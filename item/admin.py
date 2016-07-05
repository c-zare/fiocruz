from django.contrib import admin

# Register your models here.

from .models import Item

class ItemAdmin(admin.ModelAdmin):
	list_display= ('__str__', 'criado', 'atualizado')
	class meta:
		model = Item

admin.site.register(Item, ItemAdmin)