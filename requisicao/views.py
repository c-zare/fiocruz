from django.contrib import messages
from django.contrib.auth.decorators import permission_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.db import IntegrityError

from .models import Requisicao
from .forms import RequisicaoForm

@login_required
def requisicao_apaga(request,id=None):
	instance = get_object_or_404(Requisicao,id=id)
	try:
		instance.delete()
		messages.success(request,' Requisição "%s" foi excluida.' % id)
	except IntegrityError:
		messages.warning(request,' A Requisição "%s" não pode ser excluída, devido a vínculo com outra informação.' % instance.id)
	return redirect('requisicao:lista')

def requisicao_cria(request):
	try:
		requisicao = Requisicao(usuario=request.user).save()
		messages.warning(request,' Requisição foi criada.')
	except Error:
		messages.warning(request,' Erro na criação da Requisição.')
	queryset_list = Requisicao.objects.all()
	context = { 'requisicoes':queryset_list,}
	return render(request,'requisicao_lista.html', context)

def requisicao_lista(request):
	queryset_list = Requisicao.objects.all() 
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