from django.core.urlresolvers import reverse
from django.db import models

class Item(models.Model):

	nome 		= models.CharField(max_length=40,null=False)
	estoque		= models.IntegerField()
	criado	 	= models.DateTimeField(auto_now=False,auto_now_add=True)
	atualizado 	= models.DateTimeField(auto_now=True,auto_now_add=False)

	class Meta:
		ordering = ['-atualizado','-criado']
		
	def __unicode__(self):
		return self.nome

	def __str__(self):
		return self.nome

	def get_absolute_url(self):
		return reverse('item:detalhe', kwargs={'id':self.id})