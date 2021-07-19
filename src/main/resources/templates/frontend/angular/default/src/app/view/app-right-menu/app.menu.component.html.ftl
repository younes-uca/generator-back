<div class="layout-menu-container">
    <div class="menu-scroll-content">
        <!--    <div class="layout-profile" *ngIf="app.inlineUser && !appMain.isHorizontal()">
                <a class="layout-profile-button" (click)="appMain.onProfileClick($event)">
                    <img src="assets/layout/images/avatar.png" alt="roma-layout">
                    <div class="layout-profile-userinfo">
                        <span class="layout-profile-name">Arlene Welch</span>
                        <span class="layout-profile-role">Design Ops</span>
                    </div>
                </a>
                <ul [@inline]="!appMain.isSlim() ? appMain.inlineUserMenuActive ? 'visibleAnimated' : 'hiddenAnimated' : appMain.inlineUserMenuActive ? 'visible' : 'hidden'" class="layout-profile-menu">
                    <li>
                        <a href="#" pRipple>
                            <i class="pi pi-fw pi-user"></i><span>Profile</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" pRipple>
                            <i class="pi pi-fw pi-cog"></i><span>Settings</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" pRipple>
                            <i class="pi pi-fw pi-envelope"></i><span>Messages</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" pRipple>
                            <i class="pi pi-fw pi-bell"></i><span>Notifications</span>
                        </a>
                    </li>
                </ul>
        </div> -->
        <ul class="layout-menu">
            <ul class="layout-menu">
            <p-menubar [model]="model"></p-menubar>
        </ul>
        </ul>
    </div>
</div>