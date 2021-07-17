<p-dialog [(visible)]="create${pojo.name}Dialog" [style]="{width: '50vw'}" [contentStyle]="{minHeight: '30vw'}" header="${pojo.name} Create" [modal]="true"
>     
 <#list pojo.fieldsSimple as field>
<div class="p-fluid">
    <#if field.type.simpleName == "Date">
        <div class="p-field p-grid">
            <label for="${field?index}" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0">${field.name}</label>
            <div class="p-col-12 p-md-10">
                <p-calendar [(ngModel)]="selected${pojo.name}.${field.name}" placeholder="${field.name}"  dateFormat="dd.mm.yy"></p-calendar>
            </div>
        </div>
    <#elseif field.type.simpleName == "String">
        <div class="p-field p-grid">
            <label for="${field?index}" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0">${field.name}</label>
            <div class="p-col-12 p-md-10">
                <input class="p-mb-2 p-mr-2" type="text" pInputText placeholder="${field.name}" id="${field?index}" [(ngModel)]="selected${pojo.name}.${field.name}" required autofocus />
            </div>
        </div>
    <#else>
        <#if field.type.simpleName != "Long">  
            <div class="p-field p-grid">
                <label for="${field?index}" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0">${field.name}</label>
                <div class="p-col-12 p-md-10">
                <p-inputNumber class="p-mb-2 p-mr-2"  id="${field?index}" placeholder="${field.name}"  [(ngModel)]="selected${pojo.name}.${field.name}"></p-inputNumber>
                </div>
            </div>
               </#if>
  </#if>
    
    </div>
  </#list>      
        <button pButton pRipple label="Cancel" icon="pi pi-times" class="p-button-text p-mt-4 p-mr-2"
            (click)="hideCreateDialog()"></button>
        <button pButton pRipple label="Save" icon="pi pi-check" class="p-button-text" (click)="save()"></button>
</p-dialog>