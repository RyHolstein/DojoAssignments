from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index),
    url(r'^something$', views.something),
    url(r'^result$', views.result),
]
