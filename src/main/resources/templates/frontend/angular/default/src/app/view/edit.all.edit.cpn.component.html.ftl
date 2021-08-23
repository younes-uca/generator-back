<p-dialog [(visible)]="edit${pojo.name}Dialog" [style]="{width: '450px'}" header="${pojo.name} Edit" [modal]="true"
    styleClass="p-fluid" [formGroup]="edit${pojo.name}Form">
    <ng-template pTemplate="content">
    <#list pojo.fieldsSimple as field>
        <#if field.type.simpleName == "Date">
            <div class="p-field">
                <label for="${field?index}">${field.name}</label>
                <p-calendar  formControlName="${field.name}" dateFormat="dd.mm.yy"></p-calendar>
            </div>
        <#elseif field.type.simpleName == "String">
            <div class="p-field">
                <label for="${field?index}">${field.name}</label>
                <input class="p-mb-2 p-mr-2" type="text" pInputText placeholder="${field.name}" id="${field?index}" formControlName="${field.name}" required autofocus />
            </div>
        <#else>
            <#if field.type.simpleName != "Long">  
                <div class="p-field">
                    <label for="${field?index}">${field.name}</label>
                    <p-inputNumber class="p-mb-2 p-mr-2"  id="${field?index}" placeholder="${field.name}"  formControlName="${field.name}"></p-inputNumber>
                </div>
            </#if>
        </#if>
    </#list>  
      <#list pojo.fieldsGeneric as fieldGeneric>
       <#if (fieldGeneric.pojo.reference)??>
           <#if fieldGeneric.pojo.name != pojo.name>
            <div class="p-field" *ngIf="showDropDown">
             <label>${fieldGeneric.name?cap_first}</label>
              <p-dropdown [options]="${fieldGeneric.name?uncap_first}s" placeholder="${fieldGeneric.name?uncap_first}s" formControlName="${fieldGeneric.name?uncap_first}Vo" optionLabel="${fieldGeneric.pojo.reference.name}">
              </p-dropdown>  
            </div>
            </#if>
         </#if>
     </#list>  
    </ng-template>

    <ng-template pTemplate="footer">
        <button pButton pRipple label="Cancel" icon="pi pi-times" class="p-button-text"
            (click)="hideEditDialog()"></button>
        <button pButton pRipple label="Edit" icon="pi pi-check" class="p-button-text" (click)="submit()"></button>
    </ng-template>
</p-dialog>