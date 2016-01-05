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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;

@Entity
@Table(name = "fin_controle")
public class FinControle implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "idcomercio", referencedColumnName = "id", nullable = false)
	private AdmComercio idcomercio;
	@ManyToOne
	@JoinColumn(name = "idcontabancaria", referencedColumnName = "id", nullable = false)
	private FinContaBancaria idcontabancaria;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double rendamensal;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double limite;
	@Column(nullable = false)
	private Boolean aceitasaldonegativo;
	@Column(nullable = false)
	private Boolean aceitaultrapassarlimite;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public FinControle() {
		// TODO Auto-generated constructor stub
		setAceitasaldonegativo(false);
		setAceitaultrapassarlimite(false);
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public FinControle(Integer id) {
		// TODO Auto-generated constructor stub
		this();
		setId(id);
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public AdmComercio getIdcomercio() {
		return idcomercio;
	}
	public void setIdcomercio(AdmComercio idcomercio) {
		this.idcomercio = idcomercio;
	}
	public FinContaBancaria getIdcontabancaria() {
		return idcontabancaria;
	}
	public void setIdcontabancaria(FinContaBancaria idcontabancaria) {
		this.idcontabancaria = idcontabancaria;
	}
	public Double getRendamensal() {
		return rendamensal;
	}
	public void setRendamensal(Double rendamensal) {
		this.rendamensal = rendamensal;
	}
	public Double getLimite() {
		return limite;
	}
	public void setLimite(Double limite) {
		this.limite = limite;
	}
	public Boolean getAceitasaldonegativo() {
		return aceitasaldonegativo;
	}
	public void setAceitasaldonegativo(Boolean aceitasaldonegativo) {
		this.aceitasaldonegativo = aceitasaldonegativo;
	}
	public Boolean getAceitaultrapassarlimite() {
		return aceitaultrapassarlimite;
	}
	public void setAceitaultrapassarlimite(Boolean aceitaultrapassarlimite) {
		this.aceitaultrapassarlimite = aceitaultrapassarlimite;
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
