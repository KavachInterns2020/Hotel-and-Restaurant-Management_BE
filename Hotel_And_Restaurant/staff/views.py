from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.models import User,auth
from django.contrib import messages
from main_app.models import *
from datetime import datetime,date,timedelta
import smtplib
from django.utils import timezone

def dashboard(request):
	user=request.user
	job=str(user.adminprofile.admin_type)
	job=job.lower()
	if job=='owner':
		return redirect('/staff/owner')
	elif job=='chef':
		return redirect('/staff/chef')

	elif job=='receptionist':
		return redirect('/staff/reception')

	elif job=='laundry':
		return redirect('/staff/laundry')

	else:
		return redirect('/staff/roomservice')


def roomservice(request):
	services=Services.objects.filter(service_type='roomservice').filter(order_status=True)
	total=Services.objects.filter(service_type='roomservice').count()
	active=len(services)
	completed=total-active
	return render(request,'room_service_dashboard.html',{'services':services,'active':active,'completed':completed,'total':total})


def rsremoveorder(request,pk):
	service=Services.objects.get(id=pk)
	service.order_status=False
	service.save()
	messages.info(request, 'Room service Order number '+str(service.id)+' completed!')
	return redirect('/staff/roomservice')

def laundry(request):
	services=Services.objects.filter(service_type='laundry').filter(order_status=True)
	total=Services.objects.filter(service_type='laundry').count()
	active=len(services)
	completed=total-active
	return render(request,'laundry_dashboard.html',{'services':services,'active':active,'completed':completed,'total':total})

def ldremoveorder(request,pk):
	service=Services.objects.get(id=pk)
	service.order_status=False
	service.save()
	messages.info(request, 'Laundry Order number '+str(service.id)+' completed!')
	return redirect('/staff/laundry')

def laundry_history(request):
	active=Services.objects.filter(service_type='laundry').filter(order_status=True).count()
	total=Services.objects.filter(service_type='laundry').count()
	services=Services.objects.filter(service_type='laundry')
	completed=total-active
	return render(request,'view_laundry_history.html',{'services':services,'active':active,'completed':completed,'total':total})

def roomservice_history(request):
	active=Services.objects.filter(service_type='roomservice').filter(order_status=True).count()
	total=Services.objects.filter(service_type='roomservice').count()
	services=Services.objects.filter(service_type='roomservice')
	completed=total-active
	return render(request,'view_roomservice_history.html',{'services':services,'active':active,'completed':completed,'total':total})

def owner(request):
	days=date.today().day
	months=date.today().month
	years=date.today().year
	hotel_customers_today=UserProfile.objects.filter(start_date__contains=date(years,months,days)).count()
	restaurant_customers_today=GuestProfile.objects.filter(date__contains=date(years,months,days)).count()
	orders=Services.objects.filter(order_date__contains=date(years,months,days))
	rest_orders=RestaurantOrders.objects.filter(order_date__contains=date(years,months,days))
	total_rest_amount=0.0
	for o in rest_orders:
		total_rest_amount+=o.amount
	hotel_customers=User.objects.filter(userprofile__isnull=False)
	total_amount=0.0
	for order in orders:
		total_amount+=order.amount
	return render(request,'owner_dashboard.html',{'rest_amount':total_rest_amount,'restaurant_customers':restaurant_customers_today,'hotel_customers':hotel_customers_today,'total_amount':total_amount,'customers':hotel_customers})

def reception(request):
	total_number=UserProfile.objects.filter(status=True).count()
	current_customers=User.objects.filter(userprofile__isnull=False)
	days=date.today().day
	months=date.today().month
	years=date.today().year
	hotel_customers_today=UserProfile.objects.filter(start_date__contains=date(years,months,days)).count()
	return render(request,'receptionist_dashboard.html',{'total':total_number,'today':hotel_customers_today,'current_customers':current_customers})

def checkvacancy(request):
	range1=Room.objects.filter(room_type='Deluxe Double Bed').filter(available=True)
	range2=Room.objects.filter(room_type='Classic Double Bed').filter(available=True)
	range3=Room.objects.filter(room_type='Classic Single Bed').filter(available=True)
	return render(request,'room_vacancy.html',{'range1':range1,'range2':range2,'range3':range3})

