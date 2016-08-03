
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect

from .forms import  UsuarioForm

@login_required
def home(request):
	return render(request,'home.html')

@login_required
def usuario_detalhe(request):
	if request.method == 'POST':
		form = UsuarioForm(request.POST or None)
		if form.is_valid():
			instance = request.user
			instance.set_password(form.data['password'])
			instance.save()
			messages.success(request,' Senha foi alterada, e necessario um novo login.')
	return render(request,'usuario.html')
