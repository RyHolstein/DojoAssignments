import { Component, OnInit } from '@angular/core';
import { MessageService } from './../message.service';
@Component({
  selector: 'app-wall',
  templateUrl: './wall.component.html',
  styleUrls: ['./wall.component.css']
})
export class WallComponent implements OnInit {
  messages: object[] = [];
  message: string;
  comment: string;

  constructor(private _messageService: MessageService) { }

  ngOnInit() {
    this.getMessages();
  }
  getMessages(){
    this._messageService.getMessages()
    .then((messages) => this.messages = messages)
    .catch((err) => console.log("there has been an error"))
  }
  createMessage(){
    this._messageService.createMessage({content:this.message})
    .then(()=> {
      this.getMessages()
      this.message = ''
    })
    .catch((err)=> console.log(err))
  }
  newComment(messageId){
    console.log(this.comment);
    console.log(messageId);
    this._messageService.createComment({content:this.comment}, messageId)
    .then(()=>console.log('success'))
    .catch((err)=>console.log(err))
  }



}
