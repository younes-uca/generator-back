import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
<#list pojos as pojo>
import { ${pojo.name}Component } from './view/${pojo.name?uncap_first}/${pojo.name?uncap_first}.component';
</#list>
import {AppComponent} from './app.component';
import { AppMainComponent } from './app.main.component';
import { LoginComponent } from './auth/login/login.component';
import { AuthGuard } from './controller/guards/auth.guard';
import { RegisterComponent } from './auth/register/register.component';
import { AccessDeniedComponent } from './auth/access-denied/access-denied.component';
@NgModule({
  imports: [
    RouterModule.forRoot(
      [
        { path: '', redirectTo: 'login', pathMatch: 'full' },
        {path:"login",component:LoginComponent},
        {path:"register",component:RegisterComponent},
        {
          path: "",
          component: AppMainComponent,
          children: [
            <#list pojos as pojo>
             { path: '${pojo.name?uncap_first}', children: [{path: 'crud', component: ${pojo.name}Component,canActivate:[AuthGuard]}]},
            </#list>
             {path:'denied',component:AccessDeniedComponent}
          ],
          canActivate:[AuthGuard]
        },
        {path:'**',redirectTo:'login',pathMatch:'full'}
      ],
      { scrollPositionRestoration: "enabled" }
    ),
  ],
  exports: [RouterModule],
})
export class AppRoutingModule { }