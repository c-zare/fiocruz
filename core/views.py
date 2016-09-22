from django.contrib import messages
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect
from django.db.models import Sum,Q 
from .forms import  UsuarioForm
from compra.models import Compra,ItemCompra
from datetime import date

@login_required
def home(request):
	totais = []
	for indice in range(13):
		queryset = ItemCompra.objects.filter(compra__data_pagamento__month=indice).filter(criado__year=date.today().year)
		queryset = queryset.aggregate(Sum('custo'))
		totais.append(queryset)
	totais.remove({'custo__sum': None}) # Ajuste para bug da logica, estudar correção
	context = { 'totais': totais }
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
