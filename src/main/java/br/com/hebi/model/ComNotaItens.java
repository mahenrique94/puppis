package br.com.hebi.model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;

@Entity
@Table(name = "com_notaitens")
public class ComNotaItens implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "idnota", referencedColumnName = "id", nullable = false)
	private ComNota idnota;
	@ManyToOne
	@JoinColumn(name = "idprodutoservico", referencedColumnName = "id", nullable = false)
	private PsProdutoServico idprodutoservico;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valorunitario;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valortotal;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double porclucro;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double porcicms;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double porcipi;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double porcdesconto;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double quantidade;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public ComNotaItens() {
		setPorcdesconto(0.0);
		setPorcicms(0.0);
		setPorcipi(0.0);
		setPorclucro(0.0);
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public ComNotaItens(Long id) {
		this();
		setId(id);
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public ComNota getIdnota() {
		return idnota;
	}
	public void setIdnota(ComNota idnota) {
		this.idnota = idnota;
	}
	public PsProdutoServico getIdprodutoservico() {
		return idprodutoservico;
	}
	public void setIdprodutoservico(PsProdutoServico idprodutoservico) {
		this.idprodutoservico = idprodutoservico;
	}
	public Double getValorunitario() {
		return valorunitario;
	}
	public void setValorunitario(Double valorunitario) {
		this.valorunitario = valorunitario;
	}
	public Double getValortotal() {
		return valortotal;
	}
	public void setValortotal(Double valortotal) {
		this.valortotal = valortotal;
	}
	public Double getPorclucro() {
		return porclucro;
	}
	public void setPorclucro(Double porclucro) {
		this.porclucro = porclucro;
	}
	public Double getPorcicms() {
		return porcicms;
	}
	public void setPorcicms(Double porcicms) {
		this.porcicms = porcicms;
	}
	public Double getPorcipi() {
		return porcipi;
	}
	public void setPorcipi(Double porcipi) {
		this.porcipi = porcipi;
	}
	public Double getPorcdesconto() {
		return porcdesconto;
	}
	public void setPorcdesconto(Double porcdesconto) {
		this.porcdesconto = porcdesconto;
	}
	public Double getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(Double quantidade) {
		this.quantidade = quantidade;
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

	public void calculaTotal() {
		double desconto = (getPorcdesconto() / 100) * basePorcentagem();
		double icms = (getPorcicms() / 100) * basePorcentagem();
		double ipi = (getPorcipi() / 100) * basePorcentagem();
		double lucro = (getPorclucro() / 100) * basePorcentagem();
		double total = ((getQuantidade() * getValorunitario()) + icms + ipi + lucro) - desconto;
		setValortotal(total);
	}
	
	public double getIcms() {
		return (getPorcicms() / 100) * getValorunitario();
	}
	public double getIpi() {
		return (getPorcipi() / 100) * getValorunitario();
	}
	public double getDesconto() {
		return (getPorcdesconto() / 100) * getValorunitario();
	}
	
	private double basePorcentagem() {
		return getValorunitario() * getQuantidade();
	}
	
}
