import { Component, OnInit } from '@angular/core';
import { User } from './../my-class'
@Component({
  selector: 'app-my-component',
  templateUrl: './my-component.component.html',
  styleUrls: ['./my-component.component.css']
})
export class MyComponentComponent implements OnInit {
  user: object = new User();




  constructor() { }

  ngOnInit() {
  }

}
