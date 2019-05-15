import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.*;
import java.util.Scanner;

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

    public static void createConnection(){

        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conexao = DriverManager.getConnection(url, user, senha);
            stmt = conexao.createStatement();
            //by zé
           // pstmt = conexao.prepareStatement("update PRODUTO set IMG = ? where ID_PRODUTO = 95"); 
            //pstmt2 = conexao.prepareStatement("drop or create table IMAGE(img blob)");
            //pstmt2.execute();
            //insertImage("D:\\Users\\jgsp2\\Desktop\\gdi\\CineminhaGDI\\JavaDestroiBonoroCuck\\Marmita.jpg");
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    //by zé
    public static void insertImage(String namefile) {
    	File file = new File(namefile);
    	InputStream inputImage = null;
		try {
			inputImage = new FileInputStream(file);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	try {
			pstmt.setBinaryStream(1, inputImage, (int)(file.length()));
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public static ImageIcon retrieveImage() {
    	Blob blob = null;
    	ImageIcon imageIcon=null;
		try {
			resultado.next();
			blob = resultado.getBlob("IMG");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	try {
			imageIcon = new ImageIcon(blob.getBytes(1, (int)blob.length()));
			JOptionPane.showMessageDialog(null, "Hello world", "Hello", JOptionPane.INFORMATION_MESSAGE, imageIcon);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return imageIcon;
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
            //retrieveImage();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static void ImprimirResultado(int quantidadeColunas){
        while(true){
            try {
                if (resultado.next()){

                    //System.out.println(quantidadeColunas);
                 for(int i = 1; i<= quantidadeColunas;i++) {
                  System.out.print(resultado.getString(i)+"\t\t");
                 }
                 System.out.println();
                	
                }else{
                    break;
                }

            } catch (SQLException e) {
            	System.out.println();
                //e.printStackTrace();
            }
        }
    }

    private static int gambiarra(String consultaEssqL) {
    	consultaEssqL = consultaEssqL.toLowerCase();
    	
    	if(consultaEssqL.contains("*")) {
    		if(consultaEssqL.contains(" produto")) return 5;
    		else if(consultaEssqL.contains(" pessoa")) return 3;
    		//colocar outras tabelas se necessário
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
    	//if(contador==0) return 1;
    	
    	return contador+1;
    }
    

    public static void main(String args[]){
    	//DUAS LINHAS ABAIXO PRINTAM IMAGEM NA TELA
    	//IDEALMENTE GERAR IMAGEM NOVA PEGANDO DO BANCO DE DADOS ATRAVEZ DE retrieveImage() e usar isso pra printar
    	ImageIcon icon = new ImageIcon("D:\\Users\\jgsp2\\Desktop\\gdi\\CineminhaGDI\\JavaDestroiBonoroCuck\\Marmita.jpg");
    	JOptionPane.showMessageDialog(null, "MARMITA VAZIA 10 REAIS", "marmita", JOptionPane.INFORMATION_MESSAGE, icon);
     Scanner leia = new Scanner(System.in);
        //Fazer um select basico:

        //Abrir a conexao:
        createConnection();
        System.out.println("Digite quantas consultas gostaria de realizar");
        int aux = leia.nextInt();
        leia.nextLine();
        //Fazer um select:
        for(int i = 0; i<aux;i++) {
         System.out.println("Escreva a consulta em formato SELECT FROM WHERE em uma única linha.");
         String consultaEssqL = leia.nextLine();
        	
        	
         int quantidade = gambiarra(consultaEssqL);
        	
         selectBasico(consultaEssqL);
        	
         //Imprimir resultado:
         ImprimirResultado(quantidade);
        	
         //Fechar a conexao;
        }
        closeConnection();
        
    }
}
//Tem que baixar oracle jar no site da oracle