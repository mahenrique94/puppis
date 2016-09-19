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
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
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
@Table(name = "com_notaitem")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class ComNotaItem implements Serializable {
	
	@Id
	@SequenceGenerator(name = "com_notaitem", sequenceName = "sqcom_notaitem", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "com_notaitem")
	private Long id;
	@ManyToOne
	@JoinColumn(name = "idnota", referencedColumnName = "id", nullable = false)
	private ComNota idnota;
	@ManyToOne
	@JoinColumn(name = "idprodutoservico", referencedColumnName = "id", nullable = false)
	private PsProdutoServico idprodutoservico;
	@ManyToOne
	@JoinColumn(name = "idtabelaprecopessoa", referencedColumnName = "id", nullable = true)
	private TblPrecoPessoa idtabelaprecopessoa;
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
	private Double porcjuros;
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
	
	public ComNotaItem() {
		setPorcdesconto(0.0);
		setPorcicms(0.0);
		setPorcipi(0.0);
		setPorcjuros(0.0);
		setValortotal(0.0);
		setValorunitario(0.0);
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public ComNotaItem(Long id) {
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
	public TblPrecoPessoa getIdtabelaprecopessoa() {
		return idtabelaprecopessoa;
	}
	public void setIdtabelaprecopessoa(TblPrecoPessoa idtabelaprecopessoa) {
		this.idtabelaprecopessoa = idtabelaprecopessoa;
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
	public Double getPorcjuros() {
		return porcjuros;
	}
	public void setPorcjuros(Double porcjuros) {
		this.porcjuros = porcjuros;
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
		double total = ((getQuantidade() * getValorunitario()) + getValorIcms() + getValorIpi() + getValorJuros()) - getValorDesconto();
		setValortotal(total);
	}
	
	public double getValorIcms() {
		return (getPorcicms() / 100) * getValorunitario();
	}
	public double getValorIpi() {
		return (getPorcipi() / 100) * getValorunitario();
	}
	public double getValorDesconto() {
		return (getPorcdesconto() / 100) * getValorunitario();
	}
	public double getValorJuros() {
		return (getPorcjuros() / 100) * getValorunitario();
	}
	
}
