<p-dialog [(visible)]="edit${pojo.name}Dialog" [contentStyle]="{minHeight: '30vw'}" [style]="{width: '50vw'}" header="${pojo.name} Create" [formGroup]="edit${pojo.name}Form" [modal]="true"
  >
 <#list pojo.fieldsSimple as field>
    <div class="p-fluid">
    <#if field.type.simpleName == "Date">
        <div class="p-field p-grid">
            <label for="${field?index}" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0">${field.name}</label>
            <div class="p-col-12 p-md-10">
                <p-calendar  formControlName="${field.name}" dateFormat="dd.mm.yy"></p-calendar>
            </div>
        </div>
    <#elseif field.type.simpleName == "String">
        <div class="p-field p-grid">
            <label for="${field?index}" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0">${field.name}</label>
            <div class="p-col-12 p-md-10">
                <input class="p-mb-2 p-mr-2" type="text" pInputText placeholder="${field.name}" id="${field?index}" formControlName="${field.name}" required autofocus />
            </div>
        </div>
    <#else>
        <#if field.type.simpleName != "Long">  
            <div class="p-field p-grid">
                <label for="${field?index}" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0">${field.name}</label>
                <div class="p-col-12 p-md-10">
                <p-inputNumber class="p-mb-2 p-mr-2"  id="${field?index}" placeholder="${field.name}"  formControlName="${field.name}"></p-inputNumber>
                </div>
            </div>
        </#if>
  </#if>
    
    </div>
  </#list>  
   
        <button pButton pRipple label="Cancel" icon="pi pi-times" class="p-button-text p-mr-2"
            (click)="hideEditDialog()"></button>
            <button pButton pRipple label="Edit" icon="pi pi-times" class="p-button-text p-mr-2"
            (click)="submit()"></button>
</p-dialog>