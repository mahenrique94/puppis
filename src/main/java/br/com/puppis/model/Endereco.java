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
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = false)
	private String rua;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 10, message = "{minimo.0.maximo.10}")
	@Column(length = 10, columnDefinition = "varchar(10)", nullable = false)
	private String numero;
	@NotNull
	@NotEmpty
	@Size(min = 9, max = 9, message = "{cep}")
	@Column(length = 9, columnDefinition = "varchar(9)", nullable = false)
	private String cep;
	@Size(min = 0, max = 30, message = "{minimo.0.maximo.30}")
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = true)
	private String complemento;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 60, message = "{minimo.0.maximo.60}")
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = false)
	private String bairro;
	@ManyToOne
	@JoinColumn(name = "idestado", referencedColumnName = "id", nullable = false)
	private CadEstado idestado;
	@ManyToOne
	@JoinColumn(name = "idcidade", referencedColumnName = "id", nullable = false)
	private CadCidade idcidade;
	@ManyToOne
	@JoinColumn(name = "idpais", referencedColumnName = "id", nullable = false)
	private CadPais idpais;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public Endereco() {
		setIdcidade(new CadCidade(0));
		setIdestado(new CadEstado(0));
		setIdpais(new CadPais(1058));
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
	public CadEstado getIdestado() {
		return idestado;
	}
	public void setIdestado(CadEstado idestado) {
		this.idestado = idestado;
	}
	public CadCidade getIdcidade() {
		return idcidade;
	}
	public void setIdcidade(CadCidade idcidade) {
		this.idcidade = idcidade;
	}
	public CadPais getIdpais() {
		return idpais;
	}
	public void setIdpais(CadPais idpais) {
		this.idpais = idpais;
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
