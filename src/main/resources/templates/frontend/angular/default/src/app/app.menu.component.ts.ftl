import { Component, OnInit } from "@angular/core";
import { Router } from '@angular/router';
import {
  trigger,
  state,
  style,
  transition,
  animate,
} from "@angular/animations";
import { AppComponent } from "./app.component";
import { AppMainComponent } from "./app.main.component";
import { AuthService } from "./controller/service/Auth.service";
@Component({
  selector: "app-menu",
  templateUrl: "./app.menu.component.html",
  animations: [
    trigger("inline", [
      state(
        "hidden",
        style({
          height: "0px",
          overflow: "hidden",
        })
      ),
      state(
        "visible",
        style({
          height: "*",
        })
      ),
      state(
        "hiddenAnimated",
        style({
          height: "0px",
          overflow: "hidden",
        })
      ),
      state(
        "visibleAnimated",
        style({
          height: "*",
        })
      ),
      transition(
        "visibleAnimated => hiddenAnimated",
        animate("400ms cubic-bezier(0.86, 0, 0.07, 1)")
      ),
      transition(
        "hiddenAnimated => visibleAnimated",
        animate("400ms cubic-bezier(0.86, 0, 0.07, 1)")
      ),
    ]),
  ],
})
export class AppMenuComponent implements OnInit {
  model: any[];
  modelsuperadmin:any[];
  modeldefault : any[];
  <#list roles as role>
  model${role.name?lower_case} : any[];
  </#list>
  constructor(public app: AppComponent,
   public appMain: AppMainComponent,
   private authService:AuthService,
  private router: Router) {}

  ngOnInit() {
    this.modelsuperadmin = [
       {
        label: "Favorites",
        icon: "pi pi-fw pi-home",
        items:[
            <#list pojos as pojo>
           {
            label: "${pojo.name}",
            icon: "pi pi-fw pi-home",
            routerLink: ["/${pojo.name?uncap_first}/crud"],
          },
        </#list>
           {
                      label: "User",
                      icon: "pi pi-user",
                      routerLink:["user/crud"],
                    },
             ]
       }
    ]
    <#list roles as role>
    this.model${role.name?lower_case} = 
      [
           <#list role.menuRoles as menuRole>
              {
                label: "${menuRole.menu.libelle}",
                icon: "${menuRole.menu.icone}",
                items:[
                  <#list menuRole.menu.menuItems as menuItem>
                    {
                      label: "${menuItem.libelle}",
                      icon: "${menuItem.icone}",
                      <#if menuItem.pojo??>
                          items : [
                        <#list menuItem.menuItems as subMenuItem>
                         {
                          label: "${subMenuItem.libelle}",
                          icon: "${subMenuItem.icone}",
                          routerLink:["${subMenuItem.libelle}/crud"]
                         },
                        </#list>
                      ]
                       </#if>
                   
                    },
                  </#list>
                ]
              }
           </#list>
    ]
    </#list>
       if(this.authService.authenticated){
          if(this.authService.authenticatedUser.roles){
           this.authService.authenticatedUser.roles.forEach(role=>{
           const roleName = role.authority;
           eval("this.model = this.model"+ this.getRole(roleName));
            })
          }else{
             this.model = this.modeldefault;
          this.router.navigate(['/app/denied'])
          }

      }
  }
  getRole(text){
  const [role, ...rest] = text.split('_');
  return rest.join('').toLowerCase()
}
  onMenuClick(event) {
    this.appMain.onMenuClick(event);
  }
}
