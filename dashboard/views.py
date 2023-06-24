from django.contrib.sessions.backends.db import SessionStore
from django.shortcuts import render,  HttpResponseRedirect
from django.shortcuts import redirect
from django.contrib.auth.models import User
from .models import Course, Student, StudentOptedCourses, student_academics , Event , event_registration, Order
from django.db.models import Q
from django.contrib.auth.hashers import make_password, check_password
from datetime import datetime, date, time
from django.contrib.auth import login as request_login_user
from django.contrib.auth import logout as request_logout_user
from django.db import connection
from django.utils import timezone
from datetime import timedelta , time

# for Payment Gateway
from instamojo_wrapper import Instamojo
from django.conf import settings

# for sending the Mails
from django.core.mail import send_mail

# Create your views here.


def home(request):
    return render(request, 'index_new.html')


def signup_view(request):
    if request.method == 'POST':
        print("hello")
        email = request.POST.get('email')
        password = request.POST.get('password')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        username = f'{first_name} {last_name}'
        phone = request.POST.get('contact')
        dob = request.POST.get('dob')
        gender = request.POST.get('gender')
        address = request.POST.get('address')
        working_status = request.POST.get('working_status')
        qualification = request.POST.get('qualification')
        college_university = request.POST.get('college_university')
        passing_year = request.POST.get('passing_year')
        source = request.POST.get('source')
        user = User.objects.filter(Q(username=username) | Q(email=email))
        errors = []
        if user:
            errors.append('User already exists!! Please login')
            print(errors[-1])
        else:
            user = User(username=email, password=make_password(password))
            user.email = email
            user.first_name = first_name
            user.last_name = last_name
            user.last_login = datetime.now()
            user.save()
            student = Student()
            student.user = user
            student.email = email
            student.fullname = first_name + last_name
            student.phone = phone
            student.dob = dob
            student.gender = gender
            student.address = address
            student.working_status = working_status
            student.source = source
            student.save()
            student_academic = student_academics()
            student_academic.student_id = student
            student_academic.college_university = college_university
            student_academic.qualification = qualification
            student_academic.passing_year = passing_year
            student_academic.save()
            errors.append('Sign Up Successfull!! Please Login.')
            print('errors', errors[-1])
            return HttpResponseRedirect('/login/')
    return render(request, 'form.html')


def login_view(request):
    if request.method == 'POST':
        post_data = request.POST
        username = post_data.get('email')
        password = post_data.get('password')
        user = User.objects.filter(
            Q(username=username) | Q(email=username)).last()
        if user and check_password(password, user.password):
            request_login_user(
                request, user, backend='django.contrib.auth.backends.ModelBackend')
            print('logged in')
            return HttpResponseRedirect('/')
        else:
            errors = ['Invalid Username/password!!']
            print(errors)
            return render(request, 'login.html')

    return render(request, 'login.html')


def all_courses(request):
    all_courses = Course.objects.all()
    courses = []
    for course in all_courses:
        instructors = list(course.instructor_id.all())
        courses.append({'course': course, 'instructors': instructors})
        print(instructors)
    return render(request, "courses_new.html", {'courses': courses})



def instructors(request):
    return render(request , 'instructors_new.html')

 

from datetime import datetime, timedelta, time

def add_times(time1, time2):
    # Create datetime objects with the minimum date and the time values
    datetime1 = datetime.combine(datetime.min, time1)
    datetime2 = datetime.combine(datetime.min, time2)

    # Calculate the duration between the two time values
    duration = timedelta(hours=datetime2.hour, minutes=datetime2.minute, seconds=datetime2.second)

    # Add the duration to the first datetime object
    result_datetime = datetime1 + duration

    # Extract the time component from the resulting datetime object
    result_time = result_datetime.time()

    return result_time





