from django import forms

import models

class CommentForm(forms.Form):

    name = forms.CharField(max_length=255,
        widget=forms.TextInput(attrs={'tabindex': 1}))

    email = forms.EmailField(max_length=255,
        widget=forms.TextInput(attrs={'tabindex': 2}))

    website = forms.URLField(required=False, max_length=255,
        widget=forms.TextInput(attrs={'tabindex': 3}))

    text = forms.CharField(
        widget=forms.widgets.Textarea(attrs={
            'rows':15, 'cols':52, 'tabindex': 4}))

    rating_features_val = forms.IntegerField(widget=forms.HiddenInput(),
        initial=-1)
    rating_uptime_val = forms.IntegerField(widget=forms.HiddenInput(),
        initial=-1)
    rating_support_val = forms.IntegerField(widget=forms.HiddenInput(),
        initial=-1)

class LeadForm(forms.ModelForm):

    class Meta:
        model = models.Lead


