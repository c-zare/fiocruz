from django import forms

class UsuarioForm(forms.Form):

	password = forms.CharField(required=True)