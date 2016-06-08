from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect

from .forms import ItemForm
from .models import Item

# Create your views here.

def item_apaga(request,id=None):
	instance = get_object_or_404(Item,id=id)
	instance.delete()
	messages.success(request,' Ítem foi excluido.')
	return redirect('item:lista')

def item_cria(request):
	form = ItemForm(request.POST or None)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.save()
		messages.success(request,' Ítem foi criado.')
		return HttpResponseRedirect(instance.get_absolute_url())
	context = {'form':form,}
	return render(request,'item_form.html', context)

def item_detalhe(request,id):
	queryset_detalhe = Item.objects.get(id=id)
	context = { 'item':queryset_detalhe }
	return render(request,'item_detalhe.html', context)

def item_edita(request,id=None):
	instance = get_object_or_404(Item,id=id)
	form = ItemForm(request.POST or None, instance=instance)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.save()
		messages.success(request,' Ítem foi modificado.')
		return HttpResponseRedirect(instance.get_absolute_url())
#	else:
#		messages.error(request,'Armazem is NOT Update')		
	context = { 'instance':instance, 'form':form,}
	return render(request,'item_form.html', context)

def item_lista(request):
	queryset_list = Item.objects.all() 
	page_request_var='Pagina'
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