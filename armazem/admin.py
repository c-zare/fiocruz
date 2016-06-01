from django.contrib import admin

# Register your models here.

from .models import Armazem

class ArmazemAdmin(admin.ModelAdmin):
	list_display= ('__str__', 'criado', 'atualizado')
	class meta:
		model = Armazem

admin.site.register(Armazem, ArmazemAdmin)