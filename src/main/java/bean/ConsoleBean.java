package bean;

public class ConsoleBean {

	private enum Produttore{
	    Sony,
	    Microsoft,
	    Nintendo,
	    Atari,
	    Sega,
	    Altri
	}
	
	
	private String IdProdotto; //Esattamente 7 caratteri
	private String nome; //Massimo 30 caratteri
	private int qta; //>=0
	private boolean disp; //disponibilità, in genere è false e quelli false non si mostrano
	private String descr;
	private float costo;
}
