from django.contrib import messages
from django.contrib.auth.decorators import permission_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q
from django.db.models import Sum
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.db import IntegrityError

from .forms import CompraForm,ItemCompraForm
from .models import Compra,ItemCompra

@login_required
def compra_apaga(request,id=None):
	instance = get_object_or_404(Compra,id=id)
	if instance.situacao: 
		messages.warning(request,' Compra fechada, não é possivel excluir.')
		return redirect('compra:lista')
	else:
		try:
			instance.delete()
			messages.success(request,' Compra foi excluida.')
		except IntegrityError:
			messages.warning(request,' O Compra "%s" não pode ser excluído, devido a vínculo com outra informação.' % instance.nome)
		return redirect('compra:lista')

@login_required
def compra_cria(request): 
	form = CompraForm(request.POST or None)	
	formItem = ItemCompraForm(request.POST or None)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.usuario = request.user
		instance.save()
		messages.success(request,' Compra foi criada.')
		return HttpResponseRedirect(instance.get_absolute_url())
	context = { 'form':form,
				'formItem': formItem }
	return render(request,'compra_form.html', context)

@login_required
def compra_detalhe(request,id):
	queryset_detalhe = Compra.objects.get(id=id)
	queryset_detalhe_item = ItemCompra.objects.filter(compra__id=id)
	queryset_detalhe_item_soma = ItemCompra.objects.filter(compra__id=id).aggregate(Sum('custo'))
	queryset_detalhe_quantidade_soma = ItemCompra.objects.filter(compra__id=id).count()
	context = { 'compra':queryset_detalhe,
				'itemcompra':queryset_detalhe_item,
				'itemcomprasoma':queryset_detalhe_item_soma,
				'itemcompraquantidadesoma':queryset_detalhe_quantidade_soma,
				}
	return render(request,'compra_detalhe.html', context)

@login_required
def compra_edita(request,id=None):	
	instance = get_object_or_404(Compra,id=id)
	form = CompraForm(request.POST or None, instance=instance)
	if instance.situacao: 
		messages.warning(request,' Compra fechada, não é possivel editar.')
		return redirect('compra:lista')
	else:
		if form.is_valid():
			instance = form.save(commit=False)
			instance.usuario = request.user
			instance.save()
			messages.success(request,' Compra foi modificado.')
			return HttpResponseRedirect(instance.get_absolute_url())
	context = { 'instance':instance, 'form':form,}
	return render(request,'compra_form.html', context)

@login_required
def compra_lista(request):
	queryset_list = Compra.objects.all() 
	# queryset = Armazem.objects.all().order_by('-criado,-atualizado') 
	page_request_var='Pagina'
	query = request.GET.get('q')
	if query:
		queryset_list = queryset_list.filter(
			Q(notafiscal__icontains=query)|
			Q(data_compra__icontains=query)
			)
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
	context = { 'compras':queryset_list,
				'page_request_var':page_request_var 
				}
	return render(request,'compra_lista.html', context) 



@login_required
def compraitem_apaga(request,id=None):
	instance = get_object_or_404(ItemCompra,id=id)
	if instance.compra.situacao: 
		messages.warning(request,' Compra fechada, não é possivel excluir.')
		return redirect('compra:lista')
	else:
		try:
			instance.delete()
			messages.success(request,' Item da Compra foi excluida.')
		except IntegrityError:
			messages.warning(request,' O Item da Compra "%s" não pode ser excluído, devido a vínculo com outra informação.' % instance.nome)
		return redirect('compra:listadeitens',instance.compra.id)

@login_required
def compraitem_cria(request,id):
	formItem = ItemCompraForm(request.POST or None)
	queryset_compra = Compra.objects.get(id=id)
	if queryset_compra.situacao: 
		messages.warning(request,' Compra fechada, não é possivel criar itens.')
		return redirect('compra:listadeitens',id)
	else:
		if formItem.is_valid():
			instance = formItem.save(commit=False)
			instance.compra = queryset_compra
			instance.usuario = request.user
			instance.save()
			messages.success(request,' Item de Compra foi criado.')
			return HttpResponseRedirect(instance.get_absolute_url())
		context = { 'formItem': formItem }
		return render(request,'compraitem_form.html', context)

@login_required
def compraitem_detalhe(request,id):
	queryset_detalhe = ItemCompra.objects.get(id=id)
	queryset_compra = Compra.objects.get(id=queryset_detalhe.compra.id)
	context = { 'compraitem':queryset_detalhe,
				'compra':queryset_compra, }
	return render(request,'compraitem_detalhe.html', context)

@login_required
def listadeitens(request,id):
	queryset_list = ItemCompra.objects.filter(compra=id)
	queryset_compra = Compra.objects.get(id=id)	
	# queryset = Armazem.objects.all().order_by('-criado,-atualizado') 
	page_request_var='Pagina'
	query = request.GET.get('q')
	if query:
		queryset_list = queryset_list.filter(item__nome__icontains=query)
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
				'compra': queryset_compra,
				'page_request_var':page_request_var 
				}
	return render(request,'lista_de_itens.html', context)