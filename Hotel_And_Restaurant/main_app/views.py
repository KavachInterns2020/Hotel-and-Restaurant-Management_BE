from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.models import User,auth
from django.contrib import messages
from user.views import *
# Create your views here.
def logout(request):
	auth.logout(request)
	return redirect('/')
def index(request):
    return render(request,'index.html')

def login(request):
	if request.method=='POST':
		user_name=request.POST['username']
		password=request.POST['password']
		if len(user_name)==0:
			return render(request,'login.html',{'message':'Username is Empty!!!'})
		elif len(password)==0:
			return render(request,'login.html',{'message':'Password is Empty!!!'})
		else:
			user=auth.authenticate(username=user_name,password=password)
			if user is not None:
				auth.login(request,user)
				if hasattr(user,'adminprofile'):
					return redirect('/staff/dashboard')
				elif hasattr(user,'userprofile'):
					return redirect('/user/dashboard')
				else:
					return redirect('/restaurant')
					






			else:
				return render(request,'login.html',{'message':'Username or Password is incorrect. Try again!'})

	else:
		return render(request,'login.html')


def gotodash(request):
	user=request.user
	if hasattr(user,'adminprofile'):
		return redirect('/staff/dashboard')
	elif hasattr(user,'userprofile'):
		return redirect('/user/dashboard')
	else:
		return HttpResponse('Welcome ' + user.first_name + ' your table number is '+ user.guestprofile.table_number)


