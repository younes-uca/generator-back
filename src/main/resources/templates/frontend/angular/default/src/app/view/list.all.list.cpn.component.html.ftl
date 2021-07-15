
<div class="p-grid p-shadow-3 p-m-4">
    <div class="p-col-12">
        <p-toast></p-toast>
         <!--  <div *ngIf="${pojo.name?uncap_first}s.length>0;else empty">  -->
        <div>
            <div class="card">
                <p-toolbar styleClass="p-mb-4">
                    <ng-template pTemplate="left">
                        <button pButton pRipple label="New" icon="pi pi-plus" class="p-button-success p-mr-2 p-mb-2"
                            (click)="openCreate${pojo.name}()"></button>
                        <button pButton pRipple label="Delete" icon="pi pi-trash" class="p-button-danger p-mb-2"
                            (click)="deleteMultiple()" [disabled]="!${pojo.name?uncap_first}Selections || !${pojo.name?uncap_first}Selections.length"></button>
                    </ng-template>

                    <ng-template pTemplate="right">
                        <p-fileUpload mode="basic" accept="image/*" [maxFileSize]="1000000" label="Import"
                            chooseLabel="Import" class="p-mr-2 p-mb-2 p-d-inline-block"></p-fileUpload>
                        <button pButton pRipple label="Export" icon="pi pi-upload" class="p-button-help p-mb-2"
                            (click)="dt.exportCSV()"></button>
                    </ng-template>
                </p-toolbar>
                <p-table #dt [value]="${pojo.name?uncap_first}s" [columns]="cols" [rows]="4" [paginator]="true"
                     [(selection)]="selected${pojo.name}" [rowHover]="true"
                    dataKey="id" styleClass="p-datatable-customers"
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
                            <#list pojo.fields as field>
                            <th>${field.name}</th>
                            </#list>
                        </tr>
                    </ng-template>
                    <ng-template pTemplate="body" let-${pojo.name?uncap_first}>
                        <tr>
                            <td>
                                <p-tableCheckbox [value]="${pojo.name?uncap_first}"></p-tableCheckbox>
                            </td>
                               <#list pojo.fields as field>
                                  <td>{{${pojo.name?uncap_first}.${field.name}}}</td>
                            </#list>
                         

                            <td>
                                <button pButton pRipple icon="pi pi-pencil"
                                    class="p-button-rounded p-button-success p-mr-2" (click)="edit(${pojo.name?uncap_first})"></button>
                                <button pButton pRipple icon="pi pi-list" class="p-button-rounded p-button-info p-mr-2"
                                    (click)="view${pojo.name}(${pojo.name?uncap_first})"></button>
                                <button pButton pRipple icon="pi pi-trash" class="p-button-rounded p-button-warning"
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
        </div>
    <!--      <ng-template #empty>
            <div style="display: flex;justify-content: center;height: 100vh; background-color: blueviolet;">
                <h1 style="font-size: 5rem;margin-top: 30vh;color: wheat;">Aucune ${pojo.name?uncap_first}</h1>
            </div>
        </ng-template>  -->

        <app-${pojo.name?uncap_first}-create></app-${pojo.name?uncap_first}-create>
        <app-${pojo.name?uncap_first}-edit></app-${pojo.name?uncap_first}-edit>
        <app-${pojo.name?uncap_first}-view></app-${pojo.name?uncap_first}-view>
        
    </div>
</div>