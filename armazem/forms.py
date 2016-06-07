from django import forms

from .models import Armazem

class ArmazemForm(forms.ModelForm):
	class Meta:
		model = Armazem
		fields = {
			'nome',
			'endereco',
			'numero',
			'complemento',
			'localizador'
		}