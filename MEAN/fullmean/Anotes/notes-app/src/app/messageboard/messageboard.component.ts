import { Component, OnInit } from '@angular/core';
import { MessageboardService } from './../messageboard.service'

@Component({
  selector: 'app-messageboard',
  templateUrl: './messageboard.component.html',
  styleUrls: ['./messageboard.component.css']
})
export class MessageboardComponent implements OnInit {
  messages: object[] = [{content: "testing"}]



  constructor(private _messageboardService: MessageboardService) {
    this._messageboardService.getMessages()
    .then((data)=> {console.log(data)})
    .catch((err)=> {console.log(err)})
  }

  newMsgFromChild(data){
    this._messageboardService.createMessage(data)
    .then((data)=>{console.log(data)})
    .catch((err)=>console.log(err))

  }

  ngOnInit() {
  }

}
