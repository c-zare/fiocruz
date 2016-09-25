from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.auth.urls import views

from .views import requisicao_lista, requisicao_cria,requisicao_apaga

urlpatterns = [
    url(r'^$', requisicao_lista, name='lista'),
    url(r'^apaga/(?P<id>\d+)/$', requisicao_apaga, name='apaga'),
    url(r'^cria/$', requisicao_cria, name='cria'),
]