import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Scanner;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
public class JDBC {

	public static String url = "jdbc:oracle:thin:@oracle12c.cin.ufpe.br:1521:instance01";
	public static String user = "g191if685cc_eq01";
	public static String senha = "ywqpraoj";

	public static Connection conexao;
	public static Statement stmt;
	public static PreparedStatement pstmt, pstmt2;
	public static ResultSet resultado;
	
	public static String[] colunas;
	public static void testeCodigoAdriano() {
		
		Blob blob = null;
		ImageIcon icon=null;
		selectBasico("select img from produto where id_produto = 94");
		
		try {//pega resultado
			resultado.next();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {//pega blob da imagem
			blob = resultado.getBlob("IMG");
			icon = new ImageIcon(blob.getBytes(1, (int)blob.length()));
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		Image img = icon.getImage();

		BufferedImage bi = new BufferedImage(img.getWidth(null),img.getHeight(null),BufferedImage.TYPE_INT_ARGB);

		Graphics2D g2 = bi.createGraphics();
		g2.drawImage(img, 0, 0, null);
		g2.dispose();
		try {//COLOCAR UMA PATH QUE SEJA ACESSIVEL
			ImageIO.write(bi, "jpg", new File("D:\\Users\\jgsp2\\Desktop\\gdi\\CineminhaGDI\\JavaDestroiBonoroCuck\\img.jpg"));
			ImageIcon icon2 = new ImageIcon("D:\\Users\\jgsp2\\Desktop\\gdi\\CineminhaGDI\\JavaDestroiBonoroCuck\\img.jpg");
;			JOptionPane.showMessageDialog(null, "Welcome!", "This is the Bug Plug Flurry Land!", JOptionPane.INFORMATION_MESSAGE, icon2);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static void createConnection(){

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conexao = DriverManager.getConnection(url, user, senha);
			stmt = conexao.createStatement();
			//pstmt = conexao.prepareStatement("update PRODUTO set IMG = ? where ID_PRODUTO = 95"); 
			//pstmt2 = conexao.prepareStatement("drop or create table IMAGE(img blob)");
			//pstmt2.execute();
			//insertImage("D:\\Users\\jgsp2\\Desktop\\gdi\\CineminhaGDI\\JavaDestroiBonoroCuck\\Marmita.jpg");
		}catch (ClassNotFoundException e){
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void insertImage(String namefile) {
		File file = new File(namefile);
		InputStream inputImage = null;
		try {
			inputImage = new FileInputStream(file);
		} catch (FileNotFoundException e1) {

			e1.printStackTrace();
		}
		try {
			pstmt.setBinaryStream(1, inputImage, (int)(file.length()));
			pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public static void retrieveImage(String consultaEssqL) {//deveria pegar e imprimir imagem
		Blob blob = null;
		ImageIcon imageIcon=null;
		selectBasico("select count(*) from ("+consultaEssqL+")");
		String text = "";
		int qtt = 0;
		try {
			resultado.next();
			qtt = Integer.parseInt(resultado.getString(1));//quantidade de linhas
		}catch (SQLException a) {
			a.printStackTrace();
		}
		
		selectBasico(consultaEssqL);//atualiza resultado
		int DIO = gambiarra(consultaEssqL);//peg quantidade de colunas e atualiza colunas[]
		
		for(int i = 0; i<qtt;i++) {
			try {
				resultado.next();
				blob = resultado.getBlob("IMG");
				text="";
				for(int j = 1; j<= colunas.length;j++) {//pra cada coluna
					text += colunas[j-1] + ": " + resultado.getString(j) + "\n";//atualiza texto
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
	
			try {
				imageIcon = new ImageIcon(blob.getBytes(1, (int)blob.length()));
				JOptionPane.showMessageDialog(null,text, "Tabela Produtos", JOptionPane.INFORMATION_MESSAGE, imageIcon);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
	}

	public static void closeConnection(){
		try {
			conexao.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void selectBasico(String select){
		try {
			resultado = stmt.executeQuery(select);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void ImprimirResultado(int quantidadeColunas){
		String text = "";
		int qtt = 0;
		try {
			resultado.next();
			qtt = Integer.parseInt(resultado.getString(1));//quantidade de linhas
		}catch (SQLException a) {
			a.printStackTrace();
		}
		for(int i = 0; i<qtt;i++){
			try {
				if (resultado.next()){//pra cada linha
					text="";
					for(int j = 1; j<= quantidadeColunas;j++) {//pra cada coluna
						text += colunas[j-1] + ": " + resultado.getString(j).toUpperCase() + "\n";//atualiza texto
					}
					
					try {
						Blob blob = resultado.getBlob("IMG");
						ImageIcon imageIcon = new ImageIcon(blob.getBytes(1, (int)blob.length()));
						JOptionPane.showMessageDialog(null,text, "Tabela Produtos", JOptionPane.INFORMATION_MESSAGE, imageIcon);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
				}else{
					break;
				}

			} catch (SQLException e) {
				System.out.println();
			}
		}
	}

	private static int gambiarra(String consultaEssqL) {
		consultaEssqL = consultaEssqL.toLowerCase();

		if(consultaEssqL.contains("*")) {
			if(consultaEssqL.contains(" produto")) {
				//TENTATIVA DE PEGAR IMAGEM AQUI
				colunas = new String[]{"ID_produto","ID_Barzinho","CNPJ_Barzinho","Nome_Produto","Preco"};
				return 5;
			}
		}

		String aux = consultaEssqL.split("select ")[1];//pega tudo depois do select
		//System.out.println("depois do select tem "+aux);

		aux = aux.split(" from")[0];//pega tudo antes do from e depois do select
		//System.out.println("entre o select e o from tem "+aux);
		
		int contador=0;

		for(int i=0;i<aux.length(); i++) {
			if(aux.charAt(i)==',') {
				contador++;
			}

		}
		colunas = aux.split(",");
		
		//teste funcionou
		for(int i=0;i<colunas.length; i++) {
			colunas[i] = colunas[i].trim();
			System.err.println(colunas[i]);
		}
		
		
		return contador+1;
	}


	public static void main(String args[]){
		//DUAS LINHAS ABAIXO PRINTAM IMAGEM NA TELA
		//IDEALMENTE GERAR IMAGEM NOVA PEGANDO DO BANCO DE DADOS ATRAVEZ DE retrieveImage() e usar isso pra printar
		//ImageIcon icon = new ImageIcon("D:\\Users\\jgsp2\\Desktop\\gdi\\CineminhaGDI\\JavaDestroiBonoroCuck\\Marmita.jpg");
		//JOptionPane.showMessageDialog(null, "MARMITA VAZIA 10 REAIS", "marmita", JOptionPane.INFORMATION_MESSAGE, icon);
		Scanner leia = new Scanner(System.in);

		//Abrir a conexao:
		createConnection();
		
		//teste da criacao do array colunas na gambiarra
		//int q = gambiarra("select id_produto, nome_produto from produto");
		//passou no teste
		
		testeCodigoAdriano();//Só funciona se tiver isso...

		System.out.println("Digite quantas consultas gostaria de realizar");
		int aux = leia.nextInt();

		leia.nextLine();
		//Fazer um select:
		for(int i = 0; i<aux;i++) {
			System.out.println("Escreva a consulta em formato SELECT FROM WHERE em uma única linha.");
			String consultaEssqL = leia.nextLine();

			//Fazer um select basico:
			//pega resultado
			retrieveImage(consultaEssqL);//faz tudo
			//testeCodigoAdriano();

			//pega quantidade de colunas no resultado
			//int quantidade = gambiarra(consultaEssqL);

			//Imprimir resultado NO CONSOLE
			//ImprimirResultado(quantidade);

		}
		//Fechar a conexao;
		closeConnection();

	}
}
//Tem que baixar oracle jar no site da oracle

