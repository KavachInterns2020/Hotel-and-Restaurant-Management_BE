from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.models import User,auth
from django.contrib import messages
from main_app.models import *
from datetime import datetime,date,timedelta
import smtplib
from django.utils import timezone
import json

# Create your views here.
def restaurant(request):
	if request.method=='POST':
		user_name=request.POST['username']
		password=request.POST['password']
		if len(user_name)==0:
			return render(request,'restaurant_login.html',{'message':'Username is Empty!!!'})
		elif len(password)==0:
			return render(request,'restaurant_login.html',{'message':'Password is Empty!!!'})
		else:
			user=auth.authenticate(username=user_name,password=password)
			if user is not None:
				if hasattr(user,'guestprofile'):
					auth.login(request,user)
					return redirect('order')
				else:
					return render(request,'restaurant_login.html',{'message':'Only Restaurant accounts are allowed!'})
					






			else:
				return render(request,'restaurant_login.html',{'message':'Username or Password is incorrect. Try again!'})

	else:
		return render(request,'restaurant_login.html')

def signup(request):
	tables=Tables.objects.filter(status=True)
	if request.method=="GET":
		return render(request,'restaurant_signup.html',{'tables':tables})
	else:
		first_name=request.POST['firstname']
		last_name=request.POST['lastname']
		email=request.POST['email']
		phone=request.POST['phone']
		table_id=request.POST['tablenumber']
		users=User.objects.filter(username=email)
		print(len(users))
		if len(users)!=0:
			return render(request,'restaurant_signup.html',{'tables':tables,'message':'Email already exists!!'})
		else:
			username=email
			if table_id=='notchoosen':
				return render(request,'restaurant_signup.html',{'tables':tables,'message':'Enter a table number!'})
			table=Tables.objects.get(id=table_id)
			table_number=table.table_number
			table.status=False
			table.save()
			password=User.objects.make_random_password()
			user=User.objects.create_user(username=username,password=password,first_name=first_name,last_name=last_name,email=email)
			guest_profile=GuestProfile(user=user,table_number=table_number,table=table,phone=phone)
			user.save()
			guest_profile.save()
			server=smtplib.SMTP('smtp.gmail.com',587)
			server.ehlo()
			server.starttls()
			server.ehlo()
			server.login('mukundacharya2020@gmail.com','cdxsfozsqkposogy')
			subject ="Your Account Details for Login to MMVR International!"
			body="Thanks for visiting our Restaurant!\nYour username is "+username+" and your password is "+password+". Have a happy meal!!"
			msg= f"Subject: {subject}\n\n{body}"
			server.sendmail('mukundacharya2020@gmail.com',email,msg)
			print("Email has been sent!")
			server.quit()
			messages.info(request,'Your account has been created and user credentials have been sent to the email!!!!!')
			return redirect('/restaurant')

def order(request):
	if request.method=='GET':
		breakfast=MenuItems.objects.filter(menu_type='Breakfast')
		starters=MenuItems.objects.filter(menu_type='Starters')
		main_course=MenuItems.objects.filter(menu_type='Main Course')
		desserts=MenuItems.objects.filter(menu_type='Dessert')
		food_order=RestaurantOrders.objects.filter(user=request.user)
		amt=0
		for o in food_order:
			amt+=o.amount
		context={'breakfast':breakfast,'starters':starters,'maincourse':main_course,'desserts':desserts,'amt':amt}
		return render(request,'restaurant_food_order.html',context)
	else:
		user=request.user
		table_number=user.guestprofile.table_number
		cart=request.POST['cart_list']
		cart=json.loads(cart)
		total=0
		for item in cart:
			price=int(item['product_price'].split('.')[0])
			quantity=int(item['product_quantity'])
			current_price=price*quantity
			total+=price*quantity
			menu_item=item['product_name']
			food_order=RestaurantOrders.objects.create(user=user,table_number=table_number,menu_item=menu_item,quantity=quantity,amount=current_price)
			food_order.save()
		messages.info(request,'Your order has been placed! Check you previous orders under View Previous Orders for the item status!')
		return redirect('/restaurant/order')


def orderhistory(request):
	user=request.user
	days=date.today().day
	months=date.today().month
	years=date.today().year
	total_orders=RestaurantOrders.objects.filter(order_date__contains=date(years,months,days)).filter(user=request.user)
	total_count=RestaurantOrders.objects.filter(order_date__contains=date(years,months,days)).filter(user=request.user).count()
	amt=0
	for o in total_orders:
		amt+=o.amount
	pending_count=RestaurantOrders.objects.filter(order_date__contains=date(years,months,days)).filter(user=request.user).filter(status=True).count()
	context={'orders':total_orders,'total_count':total_count,'amt':amt,'pending':pending_count}
	return render(request,'view_restaurant_orders.html',context)

def confirm(request):
	total_orders=RestaurantOrders.objects.filter(order_date__date=date.today()).filter(user=request.user).filter(status=False)
	total=0
	for o in total_orders:
		total+=o.amount
	context={'total':total,'orders':total_orders}
	return render(request,'restaurant_checkout.html',context)

def checkout(request):
	user=request.user
	guest_profile=GuestProfile.objects.get(user=user)
	table=Tables.objects.get(table_number=guest_profile.table_number)
	table.status=True
	table.save()
	total_orders=RestaurantOrders.objects.filter(order_date__date=date.today()).filter(user=request.user).filter(status=False)
	total=0
	for o in total_orders:
		total+=o.amount
	guest_profile.status=False
	guest_profile.table=None
	guest_profile.save()
	RestaurantOrders.objects.filter(user=user).update(status=False)
	bill=Bills.objects.create(user=user,total_amount=total,billing_date_from=guest_profile.date,billing_date_to=date.today(),bill_type='Restaurant',payment_type='Cash')
	bill.save()
	messages.info(request,'Thanks for visiting MMVR International! Hope to serve you again!')
	return redirect('/logout')