from django.core.urlresolvers import reverse
from django.db import models
from django.db.models.signals import pre_save
from django.utils.text import slugify

class Armazem(models.Model):

	nome 		= models.CharField(max_length=40,null=False)
	slug 		= models.SlugField(unique=True)
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

	def get_absolute_url(self):
		return reverse('armazem:detalhe', kwargs={'id':self.id})

def create_slug(instance,new_slug=None):
	slug = slugify(instance.nome)
	if new_slug is not None:
		slug = new_slug
	qs = Armazem.objects.filter(slug=slug).order_by('-id')
	exists = qs.exists()
	if exists:
		new_slug = '%s-%s' %(slug, qs.first().id)
		return create_slug(instance, new_slug=new_slug)
	return slug

def pre_save_armazem_receiver(sender,instance, *args, **kwargs):
	if not instance.slug:
		instance.slug = create_slug(instance)

pre_save.connect(pre_save_armazem_receiver, sender=Armazem)
