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
	f8 = ItemCompra.objects.filter(
		Q(criado__year='2016')|
		Q(criado__month='08'))
	f = f8.aggregate(Sum('custo'))
	print(f)
	context = { 'grafico': f }
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
