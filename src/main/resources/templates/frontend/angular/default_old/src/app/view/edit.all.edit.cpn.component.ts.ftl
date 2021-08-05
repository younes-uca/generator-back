import {Component, OnInit} from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import * as moment from 'moment';
import {${pojo.name}Service} from '../../../controller/service/${pojo.name}.service';
import {${pojo.name}Vo} from '../../../controller/model/${pojo.name}.model';
<#list pojo.types as type>
  <#if pojo.name != type.simpleName>
import {${type.simpleName}Vo} from '../../../controller/model/${type.simpleName}.model';
    </#if>
</#list>

@Component({
  selector: 'app-${pojo.name?uncap_first}-edit',
  templateUrl: './${pojo.name?uncap_first}-edit.component.html',
  styleUrls: ['./${pojo.name?uncap_first}-edit.component.css']
})
export class ${pojo.name}EditComponent implements OnInit {
// declarations
 edit${pojo.name}Form = new FormGroup({
    <#list pojo.fieldsSimple as field>
      <#if field.type.simpleName == "Date">
      ${field.name}: new FormControl(new Date(), [Validators.required]),
      <#elseif field.type.simpleName == "String">
      ${field.name}: new FormControl("", [Validators.required]),
      <#else>
         <#if field.type.simpleName != "Long">
          ${field.name}:new FormControl(0,[Validators.required])
         </#if>
      </#if>
    </#list>
  }); 
constructor(private ${pojo.name?uncap_first}Service: ${pojo.name?cap_first}Service) { }
// methods 


  ngOnInit(): void {
    this.${pojo.name?uncap_first}Service.edit${pojo.name}$.subscribe(value=>{
    if(value){
     this.edit${pojo.name}Form.setValue({
       <#list pojo.fieldsSimple as field>
         <#if field.type.simpleName == "Date">
         ${field.name}: moment(this.selected${pojo.name}.${field.name}).toDate(),
         <#elseif field.type.simpleName != "Long">
          ${field.name}: this.selected${pojo.name}.${field.name},
         </#if>
    </#list>
    });
    }
  });
  }



public edit(){ 
    this.${pojo.name?uncap_first}Service.edit().subscribe(updated${pojo.name} => {
          const indexOfUpdated = this.${pojo.name?uncap_first}s.findIndex(
           (${pojo.name}) => ${pojo.name}.id === updated${pojo.name}.id
            );
            indexOfUpdated > -1 ? this.${pojo.name?uncap_first}s[indexOfUpdated] = updated${pojo.name} : false;
                });
                  this.edit${pojo.name}Dialog = false;
    this.selected${pojo.name} = new ${pojo.name}Vo();
            }

  hideEditDialog(){
    this.edit${pojo.name}Dialog = false;
  }
   submit(){
     <#list pojo.fieldsSimple as field>
         <#if field.type.simpleName != "Long">
            <#if field.type.simpleName == "Date">
                this.selected${pojo.name}.${field.name} = moment(this.${field.name}.value).format("YYYY-MM-DD");
            <#else>
                this.selected${pojo.name}.${field.name} = this.${field.name}.value;
            </#if>
         </#if>
    </#list>
    this.${pojo.name?uncap_first}Service.edit().subscribe(result=>{
        this.edit${pojo.name}Dialog = false;
    },error=>{
        console.log(error);
    });
  
  }
// getters and setters 
   <#list pojo.fieldsSimple as field>
         <#if field.type.simpleName != "Long">
            get ${field.name}() {
                 return this.edit${pojo.name}Form.get('${field.name}');
            }
         </#if>
    </#list>
 
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
  
  get edit${pojo.name}Dialog():boolean {
           return this.${pojo.name?uncap_first}Service.edit${pojo.name}Dialog;
       }
  set edit${pojo.name}Dialog(value: boolean) {
        this.${pojo.name?uncap_first}Service.edit${pojo.name}Dialog= value;
       }


}