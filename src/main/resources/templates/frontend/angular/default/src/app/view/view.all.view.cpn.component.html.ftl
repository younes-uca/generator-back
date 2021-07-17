<p-dialog [(visible)]="view${pojo.name}Dialog" [style]="{width: '450px'}" header="${pojo.name} Details" [modal]="true"
    >
 <#list pojo.fieldsSimple as field>
<div class="p-fluid">
    <#if field.type.simpleName == "Date">
        <div class="p-field p-grid">
            <label for="${field?index}" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0">${field.name}</label>
            <div class="p-col-12 p-md-10">
            <input class="p-mb-2 p-mr-2" type="text" pInputText id="1" value="{{selected${pojo.name}.${field.name} |
                date:'dd.MM.yyyy'}}" required autofocus disabled />
            </div>
        </div>
    <#elseif field.type.simpleName == "String">
        <div class="p-field p-grid">
            <label for="${field?index}" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0">${field.name}</label>
            <div class="p-col-12 p-md-10">
                <input class="p-mb-2 p-mr-2" type="text" pInputText  id="${field?index}" [(ngModel)]="selected${pojo.name}.${field.name}" required autofocus  disabled/>
            </div>
        </div>
    <#else>
        <#if field.type.simpleName != "Long">  
            <div class="p-field p-grid">
                <label for="${field?index}" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0">${field.name}</label>
                <div class="p-col-12 p-md-10">
                <p-inputNumber class="p-mb-2 p-mr-2"  id="${field?index}"  [(ngModel)]="selected${pojo.name}.${field.name}" [disabled]="true"></p-inputNumber>
                </div>
            </div>
               </#if>
  </#if>
    
    </div>
  </#list>    

        <button pButton pRipple label="Fermer" icon="pi pi-times" class="p-button-text"
            (click)="hideViewDialog()"></button>
</p-dialog>