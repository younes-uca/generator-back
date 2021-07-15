import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import {${pojo.name}Vo} from '../model/${pojo.name}.model';
<#list pojo.types as type>
  <#if pojo.name != type.simpleName>
import {${type.simpleName}Vo} from '../model/${type.simpleName}.model';
    </#if>
</#list>


@Injectable({
  providedIn: 'root'
})
export class ${pojo.name}Service {
     readonly API  = 'http://localhost:${config.backend.port?c}/${config.projectName}/${pojo.name?uncap_first}/';
     constructor(private http: HttpClient) { }
     private _${pojo.name?uncap_first}s: Array<${pojo.name}Vo> = [];
     private _selected${pojo.name}: ${pojo.name}Vo = new ${pojo.name}Vo();
     private _${pojo.name?uncap_first}Selections: Array<${pojo.name}Vo>;
     private _create${pojo.name}Dialog: boolean;
     private _edit${pojo.name}Dialog: boolean;
     private _view${pojo.name}Dialog: boolean;
     


    // getters and setters


    get ${pojo.name?uncap_first}s(): Array<${pojo.name}Vo> {
           return this._${pojo.name?uncap_first}s;
       }
    set ${pojo.name?uncap_first}s(value: Array<${pojo.name}Vo>) {
        this._${pojo.name?uncap_first}s = value;
       }
    get selected${pojo.name}(): ${pojo.name}Vo {
           return this._selected${pojo.name};
       }
    set selected${pojo.name}(value: ${pojo.name}Vo) {
        this._selected${pojo.name} = value;
       }
    get ${pojo.name?uncap_first}Selections(): Array<${pojo.name}Vo> {
        return this._${pojo.name?uncap_first}Selections;
       }
    set ${pojo.name?uncap_first}Selections(value: Array<${pojo.name}Vo>) {
        this._${pojo.name?uncap_first}Selections = value;
       }
    get create${pojo.name}Dialog(): boolean {
        return this._create${pojo.name}Dialog;
       }
    set create${pojo.name}Dialog(value: boolean) {
        this._create${pojo.name}Dialog = value;
       }

    get edit${pojo.name}Dialog(): boolean {
        return this._edit${pojo.name}Dialog;
       }
    set edit${pojo.name}Dialog(value: boolean) {
        this._edit${pojo.name}Dialog = value;
       }

    get view${pojo.name}Dialog(): boolean {
        return this._view${pojo.name}Dialog;
       }
    set view${pojo.name}Dialog(value: boolean) {
        this._view${pojo.name}Dialog = value;
       }


    // methods 

    public findAll(){
     return this.http.get<Array<${pojo.name}Vo>>(this.API);
    }
    
    public save(): Observable<${pojo.name}Vo> {
        return this.http.post<${pojo.name}Vo>(this.API, this.selected${pojo.name});
    }
    
    delete(${pojo.name?uncap_first}: ${pojo.name}Vo) {
         return this.http.delete<number>("this.API"+"/id/"+${pojo.name?uncap_first}.id);
    }


    public edit(): Observable<${pojo.name}Vo> {
        return this.http.put<${pojo.name}Vo>(this.API, this.selected${pojo.name});
    }




}