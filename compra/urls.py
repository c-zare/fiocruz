from django.conf.urls import url, include

from .views	import compra_cria, compra_lista, compra_detalhe, compra_edita, compra_apaga, listadeitens


urlpatterns = [
    url(r'^$', compra_lista, name='lista'),
    url(r'^cria/$', compra_cria, name='cria'),
    url(r'^apaga/(?P<id>\d+)/$', compra_apaga, name='apaga'),
    url(r'^detalhe/(?P<id>\d+)/$', compra_detalhe, name='detalhe'),
    url(r'^edita/(?P<id>\d+)/$', compra_edita, name='edita'),
    url(r'^listadeitens/(?P<id>\d+)/$', listadeitens, name='listadeitens')
]