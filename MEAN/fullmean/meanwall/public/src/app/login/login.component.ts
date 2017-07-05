import { Component, OnInit } from '@angular/core';
import { LoginService } from './../login.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  username: string = '';
  constructor(private _loginService: LoginService, private _router: Router){ }

  ngOnInit() {
  }


  login(){
    console.log('submitted');
    this._loginService.login({username: this.username})
    .then((user) => this._router.navigate(['/wall']) )
    .catch((err) => console.log(err))
  }
}
