import java.awt.image.BufferedImage;

public class Pessoa {

	private Integer ID;
	private String nome;
	private BufferedImage foto;
	
	public Pessoa(int ID, String nome, BufferedImage foto) {
		super();
		this.ID = ID;
		this.nome = nome;
		this.foto = foto;
	}
	
	public Integer getID() {
		return ID;
	}
	public void setID(Integer ID) {
		this.ID = ID;
	}
	public void setID(String ID) {
		this.ID = new Integer(ID);
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public BufferedImage getFoto() {
		return foto;
	}
	public void setFoto(BufferedImage foto) {
		this.foto = foto;
	}
	
	
	
}
