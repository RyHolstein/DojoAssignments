import { Component, OnInit } from '@angular/core';
import { BidService } from './../bid.service';
import { Router, ActivatedRoute } from '@angular/router'

@Component({
  selector: 'app-reset',
  templateUrl: './reset.component.html',
  styleUrls: ['./reset.component.css']
})
export class ResetComponent implements OnInit {

  constructor(private _bidService: BidService, private _router: Router) { }

  ngOnInit() {
  }
  resetBids(){
    this._bidService.reset()
    .then((data)=> {
      this._router.navigate(['/bids'])
    })
    .catch((data)=> console.log(data))
    this._router.navigate(['/bids'])
  }

}
