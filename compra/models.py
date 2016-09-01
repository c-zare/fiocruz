from django.db import models
from django.db.models import Sum

# Create your models here.
from django.conf	import settings
from django.core.urlresolvers import reverse
from datetime import datetime

from item.models import Item
from fornecedor.models import Fornecedor

class Compra(models.Model):
# Falta incluir Fornecedor
	notafiscal	= models.CharField(max_length=20,null=False)
	fornecedor  = models.ForeignKey(Fornecedor,on_delete=models.PROTECT)
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

	def __str__(self):
		return self.id		

	def get_absolute_url(self):
		return reverse('compra:detalhe', kwargs={'id':self.id})

class ItemCompra(models.Model):

	item 		= models.ForeignKey(Item,on_delete=models.PROTECT)
	quantidade 	= models.IntegerField(default=1)
	custo 		= models.DecimalField(max_digits=10,decimal_places=2)
	compra      = models.ForeignKey(Compra,on_delete=models.CASCADE)
	criado	 	= models.DateTimeField(auto_now=False,auto_now_add=True)
	atualizado 	= models.DateTimeField(auto_now=True,auto_now_add=False)
	usuario	    = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.PROTECT)

	class Meta:
		ordering = ['item']
		permissions = (
            ('pode_administrar', 'Pode Administrar'),
        )

	def __str__(self):
		return self.id