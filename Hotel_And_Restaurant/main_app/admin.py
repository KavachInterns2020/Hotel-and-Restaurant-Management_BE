from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(AdminProfile)
admin.site.register(GuestProfile)
admin.site.register(UserProfile)
admin.site.register(Room)
admin.site.register(Services)
admin.site.register(RoomServices)
admin.site.register(MenuItems)
admin.site.register(Tables)
