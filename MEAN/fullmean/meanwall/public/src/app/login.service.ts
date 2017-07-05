import { Injectable } from '@angular/core';
import { Http } from "@angular/http";
import "rxjs";

@Injectable()
export class LoginService {

  constructor(private _http: Http) { }

  login(user){
    return this._http.post('/api/login', user).map((data)=>data.json()).toPromise();
  }
}
