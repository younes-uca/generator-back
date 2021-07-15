import { BrowserModule } from '@angular/platform-browser';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {CalendarModule} from 'primeng/calendar';
import { NgModule } from '@angular/core';
import {FormsModule} from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import {AppRoutingModule} from './app-routing.module';
import { TabMenuModule } from "primeng/tabmenu";
import { TableModule } from "primeng/table";
import { AppComponent } from './app.component';
import { AppMenuComponent } from './view/app-right-menu/app.menu.component';
import { LandingPageComponent } from './landingPage/landing-page.component';
import { DialogModule } from "primeng/dialog";
import {ToastModule} from 'primeng/toast';
import {ToolbarModule} from 'primeng/toolbar';
import { BreadcrumbModule, , CardModule, CarouselModule, ChartModule, CheckboxModule, ChipsModule, CodeHighlighterModule, ColorPickerModule, ConfirmDialogModule, ContextMenuModule, DataViewModule, DropdownModule, DynamicDialogModule, FieldsetModule, FileUploadModule,MessageService, FullCalendarModule, GalleriaModule, InplaceModule, InputMaskModule, InputNumberModule, InputSwitchModule, InputTextareaModule, InputTextModule, LightboxModule, ListboxModule, MegaMenuModule, MenubarModule, MenuModule, MessageModule, MessageService, MessagesModule, MultiSelectModule, OrderListModule, OrganizationChartModule, OverlayPanelModule, PaginatorModule, PanelMenuModule, PanelModule, PasswordModule, PickListModule, ProgressBarModule, RadioButtonModule, RatingModule, ScrollPanelModule, SelectButtonModule, SidebarModule, SlideMenuModule, SliderModule, SplitButtonModule, StepsModule, TabViewModule, TerminalModule, TieredMenuModule, ToggleButtonModule, TooltipModule, TreeModule, TreeTableModule, VirtualScrollerModule } from 'primeng';
<#list pojos as pojo>
import { ${pojo.name}CreateComponent } from './view/${pojo.name?uncap_first}/create/${pojo.name?uncap_first}-create.component';
import { ${pojo.name}ListComponent } from './view/${pojo.name?uncap_first}/list/${pojo.name?uncap_first}-list.component';
import { ${pojo.name}ViewComponent } from './view/${pojo.name?uncap_first}/view/${pojo.name?uncap_first}-view.component';
import { ${pojo.name}EditComponent } from './view/${pojo.name?uncap_first}/edit/${pojo.name?uncap_first}-edit.component';
import { ${pojo.name}Component } from './view/${pojo.name?uncap_first}/${pojo.name?uncap_first}.component';
</#list>
@NgModule({
  declarations: [
    AppComponent,
    AppMenuComponent,
    LandingPageComponent,
    <#list pojos as pojo>
    ${pojo.name}CreateComponent,
    ${pojo.name}ListComponent,
    ${pojo.name}ViewComponent,
    ${pojo.name}EditComponent,
    ${pojo.name}Component,
</#list>
  ],
  imports: [
    BrowserModule,
    TabMenuModule,
    TableModule,
    DialogModule,
    BrowserModule,
    FormsModule,
    ToolbarModule,
    ToastModule,
    HttpClientModule,
    AppRoutingModule,
    BrowserAnimationsModule,
     BrowserModule,
    TabMenuModule,
    TableModule,
    DialogModule,
    BrowserModule,
    FormsModule,
    ToolbarModule,
    ToastModule,
    HttpClientModule,
    AppRoutingModule,
    InputNumberModule,
     InputTextModule,
    BrowserAnimationsModule,
    BreadcrumbModule,
    ButtonModule,
    CalendarModule,
    CardModule,
    CarouselModule,
    ChartModule,
    CheckboxModule,
    ChipsModule,
    CodeHighlighterModule,
    ConfirmDialogModule,
    ColorPickerModule,
    ContextMenuModule,
    DataViewModule,
    DialogModule,
    DropdownModule,
    FieldsetModule,
    FileUploadModule,
    FullCalendarModule,
    GalleriaModule,
    InplaceModule,
    InputNumberModule,
    InputMaskModule,
    InputSwitchModule,
    InputTextModule,
    InputTextareaModule,
    LightboxModule,
    ListboxModule,
    MegaMenuModule,
    MenuModule,
    MenubarModule,
    MessageModule,
    MessagesModule,
    MultiSelectModule,
    OrderListModule,
    OrganizationChartModule,
    OverlayPanelModule,
    PaginatorModule,
    PanelModule,
    BrowserAnimationsModule,
    PanelMenuModule,
    PasswordModule,
    PickListModule,
    ProgressBarModule,
    RadioButtonModule,
    ReactiveFormsModule,
    RatingModule,
    ScrollPanelModule,
    SelectButtonModule,
    SidebarModule,
    SlideMenuModule,
    SliderModule,
    SplitButtonModule,
    StepsModule,
    TableModule,
    TabMenuModule,
    TabViewModule,
    TerminalModule,
    TieredMenuModule,
    ToastModule,
    ToggleButtonModule,
    ToolbarModule,
    TooltipModule,
    TreeModule,
    TreeTableModule,
    VirtualScrollerModule,
    DynamicDialogModule,
  ],
  providers: [MessageService],
  bootstrap: [AppComponent]
})
export class AppModule { }
