import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class PermissionService {
  <#list roles as role>
  permissions${role.name?lower_case}  = [
        <#list role.permissions as permission>
           ${permission.name},
        </#list>
  ];
  </#list>
  constructor() { }
}
