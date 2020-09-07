from django.urls import path
from . import views

urlpatterns=[
path('',views.restaurant,name='restaurant'),
path('signup',views.signup,name='signup'),
path('order',views.order,name='order'),
path('orderhistory',views.orderhistory,name='orderhistory'),
path('confirm',views.confirm,name='confirm'),
path('checkout',views.checkout,name='checkout'),
]
