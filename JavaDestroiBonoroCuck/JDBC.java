import java.sql.*;
import java.util.Scanner;
public class JDBC {

    public static String url = "jdbc:oracle:thin:@oracle12c.cin.ufpe.br:1521:instance01";
    public static String user = "g191if685cc_eq01";
    public static String senha = "ywqpraoj";

    public static Connection conexao;
    public static Statement stmt;

    public static ResultSet resultado;

    public static void createConnection(){

        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conexao = DriverManager.getConnection(url, user, senha);
            stmt = conexao.createStatement();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
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

    public static void main(String args[]){
     Scanner leia = new Scanner(System.in);
        //Fazer um select basico:

        //Abrir a conexão:
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
        	
         //Fechar a conexão;
        }
        closeConnection();
        
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

}
//Tem que baixar oracle jar no site da oracle