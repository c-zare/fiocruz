from django import forms

from .models import Fornecedor

class FornecedorForm(forms.ModelForm):
	class Meta:
		model = Fornecedor
		fields = {
			'razaosocial',
			'nomefantasia',
			'atividade',
			'cnpj',
			'estado',
			'cidade',
			'endereco',
			'numero',
			'complemento',
			'cep',
			'telefone',
			'contato',
			'situacao',
		}