from django.contrib.sessions.backends.db import SessionStore
from django.shortcuts import render,  HttpResponseRedirect
from django.shortcuts import redirect
from django.contrib.auth.models import User
from .models import Course, Student, StudentOptedCourses, student_academics , Event , event_registration, Order , Instructor , Intern , Techteam
from django.db.models import Q
from django.contrib.auth.hashers import make_password, check_password
from datetime import datetime, date, time
from django.contrib.auth import login as request_login_user
from django.contrib.auth import logout as request_logout_user
from django.db import connection
from django.utils import timezone
from datetime import timedelta , time
from urllib.parse import unquote
from datetime import datetime, timedelta, time
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



def check_course_registration(request , course_id):
    course = Course.objects.get(course_id=course_id)
    logged_user = Student.objects.get(user=request.user)
    if(request.user.is_authenticated):
        num = 0
        is_registered_course = StudentOptedCourses.objects.filter(course_id=course, student_id=logged_user)
        if is_registered_course:
            num = 1
            return num
        return num
    else:
        return HttpResponseRedirect('/login/')



def all_courses(request):
    all_courses = Course.objects.all()
    courses = []   
    if(request.user.is_authenticated):
        for course in all_courses:
            instructors = list(course.instructor_id.all())
            num = (check_course_registration(request , course.course_id))
            courses.append({'course': course, 'instructors': instructors , 'num':num})
            print(num)
            print(courses)
    else:
        for course in all_courses:  
            instructors = list(course.instructor_id.all())
            # num = (check_course_registration(request , course.course_id))
            courses.append({'course': course, 'instructors': instructors})
            print(courses)

    return render(request, "courses_new.html", {'courses': courses})

def register_courses(request, course_name):
    course = Course.objects.get(course_name = course_name)
    course_content = course.course_content
    course_content = course_content.split(",")
    prerequisites = course.prerequisites
    prerequisites = prerequisites.split(",")
    learning_outcomes = course.learning_outcomes
    learning_outcomes = learning_outcomes.split(",")
    print(learning_outcomes)
    response = 0
    if(course.cost.split(' ')[0][0] > '0' and course.cost.split(' ')[0][0] <= '9'):
        response =1
    return render(request, 'course_new.html', {'course': course , 'course_content' : course_content , 'prerequisites':prerequisites, 'learning_outcomes' : learning_outcomes , 'response' : response})

# for payment gateway
def verification(request, course_name):
    print(course_name, "dfgdsfgsd")
    if(request.user.is_authenticated):
        logged_user = Student.objects.get(user=request.user)
        api = Instamojo(api_key = settings.API_KEY, auth_token = settings.AUTH_TOKEN, endpoint = "https://test.instamojo.com/api/1.1/")
        course = Course.objects.get(course_name=course_name)
        
        order_obj, _ = Order.objects.get_or_create(
            course = course,
            user = request.user,
            is_paid = False
        )
        num = check_course_registration(request , course.course_id)
        print("num" , num)
        if(num == 0):
            url = f"http://127.0.0.1:8000/order_success/{course.course_id}/"
            print("dugldugdsugsldfugsldhugf" , url)
            # Create a new Payment Request
            response = api.payment_request_create(
                amount=course.cost,
                purpose='Course Registration',
                buyer_name = logged_user.fullname,
                send_email=True,
                email= request.user.email,
                redirect_url=url
            )
            print(response)
            order_obj.order_id = response['payment_request']['id']
            order_obj.status = response['payment_request']['status']
            order_obj.instamojo_response = response
            order_obj.save()

            return render(request, 'pay.html', {
                'payment_url': response['payment_request']['longurl'] , 'num' :num
            })
        else:
            return render(request, 'pay.html', {'num': num})
        
    
    else:
        return HttpResponseRedirect('/login')
    
def order_success(request , course_id):
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
    course = Course.objects.get(course_id = course_id)
    student_opted_course = StudentOptedCourses()
    logged_user = Student.objects.get(user=request.user)
    student_opted_course.student_id = logged_user
    student_opted_course.course_id = course
    student_opted_course.save()
    send_mail(
        subject="Regarding Course Registration",
        message=f"Hi, {name} \n" + content,
        from_email="om21481@iiitd.ac.in",
        recipient_list=[email],
        fail_silently=False
    )

    return HttpResponseRedirect('/')    

