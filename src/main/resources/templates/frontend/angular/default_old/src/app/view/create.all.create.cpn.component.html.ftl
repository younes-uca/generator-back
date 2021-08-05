<p-dialog [(visible)]="create${pojo.name}Dialog" [style]="{width: '50vw'}" header="${pojo.name} Details" [modal]="true" styleClass="p-fluid">
    <ng-template pTemplate="content">
        <#list pojo.fieldsSimple as field>
            <#if field.type.simpleName == "Date">
                <div class="p-field">
                    <label for="${field?index}">${field.name}</label>
                     <p-calendar  id="${field?index}" placeholder="${field.name}"  [(ngModel)]="selected${pojo.name}.${field.name}" dateFormat="dd.mm.yy"></p-calendar>
                </div>
            <#elseif field.type.simpleName == "String">
             <div class="p-field">
                <label for="${field?index}">${field.name}</label>
                <input class="p-mb-2 p-mr-2" type="text" pInputText placeholder="${field.name}" id="${field?index}" [(ngModel)]="selected${pojo.name}.${field.name}" required autofocus />
            </div>
            <#else>
             <#if field.type.simpleName != "Long">  
                <div class="p-field">
                    <label for="${field?index}">${field.name}</label>
                    <p-inputNumber class="p-mb-2 p-mr-2"  id="${field?index}" placeholder="${field.name}"  [(ngModel)]="selected${pojo.name}.${field.name}"></p-inputNumber> 
                </div>
             </#if>
             </#if>
     </#list>   
    </ng-template>
    <ng-template pTemplate="footer">
        <button pButton pRipple label="Cancel" icon="pi pi-times" class="p-button-text" (click)="hideCreateDialog()"></button>
        <button pButton pRipple label="Save" icon="pi pi-check" class="p-button-text" (click)="save()"></button>
    </ng-template>
</p-dialog>
