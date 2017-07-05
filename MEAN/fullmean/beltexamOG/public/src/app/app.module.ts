
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { AppRoutingModule } from './app-routing.module';


import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { BidComponent } from './bid/bid.component';

import { BidService } from './bid.service';
import { ResetComponent } from './reset/reset.component'

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    BidComponent,
    ResetComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpModule,

  ],
  providers: [BidService],
  bootstrap: [AppComponent]
})
export class AppModule { }
