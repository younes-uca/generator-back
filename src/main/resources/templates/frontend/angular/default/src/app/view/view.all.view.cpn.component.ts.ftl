import {Component, OnInit} from '@angular/core';
import {${pojo.name}Service} from '../../../controller/service/${pojo.name}.service';
import {${pojo.name}Vo} from '../../../controller/model/${pojo.name}.model';
<#list pojo.types as type>
  <#if pojo.name != type.simpleName>
import {${type.simpleName}Vo} from '../../../controller/model/${type.simpleName}.model';
    </#if>
</#list>

@Component({
  selector: 'app-${pojo.name?uncap_first}-view',
  templateUrl: './${pojo.name?uncap_first}-view.component.html',
  styleUrls: ['./${pojo.name?uncap_first}-view.component.css']
})
export class ${pojo.name}ViewComponent implements OnInit {

  ngOnInit(): void {
  }

    constructor(private ${pojo.name?uncap_first}Service: ${pojo.name?cap_first}Service) { }

   
   // methods 
    public hideViewDialog() {
    this.view${pojo.name}Dialog = false;
    } 



   // getters and setters
    get view${pojo.name}Dialog():boolean {
        return this.${pojo.name?uncap_first}Service.view${pojo.name}Dialog;
        }
    set view${pojo.name}Dialog(value: boolean) {
        this.${pojo.name?uncap_first}Service.view${pojo.name}Dialog= value;
        }
    
    get selected${pojo.name}():${pojo.name}Vo {
           return this.${pojo.name?uncap_first}Service.selected${pojo.name};
       }
    set selected${pojo.name}(value: ${pojo.name}Vo) {
        this.${pojo.name?uncap_first}Service.selected${pojo.name} = value;
       }





}