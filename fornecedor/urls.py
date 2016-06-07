from django.conf.urls import url, include

from .views	import fornecedor_lista, fornecedor_apaga, fornecedor_detalhe, fornecedor_edita, fornecedor_cria

urlpatterns = [
    url(r'^$', fornecedor_lista, name='lista'),
    url(r'^cria/$', fornecedor_cria, name='cria'),
    url(r'^apaga/(?P<id>\d+)/$', fornecedor_apaga, name='apaga'),
    url(r'^detalhe/(?P<id>\d+)/$', fornecedor_detalhe, name='detalhe'),
    url(r'^edita/(?P<id>\d+)/$', fornecedor_edita, name='edita')
]