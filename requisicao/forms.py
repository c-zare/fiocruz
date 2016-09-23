from django import forms

from .models import Requisicao

class RequisicaoForm(forms.ModelForm):
	class Meta:
		model = Requisicao
		fields = {
		}