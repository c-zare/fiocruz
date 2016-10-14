from django.conf	import settings
from django.core.urlresolvers import reverse
from django.db import models
from armazem.models import Armazem
from fornecedor.models import Fornecedor

class Item(models.Model):

	nome 		= models.CharField(max_length=40,null=False)
	medida		= models.CharField(max_length=15,null=False)
	estoque_minimo	= models.IntegerField(default=1)
	criado	 	= models.DateTimeField(auto_now=False,auto_now_add=True)
	atualizado 	= models.DateTimeField(auto_now=True,auto_now_add=False)
	usuario	    = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.PROTECT)

	class Meta:
		ordering = ['-atualizado','-criado']
		permissions = (
            ('pode_administrar', 'Pode Administrar'),
        )
		
	def __unicode__(self):
		return self.nome

	def __str__(self):
		return self.nome

	def get_absolute_url(self):
		return reverse('item:detalhe', kwargs={'id':self.id})