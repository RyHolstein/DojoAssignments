import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { LoginComponent } from './login/login.component';
import { BidComponent } from './bid/bid.component';
import { ResetComponent } from './reset/reset.component';


const routes: Routes = [
  {
    path: '',
    children: [],
    component: LoginComponent
  },
  {
    path: 'bids',
    component: BidComponent
  },
  {
    path: 'bids/result',
    component: ResetComponent,
  },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
