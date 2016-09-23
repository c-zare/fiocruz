from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.auth.urls import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^armazem/', include('armazem.urls', namespace='armazem')),
    url(r'^compra/', include('compra.urls', namespace='compra')),
    url(r'^fornecedor/', include('fornecedor.urls', namespace='fornecedor')),
    url(r'^item/', include('item.urls', namespace='item')),
    url(r'^requisicao/', include('requisicao.urls', namespace='requisicao')),
    url(r'^usuario/', include('core.urls', namespace='core')),
    url(r'^login/',views.login, {'template_name':'login.html'}, name='login'),
    url(r'^logout/',views.logout_then_login, { 'login_url': '/login/'}, name='logout')
]