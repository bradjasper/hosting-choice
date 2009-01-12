from django import forms

class EmailForm(forms.Form):
    value = forms.EmailField(max_length=255,
        widget=forms.TextInput())

