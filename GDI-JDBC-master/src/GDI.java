import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.border.EmptyBorder;

import java.awt.BorderLayout;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import javax.swing.JTextField;
import javax.swing.JButton;
import javax.imageio.ImageIO;
import javax.swing.AbstractAction;
import java.awt.event.ActionEvent;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;

import javax.swing.JTable;
import javax.swing.JComboBox;
public class GDI extends JFrame {

	private static final long serialVersionUIDPessoa = 1L;
	private JPanel contentPane;
	private JFileChooser chooser;
	private File file;
	private JTextField IDPessoa;
	private JTextField nomePessoa;
	private JLabel labelFotoQuery;
	private JComboBox comboBox;
	
	private Connection connection;
	private BufferedImage foto;
	
	PessoaTableModel tabela = new PessoaTableModel();
	private JTable table;
	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				GDI frame = new GDI();
				frame.setVisible(true);
			}
		});
	}
	
	public void accessDB() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		try {
			connection = DriverManager.getConnection(url, "gp05", "gdi123");
			tabela.addListaDePessoa(getPessoas());
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "Erro ao conectar com o Banco de Dados.");
		}
	}
	
	public List<Pessoa> getPessoas() {
		tabela.limpar();
		List<Pessoa> pessoa = new ArrayList<>();
		String sql = "SELECT id, nome FROM Pessoa";
		try (PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			while(resultSet.next()) {
				pessoa.add(new Pessoa(resultSet.getInt("id"), resultSet.getString("nome"), null));
				comboBox.addItem(resultSet.getInt("id"));
			}
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "Erro ao selecionar do Banco de Dados.");
		}
		return pessoa;
	}

	/**
	 * Create the frame.
	 */
	public GDI() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1090, 606);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		IDPessoa = new JTextField();
		IDPessoa.setBounds(635, 121, 168, 20);
		contentPane.add(IDPessoa);
		IDPessoa.setColumns(10);
		
		JLabel lblIDPessoa = new JLabel("ID da pessoa:");
		lblIDPessoa.setBounds(635, 96, 134, 14);
		contentPane.add(lblIDPessoa);
		
		JLabel lblNomePessoa = new JLabel("Nome da pessoa:");
		lblNomePessoa.setBounds(635, 152, 168, 14);
		contentPane.add(lblNomePessoa);
		
		nomePessoa = new JTextField();
		nomePessoa.setBounds(635, 177, 168, 20);
		nomePessoa.setColumns(10);
		contentPane.add(nomePessoa);
		
		JLabel labelFoto = new JLabel("");
		labelFoto.setBounds(841, 340, 223, 203);
		contentPane.add(labelFoto);
		
		labelFotoQuery = new JLabel("");
		labelFotoQuery.setBounds(46, 340, 345, 216);
		contentPane.add(labelFotoQuery);
		
		comboBox = new JComboBox();
		comboBox.setBounds(420, 362, 157, 20);
		contentPane.add(comboBox);
		comboBox.addItem("-- Escolha uma pessoa --");
		
		JButton btnInserir = new JButton("Inserir");
		btnInserir.setBounds(650, 320, 140, 23);
		btnInserir.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				String sql = "INSERT INTO filmes(id, title, genero, foto) VALUES(?,?,?,?)";
				try (PreparedStatement statement = connection.prepareStatement(sql)) {
					Pessoa pessoa = new Pessoa(new Integer(IDPessoa.getText()), nomePessoa.getText(), foto);
					statement.setInt(1, pessoa.getID());
					statement.setString(2, pessoa.getNome());
					InputStream is = null;
		            try {
		                ByteArrayOutputStream baos = new ByteArrayOutputStream();
		                ImageIO.write(foto, "jpg", baos);
		                is = new ByteArrayInputStream(baos.toByteArray());
		            } catch (IOException ex) {
		                JOptionPane.showMessageDialog(null, "Erro ao converter a imagem.");
		            }
		            statement.setBlob(4, is);
					statement.executeUpdate();
					tabela.addListaDePessoa(getPessoas());
				} catch (SQLException e) {
					JOptionPane.showMessageDialog(null, "Erro ao inserir um filme.");
				}
				nomePessoa.setText("");
				IDPessoa.setText("");
				labelFoto.setIcon(null);
			}
		});
		contentPane.add(btnInserir);
		
		JButton btnUploadImagem = new JButton("Upload Imagem");
		btnUploadImagem.setBounds(650, 428, 142, 23);
		btnUploadImagem.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				JFileChooser c = new JFileChooser();
				c.showOpenDialog(btnInserir);
				file = c.getSelectedFile();
				labelFoto.setIcon(new ImageIcon(file.getAbsolutePath()));
				try {
					foto = ImageIO.read(file);
				} catch (IOException e) {
					JOptionPane.showMessageDialog(null, "Erro na leitrua da imagem.");
				}
			}
		});
		contentPane.add(btnUploadImagem);
		
		JPanel panel = new JPanel();
		panel.setBounds(20, 47, 557, 269);
		panel.setLayout(new BorderLayout(0, 0));
		contentPane.add(panel);
		
		table = new JTable();
		table.setCellSelectionEnabled(true);
		table.setModel(tabela);
		JScrollPane scrollPane = new JScrollPane(table);
		scrollPane.setBounds(0, 0, 0, 0);
		panel.add(scrollPane);
		
		JButton btnConsultar = new JButton("Consultar");
		btnConsultar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
	            BufferedImage imagem;
	            String sql = "Select foto from filmes where id = '" + comboBox.getSelectedItem() + "'";
	            try (PreparedStatement statement = connection.prepareStatement(sql);
	            		ResultSet resultSet = statement.executeQuery()) {
	            	while (resultSet.next()) {
	                    Blob blob = resultSet.getBlob("foto");
	                    ImageIcon i = new ImageIcon(blob.getBytes(1, (int) blob.length()));
	                    //imagem = new BufferedImage(i.getIconWidth(), i.getIconHeight(), BufferedImage.TYPE_INT_RGB);
	                    labelFotoQuery.setIcon(i);
	                }
	            } catch (Exception ex) {
	                JOptionPane.showMessageDialog(null, "Erro ao consultar o Banco de Dados.");
	            }
			}
		});
		btnConsultar.setBounds(420, 490, 157, 23);
		contentPane.add(btnConsultar);
		
		accessDB();

	}
}