from django import forms

from .models import Item
from .models import Armazem

class ItemForm(forms.ModelForm):
	class Meta:
		model = Item
		fields = {
			'nome',
			'estoque',
			'armazem'
		}