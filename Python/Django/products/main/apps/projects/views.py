from django.shortcuts import render
from .models import Product

# Create your views here.
def index(request):
    # Product.objects.create(name = "Milk", description = "Great to have in a glass", price = 1.23, cost = 1, category = 'cold_beverage' )
    for i in Product.objects.all():
        print "name:", i.name, i.description, i.price, 


    return render(request, 'products/index.html')
