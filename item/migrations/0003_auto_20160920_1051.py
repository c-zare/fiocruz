# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-09-20 10:51
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('item', '0002_auto_20160920_0811'),
    ]

    operations = [
        migrations.AlterField(
            model_name='item',
            name='estoque',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='item',
            name='estoque_minimo',
            field=models.IntegerField(default=1),
        ),
    ]
