import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

//components
import { CustomersComponent } from './customers/customers.component';
import { ProductComponent } from './product/product.component';


const routes: Routes = [
  {
    path: '',
    children: []
  },
  {
    path: 'customers',
    component: CustomersComponent
  },
  {
    path: 'products',
    component: ProductComponent
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
