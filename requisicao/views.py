from django.contrib import messages
from django.contrib.auth.decorators import permission_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.db import IntegrityError

from .models import Requisicao, RequisicaoItem
from .forms import RequisicaoForm
from .forms import RequisicaoItemForm

@login_required
def requisicao_apaga(request,id=None):
	instance = get_object_or_404(Requisicao,id=id)
	if instance.situacao == True:
		messages.warning(request,' Requisição "%s" está enviada não pode ser apagada.' % id)
		return redirect('requisicao:lista')
	if instance.usuario == request.user:			# Permissões tratar requisições, Verificar Funcao.
		try:
			instance.delete()
			messages.success(request,' Requisição "%s" foi excluida.' % id)
		except IntegrityError:
			messages.warning(request,' A Requisição "%s" não pode ser excluída, devido a vínculo com outra informação.' % instance.id)
	else:
		messages.warning(request,' A Requisição "%s" não pode ser excluída, pois é de propriendade de outro usuario.' % instance.id)
	return redirect('requisicao:lista')

@login_required
def requisicao_enviar(request,id):	
	instance = Requisicao.objects.get(id=id)
	itens = RequisicaoItem.objects.filter(requisicao=instance.id)
	if instance.situacao == True:
		messages.warning(request,' Requisição "%s" já foi enviada uma vez.' % id)
		return redirect('requisicao:lista')
	if instance.usuario == request.user:
		if itens:
			messages.warning(request,' Requisição "%s" fechada.' % id)
			instance.situacao=True
			instance.usuario = request.user
			instance.save()
		else:
			messages.warning(request,' Requisição "%s" não pode ser fechada por não há itens vinculados.' % id)
			return redirect('requisicao:lista')
	else:
		messages.warning(request,' Requisição "%s" pode ser fechada somente pelo usuário proprietário.' % id)
		return redirect('requisicao:lista')

@login_required
def requisicao_cria(request):
	form = RequisicaoForm(request.POST or None)
	instance = form.save(commit=False)
	instance.usuario = request.user
	instance.save()
	messages.success(request,' Requisição "%s" foi criada.' % instance.id)
	return HttpResponseRedirect(instance.get_absolute_url())

@login_required
def requisicao_detalhe(request,id):
	queryset_detalhe = Requisicao.objects.get(id=id)
	if queryset_detalhe.usuario == request.user or request.user.has_perm('requisicao.pode_administrar'):	
		context = { 'requisicao':queryset_detalhe}
		return render(request,'requisicao_detalhe.html', context)
	else:
		messages.warning(request,' A Requisição "%s" não pode ser vista, pois é de propriendade de outro usuario.' % instance.id)
		return redirect('requisicao:lista')

def requisicao_lista(request):
	if request.user.has_perm('requisicao.pode_administrar'):			# Permissões tratar requisições, Verificar Funcao.
		queryset_list = Requisicao.objects.all() 
	else:
		queryset_list = Requisicao.objects.all().filter(usuario=request.user)
	page_request_var='Pagina'
	query = request.GET.get('q')
	if query:
		queryset_list = queryset_list.filter(id__icontains=query)
	paginator = Paginator(queryset_list, 8)
	page = request.GET.get(page_request_var)
	try:
		queryset_list = paginator.page(page)
	except PageNotAnInteger:
		# If page is not an integer, deliver first page.
		queryset_list = paginator.page(1)
	except EmptyPage:
		# If page is out of range (e.g. 9999), deliver last page of results.
		queryset_list = paginator.page(paginator.num_pages)
	context = { 'requisicoes':queryset_list,
				'page_request_var':page_request_var 
				}
	return render(request,'requisicao_lista.html', context)

@login_required
def requisicaoitem_apaga(request,id=None):
	instance = get_object_or_404(RequisicaoItem,id=id)
	if instance.requisicao.situacao == True:
		messages.warning(request,' Requisição "%s" está enviada não pode ser apagado seus itens.' % id)
		return redirect('requisicao:listadeitens',instance.requisicao.id)
	if instance.situacao:
		messages.warning(request,' Item da Requisicao foi atendido, não é possível excluir este item.')
		return redirect('requisicao:listadeitens',instance.requisicao.id)
	if instance.usuario == request.user: 
		instance.delete()
		messages.success(request,' Item da Requisicao foi excluida.')
		return redirect('requisicao:listadeitens',instance.requisicao.id)
	else:
		messages.warning(request,' O Item da Requisicao "%s" pode ser excluído somente pelo usuário proprietário do item.' % instance.id)
		return redirect('requisicao:listadeitens',instance.requisicao.id)

