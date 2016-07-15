from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required

from .forms import FornecedorForm
from .models import Fornecedor

@login_required
def fornecedor_apaga(request,id=None):
	instance = get_object_or_404(Fornecedor,id=id)
	instance.delete()
	messages.success(request,' Fornecedor foi excluido.')
	return redirect('fornecedor:lista')

@login_required
def fornecedor_cria(request):
	form = FornecedorForm(request.POST or None)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.usuario = request.user
		instance.save()
		messages.success(request,' Fornecedor foi criado.')
		return HttpResponseRedirect(instance.get_absolute_url())
	context = {'form':form }
	return render(request,'fornecedor_form.html', context)

@login_required
def fornecedor_detalhe(request,id):
	queryset_detalhe = Fornecedor.objects.get(id=id)
	context = { 'fornecedor':queryset_detalhe}
	return render(request,'fornecedor_detalhe.html', context)

@login_required
def fornecedor_edita(request,id=None):
	instance = get_object_or_404(Fornecedor,id=id)
	form = FornecedorForm(request.POST or None, instance=instance)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.usuario = request.user
		instance.save()
		messages.success(request,' Fornecedor foi modificado.')
		return HttpResponseRedirect(instance.get_absolute_url())
	context = { 'instance':instance, 'form':form }
	return render(request,'fornecedor_form.html', context)

@login_required
def fornecedor_lista(request):
	queryset_list = Fornecedor.objects.all() 
	# queryset = Armazem.objects.all().order_by('-criado,-atualizado') 
	page_request_var='Pagina'
	query = request.GET.get('q')
	if query:
		queryset_list = queryset_list.filter(nomefantasia__icontains=query)
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
	context = { 'fornecedores':queryset_list,
				'page_request_var':page_request_var }
	return render(request,'fornecedor_lista.html', context)