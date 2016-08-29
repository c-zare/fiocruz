from django import forms

from .models import Compra, CompraItem
from fornecedor.models import Fornecedor
from item.models import Item

class CompraForm(forms.ModelForm):

#    itens       = forms.ModelMultipleChoiceField(queryset=Item.objects.all(), required=False, widget=forms.Select)
#    quantidade  = forms.IntegerField()
#    custo       = forms.DecimalField(max_digits=10,decimal_places=2)

    class Meta:
    	model = Compra
    	fields = {
    		'notafiscal',
			'data_compra',
			'data_entrega',
			'situacao',
		}