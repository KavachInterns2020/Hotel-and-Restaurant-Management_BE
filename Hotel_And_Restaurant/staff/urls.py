from django.urls import path
from . import views

urlpatterns=[
path('dashboard',views.dashboard,name='dashboard'),
path('roomservice',views.roomservice,name='roomservice'),
path('rsremoveorder/<str:pk>',views.rsremoveorder,name='rsremoveorder'),
path('laundry',views.laundry,name='laundry'),
path('ldremoveorder/<str:pk>',views.ldremoveorder,name='ldremoveorder'),
path('laundry/history',views.laundry_history,name="laundry_history"),
path('roomservice/history',views.roomservice_history,name="roomservice_history"),
path('owner',views.owner,name='owner'),
path('reception',views.reception,name='reception'),
path('reception/checkvacancy',views.checkvacancy,name='checkvacancy'),
path('reception/checkin/<str:pk>',views.checkin,name='checkin'),
path('reception/checkout/<str:pk>',views.checkout,name='checkout'),
path('add',views.add,name='add'),
path('owner/viewhotelcustomers',views.viewhotelcustomers,name='viewhotelcustomers'),
path('owner/viewemployees',views.viewemployees,name='viewemployees'),
path('changeempstatus/<str:pk>',views.changeempstatus,name='changeempstatus'),
path('owner/hotelbills',views.hotelbills,name='hotelbills'),
path('managemenu',views.managemenu,name='managemenu'),
path('addmenu',views.addmenu,name='addemnu'),
path('updatemenu/<str:pk>',views.updatemenu,name='updatemenu'),
path('deletemenu/<str:pk>',views.deletemenu,name='deletemenu'),
path('chef',views.chef,name='chef'),
path('chef/status',views.status,name='status'),
path('updatestatus/<str:pk>',views.updatestatus,name='updatestatus'),
]
