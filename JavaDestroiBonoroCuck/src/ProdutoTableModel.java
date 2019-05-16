import java.util.ArrayList;
import java.util.List;

import javax.swing.table.AbstractTableModel;


public class ProdutoTableModel extends AbstractTableModel {

	private static final long serialVersionUID = 1L;
	
	/* Lista de produtos que representam as linhas. */
	private List<Produto> linhas;
	
	/* Array de Strings com o nome das colunas. */
    private String[] colunas = new String[]{
    	 "ID_Produto",
    	 "ID_Snack_Bar", 
    	 "CNPJ_Snack_Bar", 
    	 "Nome_Produto",  
    	 "Preco"
    	 //ver se tem mais coisa auqi...
    };
	
    /* Cria um ProdutoTableModel vazio. */
    public ProdutoTableModel() {
        linhas = new ArrayList<Produto>();
    }
    
    /* Cria um ProdutoTableModel carregado com 
     * a lista de produtos especificada. */
    public ProdutoTableModel(List<Produto> listaDeProduto) {
        linhas = new ArrayList(listaDeProduto);
    }
    
    /* Retorna a quantidade de colunas. */
    @Override
    public int getColumnCount() {
        // Está retornando o tamanho do array "colunas".  
        return colunas.length;
    }
 
    /* Retorna a quantidade de linhas. */
    @Override
    public int getRowCount() {
        // Retorna o tamanho da lista de pessoas.  
        return linhas.size();
    }
 
    @Override
    public String getColumnName(int columnIndex) {
        // Retorna o conteúdo do Array que possui o nome das colunas  
        return colunas[columnIndex];
    }
     
    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return String.class;
    }
        
    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Produto produto = linhas.get(rowIndex);
 
        // Retorna o campo referente a coluna especificada.  
        // Aqui é  feito um switch para verificar qual eeh a coluna  
        // e retornar o campo adequado. As colunas sao as mesmas  
        // que foram especificadas no array "colunas".  
        switch (columnIndex) {
 
            // Seguindo o exemplo: "Id","IDsnack", "CNPJ", "..."};  
        	case 0:
        		return produto.getID_Produto();
        	case 1:
                return produto.getID_Snack_Bar();
        	case 2:
        		return produto.getCNPJ_Snack_Bar();
        	case 3:
        		return produto.getNome_Produto();
        	case 4:
        		return produto.getPreco();
            
 
            default:
                // Isto n deveria acontecer...  
                throw new IndexOutOfBoundsException("columnIndex out of bounds");
        }
    }
    
    @Override
//modifica na linha e coluna especificada  
    public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
//        Produto prod = linhas.get(rowIndex); // Carrega o item da linha que deve ser modificado  
// 
//        switch (columnIndex) { // Seta o valor do campo respectivo  
//        	case 0:
//        		prod.setFUNCAO(aValue.toString());
//        	case 1:
//        		prod.setFUNCAO(aValue.toString());
//                 
//            default:
//            // Isto n deveria acontecer...               
//        }
//        fireTableCellUpdated(rowIndex, columnIndex);
    }
        
    //modifica na linha especificada  
    public void setValueAt(Produto aValue, int rowIndex) {
//        Produto prod = linhas.get(rowIndex); // Carrega o item da linha que deve ser modificado  
// 
//        prod.setID(aValue.getFUNCAO());
//        prod.setNome(aValue.getFUNCAO());
// 
//        fireTableCellUpdated(rowIndex, 0);
//        fireTableCellUpdated(rowIndex, 1);
//        fireTableCellUpdated(rowIndex, n);
 
    }
        
    @Override
    public boolean isCellEditable(int rowIndex, int columnIndex) {
        return false;
    }
 
    public Produto getProduto(int indiceLinha) {
        return linhas.get(indiceLinha);
    }
 
    /* Adiciona um registro. */
    public void addProduto(Produto a) {
        // Adiciona o registro.  
        linhas.add(a);
 
        int ultimoIndice = getRowCount() - 1;
 
        fireTableRowsInserted(ultimoIndice, ultimoIndice);
    }
    
    /* Remove a linha especificada. */
    public void removePessoa(int indiceLinha) {
        linhas.remove(indiceLinha);
 
        fireTableRowsDeleted(indiceLinha, indiceLinha);
    }
 
    /* Adiciona uma lista de Cliente ao final dos registros. */
    public void addListaDePessoa(List<Produto> produto) {
        // Pega o tamanho antigo da tabela.  
        int tamanhoAntigo = getRowCount();
 
        // Adiciona os registros.  
        linhas.addAll(produto);
 
        fireTableRowsInserted(tamanhoAntigo, getRowCount() - 1);
    }

    /* Remove todos os registros. */
    public void limpar() {
        linhas.clear();
 
        fireTableDataChanged();
    }
 
    /* Verifica se este table model esta vazio. */
    public boolean isEmpty() {
        return linhas.isEmpty();
    }
	    
    
}
