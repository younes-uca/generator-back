import {Component, OnInit} from '@angular/core';
import {${pojo.name}Service} from '../../../controller/service/${pojo.name}.service';
import {${pojo.name}Vo} from '../../../controller/model/${pojo.name}.model';
<#list pojo.types as type>
  <#if pojo.name != type.simpleName>
import {${type.simpleName}Vo} from '../../../controller/model/${type.simpleName}.model';
    </#if>
</#list>

@Component({
  selector: 'app-${pojo.name?uncap_first}-create',
  templateUrl: './${pojo.name?uncap_first}-create.component.html',
  styleUrls: ['./${pojo.name?uncap_first}-create.component.css']
})
export class ${pojo.name}CreateComponent  {

constructor(private ${pojo.name?uncap_first}Service: ${pojo.name?cap_first}Service) { }
// methods 

public save(){

    this.${pojo.name?uncap_first}Service.save().subscribe(${pojo.name?uncap_first}=>{
          
       this.${pojo.name?uncap_first}s.push({...${pojo.name?uncap_first}});
       this.create${pojo.name}Dialog = false;
       this.selected${pojo.name} = new ${pojo.name}Vo();
    },error=>{
        console.log(error);
    })
}
// methods 

hideCreateDialog(){
    this.create${pojo.name}Dialog  = false;
}

// getters and setters 

get ${pojo.name?uncap_first}s(): Array<${pojo.name}Vo> {
    return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}s;
       }
set ${pojo.name?uncap_first}s(value: Array<${pojo.name}Vo>) {
        this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}s = value;
       } 

 get selected${pojo.name}():${pojo.name}Vo {
           return this.${pojo.name?uncap_first}Service.selected${pojo.name};
       }
    set selected${pojo.name}(value: ${pojo.name}Vo) {
        this.${pojo.name?uncap_first}Service.selected${pojo.name} = value;
       }
  
   get create${pojo.name}Dialog():boolean {
           return this.${pojo.name?uncap_first}Service.create${pojo.name}Dialog;
       }
    set create${pojo.name}Dialog(value: boolean) {
        this.${pojo.name?uncap_first}Service.create${pojo.name}Dialog= value;
       }


}