# Generated by Django 4.2.2 on 2023-06-24 07:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='event',
            name='event_mode',
            field=models.CharField(max_length=255),
        ),
    ]