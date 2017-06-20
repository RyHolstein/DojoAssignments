import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-timwzone',
  templateUrl: './timwzone.component.html',
  styleUrls: ['./timwzone.component.css']
})
export class TimwzoneComponent implements OnInit {
  currtime = new Date().toLocaleString('en-US');






  constructor() { }

  ngOnInit() {
  }
  changeTZ(){
    //var newTime = new Date().toLocaleString('en-US', {timeZone: timezone});
  }
}
