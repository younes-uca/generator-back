<div class="p-grid">
    <div class="p-col-12">

        <p-toast></p-toast>

        <div class="card">
            <p-toolbar styleClass="p-mb-4">
                <ng-template pTemplate="left">
                    <button pButton pRipple label="New" icon="pi pi-plus" class="p-button-success p-mr-2 p-mb-2"
                       (click)="openCreate${pojo.name}('${pojo.name?lower_case}')"></button>
                     <button pButton pRipple label="Search"
                        icon="pi pi-{{findByCriteriaShow?'angle-down':'angle-right'}}"
                        class="p-button-success p-mr-2 p-mb-2"
                        (click)="this.findByCriteriaShow = !this.findByCriteriaShow"></button>
                </ng-template>
                <ng-template pTemplate="right">
                    <div class="" *ngIf="findByCriteriaShow">
            <#list pojo.fieldsSimple as field>
                    <#if field.reference >
                    <input class=" p-mr-1" type="text" pInputText placeholder="${field.name}" 
                             [(ngModel)]="search${pojo.name}.${field.name}" autofocus />
                    </#if>
            </#list>
            <#list pojo.fieldsSimpleNumberOrDate as fieldSimpleNumberOrDate>
                     <#if fieldSimpleNumberOrDate.type.simpleName == "Date">
                        <p-calendar class="p-mr-2" placeholder="dateMin" [(ngModel)]="search${pojo.name}.${fieldSimpleNumberOrDate.name}Min"
                                dateFormat="dd.mm.yy"></p-calendar>
                        <p-calendar class="p-mr-2" placeholder="dateMin" [(ngModel)]="search${pojo.name}.${fieldSimpleNumberOrDate.name}Max"
                                dateFormat="dd.mm.yy"></p-calendar>
                  <#elseif fieldSimpleNumberOrDate.type.simpleName == "String">
                  <#else>
                 <#if fieldSimpleNumberOrDate.type.simpleName != "Long">  
              <p-inputNumber class="p-mr-2" placeholder="${fieldSimpleNumberOrDate.name}Min" [(ngModel)]="search${pojo.name}.${fieldSimpleNumberOrDate.name}Min"></p-inputNumber>
              <p-inputNumber class="p-mr-2" placeholder="${fieldSimpleNumberOrDate.name}Max" [(ngModel)]="search${pojo.name}.${fieldSimpleNumberOrDate .name}Max"></p-inputNumber>
              </#if>
              </#if>
            </#list>   
            <button pButton pRipple label="Submit" icon="pi pi-sort-amount-down"class="p-button-info p-mr-2" (click)="searchRequest()"></button>
                        </div>
                    </ng-template>
            </p-toolbar>

            <p-table #dt [value]="${pojo.name?uncap_first}s" [columns]="cols" [rows]="4" [paginator]="true"
                [globalFilterFields]="['reference','total','totalPaye']" [(selection)]="selected${pojo.name}"
                [rowHover]="true" dataKey="id" styleClass="p-datatable-customers"
                currentPageReportTemplate="Showing {first} to {last} of {totalRecords} entries"
                [showCurrentPageReport]="true">
                <ng-template pTemplate="caption">
                    <div class="p-d-flex p-flex-column p-flex-md-row p-jc-md-between table-header">
                        <h5 class="p-m-0">Liste des ${pojo.name}s</h5>
                        <span class="p-input-icon-left">
                            <i class="pi pi-search"></i>
                            <input pInputText type="text" placeholder="Search..." />
                        </span>
                    </div>
                </ng-template>
                <ng-template pTemplate="header">
                    <tr>
                        <th style="width: 3rem">
                            <p-tableHeaderCheckbox></p-tableHeaderCheckbox>
                        </th>
                           <#list pojo.fieldsSimple as field>
                            <th pSortableColumn="${field.name?uncap_first}">${field.name} <p-sortIcon field="${field.name?uncap_first}"></p-sortIcon></th>
                            </#list>
                    </tr>
                </ng-template>
                <ng-template pTemplate="body" let-${pojo.name?uncap_first}>
                    <tr>
                        <td>
                        <p-tableCheckbox [value]="${pojo.name?uncap_first}"></p-tableCheckbox>
                        </td>
                        <#list pojo.fieldsSimple as field>
                            <#if field.type.simpleName == "Date">
                                <td>{{${pojo.name?uncap_first}.${field.name} | date:'dd/MM/yyyy' }}</td>
                                <#else>
                                <td>{{${pojo.name?uncap_first}.${field.name} }}
                                </#if>
                        </#list>

                        <td>
                            <button pButton pRipple icon="pi pi-pencil" class="p-button-rounded p-button-success p-mr-2"
                               (click)="edit${pojo.name}(${pojo.name?uncap_first})"></button>
                            <button pButton pRipple icon="pi pi-list" class="p-button-rounded p-button-info p-mr-2"
                               (click)="view${pojo.name}(${pojo.name?uncap_first})"></button>
                            <button pButton pRipple icon="pi pi-trash" class="p-button-rounded p-button-danger"
                               (click)="delete${pojo.name}(${pojo.name?uncap_first})"></button>
                        </td>
                    </tr>
                </ng-template>
                <ng-template pTemplate="summary">
                    <div class="p-d-flex p-ai-center p-jc-between">
                       In total there are {{${pojo.name?uncap_first}s ? ${pojo.name?uncap_first}s.length : 0 }} {{${pojo.name?uncap_first}s}}.
                    </div>
                </ng-template>
            </p-table>
        </div>

        <app-${pojo.name?uncap_first}-create></app-${pojo.name?uncap_first}-create>
        <app-${pojo.name?uncap_first}-edit></app-${pojo.name?uncap_first}-edit>
        <app-${pojo.name?uncap_first}-view></app-${pojo.name?uncap_first}-view>
        <p-confirmDialog [style]="{width: '450px'}"></p-confirmDialog>
    </div>
</div>