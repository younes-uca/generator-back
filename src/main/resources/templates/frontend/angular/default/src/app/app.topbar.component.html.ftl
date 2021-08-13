<div class="layout-topbar">

    <a class="layout-right-panel-button layout-topbar-icon" (click)="appMain.onRightMenuClick($event)" href="#">
        <i class="pi pi-ellipsis-v"></i>
    </a>

    <a href="#" class="layout-menu-button layout-topbar-icon" (click)="appMain.onMenuButtonClick($event)">
        <i class="pi pi-bars"></i>
    </a>

    <a href="#" class="layout-topbar-logo">
        <span style="font-size: 2rem;color: white;font-weight: 900;">PROJECT NAME</span>
    </a>


    <ul class="topbar-menu">
        <li class="user-profile" [ngClass]="{'active-topmenuitem fadeInDown': appMain.topbarUserMenuActive}">
            <a href="#" (click)="appMain.onTopbarUserMenuButtonClick($event)" *ngIf="!app.inlineUser">
                <img src="assets/layout/images/avatar.png" alt="roma-layout" />
                <div class="layout-profile-userinfo">
                    <span class="layout-profile-name">{{authenticatedUser.email}}</span>
                    <span class="layout-profile-name">{{authenticatedUser.firstName}}</span>

                </div>
            </a>
            <ul class="fadeInDown">

                <li>
                    <a (click)="logout()">
                        <i class="pi pi-sign-out"></i>
                        <span class="p-ml-2">Log out</span>
                    </a>
                </li>
            </ul>
        </li>

    </ul>
</div>