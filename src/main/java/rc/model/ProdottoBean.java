package rc.model;

import java.io.Serializable;
import com.mysql.cj.jdbc.Blob;

@SuppressWarnings("serial")
public class ProdottoBean implements Serializable{
	
	protected String Produttore; //Enum, vedi la descrizione dei prodotti figli per capire cosa è lecito
	/*
	 * Console: Sony, Microsoft, Nintendo, Atari, Sega, Altri
	 * Videogioco: Ubisoft, Rockstar_Games, Nintendo, Activision, Electronic_Arts, Sega, Naughty_Dog, Microsoft_Studios
	 * 			   Bethesda, Gearbox_Software, Epic_Games, Capcom, Bandai_Namco_Entertainment, Konami
	 * Collezionabile: Funko, Nintendo, Pokèmon, BandaiNamco, YouTooz, Sega, Hasbro, Konami
	 */
	
	protected String Genere;
	/*
	 * Solo per Videogiochi: Action_Adventure, Picchiaduro, RPG, Sparatutto, Simulazione, Sport, Strategia
	 */
	
	protected String Piattaforma;
	/*
	 * Solo per videogiochi: PS1, PS2, PS3, PS4, PS5, Xbox, Xbox_360, Xbox_One, Xbox_Series_X_S, Nintendo_64, GameCube, Wii, Wii_U
	 * Switch, Game_Boy, Nintendo_DS, Nintendo_3DS, Sega_Mega_Drive, Sega_Master_System, DreamCast, SegaSaturn
	 * Atari_2600, Atari_5200, Atari_7800, Altro
	 */
	 
	private String TipoGioco;
	//Solo per Videogioco: "Fisico" , "Digitale"
	
	private String TipoProdotto;
	//Console, Collezionabile, Videogioco
	
	private String Categoria;
	//Solo per collezionabile: Poster, Gadget, Figure, Plush, Audio
	
	private String Edizione;
	/*
	 * Videogiochi: Standard_Edition, Bronze_Edition, Silver_Edition, Gold_Edition, Platinum_Edition, 
	 * Diamond_Edition
	 * G_O_T_Y_Edition, Enhanced_Edition, Ultimate_Edition
	 * 
	 * Collezionabile: Normale, Esclusiva, RetroCrates
	 */
	
	protected String IdProdotto; //Esattamente 7 caratteri
	protected String nome; //Massimo 30 caratteri
	protected int qta; //>=0
	protected boolean disp; //disponibilità, in genere è false e quelli false non si mostrano
	protected String descr;
	protected float costo; // decimal (10,2) >= 0
	protected Blob picture;
	protected int stelleTot; //minimo 1 massimo 5
	
	public ProdottoBean()
	{
		IdProdotto = null;
		nome = null;
		qta = -1;
		disp = false;
		descr = null;
		costo = -1;
		picture = null;
		stelleTot = 0;
		TipoGioco = null;
		TipoProdotto = null;
		Categoria = null;
		Edizione = null;
		Produttore = null;
		Genere = null;
		Piattaforma = null;
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

	public String getTipoGioco() {
		return TipoGioco;
	}

	public void setTipoGioco(String tipoGioco) {
		TipoGioco = tipoGioco;
	}

	public String getTipoProdotto() {
		return TipoProdotto;
	}

	public void setTipoProdotto(String tipoProdotto) {
		TipoProdotto = tipoProdotto;
	}

	public String getCategoria() {
		return Categoria;
	}

	public void setCategoria(String categoria) {
		Categoria = categoria;
	}

	public String getEdizione() {
		return Edizione;
	}

	public void setEdizione(String edizione) {
		Edizione = edizione;
	}

	public int getStelleTot() {
		return stelleTot;
	}

	public void setStelleTot(int stelleTot) {
		this.stelleTot = stelleTot;
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
	
	public void decrQta() {
		if (qta > 0) {
			qta--;
		}
	}
	
	public void addQta() {
		qta++;
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
