from django.conf.urls import url, include

from .views	import item_cria, item_lista, item_detalhe, item_edita, item_apaga
	

urlpatterns = [
    url(r'^$', item_lista, name='lista'),
    url(r'^cria/$', item_cria, name='cria'),
    url(r'^apaga/(?P<id>\d+)/$', item_apaga, name='apaga'),
    url(r'^detalhe/(?P<id>\d+)/$', item_detalhe, name='detalhe'),
    url(r'^edita/(?P<id>\d+)/$', item_edita, name='edita')
]