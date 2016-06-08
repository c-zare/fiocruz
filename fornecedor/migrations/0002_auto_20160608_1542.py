# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-06-08 19:42
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('fornecedor', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='fornecedor',
            old_name='naturezajuridica',
            new_name='atividade',
        ),
        migrations.AddField(
            model_name='fornecedor',
            name='cidade',
            field=models.CharField(default=1, max_length=20),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='fornecedor',
            name='estado',
            field=models.CharField(default=1, max_length=2),
            preserve_default=False,
        ),
    ]
