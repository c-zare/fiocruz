# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-09-01 13:06
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('compra', '0016_auto_20160901_0941'),
    ]

    operations = [
        migrations.AlterField(
            model_name='compra',
            name='observacao',
            field=models.TextField(max_length=200, null=True),
        ),
    ]