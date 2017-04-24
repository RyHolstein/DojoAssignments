from django.shortcuts import render, redirect
from time import ctime
import random
import datetime
# Create your views here.
def index(request):
    return render(request, 'ninja_gold/index.html')

def money(request):
    if 'coins' not in request.session:
        request.session['coins'] = 0
    if 'log' not in request.session:
        request.session['log'] = ''
    if request.method == 'POST':
        farm_gold =  random.randrange(10, 21)
        cave_gold = random.randrange(5, 11)
        house_gold = random.randrange(2, 6)
        casino_gold = random.randrange(-50, 51)
        time = ctime()

        if request.POST['building'] == 'farm':
            request.session['coins'] += farm_gold
            request.session['log'] += '<p class="winner"> You started Farming and earned ' + str(farm_gold) + ' at ' + time + '</p>'

        elif request.POST['building'] == 'cave':
            request.session['coins'] += cave_gold
            request.session['log'] += '<p class="winner"> You entered a Cave and won ' + str(cave_gold) + ' at ' + time + '</p>'

        elif request.POST['building'] == 'house':
            request.session['coins'] += house_gold
            request.session['log'] += '<p class="winner"> You Robbed a house and stole ' + str(house_gold) + ' at ' + time + '</p>'

        elif request.POST['building'] == 'casino':
            request.session['coins'] += casino_gold
            if casino_gold > 0:
                request.session['log'] += '<p class="winner"> You entered a Casino and won ' + str(casino_gold) + ' at ' + time + '</p>'
            else:
                request.session['log'] += '<p class="loser"> You entered a Casino and Lost ' + str(cave_gold) + ' at ' + time + '</p>'
    print request.session['coins']
    return redirect('/')
