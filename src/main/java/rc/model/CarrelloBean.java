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
	
	public void setCarrello(ProdottoBean prodotto) {
		ProdottoBean bean = this.retriveByKey(prodotto.getIdProdotto());
		if (bean == null) {
			carrello.add(prodotto);
		}
		else {
			this.addQuantity(bean.getIdProdotto());
		}
	}
	
	public Collection<ProdottoBean> getCarrello() {
		return carrello;
	}
	
	public void addProduct(ProdottoBean prodotto) {
		carrello.add(prodotto);
	}

	public ProdottoBean retriveByKey(String idprodotto) {
		for (Iterator<ProdottoBean> i = this.getCarrello().iterator(); i.hasNext(); ) {
			ProdottoBean prodotto = (ProdottoBean) i.next();
			if (prodotto.getIdProdotto().equals(idprodotto))
				return prodotto;
		}
		return null;
	}
	
	public void addQuantity(String idprodotto) {
		for (Iterator<ProdottoBean> i = this.getCarrello().iterator(); i.hasNext(); ) {
			ProdottoBean prodotto = (ProdottoBean) i.next();
			if (prodotto.getIdProdotto().equals(idprodotto))
				prodotto.addQta();
		}
	}
	
	public void decreaseQuantity(String idprodotto) {
		for (Iterator<ProdottoBean> i = this.getCarrello().iterator(); i.hasNext(); ) {
			ProdottoBean bean = (ProdottoBean) i.next();
			if (bean.getIdProdotto().equals(idprodotto))
				bean.decrQta();
		}
	}
	
	public void removeItem(String idprodotto) {
		if (carrello.size() > 0) {
			carrello.removeIf(prodotto -> prodotto.getIdProdotto().equals(idprodotto));
		}
	}
	
	public boolean isEmpty() {
		return carrello.isEmpty();
	}
	
	public void removeAllItems() {
		carrello.removeAll(carrello);
	}
	
	public void setLista(Collection<ProdottoBean> lista) {
		carrello = lista;
	}
}