def checkin(request,pk):
	if request.method=='GET':
		room=Room.objects.get(id=pk)
		return render(request,'checkin_form.html',{'room':room})
	else:
		room=Room.objects.get(id=pk)
		room_number=room.room_number
		amount=room.price
		first_name=request.POST['firstname']
		last_name=request.POST['lastname']
		email=request.POST['email']
		phone=request.POST['phone']
		aadhar_number=request.POST['aadhar']
		address=request.POST['address']
		start_date=datetime.now()
		start=date.today()
		end_date=request.POST['checkout']
		end_date=datetime.strptime(end_date,'%Y-%m-%d').date()
		day=end_date-start
		day=day.days
		if day<1:
			messages.info(request, 'End date cant be before start date')
			return redirect('/staff/reception/checkvacancy')
		total_amount=amount*day
		username=email.split('@')[0]
		password=User.objects.make_random_password()
		user=User.objects.create_user(username=username,password=password,first_name=first_name,last_name=last_name,email=email)
		userprofile=UserProfile(user=user,room_number=room_number,phone=phone,address=address,aadhar_number=aadhar_number,room=room,start_date=start_date,end_date=end_date,status=True)
		user.save()
		userprofile.save()
		room.available=False
		room.save()
		service=Services.objects.create(user=user,user_room_number=room.room_number,amount=total_amount,service_type='Checkin Fees',order_date=start_date)
		service.save()
		server=smtplib.SMTP('smtp.gmail.com',587)
		server.ehlo()
		server.starttls()
		server.ehlo()
		server.login('mukundacharya2020@gmail.com','cdxsfozsqkposogy')
		subject ="Your Account Details for Login to MMVR International!"
		body="Thanks for Checking In!\nYour username is "+username+" and your password is "+password+". Have a happy stay!!"
		msg= f"Subject: {subject}\n\n{body}"
		server.sendmail('mukundacharya2020@gmail.com',email,msg)
		print("Email has been sent!")
		server.quit()
		messages.info(request, 'CheckIn Complete!')
		return redirect('/staff/reception')


def checkout(request,pk):
	user=User.objects.get(id=pk)
	total_amount=0
	services=Services.objects.filter(user=user)
	for service in services:
		total_amount+=service.amount
	if request.method=='GET':
		return render(request,'checkout_form.html',{'user':user,'amount':total_amount})
	else:
		payment_type=request.POST['modeofpayment']
		userprofile=UserProfile.objects.get(user=user)
		room=Room.objects.get(id=userprofile.room_id)
		room.available=True
		room.save()
		userprofile.status=False
		userprofile.room=None
		userprofile.end_date=date.today()
		userprofile.save()
		Services.objects.filter(user=user).update(order_status=False)
		bill=Bills.objects.create(user=user,bill_type='Hotel Accomodation',total_amount=total_amount,billing_date_from=user.userprofile.start_date,billing_date_to=user.userprofile.end_date,payment_type=payment_type)
		bill.save()
		return redirect('/staff/reception')

def add(request):
	if request.method=='GET':
		return render(request,'newadmin_form.html')
	else:
		first_name=request.POST['firstname']
		last_name=request.POST['lastname']
		email=request.POST['email']
		phone=request.POST['phone']
		admin_type=request.POST['admin_type']
		if admin_type=='notchoosen':
			messages.info(request,'Choose a admin_type!')
			return render(request,'newadmin_form.html')
		username=email.split('@')[0]
		password=User.objects.make_random_password()
		print(password)
		user=User.objects.create_user(username=username,password=password,first_name=first_name,last_name=last_name,email=email)
		adminprofile=AdminProfile.objects.create(user=user,admin_type=admin_type,phone=phone,status=True)
		user.save()
		adminprofile.save()
		server=smtplib.SMTP('smtp.gmail.com',587)
		server.ehlo()
		server.starttls()
		server.ehlo()
		server.login('mukundacharya2020@gmail.com','cdxsfozsqkposogy')
		subject ="Your Account Details for Login to MMVR International!"
		body="Congatulations for your new role in MMVR International!\nYour username is "+username+" and your password is "+password+"."
		msg= f"Subject: {subject}\n\n{body}"
		server.sendmail('mukundacharya2020@gmail.com',email,msg)
		print("Email has been sent!")
		server.quit()
		messages.info(request,'New Admin Successfully created! Login Credentials sent to User!')
		return redirect('/staff/add')

