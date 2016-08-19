from django import forms

from .models import Compra, Itemcompra

class Itemcompra(forms.ModelForm):

	class Meta:
		model = Itemcompra
		fields = {
			'numero',
			'quantidade',
			'item',
			'fornecedor',
			'custo_unitario',
		}

class CompraForm(forms.ModelForm):

	#item_compra = forms.ModelMultipleChoiceField(queryset=Itemcompra.objects.all())

	class Meta:
		model = Compra
		fields = {
			'numero',
			'item_compra',
			'data_compra',
			'data_entrega',
			'situacao',
		}