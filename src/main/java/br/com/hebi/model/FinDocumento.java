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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

import br.com.hebi.util.Util;

@Entity
@Table(name = "fin_documento")
public class FinDocumento implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "idcontabancaria", referencedColumnName = "id", nullable = false)
	private FinContaBancaria idcontabancaria;
	@ManyToOne
	@JoinColumn(name = "iddefinicao", referencedColumnName = "id", nullable = false)
	private PesDefinicao iddefinicao;
	@ManyToOne
	@JoinColumn(name = "idtipooperacao", referencedColumnName = "id", nullable = false)
	private SysTipoOperacao idtipooperacao;
	@Min(0)
	@Column(nullable = false)
	private Long numero;
	@Min(0)
	@Column(nullable = true)
	private Integer serie;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 7, message = "{minimo.0.maximo.7}")
	@Column(length = 7, columnDefinition = "varchar(7)", nullable = false)
	private String desdobramento;
	@ManyToOne
	@JoinColumn(name = "idtipodocumento", referencedColumnName = "id", nullable = false)
	private FinTipoDocumento idtipodocumento;
	@Size(min = 0, max = 120, message = "{minimo.0.maximo.120}")
	@Column(length = 120, columnDefinition = "varchar(120)", nullable = true)
	private String codigobarra;
	@OneToOne
	@JoinColumn(name = "idhistorico", referencedColumnName = "id", nullable = true)
	private FinHistorico idhistorico;
	@ManyToOne
	@JoinColumn(name = "idformapagamento", referencedColumnName = "id", nullable = false)
	private FinFormaPagamento idformapagamento;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valortotal;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valordesconto;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valorjuros;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double saldo;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataemissao;
	@Temporal(TemporalType.DATE)
	@Column(nullable = true)
	private Calendar datapagamento;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datavencimento;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public FinDocumento() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
		setValordesconto(0.0);
		setValorjuros(0.0);
	}
	public FinDocumento(Long id) {
		// TODO Auto-generated constructor stub
		this();
		setId(id);
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public FinContaBancaria getIdcontabancaria() {
		return idcontabancaria;
	}
	public void setIdcontabancaria(FinContaBancaria idcontabancaria) {
		this.idcontabancaria = idcontabancaria;
	}
	public PesDefinicao getIddefinicao() {
		return iddefinicao;
	}
	public void setIddefinicao(PesDefinicao iddefinicao) {
		this.iddefinicao = iddefinicao;
	}
	public SysTipoOperacao getIdtipooperacao() {
		return idtipooperacao;
	}
	public void setIdtipooperacao(SysTipoOperacao idtipooperacao) {
		this.idtipooperacao = idtipooperacao;
	}
	public Long getNumero() {
		return numero;
	}
	public void setNumero(Long numero) {
		this.numero = numero;
	}
	public Integer getSerie() {
		return serie;
	}
	public void setSerie(Integer serie) {
		this.serie = serie;
	}
	public String getCodigobarra() {
		return codigobarra;
	}
	public void setCodigobarra(String codigobarra) {
		this.codigobarra = codigobarra;
	}
	public FinTipoDocumento getIdtipodocumento() {
		return idtipodocumento;
	}
	public void setIdtipodocumento(FinTipoDocumento idtipodocumento) {
		this.idtipodocumento = idtipodocumento;
	}
	public Calendar getDataemissao() {
		return dataemissao;
	}
	public void setDataemissao(Calendar dataemissao) {
		this.dataemissao = dataemissao;
	}
	public FinHistorico getIdhistorico() {
		return idhistorico;
	}
	public void setIdhistorico(FinHistorico idhistorico) {
		this.idhistorico = idhistorico;
	}
	public FinFormaPagamento getIdformapagamento() {
		return idformapagamento;
	}
	public void setIdformapagamento(FinFormaPagamento idformapagamento) {
		this.idformapagamento = idformapagamento;
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
	public String getDesdobramento() {
		return desdobramento;
	}
	public void setDesdobramento(String desdobramento) {
		this.desdobramento = desdobramento;
	}
	public Double getValordesconto() {
		return valordesconto;
	}
	public void setValordesconto(Double valordesconto) {
		this.valordesconto = valordesconto;
	}
	public Double getValorjuros() {
		return valorjuros;
	}
	public void setValorjuros(Double valorjuros) {
		this.valorjuros = valorjuros;
	}
	public Double getSaldo() {
		return saldo;
	}
	public void setSaldo(Double saldo) {
		this.saldo = saldo;
	}
	public Calendar getDatapagamento() {
		return datapagamento;
	}
	public void setDatapagamento(Calendar datapagamento) {
		this.datapagamento = datapagamento;
	}
	public Calendar getDatavencimento() {
		return datavencimento;
	}
	public void setDatavencimento(Calendar datavencimento) {
		this.datavencimento = datavencimento;
	}
	
	public void criar(int numeroParcela) {
		setDesdobramento(numeroParcela + "/" + getIdformapagamento().getQuantidadeparcela());
		setValortotal(getValortotal() / getIdformapagamento().getQuantidadeparcela());
		setDatavencimento(new Util().calcularDataVencimento(this));
	}
	public void novo() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
		setValordesconto(0.0);
		setValorjuros(0.0);
		setSaldo(getValortotal());
	}
	
}
