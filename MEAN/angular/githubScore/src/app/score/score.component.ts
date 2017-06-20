import { Component, OnInit } from '@angular/core';
import { HttpService } from './../http.service'

@Component({
  selector: 'app-score',
  templateUrl: './score.component.html',
  styleUrls: ['./score.component.css']
})
export class ScoreComponent implements OnInit {
  username: string = '';
  user: object[] = [];
  isUser: string = "waiting";
  constructor(private _httpService: HttpService) { }

  ngOnInit() {
  }
  getUser(event){
    
    this._httpService.retrieveTasks(this.username)
    .then(
      (data)=>this.user=data
    )
    .catch(
      ()=>this.isUser="None"
    )

  }
}
