package rc.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class OrdineBean implements Serializable
{
	private String IdOrdine; //char 10 precisi
	private String Utente; //20 caratteri massimo
	private String Destinazione; //massimo 255 caratteri
	private String email; //massimo 50 caratteri
	private String DataOrdine; //yyyy-mm-dd
	
	public OrdineBean()
	{
		IdOrdine = null;
		Utente = null;
		Destinazione = null;
		email = null;
	}

	public String getIdOrdine() {
		return IdOrdine;
	}

	public void setIdOrdine(String idOrdine) {
		IdOrdine = idOrdine;
	}

	public String getUtente() {
		return Utente;
	}

	public void setUtente(String utente) {
		Utente = utente;
	}

	public String getDestinazione() {
		return Destinazione;
	}

	public void setDestinazione(String destinazione) {
		Destinazione = destinazione;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDataOrdine() {
		return DataOrdine;
	}

	public void setDataOrdine(String data) {
		this.DataOrdine = data;
	}
	
	
}
