package rc.model;

import java.io.Serializable;
import com.mysql.cj.jdbc.Blob;

@SuppressWarnings("serial")
public class VideogiocoBean extends ProdottoBean implements Serializable{
	
	
	//ENUM
	
	//Standard_Edition, Bronze_Edition, Silver_Edition, Gold_Edition, Platinum_Edition, Diamond_Edition
	//G_O_T_Y_Edition, Enhanced_Edition, Ultimate_Edition
	private String Edizione;
	
	//Action_Adventure, Picchiaduro, RPG, Sparatutto, Simulazione, Sport, Strategia
	private String Genere; 
	
	//PS1, PS2, PS3, PS4, PS5, Xbox, Xbox_360, Xbox_One, Xbox_Series_X_S, Nintendo_64, GameCube, Wii, Wii_U
	//Switch, Game_Boy, Nintendo_DS, Nintendo_3DS, Sega_Mega_Drive, Sega_Master_System, DreamCast, SegaSaturn
	//Atari_2600, Atari_5200, Atari_7800, Altro
	private String Piattaforma;
	
	
	/*Produttore:
	 * 
	 * Ubisoft, Rockstar_Games, Nintendo, Activision, Electronic_Arts, Sega, Naughty_Dog, Microsoft_Studios
	 * Bethesda, Gearbox_Software, Epic_Games, Capcom, Bandai_Namco_Entertainment, Konami
	 */
	private String Tipo; //Digitale, Fisico

	
	public VideogiocoBean()
	{
		Edizione = null;
		Genere = null;
		Piattaforma = null;
		Produttore = null;
		Tipo = null;
		IdProdotto = null;
		nome = null;
		qta = -1;
		disp = false;
		descr = null;
		costo = -1;
		picture = null;
	}

	public String getEdizione() {
		return Edizione;
	}

	public void setEdizione(String edizione) {
		Edizione = edizione;
	}

	public String getGenere() {
		return Genere;
	}

	public void setGenere(String genere) {
		Genere = genere;
	}

	public String getPiattaforma() {
		return Piattaforma;
	}

	public void setPiattaforma(String piattaforma) {
		Piattaforma = piattaforma;
	}

	public String getProduttore() {
		return Produttore;
	}

	public void setProduttore(String produttore) {
		Produttore = produttore;
	}

	public String getTipo() {
		return Tipo;
	}

	public void setTipo(String tipo) {
		Tipo = tipo;
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
