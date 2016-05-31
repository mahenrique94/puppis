package br.com.hebi.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.enterprise.inject.Default;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;

@Entity
@Table(name = "ps_custo")
public class PsCusto implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@OneToOne
	@JoinColumn(name = "idprodutoservico", referencedColumnName = "id", nullable = false, unique = true)
	private PsProdutoServico idprodutoservico;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valorvenda;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double valormin;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double valormax;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valorpago;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valortotal;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double valoranterior;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double porclucro;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public PsCusto() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
		setPorclucro(0.0);
		setValoranterior(0.0);
		setValorvenda(0.0);
		setValorpago(0.0);
		setValortotal(0.0);
	}
	public PsCusto(Long id) {
		this();
		setId(id);
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public PsProdutoServico getIdprodutoservico() {
		return idprodutoservico;
	}
	public void setIdprodutoservico(PsProdutoServico idprodutoservico) {
		this.idprodutoservico = idprodutoservico;
	}
	public Double getValorvenda() {
		return valorvenda;
	}
	public void setValorvenda(Double valorvenda) {
		this.valorvenda = valorvenda;
	}
	public Double getValormin() {
		return valormin;
	}
	public void setValormin(Double valormin) {
		this.valormin = valormin;
	}
	public Double getValormax() {
		return valormax;
	}
	public void setValormax(Double valormax) {
		this.valormax = valormax;
	}
	public Double getValorpago() {
		return valorpago;
	}
	public void setValorpago(Double valorpago) {
		this.valorpago = valorpago;
	}
	public Double getValortotal() {
		return valortotal;
	}
	public void setValortotal(Double valortotal) {
		this.valortotal = valortotal;
	}
	public Double getValoranterior() {
		return valoranterior;
	}
	public void setValoranterior(Double valoranterior) {
		this.valoranterior = valoranterior;
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
	public Double getPorclucro() {
		return porclucro;
	}
	public void setPorclucro(Double porclucro) {
		this.porclucro = porclucro;
	}
	
	public void novo() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
		setPorclucro(0.0);
		setValoranterior(0.0);
		setValorvenda(0.0);
		setValorpago(0.0);
		setValortotal(0.0);
	}
	
}
