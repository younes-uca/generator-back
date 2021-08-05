import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
<#list pojos as pojo>
import { ${pojo.name}Component } from './view/${pojo.name?uncap_first}/${pojo.name?uncap_first}.component';
</#list>
import {AppComponent} from './app.component';
import { AppMainComponent } from './app.main.component';
@NgModule({
  imports: [
    RouterModule.forRoot(
      [
        {
          path: "",
          component: AppMainComponent,
          children: [
            <#list pojos as pojo>
             { path: '${pojo.name?uncap_first}', children: [{path: 'crud', component: ${pojo.name}Component}]},
            </#list>
          ],
        },
      ],
      { scrollPositionRestoration: "enabled" }
    ),
  ],
  exports: [RouterModule],
})
export class AppRoutingModule { }