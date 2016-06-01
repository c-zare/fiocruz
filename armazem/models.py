from django.db import models

# Create your models here.
from django.core.urlresolvers import reverse


class Armazem(models.Model):

	nome 		= models.CharField(max_length=40,null=False)
	endereco 	= models.CharField(max_length=80,null=False)
	numero		= models.IntegerField()
	criado	 	= models.DateTimeField(auto_now=False,auto_now_add=True)
	atualizado 	= models.DateTimeField(auto_now=True,auto_now_add=False)

	class Meta:
		ordering = ['-atualizado']

	def __unicode__(self):
		return self.nome

	def __str__(self):
		return self.nome

	def get_detalhe_url(self):
		return reverse('armazem:detalhe', kwargs={'id':self.id})

	def get_edit_url(self):
		return reverse('armazem:edit', kwargs={'id':self.id})

	def get_delete_url(self):
		return reverse('armazem:delete', kwargs={'id':self.id})

	def get_list_url(self):
		return reverse('armazem:list')