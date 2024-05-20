package bean;

import java.io.Serializable;

import com.mysql.cj.jdbc.Blob;

public class CollezionabileBean implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private enum Categoria
	{
		Poster,
		Gadget,
		Figure,
		Plush,
		Audio
	}
	
	private enum Produttore
	{
		Funko,
		Nintendo,
		Pokèmon,
		BandaiNamco,
		Youtooz,
		Sega,
		Hasbro,
		Konami,
	}
	
	
	
	private String IdProdotto; //Esattamente 7 caratteri
	private String nome; //Massimo 30 caratteri
	private int qta; //>=0
	private boolean disp; //disponibilità, in genere è false e quelli false non si mostrano
	private String descr;
	private float costo; // decimal (10,2) >= 0
}