@login_required
def requisicaoitem_cria(request,id):
	formItem = RequisicaoItemForm(request.POST or None)
	queryset_requisicao = Requisicao.objects.get(id=id)
	if queryset_requisicao.situacao == True:
		messages.warning(request,' Requisição "%s" está enviada não pode ser adicionado mas itens.' % id)
		return redirect('requisicao:listadeitens',queryset_requisicao.id)
	if queryset_requisicao.usuario != request.user:
		messages.warning(request,' O Item da Requisicao "%s" pode ser criado somente pelo usuário proprietário da requisicao.' % queryset_requisicao.id)
		return redirect('requisicao:listadeitens',queryset_requisicao.id)	
	if formItem.is_valid():
		instance = formItem.save(commit=False)
		instance.requisicao = queryset_requisicao
		instance.usuario = request.user
		instance.save()
		messages.success(request,' Item de Requisicao foi criado.')
		return HttpResponseRedirect(instance.get_absolute_url())
	context = { 'formItem': formItem,
					'requisicao':queryset_requisicao, }
	return render(request,'requsitcaoitem_form.html', context)

@login_required
def requisicaoitem_edita(request,id=None):	
	instance = get_object_or_404(RequisicaoItem,id=id)	
	queryset_requisicao = Requisicao.objects.get(id=instance.requisicao.id)
	if queryset_requisicao.situacao == True:
		messages.warning(request,' Requisição "%s" está enviada não pode ser modificado seus itens.' % id)
		return redirect('requisicao:listadeitens',queryset_requisicao.id)
	if instance.usuario != request.user:
		messages.warning(request,' O Item da Requisicao "%s" pode ser alterado somente pelo usuário proprietário do item.' % instance.id)
		return redirect('requisicao:listadeitens',instance.requisicao.id)		
	form = RequisicaoItemForm(request.POST or None, instance=instance)
	if instance.situacao: 
		messages.warning(request,' Item atendido, não é possivel editar.')
		return redirect('requisicao:listadeitens',instance.requisicao.id)
	else:
		if form.is_valid():
			instance = form.save(commit=False)
			instance.usuario = request.user
			instance.save()
			messages.success(request,' item da Requisicao foi modificado.')
			return HttpResponseRedirect(instance.get_absolute_url())
	context = { 'formItem':form,
				'requisicao':queryset_requisicao,}
	return render(request,'requsitcaoitem_form.html', context)

@login_required
def requisicaoitem_detalhe(request,id):
	queryset_detalhe = RequisicaoItem.objects.get(id=id)
	queryset_requisicao = Requisicao.objects.get(id=queryset_detalhe.requisicao.id)
	if queryset_detalhe.usuario == request.user or request.user.has_perm('requisicao.pode_administrar'):
		context = { 'requisicaoitem':queryset_detalhe,
					'requisicao':queryset_requisicao, }
		return render(request,'requisicaoitem_detalhe.html', context)
	else:
		messages.warning(request,' O Item da Requisição "%s" não pode ser vista, pois é de propriendade de outro usuario.' % queryset_requisicao.id)
		return redirect('requisicao:lista')

@login_required
def requisicao_listadeitens(request,id):
	if request.user.has_perm('requisicao.pode_administrar'):			# Permissões tratar requisições, Verificar Funcao.
		queryset_list = RequisicaoItem.objects.filter(requisicao=id)
	else:
		queryset_list = RequisicaoItem.objects.filter(requisicao=id).filter(usuario=request.user)
	queryset_requisicao = Requisicao.objects.get(id=id)
	# queryset = Armazem.objects.all().order_by('-criado,-atualizado') 
	page_request_var='Pagina'
	query = request.GET.get('q')
	if query:
		queryset_list = queryset_list.filter(requisicao__id__icontains=query)
	paginator = Paginator(queryset_list, 8)
	page = request.GET.get(page_request_var)
	try:
		queryset_list = paginator.page(page)
	except PageNotAnInteger:
		# If page is not an integer, deliver first page.
		queryset_list = paginator.page(1)
	except EmptyPage:
		# If page is out of range (e.g. 9999), deliver last page of results.
		queryset_list = paginator.page(paginator.num_pages)
	context = { 'listadeitens':queryset_list,
				'requisicao': queryset_requisicao,
				'page_request_var':page_request_var 
				}
	return render(request,'requisicao_listadeitens.html', context)
