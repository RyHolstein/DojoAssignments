import { Component, OnInit, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-add',
  templateUrl: './add.component.html',
  styleUrls: ['./add.component.css']
})
export class AddComponent implements OnInit {

  @Output() addtoListemitter = new EventEmitter();
  constructor() { }
  note: object = {
    content: '',
  }
  ngOnInit() {
  }
  onSubmit(){
    this.addtoListemitter.emit(this.note)
    console.log('sent')

  }
}
