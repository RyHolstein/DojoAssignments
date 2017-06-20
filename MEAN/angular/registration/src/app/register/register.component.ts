import { Component, OnInit } from '@angular/core';
import { User } from './../user'
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  //variables
  user: User = new User();
  message: any = {message: "", display: false, sign: "Have a Wonderful Day!" };

  //i dont know yet
  constructor() { }
  ngOnInit() {
  }

  //functions
  onSubmit() {
    console.log('submitted')
    this.message['message'] = "Thank you " + this.user['name'] + "for signing up with the email: " + this.user['email'] + " we will send all of you mail to "  + this.user['street']
    this.message['display'] = true

  }

}
