<p-dialog [(visible)]="create${pojo.name}Dialog" [style]="{width: '450px'}" header="${pojo.name} Create" [modal]="true"
    styleClass="p-fluid">
    <ng-template pTemplate="content">
         <#list pojo.fields as field>
         <div class="p-field">
            <label for="${field?index}">${field.name}</label>
            <input type="text" pInputText id="${field?index}" [(ngModel)]="selected${pojo.name}.${field.name}" required autofocus />
        </div>
        </#list>
    </ng-template>
   
    <ng-template pTemplate="footer">
        <button pButton pRipple label="Cancel" icon="pi pi-times" class="p-button-text"
            (click)="hideCreateDialog()"></button>
        <button pButton pRipple label="Save" icon="pi pi-check" class="p-button-text" (click)="save()"></button>
    </ng-template>
</p-dialog>