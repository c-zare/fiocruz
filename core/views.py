from django.shortcuts import render

# Create your views here.
def usuario_detalhe(request):
	return render(request,'usuario.html')