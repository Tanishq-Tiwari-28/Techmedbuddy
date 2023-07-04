from django.contrib import admin    
from .models import Student , Course , StudentOptedCourses  , student_academics , Instructor , Event , event_registration, Order , Intern , Techteam_mem , Executive_team
# Register your models here

admin.site.register(Student)
admin.site.register(Course)
admin.site.register(Instructor)
admin.site.register(StudentOptedCourses)
admin.site.register(student_academics)
admin.site.register(Event)
admin.site.register(event_registration)
admin.site.register(Order)
admin.site.register(Intern)
admin.site.register(Techteam_mem)
admin.site.register(Executive_team)

