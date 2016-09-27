from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.auth.urls import views

from .views import requisicao_lista, requisicao_cria,requisicao_apaga, requisicao_detalhe, requisicao_listadeitens, requisicaoitem_detalhe, requisicaoitem_apaga, requisicaoitem_edita, requisicaoitem_cria, requisicao_enviar

urlpatterns = [
    url(r'^$', requisicao_lista, name='lista'),
    url(r'^apaga/(?P<id>\d+)/$', requisicao_apaga, name='apaga'),
    url(r'^detalhe/(?P<id>\d+)/$',requisicao_detalhe,name='detalhe'),
    url(r'^cria/$', requisicao_cria, name='cria'),
    url(r'^enviar/(?P<id>\d+)/$', requisicao_enviar, name='enviar'),   
    url(r'^listadeitens/(?P<id>\d+)/$', requisicao_listadeitens, name='listadeitens'),
    url(r'^requisicaoitemapaga/(?P<id>\d+)/$', requisicaoitem_apaga, name='requisicaoitemapaga'),
    url(r'^requisicaoitemcria/(?P<id>\d+)/$', requisicaoitem_cria, name='requisicaoitemcria'),
    url(r'^requisicaoitemdetalhe/(?P<id>\d+)/$', requisicaoitem_detalhe, name='requisicaoitemdetalhe'), 
    url(r'^requisicaoitemedita/(?P<id>\d+)/$', requisicaoitem_edita, name='requisicaoitemedita'),
]