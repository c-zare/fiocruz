from django.contrib import messages
from django.contrib.auth.decorators import permission_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.db import IntegrityError

from .forms import CompraForm
from .models import Compra

@login_required
def compra_cria(request): 
	form = CompraForm(request.POST or None)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.usuario = request.user
		instance.save()
		messages.success(request,' Compra foi criada.')
		return HttpResponseRedirect(instance.get_absolute_url())
	else:
		print('Erro no form')
	context = {'form':form,}
	return render(request,'compra_form.html', context)

@login_required
def compra_apaga(request,id=None):
	instance = get_object_or_404(Compra,id=id)
	try:
		instance.delete()
		messages.success(request,' Compra foi excluida.')
	except IntegrityError:
		messages.warning(request,' O Compra %s não pode ser excluído, devido a vínculo com outra informação.' % instance.nome)
	return redirect('compra:lista')

@login_required
def compra_detalhe(request,id):
	queryset_detalhe = Compra.objects.get(id=id)
	context = { 'compra':queryset_detalhe }
	return render(request,'compra_detalhe.html', context)

@login_required
def compra_lista(request):
	queryset_list = Compra.objects.all() 
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
	context = { 'compras':queryset_list,
				'page_request_var':page_request_var 
				}
	return render(request,'compra_lista.html', context)

@login_required
def compra_edita(request,id=None):
	pass