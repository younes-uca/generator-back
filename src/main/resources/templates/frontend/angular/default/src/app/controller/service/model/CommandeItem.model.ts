import {CommandeVo} from './Commande.model';
import {ProduitVo} from './Produit.model';

export class CommandeItemVo {
    public id: number;
    
    public qte: number;
    public qteMax: string ;
    public qteMin: string ;
    public produitVo: ProduitVo;
        
    public commandeVo: CommandeVo;
        


}