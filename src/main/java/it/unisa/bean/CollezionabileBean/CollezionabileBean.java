package Collezionabile;

import java.io.Serializable;

import com.mysql.cj.jdbc.Blob;

public class CollezionabileBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	//ENUM IN DB
	private String Categoria; //Poster, Gadget, Figure, Plush, Audio
	private String Produttore; //Funko, Nintendo, Pokèmon, BandaiNamco, YouTooz, Sega, Hasbro, Konami
	private String Edizione; //Normale, Esclusiva, RetroCrates
	
	//ALTRI DATI
	private String IdProdotto; //Esattamente 7 caratteri
	private String nome; //Massimo 30 caratteri
	private int qta; //>=0
	private boolean disp; //disponibilità, in genere è false e quelli false non si mostrano
	private String descr;
	private float costo; // decimal (10,2) >= 0
	private Blob picture;
	
	public CollezionabileBean()
	{
		Categoria = null;
		Produttore = null;
		Edizione = null;
		IdProdotto = null;
		nome = null;
		qta = 0;
		disp = false;
		descr = null;
		costo = -1;
		picture = null;
	}

	public String getCategoria() {
		return Categoria;
	}

	public void setCategoria(String categoria) {
		Categoria = categoria;
	}

	public String getProduttore() {
		return Produttore;
	}

	public void setProduttore(String produttore) {
		Produttore = produttore;
	}

	public String getEdizione() {
		return Edizione;
	}

	public void setEdizione(String edizione) {
		Edizione = edizione;
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
