package rc.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class UtenteBean implements Serializable
{
	//Enum
	private String Tipo; //Admin, Utente 
	
	private String Username; //massimo 20 caratteri
	private String email; //massimo 50 caratteri
	private String PasswordHash; //Da Hashare
	private String Datanas; 
	
	public UtenteBean() 
	{
		Tipo = null;
		Username = null;
		email = null;
		PasswordHash = null;
		Datanas = null;
	}

	public String getTipo() {
		return Tipo;
	}

	public void setTipo(String tipo) {
		Tipo = tipo;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPasswordHash() {
		return PasswordHash;
	}

	public void setPasswordHash(String passwordHash) {
		PasswordHash = passwordHash;
	}

	public String getDatanas() {
		return Datanas;
	}

	public void setDatanas(String date) {
		Datanas = date;
	}
}
