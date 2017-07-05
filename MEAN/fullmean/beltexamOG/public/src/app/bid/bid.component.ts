import { Component, OnInit } from '@angular/core';
import { BidService } from './../bid.service';
@Component({
  selector: 'app-bid',
  templateUrl: './bid.component.html',
  styleUrls: ['./bid.component.css']
})
export class BidComponent implements OnInit {
  product1 = {
    name: "product1",
    bid: 0
  };
  product2 = {
    name: "product2",
    bid: 0
  };
  product3 = {
    name: "product3",
    bid: 0
  };
  product1bids: Object[] =[]
  product2bids: Object[] =[]
  product3bids: Object[] =[]

  constructor(private _bidService: BidService) {
    this.getBids();
  }

  ngOnInit() {
  }
  reset(){
    this.product1.bid=0;
    this.product2.bid=0;
    this.product3.bid=0;
  }
  bidPlaced(data){
    var thrownData = {};
    if(data == 1 ){
      thrownData = this.product1
    }
    else if (data == 2 ){
      thrownData = this.product2
    } else {
      thrownData = this.product3
    }
    this._bidService.addBid(thrownData)
    .then((data)=>{
      console.log(data)
      this.reset();
      this.getBids();
    })
    .catch((data)=>console.log(data))
  }

  getBids(){
    this._bidService.getBids()
    .then((data)=>{
      console.log(data)
      console.log(data[0].bids)
      for(var i = 0; i < data.length; i++){
        if (data[i].name = "product1"){
          this.product1bids.push(data[i].bids);
        }
        if (data[i].name = "product2"){
          this.product2bids.push(data[i].bids);
        } else {
          this.product3bids.push(data[i].bids);
        }
      }

    })
    .catch((data)=>console.log(data))
  }


}
