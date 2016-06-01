from django.conf.urls import url, include

from .views	import armazem_cria, armazem_list, armazem_detalhe, armazem_edit, armazem_delete
	

urlpatterns = [
    url(r'^$', armazem_list, name='list'),
    url(r'^cria/$', armazem_cria, name='cria'),
    url(r'^delete/(?P<id>\d+)/$', armazem_delete, name='delete'),
    url(r'^detalhe/(?P<id>\d+)/$', armazem_detalhe, name='detalhe'),
    url(r'^edit/(?P<id>\d+)/$', armazem_edit, name='edit')
]