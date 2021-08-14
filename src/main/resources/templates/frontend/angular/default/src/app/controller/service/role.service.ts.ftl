import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Role } from '../model/Role.model';

@Injectable({
  providedIn: 'root'
})
export class RoleService {
  private readonly API = "http://localhost:8036"
  _roles:Role[] = [];
  constructor(private http:HttpClient) { }
  findAll(){
    this.http.get<Role[]>(this.API+"role/").subscribe(roles=>{
      this._roles = roles;
    },(error:HttpErrorResponse)=>{
      console.log(error.error)
    })
  }
  get roles():Role[]{
    return this._roles;
  }
  set roles(roles:Role[]){
    this._roles = roles;
  }
}
