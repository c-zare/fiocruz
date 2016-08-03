from django.conf.urls import url, include

from .views	import usuario_detalhe, home

urlpatterns = [
   url(r'^home/', home, name='home'),
   url(r'^usuario/', usuario_detalhe, name='usuario'),
]