from django import forms

from .models import Compra, ItemCompra
from fornecedor.models import Fornecedor
from item.models import Item

class CompraForm(forms.ModelForm):

    class Meta:
    	model = Compra
    	fields = {
    		'notafiscal',
    		'fornecedor',
			'data_compra',
			'data_entrega',
			'data_pagamento',
			'situacao',
		}

class ItemCompraForm(forms.ModelForm):

	item = forms.ModelChoiceField(queryset=Item.objects.all())

	class Meta:
		model = ItemCompra
		fields = {
			'item',
			'quantidade',
			'custo',
			'armazem',
			'requisitante',
		}	