from django.urls import path
from . import views

urlpatterns=[
path('dashboard',views.dashboard,name='dashboard'),
path('roomservice',views.roomservice,name='roomservice'),
path('rsremoveorder/<str:pk>',views.rsremoveorder,name='rsremoveorder'),
path('laundry',views.laundry,name='laundry'),
path('ldremoveorder/<str:pk>',views.ldremoveorder,name='ldremoveorder'),
]
