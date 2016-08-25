from django.contrib import admin

from .models import Compra

class CompraAdmin(admin.ModelAdmin):
	list_display= ('__str__', 'criado', 'atualizado')
	class meta:
		model = Compra

admin.site.register(Compra, CompraAdmin)