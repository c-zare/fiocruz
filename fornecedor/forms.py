from django import forms

from .models import Fornecedor
from core.models import Estado

class FornecedorForm(forms.ModelForm):

	situacao 	= forms.BooleanField(required=False, label="situacao")

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