from django import forms

from .models import Fornecedor
from core.models import Estado, Municipio

class FornecedorForm(forms.ModelForm):


#	telefone	= forms.RegexField(regex=r'^\+?1?\d{9,15}$',error_message = ("Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed."))
	situacao 	= forms.BooleanField(required=False, label="situacao")
#	cidade 		= forms.ModelChoiceField(queryset=Municipio.objects.all().filter(estado_id=11))

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
			'email',
			'situacao',
		}