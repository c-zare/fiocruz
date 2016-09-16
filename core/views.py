from django.contrib import messages
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect
from django.db.models import Sum,Q 
from .forms import  UsuarioForm
from compra.models import Compra,ItemCompra

@login_required
def home(request):
	meses = []							# Geração dos saldos de compras
	for indice in range(12):
		queryset = ItemCompra.objects.filter(criado__month=indice).filter(criado__year=2016)
		queryset = queryset.aggregate(Sum('custo'))		
		meses.append(queryset)
	context = { 'totalizacao_compras_mes': meses }
	return render(request,'home.html', context)

@login_required
def usuario_detalhe(request):
	if request.method == 'POST':
		form = UsuarioForm(request.POST or None)
		if form.is_valid():
			instance = request.user
			instance.set_password(form.data['password'])
			instance.save()
			update_session_auth_hash(request, request.user)
			messages.success(request,' Senha foi alterada, e necessario um novo login.')
	return render(request,'usuario.html')
