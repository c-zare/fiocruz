# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-08-30 18:04
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('item', '0001_initial'),
        ('compra', '0011_compra_fornecedor'),
    ]

    operations = [
        migrations.CreateModel(
            name='ItemCompra',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantidade', models.IntegerField(default=1)),
                ('custo', models.DecimalField(decimal_places=2, max_digits=10)),
                ('criado', models.DateTimeField(auto_now_add=True)),
                ('atualizado', models.DateTimeField(auto_now=True)),
                ('compra', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='compra.Compra')),
                ('item', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='item.Item')),
                ('usuario', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['item'],
                'permissions': (('pode_administrar', 'Pode Administrar'),),
            },
        ),
        migrations.RemoveField(
            model_name='compraitem',
            name='item',
        ),
        migrations.DeleteModel(
            name='CompraItem',
        ),
    ]