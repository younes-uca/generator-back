import {CommandeItemVo} from './CommandeItem.model';

export class CommandeVo {
    public id: number;
    
    public ref: string;
    public dateCmd: string;
    public total: number;
    public dateCmdMax: string ;
    public dateCmdMin: string ;
    public totalMax: string ;
    public totalMin: string ;
    public commandeItemsVo: Array<CommandeItemVo>;


}