from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.models import User,auth
from django.contrib import messages
# Create your views here.
def index(request):
    return render(request,'index.html')

def login(request):
	if request.method=='POST':
		user_name=request.POST['username']
		password=request.POST['password']
		if len(user_name)==0:
			return render(request,'home_login.html',{'message':'Username is Empty!!!'})
		elif len(password)==0:
			return render(request,'home_login.html',{'message':'Password is Empty!!!'})
		else:
			user=auth.authenticate(username=user_name,password=password)
			if user is not None:
				auth.login(request,user)
				if hasattr(user,'adminprofile'):
					return HttpResponse('Welcome ' + user.first_name + ' your designation is '+ user.adminprofile.admin_type)
				elif hasattr(user,'userprofile'):
					return HttpResponse('Welcome ' + user.first_name + ' your Aadhar number is '+ user.userprofile.aadhar_number)
				else:
					return HttpResponse('Welcome ' + user.first_name + ' your table number is '+ user.guestprofile.table_number)
					






			else:
				return render(request,'home_login.html',{'message':'Username or Password is incorrect. Try again!'})

	else:
		return render(request,'home_login.html')


