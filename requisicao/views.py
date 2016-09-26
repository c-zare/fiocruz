from django.contrib import messages
from django.contrib.auth.decorators import permission_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.db import IntegrityError

from .models import Requisicao, RequisicaoItem
from .forms import RequisicaoForm

@login_required
def requisicao_apaga(request,id=None):
	instance = get_object_or_404(Requisicao,id=id)
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