def instructors(request):
    all_instructors = Instructor.objects.all()
    instructors = []
    for instructor in all_instructors:
        instructors.append({'instructor': instructor})
        print(instructors)
    return render(request , 'instructors_new.html' ,  {'instructors':instructors})


def Interns(request):
    all_interns = Interns.objects.all()
    interns = []
    for interns in all_interns:
        interns.append({'interns':interns})
        print(interns)
    return render(request , 'interns.html' ,  {'interns':interns})


def Techteam(request):
    # all_Techteam = Techteam.objects.all()
    # techteams = []
    # for techteam in all_Techteam:
    #     techteams.append({'techteam': techteam})
    #     print(techteams)
    return render(request , 'techteam.html')


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



def check_event_registration(request , event_id):
    event = Event.objects.get(event_id=event_id)
    logged_user = Student.objects.get(user=request.user)
    if(request.user.is_authenticated):
        num = 0
        is_registered_event = event_registration.objects.filter(event_id=event, student_id=logged_user)
        if is_registered_event:
            num = 1
            return num
        return num
    else:
        return HttpResponseRedirect('/login/')



import pytz

def events(request):
    all_events = Event.objects.all()
    events = []
    upcoming_events = []
    live_events = []
    past_events = []
    current_datetime = timezone.localtime(timezone.now())
    for event in all_events:
        if(request.user.is_authenticated):
            num = (check_event_registration(request , event.event_id))
        currenttime = current_datetime.time()
        currentdate = current_datetime.date()
        event_startdatetime = event.event_startdatetime.astimezone(pytz.timezone('Asia/Kolkata'))
        event_enddatetime = event.event_enddatetime.astimezone(pytz.timezone('Asia/Kolkata'))
        # Retrieve the time and date values
        starttime = event_startdatetime.time()
        endtime = event_enddatetime.time()
        startdate = event_startdatetime.date()
        enddate = event_enddatetime.date()    
        if (startdate > currentdate) or (startdate == currentdate and currenttime < starttime):
            upcoming_events.append({'event': event})
            event.event_status = "Upcoming"

            # event.save()
        elif (startdate < currentdate) or  (startdate == currentdate and currenttime > endtime):
            past_events.append({'event': event})
            event.event_status = "Past"
            print(event)
            # event.save()
        elif (startdate == currentdate) and (currenttime <= endtime) and (currenttime >= starttime):
            live_events.append({'event': event})
            event.event_status = "Live"
                # event.save()
        if(request.user.is_authenticated):
            events.append({'event':event, 'num': num }) 
        else:
            events.append({'event':event }) 

    events.append({'upcoming_events': upcoming_events , 'live_events':live_events , 'past_events':past_events})
    # final = list(zip(events, num))
    print("eve" ,  events)   
    return render(request, 'events.html', {'events':events })





def register_events(request , event_name):
    event = Event.objects.get(event_name=event_name)
    if(request.user.is_authenticated):
        event_id = event.event_id
        num = check_event_registration(request , event.event_id)
    if(request.method == 'POST'):
        previous_event = request.POST.get('previous_event')
        event_knowledge = request.POST.get('event_knowledge')
        event_source = request.POST.get('event_source') 
        print("IN poST method")
        if(request.user.is_authenticated):
            print("student registered for event")
            event_register = event_registration()
            logged_user = Student.objects.get(user=request.user)
            event_register.student_id = logged_user
            event_register.event_id = event
            event_register.previous_event = previous_event
            event_register.previous_knowledge = event_knowledge
            event_register.event_source = event_source
            event_register.save()
            return HttpResponseRedirect("/all_events/")
        else:
            return HttpResponseRedirect('/login/')
    if(request.user.is_authenticated):
        return render(request, 'event_details.html' , {'event': event , 'num':num})
    return render(request, 'event_details.html' , {'event': event , 'num' : 0})


def logout(request):
    logged_user = Student.objects.get(user=request.user)
    request_logout_user(request)
    print("logged out")
    return HttpResponseRedirect('/')
