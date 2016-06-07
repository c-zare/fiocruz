from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect

from .models import Fornecedor

def fornecedor_apaga(request):
	pass

def fornecedor_cria(request):
	pass

def fornecedor_detalhe(request):
	pass

def fornecedor_edita(request):
	pass

def fornecedor_lista(request):
	queryset_list = Fornecedor.objects.all() 
	# queryset = Armazem.objects.all().order_by('-criado,-atualizado') 
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
	context = { 'fornecedores':queryset_list,
				'page_request_var':page_request_var }
	return render(request,'fornecedor_lista.html', context)


