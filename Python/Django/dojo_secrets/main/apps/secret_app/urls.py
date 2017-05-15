from django.conf.urls import url, include
from . import views


urlpatterns = [
    url(r'^$', views.index),
    url(r'^register$', views.register_account),
    url(r'^login$', views.login_account),
    url(r'^secrets', views.success),
    url(r'^secret_message$', views.secret_message),
    url(r'^message_like$', views.like),
    url(r'^logout$', views.logout),
    url(r'^delete/(?P<id>\d+)$', views.delete_message, name = 'm_delete'),
    url(r'^no_login$', views.no_login),
    url(r'^liked/(?P<id>\d+)$', views.like, name = "liked")
]
