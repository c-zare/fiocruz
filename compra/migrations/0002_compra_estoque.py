# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-08-19 13:05
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('compra', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='compra',
            name='estoque',
            field=models.BooleanField(default=False),
        ),
    ]