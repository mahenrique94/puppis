package br.com.pupis.model;

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

@Entity
@Table(name = "com_notacusto")
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
	private Double porcdesconto;
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
	@Column(nullable = false)
	private Double valortotal;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public ComNotaCusto() {
		setPorcdesconto(0.0);
		setPorcicms(0.0);
		setPorcipi(0.0);
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
	public Double getPorcdesconto() {
		return porcdesconto;
	}
	public void setPorcdesconto(Double porcdesconto) {
		this.porcdesconto = porcdesconto;
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

	public void calcularTotal(ComNotaCusto obj, List<ComNotaItens> itens) {
		double totalItens = 0.0;
		for(ComNotaItens item : itens) {
			totalItens += item.getValortotal();
		}
		double desconto = ((obj.getPorcdesconto() != null ? obj.getPorcdesconto() : 0.0) / 100) * totalItens;
		double icms = ((obj.getPorcicms() != null ? obj.getPorcicms() : 0.0) / 100) * totalItens;
		double ipi = ((obj.getPorcipi() != null ? obj.getPorcipi() : 0.0) / 100) * totalItens;
		double total = (icms + ipi + totalItens) - desconto;
		obj.setValortotal(total);
	}
	
}