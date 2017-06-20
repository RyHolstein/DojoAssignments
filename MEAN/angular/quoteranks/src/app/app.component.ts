import { Component } from '@angular/core';
import { Quote } from './quote'


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  quotelist: Quote[] = [];


  title = 'app';

  deleteData(data){
    console.log('deleted')
    this.quotelist.splice(data, 1);

  }
  upVoteData(data){
    console.log('trying to add')
    this.quotelist[data].likes = this.quotelist[data].likes + 1;


  }
  downVoteData(data){
    if (this.quotelist[data].likes == 0){

    }else {
      this.quotelist[data].likes = this.quotelist[data].likes - 1;
    }
  }
  thisData(data){
    var tempQuote = new Quote(data.author, data.content, 0);
    this.quotelist.push(tempQuote)
    console.log(this.quotelist);
  }
}
