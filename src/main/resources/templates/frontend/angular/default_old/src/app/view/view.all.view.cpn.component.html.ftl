<p-dialog [(visible)]="view${pojo.name}Dialog" [style]="{width: '450px'}" header="Commande Details" [modal]="true" styleClass="p-fluid">
    <ng-template pTemplate="content">
    <#list pojo.fieldsSimple as field>
        <#if field.type.simpleName == "Date">
            <div class="p-field">
                <label for="ref">${field.name}</label>
                <input class="p-mb-2 p-mr-2" type="text" pInputText id="1" value="{{selected${pojo.name}.${field.name} |
                date:'dd.MM.yyyy'}}" required autofocus disabled />
            </div>
        <#elseif field.type.simpleName == "String">
            <div class="p-field">
                <label for="total">${field.name}</label>
                <input class="p-mb-2 p-mr-2" type="text" pInputText  id="${field?index}" [(ngModel)]="selected${pojo.name}.${field.name}" required autofocus  disabled/>
            </div>
        <#else>
            <#if field.type.simpleName != "Long">  
                <div class="p-formgrid p-grid">
                    <div class="p-field p-col">
                        <label for="totalPaye">${field.name}</label>
                        <p-inputNumber class="p-mb-2 p-mr-2"  id="${field?index}"  [(ngModel)]="selected${pojo.name}.${field.name}" [disabled]="true"></p-inputNumber>
                    </div>
                </div>
            </#if>
         </#if>
        </#list>
    </ng-template>

    <ng-template pTemplate="footer">
        <button pButton pRipple label="Fermer" icon="pi pi-times" class="p-button-text" (click)="hideViewDialog()"></button>
    </ng-template>
</p-dialog>
