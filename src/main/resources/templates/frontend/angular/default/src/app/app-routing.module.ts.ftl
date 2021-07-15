import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
<#list pojos as pojo>
import { ${pojo.name}Component } from './view/${pojo.name?uncap_first}/${pojo.name?uncap_first}.component';
</#list>
import {AppComponent} from './app.component';
import { LandingPageComponent } from './landingPage/landing-page.component';

const routes: Routes = [
<#list pojos as pojo>
  { path: '${pojo.name?uncap_first}', children: [
      {path: 'crud', component: ${pojo.name}Component},
    ]},
</#list>
  {path: '', component: LandingPageComponent}
    ]
;

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }