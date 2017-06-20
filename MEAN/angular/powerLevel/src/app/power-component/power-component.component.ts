import { Component, OnInit, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-power-component',
  templateUrl: './power-component.component.html',
  styleUrls: ['./power-component.component.css']
})
export class PowerComponentComponent implements OnInit {
  powerlevel: number = 0;
  length: number = 100;
  hello: string = "hello";
  @Output() powerEmitter = new EventEmitter();

  constructor() {}

  ngOnInit() {
  }
  onSubmit(){
    console.log(this.powerlevel);
    this.powerEmitter.emit(this.powerlevel)
  }
}
