package br.com.netsis.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "pes_endereco")
public class PesEndereco implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@OneToOne
	@JoinColumn(name = "idpessoa", referencedColumnName = "id", nullable = true, unique = true)
	private PesPessoa idpessoa;
	@NotNull
	@NotEmpty
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = false)
	private String rua;
	@NotNull
	@NotEmpty
	@Column(length = 10, columnDefinition = "varchar(10)", nullable = false)
	private String numero;
	@NotNull
	@NotEmpty
	@Size(min = 10, max = 10, message = "{cep}")
	@Column(length = 12, columnDefinition = "varchar(12)", nullable = false)
	private String cep;
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = true)
	private String complemento;
	@NotNull
	@NotEmpty
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = false)
	private String bairro;
	@NotNull
	@NotEmpty
	@Size(min = 2, max = 2, message = "{uf}")
	@Column(length = 2, columnDefinition = "char(2)", nullable = false)
	private String uf;
	@NotNull
	@NotEmpty
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = false)
	private String cidade;
	@NotNull
	@NotEmpty
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = false)
	private String pais;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public PesEndereco() {
		setRua("");
		setNumero("");
		setCep("");
		setBairro("");
		setUf("");
		setCidade("");
		setPais("");
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public PesEndereco(Long id) {
		this();
		setId(id);
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public PesPessoa getIdpessoa() {
		return idpessoa;
	}
	public void setIdpessoa(PesPessoa idpessoa) {
		this.idpessoa = idpessoa;
	}
	public String getRua() {
		return rua;
	}
	public void setRua(String rua) {
		this.rua = rua;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public Calendar getDatacreate() {
		return datacreate;
	}
	public void setDatacreate(Calendar datacreate) {
		this.datacreate = datacreate;
	}
	public Calendar getDataupdate() {
		return dataupdate;
	}
	public void setDataupdate(Calendar dataupdate) {
		this.dataupdate = dataupdate;
	}
	
}
