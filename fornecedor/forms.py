from django import forms

from .models import Fornecedor
from core.models import Estado, Municipio

class FornecedorForm(forms.ModelForm):

	situacao 	= forms.BooleanField(required=False, label="situacao")
#	cidade   	= forms.ChoiceField(choices=Municipio, label=u'id')

	class Meta:
		model = Fornecedor
		fields = {
			'razaosocial',
			'nomefantasia',
			'atividade',
			'cnpj',
			'estado',
			'cidade',
			'bairro',
			'endereco',
			'numero',
			'complemento',
			'cep',
			'telefone',
			'contato',
			'situacao',
		}