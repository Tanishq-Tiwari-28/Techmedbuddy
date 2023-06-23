from django.contrib.sessions.backends.db import SessionStore
from django.shortcuts import render,  HttpResponseRedirect
from django.shortcuts import redirect
from django.contrib.auth.models import User
from .models import Course, Student, StudentOptedCourses, student_academics , Event , event_registration
from django.db.models import Q
from django.contrib.auth.hashers import make_password, check_password
from datetime import datetime, date, time
from django.contrib.auth import login as request_login_user
from django.contrib.auth import logout as request_logout_user
from django.db import connection
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
            user = User(username=username, password=make_password(password))
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


def events(request):
    all_events = Event.objects.all()
    events = []
    for event in all_events:
        events.append({'event': event})
    return render(request , 'events.html' , {'events':events})



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


def verification(request, course_id):
    if(request.user.is_authenticated):
        course = Course.objects.get(course_id=course_id)
        return render(request, "verification.html", {'course': course})
    else:
        return HttpResponseRedirect('/login/')


def logout(request):
    logged_user = Student.objects.get(user=request.user)
    request_logout_user(request)
    print("logged out")
    return HttpResponseRedirect('/')
