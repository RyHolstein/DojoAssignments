import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs';

@Injectable()
export class MessageService {

  constructor(private _http: Http) { }
  getMessages(){
    return this._http.get('/api/messages').map((data)=>data.json()).toPromise();
  }

  createMessage(content){
    console.log(content);
    return this._http.post('/api/messages', content).map((data)=>data.json()).toPromise();
  }

  createComment(content, id){
    return this._http.post('/api/comments/' + id, content).map(data=>data.json()).toPromise();
  }
}
