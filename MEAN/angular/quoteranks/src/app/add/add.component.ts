import { Component, OnInit, Output, EventEmitter} from '@angular/core';

@Component({
  selector: 'app-add',
  templateUrl: './add.component.html',
  styleUrls: ['./add.component.css']
})
export class AddComponent implements OnInit {

  quote: object = {
    author: '',
    content: '',
  };
  @Output() quoteAddEvent = new EventEmitter();

  constructor() { }

  ngOnInit() {
  }

onSubmit(){

   this.quoteAddEvent.emit(this.quote)
 }
}
