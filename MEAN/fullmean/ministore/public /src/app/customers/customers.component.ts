import { Component, OnInit } from '@angular/core';
import { StoreService } from './../store.service';

@Component({
  selector: 'app-customers',
  templateUrl: './customers.component.html',
  styleUrls: ['./customers.component.css']
})
export class CustomersComponent implements OnInit {
  customers = [];
  customer = {
    name: ''
  }
  errors: String = null;
  constructor(private _storeService: StoreService) { }


  ngOnInit() {
    this.getCustomers()
  }

  addCustomer(){ //adds a new customer
    this._storeService.addCustomer(this.customer)
    .then((data)=>{
      console.log();
      this.errors = null;
      if(data.errors.name.message){
        this.errors = data.errors.name.message;
      } else {
        this.customer.name = '';
        this.getCustomers();
      }
    })
    .catch((err)=> {
      this.customer.name = '';
      this.getCustomers();
    })
  }

  getCustomers(){ //gets all the customers
    this._storeService.getCustomers()
    .then((data)=>this.customers = data)
    .catch((err)=>console.log(err))
  }

  deleteCustomer(id){
    this._storeService.deleteCustomer(id)
    .then((data)=> {
      console.log("returned")
      this.getCustomers();
    })
    .catch((err)=>console.log(err))
  }




} // end of class
