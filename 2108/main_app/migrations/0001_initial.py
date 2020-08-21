# Generated by Django 3.0.6 on 2020-08-05 15:56

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Login',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('loginid', models.CharField(max_length=100)),
                ('password', models.CharField(max_length=100)),
                ('login_type', models.CharField(max_length=20)),
                ('login_status', models.IntegerField(default=0)),
            ],
        ),
    ]
