# Generated by Django 2.2.10 on 2020-09-01 11:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main_app', '0015_services_user_room_number'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='laundryservice',
            name='order_status',
        ),
        migrations.RemoveField(
            model_name='roomservices',
            name='order_status',
        ),
        migrations.AddField(
            model_name='services',
            name='order_status',
            field=models.BooleanField(default=True),
        ),
    ]
