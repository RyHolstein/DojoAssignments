import { Component, OnInit } from '@angular/core';
import { StoreService } from './../store.service';;

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductComponent implements OnInit {
  product = {
    name: '',
    imageURL: '',
    description: '',
    stock: 0,
  }
  clearProduct = {
    name: '',
    imageURL: '',
    description: '',
    stock: 0
  }
  products = []
  constructor(private _storeService: StoreService) { }

  ngOnInit() {
    this.getProducts();
  }
  getProducts(){
    this._storeService.getProducts()
    .then((data)=>this.products=data)
    .catch((err)=>console.log(err))
  }
  createProduct() {
    this._storeService.createProduct(this.product)
    .then((data)=> {
      console.log("successfully added");
      this.getProducts();
      this.product = this.clearProduct
    })
    .catch((err)=>console.log(err))
  }



}// end of class
