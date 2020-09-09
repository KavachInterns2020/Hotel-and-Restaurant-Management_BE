# Hotel And Restaurant Management
## Team 2020T0011

### Team Members:
1. M Venkateshwar Reddy (InternID- INTERN202000188)
2. Mukund N Acharya (InternID- INTERN202000136)
3. Manjunath B (InternID - INTERN202000241)
4. Rahul KP (InternID - INTERN202000142)

## About The Project:
### Types of Users of the Application:
<ol><li><b>Admin Profile: </b>The users with admin profiles are the staff of the organization like Owners, Chefs, Laundry Managers and Room Service Managers.</li>
<li><b>Guest Profile(Restaurant Profile): </b>The users with Guest profiles are Restaurant users who can create a new account and can order food using the food order page.</li>
<li><b>UserProfile(Hotel Guest Profile): </b>The users with User Profile are Users who stay at one of the hotel rooms and can avail the services through the application like:
<ol>
  <li>Ordering Food.</li>
  <li>Ordering RoomServices.</li>
  <li>Ordering Laundry Services.</li>
  <li>Extending stay time.</li>
  <li>Changing Password.</li>
  </ol>
  </li>
  </ol>

## Steps for Setup:
<ol><li>Go to https://github.com/KavachNetworks/Hotel-and-Restaurant-Management_BE for the Source code of the project.</li>
  <li>Go to  “Code” Button Click on the “Download Zip” Button.</li>
  <li>Unzip the downloaded ZIP file and put it in a folder.</li>
  <li>Go to command prompt and create a Virtual Environment by typing:</li>
 <b> <ol><li>sudo apt install python-pip</li>
    <li>sudo pip install virtualenvwrapper</li>
    <li>mkvirtualenv django</li>
   </ol></b>
<li>Work on the current environment created by typing <b>“workon django”</b> in the command prompt.</li>
<li>Install all the dependencies for the project by typing 
  <ol><b><li>pip install -r requirements.txt</li></b></ol>
<li>Install PostgreSQL server (https://www.postgresql.org/download/) and PGAdmin(https://www.pgadmin.org/download/).</li>
  <li>During installation, set password as <b>‘password’</b> ONLY. (Putting some other password will lead to a change in django settings folder to run.)</li>
<li>After Installation is complete, open PGadmin and create a database with the name ‘Hotel_And_Restaurant’ ONLY.</li>
  <li>Go to the unzipped folder location and go to the folder named <b>“Hotel_And_Restaurant”</b> and open a command prompt in this location.</li>
<li>If you want to use the already prepared database by us, which has been set up by dummy values, you can import the database with the filename <b>“hotelfinal.sql”</b> into the <b>“Hotel_And_Restaurant”</b> database created earlier in pgadmin and then you can directly login using the credentials provided in the readme file of the project. For that, run the server and go to <b>127.0.0.1:8000</b> and login. Else to prepare the whole database, follow the next steps.</li>
<li>Type django <b>manage.py createsuperuser</b> (This will be the login credential for the superuser for access django-admin) and enter username, email and password of your choice.</li>
  <li>Type <b>“python manage.py makemigrations”</b></li>
  <li>Type <b>“python manage.py migrate”</b></li>
  <li>Type <b>“python manage.py runserver”</b></li>
<li>After typing you will see a link like <b>“127.0.0.1:8000”</b>. Put this in a web browser.</li>
<li>You will see the homepage. Now in the address bar add “/admin” after the link like <b>“127.0.0.1:8000/admin”</b>.</li>
  <li>Login using your super user credentials.</li>
  <li>You will see a Users tab, click and create a User.</li>
  <li>After this, go to Admin Profile Tab and link this user as a “owner” (all lower case)</li>
<li>After the creation of the owner, create rooms by clicking Rooms in the admin main page. The room types are:
  <ol><b><li>Deluxe Double Bed</li>
    <li>Classic Single Bed</li>
    <li>Classic Double Bed</li></b></ol>
<b>NOTE-</b> Please put the same name as these including the Cases of the words for testing of the current prototype, These can be changed according to the hotel’s need by the backend team.</li>
  <li>Set a price for each room type in the room creation page.</li>
  <li>Create Restaurant tables by clicking the tables on the django-admin page.</li>
<li>Now logout of the admin portal as the superuser by clicking logout in the top right corner of the Django-admin site.</li>
  <li>Now, run the django server using <b>"python manage.py runserver"</b> if not run previously.</li>
<li>In the address bar, type the url <b>“127.0.0.1:8000”</b>. The homepage should appear. Login as owner using owner credentials and create admins like Receptionists, chef etc. so the software can start to function.</li>
<li>The user creations further can be done using the website. </li>
</ol>
