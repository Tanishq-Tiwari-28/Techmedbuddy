from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
# Create your models here.


class Student(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE)
    enrollment_id = models.AutoField(primary_key=True)
    email = models.CharField(
        unique=True, max_length=255, blank=True, null=True)
    fullname = models.CharField(max_length=255)
    phone = models.CharField(max_length=20)
    dob = models.DateField()
    gender = models.CharField(max_length=6)
    address = models.TextField()
    working_status = models.CharField(max_length=10) #size++
    source = models.CharField(max_length=10)
    class Meta:
        managed = True
        db_table = 'student'

    def get_user_email(self):
        return self.user.email

    def get_user_password(self):
        return self.user.password




class Instructor(models.Model):
    instructor_id = models.CharField(primary_key=True, max_length=255)
    image = models.CharField(max_length=1000)
    instructor_name = models.CharField(max_length=255)
    instructor_description = models.CharField(max_length=10000)
    instructor_qualification = models.CharField(max_length=255)
    twitter = models.CharField(max_length=255 , blank=True , null=True)
    linkdln = models.CharField(max_length=255 , blank=True , null=True)
    # date_of_birth = models.DateField()
    # gender = models.CharField(max_length=6)
    # phone_number = models.CharField(max_length=20)
    # address = models.CharField(max_length=255)
    # salary = models.DecimalField(
    #     max_digits=10, decimal_places=3, blank=True, null=True)
    # department = models.CharField(max_length=255, blank=True, null=True)
    # years_of_experience = models.IntegerField()

    class Meta:
        managed = True
        db_table = 'instructor'

class Intern(models.Model):
    intern_id = models.CharField(primary_key=True, max_length=255)
    image = models.CharField(max_length=1000)
    intern_name = models.CharField(max_length=255)
    intern_description = models.TextField()
    intern_qualification = models.TextField()
    class Meta:
        managed = True
        db_table = 'Intern'

class Techteam_mem(models.Model):
    id = models.CharField(primary_key=True, max_length=255)
    image = models.CharField(max_length=1000)
    name = models.CharField(max_length=255)
    description = models.TextField()
    qualification = models.TextField()
    linkdln = models.CharField(max_length=255 , blank=True , null=True)

    class Meta:
        managed = True
        db_table = 'Techteam_mem'


class Executive_team(models.Model):
    executives_id = models.CharField(primary_key=True, max_length=255)
    image = models.CharField(max_length=1000)
    executives_name = models.CharField(max_length=255)
    executives_description = models.TextField()
    executives_qualification = models.TextField()
    linkdln = models.CharField(max_length=255 , blank=True , null=True)

    class Meta:
        managed = True
        db_table = 'Executive_team'



class Course(models.Model):
    course_id = models.CharField(primary_key=True, max_length=255)
    course_name = models.CharField(max_length=255)
    image = models.CharField(max_length=1000)
    instructor_id = models.ManyToManyField(Instructor)
    course_duration = models.CharField(max_length=100, blank=True, null=True) #convert type to int
    # Field name made lowercase.
    course_description = models.TextField(
        db_column='course_Description', blank=True, null=True)
    cost = models.CharField(max_length =255)
    opening_date = models.DateField(blank=True, null=True)
    rating = models.IntegerField(blank=True, null=True)
    students_enrolled = models.IntegerField(blank=True, null=True)
    course_tags = models.CharField(max_length=255, blank=True, null=True) #characters array ???
    available_seats = models.IntegerField(blank=True, null=True)
    # Field name made lowercase.
    prerequisites = models.TextField(
        db_column='Prerequisites', blank=True, null=True)
    learning_outcomes = models.TextField(blank=True, null=True)
    course_content = models.TextField(blank=True, null=True)
    certification_criteria = models.TextField(blank=True, null=True)
    class Meta:
        managed = True
        db_table = 'course'






class student_academics(models.Model):
    student_id = models.ForeignKey(Student, blank=True,
                                   null=True, on_delete=models.CASCADE)
    qualification = models.TextField(blank=True, null=True)
    college_university = models.TextField(blank=True, null=True)
    passing_year = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'student_academics'


class StudentOptedCourses(models.Model):
    student_id = models.ForeignKey(Student, blank=True,
                                   null=True,  on_delete=models.CASCADE)
    course_id = models.ForeignKey(
        Course, blank=True, null=True, on_delete=models.CASCADE)
    feedback = models.TextField(blank=True, null=True)
    grade = models.CharField(max_length=10, blank=True, null=True)
    attendance = models.DecimalField(
        max_digits=5, decimal_places=2, blank=True, null=True)
    drive_link = models.TextField(blank=True, null=True)
    course_status = models.CharField(max_length=9, blank=True, null=True)
    #course ratibg attribute??
    class Meta:
        managed = True
        db_table = 'student_opted_courses'
        unique_together = (('student_id', 'course_id'),)



class Event(models.Model):
    event_id = models.CharField(primary_key=True, max_length=255)
    event_name = models.CharField(max_length=255)
    event_banner = models.TextField(blank=True, null=True)
    speaker_image = models.TextField(blank=True, null=True)
    event_link = models.TextField(blank=True, null=True)
    event_description = models.TextField()
    event_speaker = models.CharField(max_length=255)
    speaker_description = models.TextField()
    event_startdatetime = models.DateTimeField()
    event_enddatetime = models.DateTimeField()
    event_duration = models.TextField()
    event_venue = models.TextField()
    event_mode = models.CharField(max_length=255)
    students_enrolled = models.IntegerField() 
    available_seats = models.IntegerField()
    event_fees = models.DecimalField(max_digits=10, decimal_places=2)
    EVENT_STATUS_CHOICES = [
        ('Past', 'Past'),
        ('Live', 'Live'),
        ('Upcoming', 'Upcoming'),
    ]
    event_status = models.CharField(max_length=255, choices=EVENT_STATUS_CHOICES , null=True , blank=True)
    class Meta:
        managed = True
        db_table = 'Event'



class event_registration(models.Model):
    student_id = models.ForeignKey(Student, blank=True,
                                   null=True,  on_delete=models.CASCADE)
    event_id = models.ForeignKey(Event, blank=True,
                                   null=True,  on_delete=models.CASCADE)
    previous_event = models.TextField(blank=True,null=True)
    previous_knowledge = models.TextField(blank=True,null=True)
    event_source = models.TextField(blank=True,null=True)
    feedback = models.TextField(blank=True,null=True)
    suggestions = models.TextField(blank=True,null=True)
    class Meta:
        managed = True
        db_table = 'event_registeration'
        unique_together = ('event_id', 'student_id')


class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    is_paid = models.BooleanField(default=False)
    status = models.CharField(max_length=100, default="Pending")
    order_id = models.CharField(max_length=500)
    instamojo_response = models.TextField(null=True, blank=True)
