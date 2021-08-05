import { Component, OnInit } from "@angular/core";
import {
  trigger,
  state,
  style,
  transition,
  animate,
} from "@angular/animations";
import { AppComponent } from "./app.component";
import { AppMainComponent } from "./app.main.component";

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

  constructor(public app: AppComponent, public appMain: AppMainComponent) {}

  ngOnInit() {
    this.model = [
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
             ]
       }
    ]
  }
  onMenuClick(event) {
    this.appMain.onMenuClick(event);
  }
}
