from django.urls import path
from dashboard.views import *
from . import views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('', home),
    path('signup/', signup_view),
    path('login/', login_view),
    path('logout/', logout),
    path('all_courses/', all_courses),
    path('all_instructors/', instructors),
    path('all_interns/' , Interns),
    path('techteam/' , Techteam),
    path('about/' , about),
    path('all_events/<path:event_name>/' , register_events),
    path('all_events/' , events),
    path('all_courses/<path:course_name>/verification/', verification),
    path('all_courses/<path:course_name>/', register_courses),
    path('order_success/<int:course_id>/', order_success),
    # path('test/', test),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL,
                          document_root=settings.STATIC_ROOT)
