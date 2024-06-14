package rc.model;

import java.io.Serializable;
import com.mysql.cj.jdbc.Blob;

@SuppressWarnings("serial")
public class ConsoleBean extends ProdottoBean implements Serializable{

	//ENUM
	//Produttore: Sony, Microsoft, Nintendo, Atari, Sega, Altri
	
	public ConsoleBean() 
	{
		Produttore = null;
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
