from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required

from .forms import ItemForm
from .models import Item

@login_required
def item_apaga(request,id=None):
	instance = get_object_or_404(Item,id=id)
	instance.delete()
	messages.success(request,' Ítem foi excluido.')
	return redirect('item:lista')

@login_required
def item_cria(request):
	form = ItemForm(request.POST or None)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.usuario = request.user
		instance.save()
		messages.success(request,' Ítem foi criado.')
		return HttpResponseRedirect(instance.get_absolute_url())
	context = {'form':form,}
	return render(request,'item_form.html', context)

@login_required
def item_detalhe(request,id):
	queryset_detalhe = Item.objects.get(id=id)
	context = { 'item':queryset_detalhe }
	return render(request,'item_detalhe.html', context)

@login_required
def item_edita(request,id=None):
	instance = get_object_or_404(Item,id=id)
	form = ItemForm(request.POST or None, instance=instance)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.usuario = request.user
		instance.save()
		messages.success(request,' Ítem foi modificado.')
		return HttpResponseRedirect(instance.get_absolute_url())
	context = { 'instance':instance, 'form':form,}
	return render(request,'item_form.html', context)

@login_required
def item_lista(request):
	queryset_list = Item.objects.all() 
	page_request_var='Pagina'
	query = request.GET.get('q')
	if query:
		queryset_list = queryset_list.filter(nome__icontains=query)
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
	context = { 'itens':queryset_list,
				'page_request_var':page_request_var }
	return render(request,'item_lista.html', context)