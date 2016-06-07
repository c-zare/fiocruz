from django.conf.urls import url, include
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^armazem/', include('armazem.urls', namespace='armazem')),
    url(r'^fornecedor/', include('fornecedor.urls', namespace='fornecedor'))
]
