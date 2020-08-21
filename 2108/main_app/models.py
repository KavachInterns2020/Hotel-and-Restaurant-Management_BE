from django.db import models
from django.utils import timezone
<<<<<<< HEAD
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
    aadhaar_number= models.CharField(max_length=12)
=======
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
>>>>>>> 20f3d8335c96963e18eb83ad90bc17607e1acd1c

class Rooms(models.Model):
    room_id=models.AutoField(primary_key=True)
    room_type= models.CharField(max_length=50)
    accomodations= models.IntegerField()
    price= models.FloatField()
    available= models.CharField(max_length=3,default='yes')

class Bookings(models.Model):
    booking_id= models.AutoField(primary_key=True)
<<<<<<< HEAD
    customer_id= models.IntegerField()
=======
    customer_id= models.CharField(max_length=10)
>>>>>>> 20f3d8335c96963e18eb83ad90bc17607e1acd1c
    room_id= models.IntegerField()
    amount= models.FloatField()
    start_date= models.DateTimeField(default=timezone.now)
    end_date= models.DateTimeField()

class Bills(models.Model):
    bill_id= models.AutoField(primary_key=True)
    bill_type= models.CharField(max_length=20)
    amount= models.FloatField()
    date= models.DateTimeField(default=timezone.now)
<<<<<<< HEAD
    customer_id= models.IntegerField()
=======
    customer_id= models.CharField(max_length=10)
>>>>>>> 20f3d8335c96963e18eb83ad90bc17607e1acd1c

class Orders(models.Model):
    order_id= models.AutoField(primary_key=True)
    name= models.CharField(max_length=50)
<<<<<<< HEAD
    customer_id=models.IntegerField()

class MenuItems(models.Model):
    item_name=models.CharField(max_length=50)
    item_description=models.TextField(max_length=50)
    item_price=models.IntegerField()
    item_available=models.BooleanField(default=True)
=======
>>>>>>> 20f3d8335c96963e18eb83ad90bc17607e1acd1c