def viewhotelcustomers(request):
	current_customers=UserProfile.objects.filter(status=True).count()
	total_customers=User.objects.filter(userprofile__isnull=False).count()
	customers=User.objects.filter(userprofile__isnull=False)
	context={'current_customers':current_customers,'total_customers':total_customers,'customers':customers}
	return render(request,'view_hotel_customers.html',context)

def viewemployees(request):
	total_admins=AdminProfile.objects.all().count()
	current_admins=AdminProfile.objects.filter(status=True).count()
	admins=User.objects.filter(adminprofile__isnull=False)
	context={'total':total_admins,'current':current_admins,'admins':admins}
	return render(request,'View_Employees.html',context)

def changeempstatus(request,pk):
	user=User.objects.get(id=pk)
	adminprofile=AdminProfile.objects.get(user=user)
	if adminprofile.status==True:
		adminprofile.status=False
	else:
		adminprofile.status=True
	adminprofile.save()
	messages.info(request,'Admin status changed!')
	return redirect('/staff/owner/viewemployees')

def hotelbills(request):
	days=date.today().day
	months=date.today().month
	years=date.today().year
	today_services=Services.objects.filter(order_date__contains=date(years,months,days))
	total_services=Services.objects.all()
	total_earnings=0.0
	today_earnings=0.0
	for s in total_services:
		total_earnings+=s.amount
	for s in today_services:
		today_earnings+=s.amount
	context={'total':total_earnings,'today':today_earnings,'bills':total_services}
	return render(request,'view_hotel_bills.html',context)

def managemenu(request):
	breakfast=MenuItems.objects.filter(menu_type='Breakfast')
	starters=MenuItems.objects.filter(menu_type='Starters')
	main_course=MenuItems.objects.filter(menu_type='Main Course')
	desserts=MenuItems.objects.filter(menu_type='Dessert')
	context={'breakfast':breakfast,'starters':starters,'maincourse':main_course,'desserts':desserts}
	return render(request,'manage_menu.html',context)

def addmenu(request):
	if request.method=="GET":
		return render(request,'add_menu.html')
	else:
		item_name=request.POST['itemname']
		if len(request.FILES)==0:
			messages.info(request,'Please upload an image!')
			return render(request,'add_menu.html')
		item_picture=request.FILES['item_img']
		item_description=request.POST['description']
		item_price=request.POST['price']
		menu_type=request.POST['menutype']
		food_type=request.POST['food_type']
		print(type(item_picture))
		if len(item_name)==0 or len(item_description)==0 or item_price==0.0 or menu_type=='notchoosen' or food_type=='notchoosen':
			messages.info(request,'Some fields are empty')
			return render(request,'add_menu.html')
		else:
			menu_item=MenuItems.objects.create(item_name=item_name,item_picture=item_picture,item_description=item_description,item_price=item_price,menu_type=menu_type,food_type=food_type)
			menu_item.save()
			messages.info(request,'New Menu Item Added!!!!')
			return render(request,'add_menu.html')

def updatemenu(request,pk):
	if request.method=="GET":
		item=MenuItems.objects.get(id=pk)
		return render(request,'update_menu_item.html',{'item':item})
	else:
		item=MenuItems.objects.get(id=pk)
		item_name=request.POST['itemname']
		item_description=request.POST['description']
		item_price=request.POST['price']
		menu_type=request.POST['menutype']
		food_type=request.POST['food_type']
		if len(item_name)==0 or len(item_description)==0 or item_price==0.0 or menu_type=='notchoosen' or food_type=='notchoosen':
			messages.info(request,'Some fields are empty')
			return render(request,'update_menu_item.html',{'item':item})
		if len(request.FILES)==0:
			item.item_name=item_name
			item.item_description=item_description
			item.item_price=item_price
			item.menu_type=menu_type
			item.food_type=food_type
			item.save()
		else:
			item_img=request.FILES['item_img']
			item.item_name=item_name
			item.item_picture=item_img
			item.item_description=item_description
			item.item_price=item_price
			item.menu_type=menu_type
			item.food_type=food_type
			item.save()
		messages.info(request,'Menu Item Updated!!!!')
		return redirect('/staff/managemenu')

def deletemenu(request,pk):
	item=MenuItems.objects.get(id=pk)
	name=item.item_name
	item.delete()
	messages.info(request,'The item '+name+' has been deleted!')
	return redirect('/staff/managemenu')

