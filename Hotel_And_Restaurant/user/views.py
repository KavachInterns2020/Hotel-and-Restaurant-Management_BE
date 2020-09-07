from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.models import User,auth
from django.contrib import messages
from main_app.models import *
from datetime import datetime,timedelta,date
import json

# Create your views here.
def dashboard(request):
	user=request.user
	costs=Services.objects.filter(user=user)
	total_cost=0.0
	for cost in costs:
		total_cost+=cost.amount
	return render(request,'user_dashboard.html',{'cost':total_cost})

def roomservice(request):
	if request.method=='POST':
		user=request.user
		service_type='roomservice'
		amount=0.0
		user_room_number=user.userprofile.room.room_number
		option=request.POST['optradio']
		message=request.POST['message']
		service=Services.objects.create(user=user,amount=amount,service_type=service_type,user_room_number=user_room_number)
		roomservice_object=RoomServices.objects.create(service=service,option=option,message=message)
		service.save()
		roomservice_object.save()
		messages.info(request, 'Your order has been placed! Check in your order history for all the roomservice orders placed.')
		return redirect('/user/dashboard')

	else:
		return render(request,'roomservice_form.html')

def laundry(request):
	if request.method=='POST':
		now= datetime.now()
		tomorrow=datetime.now() + timedelta(days=1)
		user=request.user
		user_room_number=user.userprofile.room.room_number
		service_type='laundry'
		amount=float(request.POST['cost'])
		quantity=request.POST['quantity']
		if quantity=='':
			messages.info(request, 'Quantity cannot be zero!')
			return render(request,'user_laundry_form.html',{'today':now,'tomorrow':tomorrow})
		quantity=int(request.POST['quantity'])
		garment_type=request.POST['garment_type']
		laundry_type=request.POST['laundry_type']
		instructions=request.POST['instructions']


		if garment_type=='notchoosen':
			messages.info(request, 'Choose a Garment Type!')
			return render(request,'user_laundry_form.html',{'today':now,'tomorrow':tomorrow})
		if amount==0:
			if laundry_type=='wash':
				amount=quantity*30
			elif laundry_type=='iron':
				amount=quantity*60
			else:
				amount=quantity*100
		service=Services.objects.create(user=user,amount=amount,service_type=service_type,user_room_number=user_room_number)
		laundry_object=LaundryService.objects.create(service=service,quantity=quantity,garment_type=garment_type,laundry_type=laundry_type,instructions=instructions)
		service.save()
		laundry_object.save()
		messages.info(request, 'Your order has been placed! Check in your order history for all the Laundry orders placed.')
		return redirect('/user/dashboard')
	else:
		now= datetime.now()
		tomorrow=datetime.now() + timedelta(days=1)
		return render(request,'user_laundry_form.html',{'today':now,'tomorrow':tomorrow})


def transactions(request):
	user=request.user
	costs=Services.objects.filter(user=user)
	total_cost=0.0
	for cost in costs:
		total_cost+=cost.amount
	transactions=Services.objects.filter(user=user)
	return render(request,'view_transactions.html',{'transactions':transactions,'cost':total_cost})


def extendstay(request):
	user=request.user
	price=user.userprofile.room.price
	if request.method=='GET':
		return render(request,'stay_extend.html',{'price': price})
	else:
		old_date=user.userprofile.end_date
		new_date=request.POST['newcheckout']
		new_date=datetime.strptime(new_date,'%Y-%m-%d').date()
		delta=new_date-old_date
		days=delta.days
		if days<1:
			messages.info(request, 'New Date cannot be less than Old date!!!!')
			return redirect('/user/extendstay')
		total_amount=price*days
		user_room_number=user.userprofile.room.room_number
		amount=total_amount
		service_type='date extension'
		order_status=False
		service=Services.objects.create(user=user,user_room_number=user_room_number,amount=amount,service_type=service_type,order_status=order_status)
		service.save()
		user_id=user.id
		user_obj=UserProfile.objects.get(user_id=user_id)
		user_obj.end_date=new_date
		user_obj.save()
		messages.info(request, 'Your date has been extended!!!')
		return redirect('/user/extendstay')


def changepassword(request):
	if request.method=='GET':
		return render(request,'change_password.html')
	else:
		oldpassword=request.POST['oldpassword']
		newpassword=request.POST['newpassword']
		newpassword_confirm=request.POST['confirmnewpassword']
		user=request.user
		if newpassword!=newpassword_confirm:
			messages.info(request, 'New passwords do not match! Try again')
			return redirect('/user/changepassword')
		else:
			user.set_password(newpassword)
			user.save()
			messages.info(request,'Your password has been changed, please relogin')
			return redirect('/logout')

def orderfood(request):
	if request.method=='POST':
		user=request.user
		user_room_number=user.userprofile.room.room_number
		service_type='food'
		cart=request.POST['cart_list']
		total=0.0
		cart=json.loads(cart)
		for item in cart:
			price=item['product_price'].split('.')[0]
			total+=int(price)*int(item['product_quantity'])
		service=Services.objects.create(user=user,amount=total,service_type=service_type,user_room_number=user_room_number)
		for item in cart:
			menu=MenuItems.objects.get(item_name=item['product_name'])
			quantity=int(item['product_quantity'])
			foodservice=FoodServices.objects.create(service=service,menu_item=item['product_name'],where=user_room_number,quantity=quantity)
		service.save()
		foodservice.save()


		messages.info(request, 'Your order has been placed! Check in your order history for all the food orders placed.')
		return redirect('/user/dashboard')
	else:
		breakfast=MenuItems.objects.filter(menu_type='Breakfast')
		starters=MenuItems.objects.filter(menu_type='Starters')
		main_course=MenuItems.objects.filter(menu_type='Main Course')
		desserts=MenuItems.objects.filter(menu_type='Dessert')
		for b in breakfast:
			b.item_price+=(5*b.item_price)//100
		for s in starters:
			s.item_price+=(5*b.item_price)//100
		for m in main_course:
			m.item_price+=(5*b.item_price)//100
		for d in desserts:
			d.item_price+=(5*b.item_price)//100
		context={'breakfast':breakfast,'starters':starters,'maincourse':main_course,'desserts':desserts}
		return render(request,'food_order.html',context)
