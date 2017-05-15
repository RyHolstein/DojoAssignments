from django.shortcuts import render, redirect, HttpResponse
from .models import Book
# Create your views here.
def index(request):
    books = Book.objects.all()
    return render(request, "add_book/index.html", {'books': books})

def form(request):
    if request.method == 'POST':
        Book.objects.create(title = request.POST['title'], author = request.POST['author'], category = request.POST['category'] )
    return redirect('/')
