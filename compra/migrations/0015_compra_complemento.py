# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-09-01 12:37
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('compra', '0014_auto_20160831_0939'),
    ]

    operations = [
        migrations.AddField(
            model_name='compra',
            name='complemento',
            field=models.TextField(max_length=80, null=True),
        ),
    ]
