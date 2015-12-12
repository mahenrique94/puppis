package br.com.netsis.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "pes_documento")
public class PesDocumento implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@OneToOne
	@JoinColumn(name = "idpessoa", referencedColumnName = "id", nullable = false, unique = true)
	private PesPessoa idpessoa;
	@NotNull
	@NotEmpty
	@Size(min = 10, max = 18, message = "{cpfcnpj}")
	@Column(length = 20, columnDefinition = "varchar(20)", nullable = false, unique = true)
	private String cpfcnpj;
	@NotNull
	@NotEmpty
	@Size(min = 6, max = 18, message = "{rginscricaoestadual}")
	@Column(length = 20, columnDefinition = "varchar(20)", nullable = false, unique = true)
	private String rginscricaoestadual;
	@Column(nullable = true)
	private Integer ctps;
	@Column(nullable = true)
	private Integer serie;
	@Column(nullable = true)
	private Integer pis;
	@Column(length = 20, columnDefinition = "varchar(20)", nullable = true, unique = true)
	private String cnh;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public PesDocumento() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public PesDocumento(Long id) {
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
	public String getCpfcnpj() {
		return cpfcnpj;
	}
	public void setCpfcnpj(String cpfcnpj) {
		this.cpfcnpj = cpfcnpj;
	}
	public String getRginscricaoestadual() {
		return rginscricaoestadual;
	}
	public void setRginscricaoestadual(String rginscricaoestadual) {
		this.rginscricaoestadual = rginscricaoestadual;
	}
	public Integer getCtps() {
		return ctps;
	}
	public void setCtps(Integer ctps) {
		this.ctps = ctps;
	}
	public Integer getSerie() {
		return serie;
	}
	public void setSerie(Integer serie) {
		this.serie = serie;
	}
	public Integer getPis() {
		return pis;
	}
	public void setPis(Integer pis) {
		this.pis = pis;
	}
	public String getCnh() {
		return cnh;
	}
	public void setCnh(String cnh) {
		this.cnh = cnh;
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
