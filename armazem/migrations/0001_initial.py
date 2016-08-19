# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-08-19 16:22
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Armazem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=40)),
                ('endereco', models.CharField(max_length=40)),
                ('numero', models.CharField(max_length=6)),
                ('complemento', models.CharField(max_length=40, null=True)),
                ('localizador', models.CharField(max_length=10)),
                ('criado', models.DateTimeField(auto_now_add=True)),
                ('atualizado', models.DateTimeField(auto_now=True)),
                ('usuario', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'permissions': (('pode_administrar', 'Pode Administrar'),),
                'ordering': ['-atualizado', '-criado'],
            },
        ),
    ]
