from django.urls import path
from . import views

urlpatterns=[
path('dashboard',views.dashboard,name='dashboard'),
path('roomservice',views.roomservice,name='roomservice'),
path('laundry',views.laundry,name='laundry'),
path('transactions',views.transactions,name='transactions'),
path('extendstay',views.extendstay,name='extendstay'),
#path('getdelta',views.getdelta,name='getdelta')
]
