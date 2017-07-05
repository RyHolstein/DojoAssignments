//modules
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { AppRoutingModule } from './app-routing.module';
//components
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { WallComponent } from './wall/wall.component';
//services
import { LoginService } from './login.service'
import { MessageService } from './message.service';


@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    WallComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpModule
  ],
  providers: [
    LoginService,
    MessageService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
