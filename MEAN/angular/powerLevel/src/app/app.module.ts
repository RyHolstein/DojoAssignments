import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms'


import { AppComponent } from './app.component';
import { PowerComponentComponent } from './power-component/power-component.component';
import { HumanComponent } from './power-component/human/human.component';
import { SaiyanComponent } from './power-component/saiyan/saiyan.component';
import { SupersaiyanComponent } from './power-component/supersaiyan/supersaiyan.component';
import { Supersaiyan2Component } from './power-component/supersaiyan2/supersaiyan2.component';
import { Supersaiyan3Component } from './power-component/supersaiyan3/supersaiyan3.component';
import { Supersaiyan4Component } from './power-component/supersaiyan4/supersaiyan4.component';

@NgModule({
  declarations: [
    AppComponent,
    PowerComponentComponent,
    HumanComponent,
    SaiyanComponent,
    SupersaiyanComponent,
    Supersaiyan2Component,
    Supersaiyan3Component,
    Supersaiyan4Component
  ],
  imports: [
    BrowserModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
