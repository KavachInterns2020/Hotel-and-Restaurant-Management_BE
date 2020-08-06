from django.db import models
from django.utils import timezone
# Create your models here.

class Login(models.Model):
    loginid= models.CharField(max_length=100)
    password= models.CharField(max_length=100)
    login_type= models.CharField(max_length=20)
    login_status= models.IntegerField(default=0)

class Admin(models.Model):
    first_name= models.CharField(max_length=40)
    last_name= models.CharField(max_length=40)
    phone= models.CharField(max_length=10)
    email= models.EmailField(max_length=254)
    type= models.CharField(max_length=20)

class Customer(models.Model):
    Customer_id= models.AutoField(primary_key=True)
    first_name= models.CharField(max_length=40)
    last_name= models.CharField(max_length=40)
    phone= models.CharField(max_length=10)
    email= models.EmailField(max_length=254)
    address= models.TextField()
    aadhaar_number= models.CharField(max_length=12)
    Document= models.ImageField(upload_to='Aadhaar')

class Rooms(models.Model):
    room_id=models.AutoField(primary_key=True)
    room_type= models.CharField(max_length=50)
    accomodations= models.IntegerField()
    price= models.FloatField()
    available= models.CharField(max_length=3,default='yes')

class Bookings(models.Model):
    booking_id= models.AutoField(primary_key=True)
    customer_id= models.CharField(max_length=10)
    room_id= models.IntegerField()
    amount= models.FloatField()
    start_date= models.DateTimeField(default=timezone.now)
    end_date= models.DateTimeField()

class Bills(models.Model):
    bill_id= models.AutoField(primary_key=True)
    bill_type= models.CharField(max_length=20)
    amount= models.FloatField()
    date= models.DateTimeField(default=timezone.now)
    customer_id= models.CharField(max_length=10)

class Orders(models.Model):
    order_id= models.AutoField(primary_key=True)
    name= models.CharField(max_length=50)
