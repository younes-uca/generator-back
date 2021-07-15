<p-dialog [(visible)]="view${pojo.name}Dialog" [style]="{width: '450px'}" header="${pojo.name} Details" [modal]="true"
    styleClass="p-fluid">
    <ng-template pTemplate="content">
      <#list pojo.fields as field>
         <div class="p-field">
            <label for="${field?index}">${field.name}</label>
            <input type="text" pInputText id="${field?index}" [(ngModel)]="selected${pojo.name}.${field.name}" disabled />
        </div>
        </#list>
    </ng-template>

    <ng-template pTemplate="footer">
        <button pButton pRipple label="Fermer" icon="pi pi-times" class="p-button-text"
            (click)="hideViewDialog()"></button>
    </ng-template>
</p-dialog>