package br.com.puppis.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.NotEmpty;

@MappedSuperclass
public class Endereco implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 60, message = "{minimo.0.maximo.60}")
	@Pattern(regexp = "^(([A-Z\\d])+(\\s[A-Z\\d]+)*)$", message = "{pattern.espacoLetraNumero}")
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = false)
	private String logradouro;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 10, message = "{minimo.0.maximo.10}")
	@Pattern(regexp = "^(([A-Z\\d])*([S\\/N])*)$", message = "{pattern.numeroEndereco}")
	@Column(length = 10, columnDefinition = "varchar(10)", nullable = false)
	private String numero;
	@NotNull
	@NotEmpty
	@Size(min = 9, max = 9, message = "{cep}")
	@Pattern(regexp = "^(([\\d]){5}([\\-])([\\d]{3}))$", message = "{pattern.cep}")
	@Column(length = 9, columnDefinition = "varchar(9)", nullable = false)
	private String cep;
	@Size(min = 0, max = 30, message = "{minimo.0.maximo.30}")
	@Pattern(regexp = "^(([A-Z\\d\\.\\/\\-])+(\\s[A-Z\\d\\.\\/\\-]+)*)$", message = "{pattern.espacoLetraNumeroBarraPontoTraco}")
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = true)
	private String complemento;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 60, message = "{minimo.0.maximo.60}")
	@Pattern(regexp = "^(([A-Z])+(\\s[A-Z]+)*)$", message = "{pattern.espacoLetra}")
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = false)
	private String bairro;
	@ManyToOne
	@JoinColumn(name = "idcidade", referencedColumnName = "id", nullable = false)
	private CadCidade idcidade;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public Endereco() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public Endereco(Integer id) {
		this();
		setId(id);
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
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
	public CadCidade getIdcidade() {
		return idcidade;
	}
	public void setIdcidade(CadCidade idcidade) {
		this.idcidade = idcidade;
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
