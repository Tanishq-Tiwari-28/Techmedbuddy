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

class Course(models.Model):
    course_id = models.CharField(primary_key=True, max_length=255)
    course_name = models.CharField(max_length=255)
    image = models.CharField(max_length=1000)
    instructor_id = models.ManyToManyField(Instructor)
    course_duration = models.CharField(max_length=100, blank=True, null=True) #convert type to int
    # Field name made lowercase.
    course_description = models.TextField(
        db_column='course_Description', blank=True, null=True)
    cost = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True)
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
    event_description = models.CharField(max_length=255, blank=True, null=True)
    event_speaker = models.CharField(max_length=255)
    event_datetime = models.DateTimeField()
    event_duration = models.TimeField()
    event_venue = models.TextField()
    event_mode = models.CharField(max_length=255)
    students_enrolled = models.IntegerField() 
    available_seats = models.IntegerField()
    event_fees = models.DecimalField(max_digits=10, decimal_places=2)
    class Meta:
        managed = True
        db_table = 'Event'



class event_registration(models.Model):
    student_id = models.ForeignKey(Student, blank=True,
                                   null=True,  on_delete=models.CASCADE)
    event_id = models.ForeignKey(Event, blank=True,
                                   null=True,  on_delete=models.CASCADE)
    class Meta:
        managed = True
        db_table = 'event_registration'