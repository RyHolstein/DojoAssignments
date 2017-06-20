import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { TimwzoneComponent } from './timwzone/timwzone.component';

@NgModule({
  declarations: [
    AppComponent,
    TimwzoneComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
