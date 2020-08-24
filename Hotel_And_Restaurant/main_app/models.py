from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
# Create your models here.
class AdminProfile(models.Model):
    user=models.OneToOneField(User,on_delete=models.CASCADE)
    admin_type=models.CharField(max_length=20)
    phone=models.CharField(max_length=10)


class UserProfile(models.Model):
    user=models.OneToOneField(User,on_delete=models.CASCADE)
    phone= models.CharField(max_length=10)
    address= models.TextField()
    aadhar_number= models.CharField(max_length=12)
    room_number=models.CharField(max_length=3)

class GuestProfile(models.Model):
    user=models.OneToOneField(User,on_delete=models.CASCADE)
    table_number=models.CharField(max_length=3)
    phone=models.CharField(max_length=10)


class Rooms(models.Model):
    room_id=models.AutoField(primary_key=True)
    room_number=models.CharField(max_length=3)
    room_type= models.CharField(max_length=50)
    accomodations= models.IntegerField()
    price= models.FloatField()
    available= models.CharField(max_length=3,default='yes')

class Bookings(models.Model):
    booking_id= models.AutoField(primary_key=True)
    customer_id= models.IntegerField()
    room_id= models.IntegerField()
    amount= models.FloatField()
    start_date= models.DateTimeField(default=timezone.now)
    end_date= models.DateTimeField()

class Bills(models.Model):
    bill_id= models.AutoField(primary_key=True)
    bill_type= models.CharField(max_length=20)
    amount= models.FloatField()
    date= models.DateTimeField(default=timezone.now)
    customer_id= models.IntegerField()

class Orders(models.Model):
    order_id= models.AutoField(primary_key=True)
    name= models.CharField(max_length=50)
    customer_id=models.IntegerField()

class MenuItems(models.Model):
    item_name=models.CharField(max_length=50)
    item_description=models.TextField(max_length=50)
    item_price=models.IntegerField()
    item_available=models.BooleanField(default=True)
