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
    path('all_courses/<int:course_id>/', register_courses),
    path('all_courses/<int:course_id>/verification/', verification),
    # path('test/', test),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL,
                          document_root=settings.STATIC_ROOT)
