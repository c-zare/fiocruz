# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-06-07 19:35
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Fornecedor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('razaosocial', models.CharField(max_length=40)),
                ('nomefantasia', models.CharField(max_length=40)),
                ('endereco', models.CharField(max_length=40)),
                ('numero', models.IntegerField()),
                ('complemento', models.CharField(max_length=40, null=True)),
                ('cep', models.CharField(max_length=8)),
                ('telefone', models.IntegerField()),
                ('contato', models.CharField(max_length=40, null=True)),
                ('criado', models.DateTimeField(auto_now_add=True)),
                ('atualizado', models.DateTimeField(auto_now=True)),
            ],
            options={
                'ordering': ['-atualizado', '-criado'],
            },
        ),
    ]
