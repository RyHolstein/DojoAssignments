# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-04-18 19:09
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('description', models.TextField()),
                ('price', models.IntegerField()),
                ('cost', models.IntegerField()),
                ('category', models.CharField(max_length=100)),
            ],
        ),
    ]
