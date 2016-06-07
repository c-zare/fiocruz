from django.core.urlresolvers import reverse
from django.db import models

class Fornecedor(models.Model):

	razaosocial	= models.CharField(max_length=40,null=False)
	nomefantasia= models.CharField(max_length=40,null=False)
	endereco 	= models.CharField(max_length=40,null=False)
	numero		= models.IntegerField()
	complemento	= models.CharField(max_length=40,null=True)
	cep			= models.CharField(max_length=8,null=False)
	telefone	= models.IntegerField()
	contato		= models.CharField(max_length=40,null=True)
	criado	 	= models.DateTimeField(auto_now=False,auto_now_add=True)
	atualizado 	= models.DateTimeField(auto_now=True,auto_now_add=False)

	class Meta:
		ordering = ['-atualizado','-criado']
		
	def __unicode__(self):
		return self.razaosocial

	def __str__(self):
		return self.razaosocial