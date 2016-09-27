from django import forms

from .models import Requisicao
from .models import RequisicaoItem

class RequisicaoForm(forms.ModelForm):
	class Meta:
		model = Requisicao
		fields = {
		}

class RequisicaoItemForm(forms.ModelForm):
	class Meta:
		model = RequisicaoItem
		fields = {
		'item',
		'quantidade',
		}