package rc.model;

import java.io.Serializable;
import com.mysql.cj.jdbc.Blob;

@SuppressWarnings("serial")
public class ProdottoBean implements Serializable{
	
	protected String Produttore; //Enum, vedi la descrizione dei prodotti figli per capire cosa è lecito
	protected String IdProdotto; //Esattamente 7 caratteri
	protected String nome; //Massimo 30 caratteri
	protected int qta; //>=0
	protected boolean disp; //disponibilità, in genere è false e quelli false non si mostrano
	protected String descr;
	protected float costo; // decimal (10,2) >= 0
	protected Blob picture;
	
	public ProdottoBean()
	{
		IdProdotto = null;
		nome = null;
		qta = -1;
		disp = false;
		descr = null;
		costo = -1;
		picture = null;
	}

	public String getProduttore() {
		return Produttore;
	}

	public void setProduttore(String produttore) {
		Produttore = produttore;
	}

	public String getIdProdotto() {
		return IdProdotto;
	}

	public void setIdProdotto(String idProdotto) {
		IdProdotto = idProdotto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getQta() {
		return qta;
	}

	public void setQta(int qta) {
		this.qta = qta;
	}

	public boolean isDisp() {
		return disp;
	}

	public void setDisp(boolean disp) {
		this.disp = disp;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public float getCosto() {
		return costo;
	}

	public void setCosto(float costo) {
		this.costo = costo;
	}

	public Blob getPicture() {
		return picture;
	}

	public void setPicture(Blob picture) {
		this.picture = picture;
	}
	
	
}
