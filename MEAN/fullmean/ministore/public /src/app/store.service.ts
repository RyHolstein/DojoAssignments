import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs';

@Injectable()
export class StoreService {

  constructor(private _http: Http) { }

//Customer Service calls ==============================
  addCustomer(data){ //creates a customer
    return this._http.post('/api/customer/create', data).map((data)=>data.json()).toPromise();
  }
  getCustomers(){ //get all the customers
    return this._http.get('/api/customer/getAll').map((data)=>data.json()).toPromise();
  }
  deleteCustomer(id){ //deletes a customer
    console.log("id recieved for deletion");
    return this._http.get('/api/customer/delete/'+ id).map((data)=>data.json()).toPromise();
  }

// ====================================================
// Product Service Calls ==============================
  createProduct(data){
    console.log("I am starting call to create Product");
    return this._http.post('/api/product/create', data).map((data)=>data.json()).toPromise();
  }
  getProducts(){
    console.log("I am starting call all Products");
    return this._http.get('/api/product/getAll').map((data)=>data.json()).toPromise();
  }




}// the end
