# Generated by Django 4.2.2 on 2023-06-23 09:47

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='course',
            old_name='course_context',
            new_name='course_content',
        ),
    ]
