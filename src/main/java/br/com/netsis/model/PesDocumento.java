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
	@Column(length = 18, columnDefinition = "varchar(18)", nullable = false, unique = true)
	private String cpfcnpj;
	@NotNull
	@NotEmpty
	@Size(min = 6, max = 15, message = "{rginscricaoestadual}")
	@Column(length = 15, columnDefinition = "varchar(15)", nullable = false, unique = true)
	private String rginscricaoestadual;
	@Column(nullable = true)
	private Integer ctps;
	@Column(nullable = true)
	private Integer seriectps;
	@Column(length = 15, columnDefinition = "varchar(15", nullable = true)
	private String pis;
	@Column(length = 20, columnDefinition = "varchar(20)", nullable = true, unique = true)
	private String cnh;
	@Column(length = 5, columnDefinition = "varchar(5)", nullable = true)
	private String tipocnh;
	@Temporal(TemporalType.DATE)
	@Column(nullable = true)
	private Calendar dataexpedicaocnh;
	@Temporal(TemporalType.DATE)
	@Column(nullable = true)
	private Calendar datavencimentocnh;
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
	public Integer getSeriectps() {
		return seriectps;
	}
	public void setSeriectps(Integer seriectps) {
		this.seriectps = seriectps;
	}
	public String getPis() {
		return pis;
	}
	public void setPis(String pis) {
		this.pis = pis;
	}
	public String getCnh() {
		return cnh;
	}
	public void setCnh(String cnh) {
		this.cnh = cnh;
	}
	public String getTipocnh() {
		return tipocnh;
	}
	public void setTipocnh(String tipocnh) {
		this.tipocnh = tipocnh;
	}
	public Calendar getDataexpedicaocnh() {
		return dataexpedicaocnh;
	}
	public void setDataexpedicaocnh(Calendar dataexpedicaocnh) {
		this.dataexpedicaocnh = dataexpedicaocnh;
	}
	public Calendar getDatavencimentocnh() {
		return datavencimentocnh;
	}
	public void setDatavencimentocnh(Calendar datavencimentocnh) {
		this.datavencimentocnh = datavencimentocnh;
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
