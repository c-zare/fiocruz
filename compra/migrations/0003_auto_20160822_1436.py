# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-08-22 17:36
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('compra', '0002_remove_itemcompra_fornecedor'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='itemcompra',
            name='item',
        ),
        migrations.AlterField(
            model_name='compra',
            name='itens',
            field=models.ManyToManyField(to='item.Item'),
        ),
        migrations.DeleteModel(
            name='Itemcompra',
        ),
    ]
