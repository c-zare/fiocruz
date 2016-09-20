from django.conf.urls import url, include

from .views	import armazem_cria, armazem_lista, armazem_detalhe, armazem_edita, armazem_apaga

urlpatterns = [
    url(r'^$', armazem_lista, name='lista'),
    url(r'^cria/$', armazem_cria, name='cria'),
    url(r'^apaga/(?P<id>\d+)/$', armazem_apaga, name='apaga'),
    url(r'^detalhe/(?P<id>\d+)/$', armazem_detalhe, name='detalhe'),
    url(r'^edita/(?P<id>\d+)/$', armazem_edita, name='edita')
]