package ContieneConBean;

import java.io.Serializable;

public class ContieneConBean implements Serializable 
{
	private String IdOrdine; //10 caratteri precisi
	private String IdProdotto; //7 caratteri precisi
	private int qta;
	private float costo; //decimal 10,2 minimo o uguale a 0.
	
	public ContieneConBean() 
	{
		IdOrdine = null;
		IdProdotto = null;
		qta = -1;
		costo = -1;
	}

	public String getIdOrdine() {
		return IdOrdine;
	}

	public void setIdOrdine(String idOrdine) {
		IdOrdine = idOrdine;
	}

	public String getIdProdotto() {
		return IdProdotto;
	}

	public void setIdProdotto(String idProdotto) {
		IdProdotto = idProdotto;
	}

	public int getQta() {
		return qta;
	}

	public void setQta(int qta) {
		this.qta = qta;
	}

	public float getCosto() {
		return costo;
	}

	public void setCosto(float costo) {
		this.costo = costo;
	}
}
