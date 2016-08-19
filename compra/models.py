from django.db import models

# Create your models here.
from django.conf	import settings
from django.core.urlresolvers import reverse
from datetime import datetime

from item.models import Item
from fornecedor.models import Fornecedor

class Itemcompra(models.Model):

	numero		= models.IntegerField(null=False)
	quantidade	= models.IntegerField(null=False)	
	item		= models.ForeignKey(Item,on_delete=models.PROTECT)
	fornecedor  = models.ForeignKey(Fornecedor,on_delete=models.PROTECT)
	custo_unitario = models.DecimalField(max_digits=10,decimal_places=2)
	criado	 	= models.DateTimeField(auto_now=False,auto_now_add=True)
	atualizado 	= models.DateTimeField(auto_now=True,auto_now_add=False)
	usuario	    = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.PROTECT)

	class Meta:
		ordering = ['-atualizado','-criado']
		permissions = (
            ('pode_administrar', 'Pode Administrar'),
        )

	def __unicode__(self):
		return self.numero		

	def __str__(self):
		return self.numero

class Compra(models.Model):

	numero		= models.IntegerField(null=False)
	item_compra = models.ManyToManyField(Itemcompra)
	data_compra	= models.DateField(default=datetime.today)
	data_entrega= models.DateField(default=datetime.today)
	situacao	= models.BooleanField(default=False)
	criado	 	= models.DateTimeField(auto_now=False,auto_now_add=True)
	atualizado 	= models.DateTimeField(auto_now=True,auto_now_add=False)
	usuario	    = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.PROTECT)

	class Meta:
		ordering = ['-atualizado','-criado']
		permissions = (
            ('pode_administrar', 'Pode Administrar'),
        )

	def __unicode__(self):
		return self.numero		

	def __str__(self):
		return self.numero    