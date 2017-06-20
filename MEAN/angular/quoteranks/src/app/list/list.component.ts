import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class ListComponent implements OnInit {
  @Input() stuff;
  @Output() delquote = new EventEmitter();
  @Output() upVoteQuote = new EventEmitter();
  @Output() downVoteQuote = new EventEmitter();

  constructor() { }

  ngOnInit() {
  }
  upVoteMe(event){
    var index = event.target.value;
    this.upVoteQuote.emit(index)
  }
  downVoteMe(event){
    var index = event.target.value;
    this.downVoteQuote.emit(index)
  }
  deleteMe(event){
    var index = event.target.value;
    this.delquote.emit(index)
  }
}
