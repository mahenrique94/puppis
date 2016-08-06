package br.com.puppis.model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "com_notacusto")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class ComNotaCusto implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@OneToOne
	@JoinColumn(name = "idnota", referencedColumnName = "id", nullable = false)
	private ComNota idnota;
	@ManyToOne
	@JoinColumn(name = "idformapagamento", referencedColumnName = "id", nullable = false)
	private FinFormaPagamento idformapagamento;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double valordesconto;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double valorjuros;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double valoricms;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double valoripi;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valortotal;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public ComNotaCusto() {
		setIdformapagamento(new FinFormaPagamento(0));
		setValordesconto(0.0);
		setValorjuros(0.0);
		setValoricms(0.0);
		setValoripi(0.0);
		setValortotal(0.0);
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public ComNotaCusto(Long id) {
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
	public FinFormaPagamento getIdformapagamento() {
		return idformapagamento;
	}
	public void setIdformapagamento(FinFormaPagamento idformapagamento) {
		this.idformapagamento = idformapagamento;
	}
	public Double getValordesconto() {
		return valordesconto;
	}
	public void setValordesconto(Double valordesconto) {
		this.valordesconto = valordesconto;
	}
	public Double getValoricms() {
		return valoricms;
	}
	public void setValoricms(Double valoricms) {
		this.valoricms = valoricms;
	}
	public Double getValoripi() {
		return valoripi;
	}
	public void setValoripi(Double valoripi) {
		this.valoripi = valoripi;
	}
	public Double getValorjuros() {
		return valorjuros;
	}
	public void setValorjuros(Double valorjuros) {
		this.valorjuros = valorjuros;
	}
	public Double getValortotal() {
		return valortotal;
	}
	public void setValortotal(Double valortotal) {
		this.valortotal = valortotal;
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

	public void calcularTotal(ComNotaCusto obj, List<ComNotaItem> itens) {
		double totalItens = 0.0;
		for(ComNotaItem item : itens) {
			totalItens += item.getValortotal();
		}
		double desconto = ((obj.getValordesconto() != null ? obj.getValordesconto() : 0.0) / 100) * totalItens;
		double juros= ((obj.getValorjuros() != null ? obj.getValorjuros() : 0.0) / 100) * totalItens;
		double icms = ((obj.getValoricms() != null ? obj.getValoricms() : 0.0) / 100) * totalItens;
		double ipi = ((obj.getValoripi() != null ? obj.getValoripi() : 0.0) / 100) * totalItens;
		double total = (icms + ipi + totalItens + juros) - desconto;
		obj.setValortotal(total);
	}
	
}