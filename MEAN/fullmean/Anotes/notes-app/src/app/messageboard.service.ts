import { Injectable } from '@angular/core';
import { Http } from '@angular/http'
import 'rxjs';

@Injectable()
export class MessageboardService {

  constructor(private _http: Http) { }
  createMessage(newMessage){
    return this._http.post('/messages', newMessage).map(data=>data.json).toPromise();
  }

  getMessages(){
    return this._http.get('/messages').map(data=>data.json)).toPromise();
  }
}
