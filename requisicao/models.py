from django.conf import settings
from django.core.urlresolvers import reverse
from django.db import models
from django.db.models.signals import pre_save

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
