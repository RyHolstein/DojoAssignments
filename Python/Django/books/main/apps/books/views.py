from django.shortcuts import render
from .models import Book

# Create your views here.
def index(request):
    # Book.objects.create(name = "new new", author ='hey',published_date = '1990-03-20', category = "erotic novel")
    # Book.objects.create(name = "The Great Gatsby", author ='fitz',published_date = '1890-05-20', category = "Horror"  )
    # Book.objects.create(name = "Tale of no cities", author ='me',published_date = '1042-03-04', category = "Comedy"  )
    # Book.objects.create(name = "Love on a Boat", author ='Moore Teets',published_date = '3000-03-20', category = "Underwater Novel"  )
    # for i in Book.objects.all():
    #     print i.name
    books = Book.objects.all()
    return render(request, 'books/index.html', {'books': books})
