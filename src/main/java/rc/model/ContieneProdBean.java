package rc.model;

public class ContieneProdBean {
    private String idOrdine;
    private String idProdotto;
    private int qta;
    private float costo;
    
	public String getIdOrdine() {
		return idOrdine;
	}
	
	public void setIdOrdine(String idOrdine) {
		this.idOrdine = idOrdine;
	}
	
	public String getIdProdotto() {
		return idProdotto;
	}
	
	public void setIdProdotto(String idProdotto) {
		this.idProdotto = idProdotto;
	}
	
	public int getQta() {
		return qta;
	}
	
	public void setQta(int qta) {
		this.qta = qta;
	}
	
	public float getCosto() {
		return costo;
	}
	
	public void setCosto(float costo) {
		this.costo = costo;
	}


}
