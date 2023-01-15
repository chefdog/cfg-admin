import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent, SideNavComponent } from './components';


@NgModule({
  declarations: [
    SideNavComponent,
    HeaderComponent
  ],
  imports: [
    CommonModule
  ],
  exports: [
    HeaderComponent,
    SideNavComponent
  ]
})
export class SharedModule { }
