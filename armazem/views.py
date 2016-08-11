from django.contrib import messages
from django.contrib.auth.decorators import permission_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.db import IntegrityError

from .forms import ArmazemForm
from .models import Armazem

@login_required
# @permission_required('armazem.pode_administrar')
def armazem_cria(request): 
	form = ArmazemForm(request.POST or None)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.usuario = request.user
		instance.save()
		messages.success(request,' Armazém foi criado.')
		return HttpResponseRedirect(instance.get_absolute_url())
	context = {'form':form,}
	return render(request,'armazem_form.html', context)

@login_required
def armazem_apaga(request,id=None):
	instance = get_object_or_404(Armazem,id=id)
	try:
		instance.delete()
		messages.success(request,' Armazém foi excluido.')
	except IntegrityError:
		messages.warning(request,' O Armazem %s não pode ser excluído, devido a vínculo com outra informação.' % instance.nome)
	return redirect('armazem:lista')

@login_required
def armazem_detalhe(request,id):
	queryset_detalhe = Armazem.objects.get(id=id)
	context = { 'armazem':queryset_detalhe }
	return render(request,'armazem_detalhe.html', context)

@login_required
def armazem_lista(request):
	queryset_list = Armazem.objects.all() 
	# queryset = Armazem.objects.all().order_by('-criado,-atualizado') 
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
	context = { 'armazens':queryset_list,
				'page_request_var':page_request_var 
				}
	return render(request,'armazem_lista.html', context)

@login_required
def armazem_edita(request,id=None):
	instance = get_object_or_404(Armazem,id=id)
	form = ArmazemForm(request.POST or None, instance=instance)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.usuario = request.user
		instance.save()
		messages.success(request,' Armazém foi modificado.')
		return HttpResponseRedirect(instance.get_absolute_url())
	context = { 'instance':instance, 'form':form,}
	return render(request,'armazem_form.html', context)