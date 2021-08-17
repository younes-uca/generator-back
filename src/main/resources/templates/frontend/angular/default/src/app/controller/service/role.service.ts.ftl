import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Role } from '../model/Role.model';
import { BehaviorSubject, Observable } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class RoleService {
  private readonly API = "http://localhost:8036/api"
  _roles:Role[] = [];
  public _role = new BehaviorSubject<string>('');
  public role$: Observable<string> = this._role.asObservable();
  constructor(private http:HttpClient) { }
  findAll(){
    this.http.get<Role[]>(this.API+"/roles/").subscribe(roles=>{
      this._roles = roles;
      
    },(error:HttpErrorResponse)=>{
      console.log(error.error)
    })
  }
    isPermitted(pojo: string, action: string): boolean {
    this.role$.subscribe(role => {
      const foundRole = this.roles.find(r => "ROLE_" + role.toUpperCase() == r.authority);
      let permission: string[];
      if (foundRole) {
        permission = foundRole.permissions
          .map(permission => permission.name)
          .filter(name => name.split('.')[0].toLocaleLowerCase() == pojo)
          .filter(name => name.split('.')[1] == action)
      }
      return permission ? permission.length > 0 ? true : false : false;

    })

    return false;
  }
  get roles():Role[]{
    return this._roles;
  }
  set roles(roles:Role[]){
    this._roles = roles;
  }
}
