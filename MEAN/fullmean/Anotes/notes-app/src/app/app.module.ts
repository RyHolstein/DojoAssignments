import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MessageboardComponent } from './messageboard/messageboard.component';
import { AddComponent } from './messageboard/add/add.component';
import { ListComponent } from './messageboard/list/list.component';

// import the service
import { MessageboardService } from './messageboard.service';
import { BishComponent } from './bish/bish.component';

@NgModule({
  declarations: [
    AppComponent,
    MessageboardComponent,
    AddComponent,
    ListComponent,
    BishComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule
  ],
  providers: [MessageboardService],
  bootstrap: [AppComponent]
})
export class AppModule { }
