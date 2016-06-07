from django.contrib import admin

from .models import Fornecedor

class FornecedorAdmin(admin.ModelAdmin):
	list_display= ('__str__', 'criado', 'atualizado')
	class meta:
		model = Fornecedor

admin.site.register(Fornecedor, FornecedorAdmin)