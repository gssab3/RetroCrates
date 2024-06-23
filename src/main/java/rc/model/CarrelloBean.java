package rc.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

import rc.model.ProdottoBean;

public class CarrelloBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Collection<ProdottoBean> carrello;
	
	public CarrelloBean() {
		// TODO Auto-generated constructor stub
		carrello = new LinkedList<ProdottoBean>();
	}
	
	//Aggiungi qualcosa al carrello
	public void aggiungiCarrello(ProdottoBean prodotto) {
		//Controlla Duplicati
		int qta = 0;
		for (Iterator<ProdottoBean> i = this.getCarrello().iterator(); i.hasNext(); ) {
			ProdottoBean prodottoi = i.next();
			if(prodottoi != null) {
				if(prodottoi.getIdProdotto().equals(prodotto.IdProdotto))
				qta+=prodotto.getQta();
			}
		}
		
		//Ci sono stati duplicati, quindi accorpa tutto per qta
		if(qta > 0) {
			for (Iterator<ProdottoBean> i = this.getCarrello().iterator(); i.hasNext(); ) {
				ProdottoBean prodottob = i.next();
				if(prodottob != null) {
				if(prodottob.getIdProdotto().equals(prodotto.IdProdotto)) 
					i.remove(); //rimuove quel prodotto se c'è, togliendoli poi tutti
			}
			}
			//dopo averli tolti tutti ne aggiunge uno
			prodotto.qta = qta;
			carrello.add(prodotto);
		}
		//Non ci sono duplicati
		else
			carrello.add(prodotto);
	}
	
	public Collection<ProdottoBean> getCarrello() {
		return carrello;
	}
	
	//Aumenta di quantità quel prodotto
	public void addQuantity(String idprodotto) {
		//per come è fatto sappiamo che solo uno avrà quell'id.
		for (Iterator<ProdottoBean> i = this.getCarrello().iterator(); i.hasNext(); ) {
			ProdottoBean prodotto = (ProdottoBean) i.next();
			if(prodotto != null)
				if (prodotto.getIdProdotto().equals(idprodotto))
					prodotto.addQta();
		}
	}
	
	//Diminuisci la quantità di quel prodotto
	public void decreaseQuantity(String idprodotto) {
		//per come è fatto sappiamo che solo uno avrà quell'id.
		for (Iterator<ProdottoBean> i = this.getCarrello().iterator(); i.hasNext(); ) {
			ProdottoBean bean = (ProdottoBean) i.next();
			if(bean != null)
				if (bean.getIdProdotto().equals(idprodotto))
					bean.decrQta();
		}
	}
	
	//Rimuovi elemento dal carrello
	public void removeItem(String idprodotto) {
		if (carrello.size() > 0) {
			carrello.removeIf(prodotto -> prodotto.getIdProdotto().equals(idprodotto));
		}
	}
	
	public void setLista(Collection<ProdottoBean> lista) {
		carrello = lista;
	}
	
	public ProdottoBean retrieveByKey(String idprodotto) {
		for (Iterator<ProdottoBean> i = this.getCarrello().iterator(); i.hasNext(); ) {
			ProdottoBean prod = i.next();
			if(prod != null)
				if(prod.IdProdotto.equals(idprodotto))
					return (ProdottoBean) prod;
		}
		return null;
	}
}
