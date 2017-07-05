import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs';

@Injectable()
export class BidService {

  constructor(private _http: Http) { }
  login(data){
    console.log('in the login')
    return this._http.post('/api/user/login', data).map((data)=>data.json()).toPromise();
  }

  addBid(data){
    console.log('adding a bid');
    return this._http.post('/api/bid/addbid', data).map((data)=>data.json()).toPromise();
  }

  getBids(){
    return this._http.get('/api/bids/get').map((data)=>data.json()).toPromise();
  }

  reset(){
    return this._http.get('/api/reset').map((data)=>data.json()).toPromise();
  }
}
