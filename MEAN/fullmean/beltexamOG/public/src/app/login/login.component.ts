import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router'

import { BidService } from './../bid.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  user = {
    username: '',
  }
  errors: String = null

  constructor(private _bidService: BidService, private _router: Router) { }

  ngOnInit() {
  }
  login(){
    this._bidService.login(this.user)
    .then((data)=> {
      if(data.errors){
        console.log(data.errors.username.message)
        this.errors = data.errors.username.message
      }else {
        this._router.navigate(['/bids'])
      }
    })
    .catch((err)=> console.log(err))
  }
}
