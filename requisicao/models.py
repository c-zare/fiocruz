from django.conf import settings
from django.core.urlresolvers import reverse
from django.db import models
from django.db.models.signals import pre_save

from item.models import Item

class Requisicao(models.Model):

	criado	 	= models.DateTimeField(auto_now=False,auto_now_add=True)
	atualizado 	= models.DateTimeField(auto_now=True,auto_now_add=False)
	usuario	    = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.PROTECT)

	class Meta:
		ordering = ['-atualizado','-criado']
		permissions = (
            ('pode_administrar', 'Pode Administrar'),            
        )
		
	def __unicode__(self):
		return self.id

	def __str__(self):
		return self.id

	def get_absolute_url(self):
		return reverse('requisicao:detalhe', kwargs={'id':self.id})

class RequisicaoItem(models.Model):

	item 		= models.ForeignKey(Item,on_delete=models.PROTECT)
	requisicao  = models.ForeignKey(Requisicao,on_delete=models.PROTECT)
	quantidade	= models.IntegerField(null=False)
	atendido	= models.BooleanField(default=False)								# Atendida True.
	criado	 	= models.DateTimeField(auto_now=False,auto_now_add=True)
	atualizado 	= models.DateTimeField(auto_now=True,auto_now_add=False)
	usuario	    = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.PROTECT)

	class Meta:
		ordering = ['-atualizado','-criado']
		permissions = (
            ('pode_administrar', 'Pode Administrar'),            
    )
		
	def __unicode__(self):
		return self.id

	def __str__(self):
		return self.id

	def get_absolute_url(self):
		return reverse('requisicaoitem:detalhe', kwargs={'id':self.id})