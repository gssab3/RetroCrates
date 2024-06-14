package rc.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class RecensioneBean implements Serializable 
{
	private String IdRecensione; //10 caratteri esatti
	private String Utente; //20 caratteri massimo
	private String Console; //7 caratteri esatti
	private String Videogioco; //7 caratteri esatti
	private String Collezionabile; //7 caratteri esatti
	private float stelle; //decimal(2,1) minimo 1 massimo 5
	private String Descrizione;
	//Uno di questi 3 deve essere not null ma solo uno
	
	public RecensioneBean () 
	{
		IdRecensione = null;
		Utente = null;
		Videogioco = null;
		Collezionabile = null;
		stelle = -1;
		Descrizione = null;
	}

	public String getIdRecensione() {
		return IdRecensione;
	}

	public void setIdRecensione(String idRecensione) {
		IdRecensione = idRecensione;
	}

	public String getUtente() {
		return Utente;
	}

	public void setUtente(String utente) {
		Utente = utente;
	}

	public String getVideogioco() {
		return Videogioco;
	}

	public void setVideogioco(String videogioco) {
		Videogioco = videogioco;
	}

	public String getCollezionabile() {
		return Collezionabile;
	}

	public void setCollezionabile(String collezionabile) {
		Collezionabile = collezionabile;
	}

	public float getStelle() {
		return stelle;
	}

	public void setStelle(float stelle) {
		this.stelle = stelle;
	}

	public String getDescrizione() {
		return Descrizione;
	}

	public void setDescrizione(String descrizione) {
		Descrizione = descrizione;
	}

	public String getConsole() {
		return Console;
	}

	public void setConsole(String console) {
		Console = console;
	}
	
	
}