def chef(request):
	foodservices=FoodServices.objects.filter(status=True)
	restaurant_orders=RestaurantOrders.objects.filter(status=True)
	today=Services.objects.filter(service_type='food').filter(order_date__date=date.today())
	total=0
	for i in today:
		total+=FoodServices.objects.filter(service=i.id).count()
	today_rest=RestaurantOrders.objects.filter(order_date__date=date.today()).count()
	total+=today_rest
	active=FoodServices.objects.filter(status=True).count()
	active_rest=RestaurantOrders.objects.filter(status=True).count()
	active+=active_rest
	completed=total-active
	if completed < 0:
		completed=0
	return render(request,'chef_dashboard.html',{'restaurant':restaurant_orders,'foodservices':foodservices,'active':active,'completed':completed,'total':total})

def fsremoveorder(request,pk):
	foodservice=FoodServices.objects.get(id=pk)
	foodservice.status=False
	foodservice.save()
	service=Services.objects.filter(id=foodservice.service_id).filter(order_status=True)
	if(len(service)>0):
		order=Services.objects.get(id=foodservice.service_id)
		order.order_status=False
		order.save()

	messages.info(request, 'Room service Order number '+str(foodservice.id)+' completed!')
	return redirect('/staff/chef')

def food_history(request):
	foodservices=FoodServices.objects.all()
	restaurant_orders=RestaurantOrders.objects.all()
	today=Services.objects.filter(service_type='food').filter(order_date__date=date.today())
	total=0
	for i in today:
		total+=FoodServices.objects.filter(service=i.id).count()
	today_rest=RestaurantOrders.objects.filter(order_date__date=date.today()).count()
	total+=today_rest
	active=FoodServices.objects.filter(status=True).count()
	active_rest=RestaurantOrders.objects.filter(status=True).count()
	active+=active_rest
	completed=total-active
	if completed < 0:
		completed=0
	return render(request,'view_food_history.html',{'restaurant':restaurant_orders,'foodservices':foodservices,'active':active,'completed':completed,'total':total})


def status(request):
	breakfast=MenuItems.objects.filter(menu_type='Breakfast')
	starters=MenuItems.objects.filter(menu_type='Starters')
	main_course=MenuItems.objects.filter(menu_type='Main Course')
	desserts=MenuItems.objects.filter(menu_type='Dessert')
	context={'breakfast':breakfast,'starters':starters,'maincourse':main_course,'desserts':desserts}
	return render(request,'update_menu_status.html',context)

def updatestatus(request,pk):
	item=MenuItems.objects.get(id=pk)
	if(item.available_status==True):
		s1='Available'
		s2='Not Available'
		item.available_status=False
	else:
		s1='Not Available'
		s2='Available'
		item.available_status=True
	item.save()
	messages.info(request,'Status for '+item.item_name+" has been changed from "+s1+" to "+s2)
	return redirect('/staff/chef/status')

def completeorder(request,pk):
	food_order=RestaurantOrders.objects.get(id=pk)
	food_order.status=False
	food_order.save()
	messages.info(request,'Restaurant Order number '+str(food_order.id)+ ' has been completed!')
	return redirect('/staff/chef')

def viewrestaurantcustomers(request):
	days=date.today().day
	months=date.today().month
	years=date.today().year
	today_customers=GuestProfile.objects.filter(date__contains=date(years,months,days)).count()
	hotel_customers=User.objects.filter(guestprofile__isnull=False)
	hotel_count=User.objects.filter(guestprofile__isnull=False).count()
	context={'customers':hotel_customers,'today_count':today_customers,'total_count':hotel_count}
	return render(request,'view_restuarant_customers.html',context)

def viewrestaurantbills(request):
	days=date.today().day
	months=date.today().month
	years=date.today().year
	today_orders=RestaurantOrders.objects.filter(order_date__contains=date(years,months,days))
	total_orders=RestaurantOrders.objects.all()
	today_earnings=0.0
	total_earnings=0.0
	for t in today_orders:
		today_earnings+=t.amount
	for t in total_orders:
		total_earnings+=t.amount
	context={'orders':today_orders,'today':today_earnings,'total':total_earnings}
	return render(request,'view_restuarant_bills.html',context)
