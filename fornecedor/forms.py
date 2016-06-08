from django import forms

from .models import Fornecedor

class FornecedorForm(forms.ModelForm):
	class Meta:
		model = Fornecedor
		fields = {
			'razaosocial',
			'nomefantasia',
			'cnpj',
			'endereco',
			'numero',
			'complemento',
			'cep',
			'telefone',
			'contato'
		}