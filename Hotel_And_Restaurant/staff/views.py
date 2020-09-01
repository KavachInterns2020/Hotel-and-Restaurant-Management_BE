from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.models import User,auth
from django.contrib import messages
from main_app.models import *

def dashboard(request):
	user=request.user
	job=str(user.adminprofile.admin_type)
	job=job.lower()
	if job=='owner':
		return render(request,'owner_dashboard.html')
	elif job=='chef':
		return render(request,'chef_dashboard.html')

	elif job=='receptionist':
		return render(request,'receptionist_dashboard.html')

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
	return redirect('/staff/laundry')