from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from datetime import date

class AdminProfile(models.Model):
    user=models.OneToOneField(User,on_delete=models.CASCADE)
    admin_type=models.CharField(max_length=20)
    phone=models.CharField(max_length=10)
    status=models.BooleanField(default=True)

class GuestProfile(models.Model):
    user=models.OneToOneField(User,on_delete=models.CASCADE)
    table_number=models.CharField(max_length=3)
    phone=models.CharField(max_length=10)
    date=models.DateTimeField(default=timezone.now)

class Room(models.Model):
    room_number=models.CharField(max_length=3)
    room_type=models.CharField(max_length=50)
    price=models.FloatField()
    available=models.BooleanField(default=True)

class UserProfile(models.Model):
    user=models.OneToOneField(User,on_delete=models.CASCADE)
    phone=models.CharField(max_length=10)
    address=models.CharField(max_length=150)
    aadhar_number=models.CharField(max_length=12)
    room_number=models.CharField(max_length=3,null=True)
    room=models.OneToOneField(Room,on_delete=models.CASCADE,null=True,blank=True)
    start_date=models.DateTimeField(default=timezone.now)
    end_date=models.DateField()
    status=models.BooleanField(default=True)



class Services(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    user_room_number=models.CharField(max_length=3)
    amount=models.FloatField()
    service_type=models.CharField(max_length=50)
    order_date=models.DateTimeField(default=timezone.now)
    order_status=models.BooleanField(default=True)

class LaundryService(models.Model):
    service=models.OneToOneField(Services,on_delete=models.CASCADE)
    quantity=models.IntegerField()
    garment_type=models.CharField(max_length=50)
    laundry_type=models.CharField(max_length=50)
    instructions=models.CharField(max_length=100)
    

class RoomServices(models.Model):
    service=models.OneToOneField(Services,on_delete=models.CASCADE)
    option=models.CharField(max_length=50)
    message=models.CharField(max_length=100)

class MenuItems(models.Model):
    item_name=models.CharField(max_length=50)
    item_description=models.CharField(max_length=150)
    item_picture=models.ImageField(upload_to='pics')
    item_price=models.FloatField()
    menu_type=models.CharField(max_length=50)
    food_type=models.CharField(max_length=10)
    available_status=models.BooleanField(default=True)

class Bills(models.Model):
    user=models.OneToOneField(User,on_delete=models.CASCADE)
    total_amount=models.FloatField()
    billing_date_from=models.DateTimeField()
    billing_date_to=models.DateField()
    bill_type=models.CharField(max_length=100)
    payment_type=models.CharField(max_length=100)

class FoodServices(models.Model):
    service=models.OneToOneField(Services,on_delete=models.CASCADE)
    menu_item=models.ForeignKey(MenuItems,on_delete=models.CASCADE)
    quantity=models.IntegerField()
    message=models.CharField(max_length=100)