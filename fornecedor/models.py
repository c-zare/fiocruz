from django.conf	import settings
from django.core.urlresolvers import reverse
from django.db import models

from core.models import Estado
from core.models import Municipio

class Fornecedor(models.Model):

	razaosocial	= models.CharField(max_length=80,null=False)
	nomefantasia= models.CharField(max_length=40,null=False)
	cnpj		= models.IntegerField()
	atividade	= models.CharField(max_length=20,null=False)
	estado		= models.ForeignKey(Estado)
	cidade		= models.ForeignKey(Municipio)		
	endereco 	= models.CharField(max_length=40,null=False)
	numero		= models.IntegerField()
	complemento	= models.CharField(max_length=40,null=True)
	cep			= models.CharField(max_length=8,null=False)
	telefone	= models.CharField(max_length=20,null=False)
	contato		= models.CharField(max_length=40,null=True)
	criado	 	= models.DateTimeField(auto_now=False,auto_now_add=True)
	atualizado 	= models.DateTimeField(auto_now=True,auto_now_add=False)
	situacao	= models.BooleanField()
	usuario	    = models.ForeignKey(settings.AUTH_USER_MODEL)

	class Meta:
		ordering = ['-atualizado','-criado']
		permissions = (
            ('pode_administrar', 'Pode Administrar'),
        )
		
	def __unicode__(self):
		return self.razaosocial

	def __str__(self):
		return self.razaosocial

	def get_absolute_url(self):
		return reverse('fornecedor:detalhe', kwargs={'id':self.id})