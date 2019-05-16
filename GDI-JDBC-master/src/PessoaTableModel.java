
import java.util.ArrayList;
import java.util.List;

import javax.swing.table.AbstractTableModel;


public class PessoaTableModel extends AbstractTableModel {

	private static final long serialVersionUID = 1L;
	
	/* Lista de pessoas que representam as linhas. */
    private List<Pessoa> linhas;
 
    /* Array de Strings com o nome das colunas. */
    private String[] colunas = new String[]{
    			"ID", "Nome"
    		};
 
    /* Cria um PessoaTableModel vazio. */
    public PessoaTableModel() {
        linhas = new ArrayList<Pessoa>();
    }
 
    /* Cria um PessoaTableModel carregado com 
     * a lista de pessoas especificada. */
    public PessoaTableModel(List<Pessoa> listaDePessoa) {
        linhas = new ArrayList(listaDePessoa);
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
 
    ;  
   
    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return String.class;
    }
 
    ;  
   
   
    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Pessoa pessoa = linhas.get(rowIndex);
 
        // Retorna o campo referente a coluna especificada.  
        // Aqui � feito um switch para verificar qual � a coluna  
        // e retornar o campo adequado. As colunas s�o as mesmas  
        // que foram especificadas no array "colunas".  
        switch (columnIndex) {
 
            // Seguindo o exemplo: "Tipo","Data de Cadastro", "Nome", "Idade"};  
        	case 0:
        		return pessoa.getID();
        	case 1:
                return pessoa.getNome();
            
 
            default:
                // Isto n�o deveria acontecer...  
                throw new IndexOutOfBoundsException("columnIndex out of bounds");
        }
    }
 
    @Override
//modifica na linha e coluna especificada  
    public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
        Pessoa pessoa = linhas.get(rowIndex); // Carrega o item da linha que deve ser modificado  
 
        switch (columnIndex) { // Seta o valor do campo respectivo  
        	case 0:
        		pessoa.setID(aValue.toString());
        	case 1:
                pessoa.setNome(aValue.toString());
                 
            default:
            // Isto n�o deveria acontecer...               
        }
        fireTableCellUpdated(rowIndex, columnIndex);
    }
 
    //modifica na linha especificada  
    public void setValueAt(Pessoa aValue, int rowIndex) {
        Pessoa pessoa = linhas.get(rowIndex); // Carrega o item da linha que deve ser modificado  
 
        pessoa.setID(aValue.getID());
        pessoa.setNome(aValue.getNome());
 
        fireTableCellUpdated(rowIndex, 0);
        fireTableCellUpdated(rowIndex, 1);
 
    }
 
    ;  
   
   
    ;  
   
   
    @Override
    public boolean isCellEditable(int rowIndex, int columnIndex) {
        return false;
    }
 
    public Pessoa getPessoa(int indiceLinha) {
        return linhas.get(indiceLinha);
    }
 
    /* Adiciona um registro. */
    public void addPessoa(Pessoa a) {
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
    public void addListaDePessoa(List<Pessoa> pessoa) {
        // Pega o tamanho antigo da tabela.  
        int tamanhoAntigo = getRowCount();
 
        // Adiciona os registros.  
        linhas.addAll(pessoa);
 
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
