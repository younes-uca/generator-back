import {Component, OnInit} from '@angular/core';
import {${pojo.name}Service} from '../../../controller/service/${pojo.name}.service';
import {${pojo.name}Vo} from '../../../controller/model/${pojo.name}.model';
<#list pojo.types as type>
  <#if pojo.name != type.simpleName>
import {${type.simpleName}Vo} from '../../../controller/model/${type.simpleName}.model';
    </#if>
</#list>
import { MessageService,ConfirmationService } from 'primeng/api';

@Component({
  selector: 'app-${pojo.name?uncap_first}-list',
  templateUrl: './${pojo.name?uncap_first}-list.component.html',
  styleUrls: ['./${pojo.name?uncap_first}-list.component.css']
})

export class ${pojo.name}ListComponent implements OnInit {
    // declarations
    findByCriteriaShow:boolean=false;
     cols: any[] = [];

    constructor(private ${pojo.name?uncap_first}Service: ${pojo.name?cap_first}Service,private messageService: MessageService,private confirmationService: ConfirmationService) { }

    ngOnInit(): void {
     this.${pojo.name?uncap_first}Service.findAll().subscribe(${pojo.name?uncap_first}s => this.${pojo.name?uncap_first}s = ${pojo.name?uncap_first}s,error=>console.log(error));
    } 
    
    // methods 
  
 public searchRequest(){
        this.${pojo.name?uncap_first}Service.findByCriteria(this.search${pojo.name}).subscribe(${pojo.name?uncap_first}s=>{
            
            this.${pojo.name?uncap_first}s = ${pojo.name?uncap_first}s;
            this.search${pojo.name} = new ${pojo.name}Vo();
        },error=>console.log(error));
    }

    private initCol() {
        this.cols = [
            <#list pojo.fields as field>
                {field: '${field.name}', header: '${field.name}'},
            </#list>
        ];
    }
    
    public edit${pojo.name}(${pojo.name?uncap_first}:${pojo.name}Vo){
         this.selected${pojo.name} = ${pojo.name?uncap_first};
         this.edit${pojo.name}Dialog = true;
         this.${pojo.name?uncap_first}Service.edit${pojo.name}$.next(true);
    }
    


    public view${pojo.name}(${pojo.name?uncap_first}:${pojo.name}Vo){
         this.selected${pojo.name} = ${pojo.name?uncap_first};
        this.view${pojo.name}Dialog = true;
    }
    
    public openCreate${pojo.name}() {
        this.selected${pojo.name} = new ${pojo.name}Vo();
        this.create${pojo.name}Dialog = true;
    }

    public delete${pojo.name}(${pojo.name?uncap_first}:${pojo.name}Vo){
                 this.confirmationService.confirm({
                      message: 'Are you sure you want to delete the ${pojo.name} ?',
                      header: 'Confirm',
                      icon: 'pi pi-exclamation-triangle',
                      accept: () => {
                          this.${pojo.name?uncap_first}Service.delete(${pojo.name?uncap_first}).subscribe(status=>{
                          if(status > 0){
                          const position = this.${pojo.name?uncap_first}s.indexOf(${pojo.name?uncap_first});
                          position > -1 ? this.${pojo.name?uncap_first}s.splice(position, 1) : false;
                                     }
                       this.messageService.add({
                        severity: 'success',
                        summary: 'Successful',
                        detail: '${pojo.name} Deleted',
                        life: 3000
                    });
                                        },error=>console.log(error))
                             }
                                                 });

     
    }


    // getters and setters

    get ${pojo.name?uncap_first}s(): Array<${pojo.name}Vo> {
           return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}s;
       }
    set ${pojo.name?uncap_first}s(value: Array<${pojo.name}Vo>) {
        this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}s = value;
       }

    get ${pojo.name?uncap_first}Selections(): Array<${pojo.name}Vo> {
           return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}Selections;
       }
    set ${pojo.name?uncap_first}Selections(value: Array<${pojo.name}Vo>) {
        this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}Selections = value;
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
    
    get edit${pojo.name}Dialog():boolean {
           return this.${pojo.name?uncap_first}Service.edit${pojo.name}Dialog;
       }
    set edit${pojo.name}Dialog(value: boolean) {
        this.${pojo.name?uncap_first}Service.edit${pojo.name}Dialog= value;
       }
    get view${pojo.name}Dialog():boolean {
           return this.${pojo.name?uncap_first}Service.view${pojo.name}Dialog;
       }
    set view${pojo.name}Dialog(value: boolean) {
        this.${pojo.name?uncap_first}Service.view${pojo.name}Dialog = value;
       }
       
     get search${pojo.name}(): ${pojo.name}Vo {
        return this.${pojo.name?uncap_first}Service.search${pojo.name};
       }
    set search${pojo.name}(value: ${pojo.name}Vo) {
        this.${pojo.name?uncap_first}Service.search${pojo.name} = value;
       }



}