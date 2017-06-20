import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs';

@Injectable()
export class HttpService {

  constructor(private _http: Http) { }
  retrieveTasks(name) {
    //code...
    console.log(name);
    return this._http.get('https://api.github.com/users/'+name).map(response=>response.json()).toPromise()



  }
}
