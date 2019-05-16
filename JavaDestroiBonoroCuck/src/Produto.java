import java.awt.image.BufferedImage;

	//product class 
public class Produto {
	
	//variables 
	
	private int ID_Produto,	ID_Snack_Bar, CNPJ_Snack_Bar;
	private String Nome_Produto;
	private double Preco;
	private BufferedImage foto;
	
	//constructor
	
	public Produto(int ID_Produto,int ID_Snack_Bar,int CNPJ_Snack_Bar,String  Nome_Produto, double Preco, BufferedImage foto) {
		//super();
		this.ID_Produto = ID_Produto;
		this.ID_Snack_Bar = ID_Snack_Bar;
		this.CNPJ_Snack_Bar = CNPJ_Snack_Bar;
		this.Nome_Produto = Nome_Produto;
		this.Preco = Preco;
		this.foto = foto;
	}

	//getters and setters
	
	public int getID_Produto() {
		return this.ID_Produto;
	}
	public void setID_Produto(int iD_Produto) {
		this.ID_Produto = iD_Produto;
	}
	public int getID_Snack_Bar() {
		return this.ID_Snack_Bar;
	}
	public void setID_Snack_Bar(int iD_Snack_Bar) {
		this.ID_Snack_Bar = iD_Snack_Bar;
	}
	public int getCNPJ_Snack_Bar() {
		return this.CNPJ_Snack_Bar;
	}
	public void setCNPJ_Snack_Bar(int cNPJ_Snack_Bar) {
		this.CNPJ_Snack_Bar = cNPJ_Snack_Bar;
	}
	public String getNome_Produto() {
		return this.Nome_Produto;
	}
	public void setNome_Produto(String nome_Produto) {
		this.Nome_Produto = nome_Produto;
	}
	public double getPreco() {
		return this.Preco;
	}
	public void setPreco(double preco) {
		this.Preco = preco;
	}

	public BufferedImage getFoto() {
		return foto;
	}
	public void setFoto(BufferedImage foto) {
		this.foto = foto;
	}
	
}
