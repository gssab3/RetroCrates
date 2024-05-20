package bean;

import java.io.Serializable;

public class VideogiocoBean implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private enum Edizione{
		Standard_Edition,
		Bronze_Edition,
		Silver_Edition,
		Gold_Edition,
		Platinum_Edition,
		Diamond_Edition,
		Definitive_Edition,
		G_O_T_Y_Edition,
		Enhanced_Edition,
		Ultimate_Edition
	}
	
	private enum Genere{
	    Action_Adventure,
	    Picchiadure,
	    RPG,
	    Sparattutto,
	    Simulazione,
	    Sport,
	    Strategia
	}
	
	private enum Piattaforma{
	    PS1,
	    PS2,
	    PS3,
	    PS4,
	    PS5,
	    Xbox,
	    Xbox_360,
	    Xbox_One,
	    Xbox_Series_X_S,
	    Nintendo_64,
	    GameCube,
	    Wii,
	    Wii_U,
	    Switch,
	    Game_Boy,
	    Nintendo_DS,
	    Nintendo_3DS,
	    Sega_Mega_Drive,
	    Sega_Master_System,
	    DreamCast,
	    Sega_Saturn,
	    Atari_2600,
	    Atari_5200,
	    Atari_7800,
	    Altro
	}
	
	private enum Produttore{
	    Ubisoft,
	    Rockstar_Games,
	    Nintendo,
	    Activision,
	    Eletronic_Arts,
	    Sega,
	    Naughty_Dog,
	    Microsoft_Studios,
	    Bethesda,
	    Gearbox_Software,
	    Epic_Games,
	    Capcom,
	    Bandai_Namco_Entertainment,
	    Konami 
	}
	
	private enum Tipo{
		Digitale,
		Fisico
	}

	
	private String IdProdotto; //Esattamente 7 caratteri
	private String nome; //Massimo 30 caratteri
	private int qta; //>=0
	private boolean disp; //disponibilità, in genere è false e quelli false non si mostrano
	private String descr;
	private float costo;

}
