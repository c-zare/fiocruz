from django.db import models


class Estado(models.Model):

	sigla		= models.CharField(max_length=2,null=False)
	nome		= models.CharField(max_length=20,null=False)
	criado	 	= models.DateTimeField(auto_now=False,auto_now_add=True)
	atualizado 	= models.DateTimeField(auto_now=True,auto_now_add=False)

	class Meta:
		ordering = ['sigla']
		
	def __unicode__(self):
		return self.nome

	def __str__(self):
		return self.nome

class Municipio(models.Model):

	nome		= models.CharField(max_length=30)
	estado      = models.ForeignKey(Estado)
	criado	 	= models.DateTimeField(auto_now=False,auto_now_add=True)
	atualizado 	= models.DateTimeField(auto_now=True,auto_now_add=False)

	class Meta:
		ordering = ['nome']
		
	def __unicode__(self):
		return self.nome

	def __str__(self):
		return self.nome


# Estado(sigla='AC',nome='Acre').save()
# Estado(sigla='AL',nome='Alagoas').save()
# Estado(sigla='AP',nome='Amapá').save()
# Estado(sigla='AM',nome='Amazonas').save()
# Estado(sigla='BA',nome='Bahia').save()
# Estado(sigla='CE',nome='Ceara').save()
# Estado(sigla='DF',nome='Distrito Federal').save()
# Estado(sigla='GO',nome='Goiás').save()
# Estado(sigla='MA',nome='Maranhão').save()
# Estado(sigla='MT',nome='Mato Grosso').save()
# Estado(sigla='MS',nome='Mato Grosso do Sul').save()
# Estado(sigla='MG',nome='Minas Gerais').save()
# Estado(sigla='PA',nome='Pará').save()
# Estado(sigla='PB',nome='Paraíba').save()
# Estado(sigla='PR',nome='Paraná').save()
# Estado(sigla='PE',nome='Pernambuco').save()
# Estado(sigla='PI',nome='Piauí').save()
# Estado(sigla='RJ',nome='Rio de Janeiro').save()
# Estado(sigla='RN',nome='Rio Grande do Norte').save()
# Estado(sigla='RS',nome='Rio Grande do Sul').save()
# Estado(sigla='RO',nome='Rondônia').save()
# Estado(sigla='RR',nome='Roraima').save()
# Estado(sigla='SC',nome='Santa Catarina').save()
# Estado(sigla='SP',nome='São Paulo').save()
# Estado(sigla='SE',nome='Sergipe').save()
# Estado(sigla='TO',nome='Tocantins').save()