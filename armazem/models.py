from django.conf import settings
from django.core.urlresolvers import reverse
from django.db import models
from django.db.models.signals import pre_save
from django.utils.text import slugify

class Armazem(models.Model):

	nome 		= models.CharField(max_length=40,null=False)
	endereco 	= models.CharField(max_length=40,null=False)
	numero		= models.CharField(max_length=6,null=False)
	complemento	= models.CharField(max_length=40,null=True)
	localizador	= models.CharField(max_length=10)
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
		return reverse('armazem:detalhe', kwargs={'id':self.id})