def events(request):
    all_events = Event.objects.all()
    events = []
    upcoming_events = []
    live_events = []
    past_events = []
    current_datetime = timezone.localtime(timezone.now())  
    for event in all_events:
        print(event.event_duration)
        events.append({'event': event})
        event_end_time = add_times(event.event_duration,event.event_datetime.time())
        if event.event_datetime.date() < current_datetime.date() or event.event_datetime.time() < current_datetime.time():
            upcoming_events.append({'event': event})
        elif event.event_datetime.date() > current_datetime.date() or event.event_datetime.time() > current_datetime.time():
            past_events.append({'event': event})
        elif event.event_datetime.date() == current_datetime.date() and current_datetime.time()<event_end_time and current_datetime.time()>event.event_datetime.time():
            live_events.append({'event': event})
    print(upcoming_events)
    print(live_events)
    print(past_events)
    print(current_datetime)
    return render(request, 'events.html', {'events': events,'upcoming_events': upcoming_events,'live_events': live_events,'past_events': past_events
    })


def register_events(request , event_name):
    event = Event.objects.get(event_name=event_name)
    event_id = event.event_id
    print(event_id)
    if(request.method == 'POST'):
        print("IN poST method")
        if(request.user.is_authenticated):
            print("student registered for event")
            event_register = event_registration()
            logged_user = Student.objects.get(user=request.user)
            event_register.student_id = logged_user
            event_register.event_id = event
            event_register.save()
            return HttpResponseRedirect("/all_events/")
        else:
            return HttpResponseRedirect('/login/')
    return render(request, 'event_details.html' , {'event': event})

def register_courses(request, course_id):
    course = Course.objects.get(course_id=course_id)
    if(request.method == 'POST'):
        #     print("register course")
        #     student_opted_course = StudentOptedCourses()
        #     logged_user = Student.objects.get(user=request.user)
        #     student_opted_course.student_id = logged_user
        #     student_opted_course.course_id = course_id
        #     student_opted_course.save()
        return HttpResponseRedirect("/payment/")
    return render(request, 'course_new.html', {'course': course})


# for payment gateway
def verification(request, course_id):
    if(request.user.is_authenticated):
        api = Instamojo(api_key = settings.API_KEY, auth_token = settings.AUTH_TOKEN, endpoint = "https://test.instamojo.com/api/1.1/")

        course = Course.objects.get(course_id=course_id)
        order_obj, _ = Order.objects.get_or_create(
            course = course,
            user = request.user,
            is_paid = False
        )

        # Create a new Payment Request
        response = api.payment_request_create(
            amount=course.cost,
            purpose='Course Registration',
            buyer_name = 'Om garg',
            send_email=True,
            email= request.user.email,
            redirect_url="http://127.0.0.1:8000/order_success/"
        )

        order_obj.order_id = response['payment_request']['id']
        order_obj.status = response['payment_request']['status']
        order_obj.instamojo_response = response
        order_obj.save()

        return render(request, 'pay.html', {
            'payment_url': response['payment_request']['longurl']
        })
    
    else:
        return HttpResponseRedirect('/login/')


def order_success(request):
    payment_request_id = request.GET.get('payment_request_id')
    payment_id = request.GET.get('payment_id')
    payment_status = request.GET.get('payment_status')
    order_obj = Order.objects.get(order_id = payment_request_id)
    order_obj.is_paid = True
    order_obj.status = payment_status
    order_obj.save()

    # -------------------------- we have to verify email at begining of sign in only --> then only we can send email ------------------
    # now email has to sended from our side also
    logged_user = Student.objects.get(user=request.user)

    name =  logged_user.fullname
    email = logged_user.email
    content = "This is the conformation of Payment from Techmedbuddy"

    # here in content we can send the links and conformaion of payment 

    # here we need to register

    send_mail(
        subject="Regarding Course Registration",
        message=f"Hi, {name} \n" + content,
        from_email="om21481@iiitd.ac.in",
        recipient_list=[email],
        fail_silently=False
    )

    return HttpResponseRedirect('/')

def logout(request):
    logged_user = Student.objects.get(user=request.user)
    request_logout_user(request)
    print("logged out")
    return HttpResponseRedirect('/')
