from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect

# Create your views here.
from .forms import ArmazemForm
from .models import Armazem


def armazem_cria(request): 
	form = ArmazemForm(request.POST or None)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.save()
		messages.success(request,'Armazém foi criado.')
		return HttpResponseRedirect(instance.get_detalhe_url())
#	else:
#		messages.error(request,'Armazem is NOT Create')
	context = {'form':form,}
	return render(request,'armazem_form.html', context)

def armazem_delete(request,id=None):
	instance = get_object_or_404(Armazem,id=id)
	instance.delete()
	messages.warning(request,'Armazém foi excluído.')
	return redirect('armazem:list')

def armazem_detalhe(request,id):
	queryset_detalhe = Armazem.objects.get(id=id)
	context = { 'armazem':queryset_detalhe }
	return render(request,'armazem_detalhe.html', context)

def armazem_list(request):
	queryset_list = Armazem.objects.all() 
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
	context = { 'armazens':queryset_list,
				'page_request_var':page_request_var }
	return render(request,'armazem_list.html', context)

def armazem_edit(request,id=None):
	instance = get_object_or_404(Armazem,id=id)
	form = ArmazemForm(request.POST or None, instance=instance)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.save()
		messages.info(request,'Armazém foi alterado.')
		return HttpResponseRedirect(instance.get_detalhe_url())
#	else:
#		messages.error(request,'Armazem is NOT Update')		
	context = { 'instance':instance, 'form':form,}
	return render(request,'armazem_form.html', context)