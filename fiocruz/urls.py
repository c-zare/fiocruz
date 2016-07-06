from django.conf.urls import url, include
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^armazem/', include('armazem.urls', namespace='armazem')),
    url(r'^fornecedor/', include('fornecedor.urls', namespace='fornecedor')),
    url(r'^item/', include('item.urls', namespace='item')),
    url(r'^usuario/', include('core.urls', namespace='core')),
    url(r'^login/','django.contrib.auth.views.login', {'template_name':'login.html'}, name='login'),
    url(r'^logout/','django.contrib.auth.views.logout_then_login', { 'login_url': '/login/'}, name='logout')
]