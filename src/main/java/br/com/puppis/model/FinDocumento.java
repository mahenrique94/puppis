package br.com.puppis.model;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

import com.lowagie.text.pdf.PRAcroForm;

import br.com.mhc.function.DateFunction;
import br.com.mhc.function.NumberFunction;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.util.Util;

@Entity
@Table(name = "fin_documento")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class FinDocumento implements Serializable, Cloneable {
	
	@Id
	@SequenceGenerator(name = "fin_documento", sequenceName = "sqfin_documento", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "fin_documento")
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
	@ManyToOne
	@JoinColumn(name = "iddocumento", referencedColumnName = "id", nullable = true)
	private FinDocumento iddocumento;
	@Range(min = 0, message = "{minimo.0}")
	@Column(nullable = false)
	private Long numero;
	@Range(min = 0, message = "{minimo.0}")
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
	@Pattern(regexp = "^([\\dA-Z]*)$")
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
	@Temporal(TemporalType.DATE)
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
	public FinDocumento getIddocumento() {
		return iddocumento;
	}
	public void setIddocumento(FinDocumento iddocumento) {
		this.iddocumento = iddocumento;
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
	
	public FinDocumento novo() {
		Calendar agora = Calendar.getInstance();
		setDatacreate(agora);
		setDataupdate(agora);
		setValordesconto(0.0);
		setValorjuros(0.0);
		setSaldo(calcula());
		return this;
	}
	
	public FinDocumento novoClonado() {
		Calendar agora = Calendar.getInstance();
		setId(null);
		setDatacreate(agora);
		setDataupdate(agora);
		setDataemissao(agora);
		setDatapagamento(agora);
		setDatavencimento(agora);
		setSaldo(0.0);
		return this;
	}
	
	public FinDocumento novoParcelamento(List<ParametrosWeb> parametrosWeb, FinFormaPagamento finFormaPagamento, int numeroParcela) {
		setDataemissao(DateFunction.stringToCalendar(parametrosWeb.get(6).getParametroInicial()));
		setIdcontabancaria(new FinContaBancaria(Integer.parseInt(parametrosWeb.get(2).getParametroInicial())));
		setIddefinicao(new PesDefinicao(Long.parseLong(parametrosWeb.get(1).getParametroInicial())));
		setIdformapagamento(finFormaPagamento);
		setIdhistorico(new FinHistorico(Integer.parseInt(parametrosWeb.get(8).getParametroInicial())));
		setIdtipodocumento(new FinTipoDocumento(Integer.parseInt(parametrosWeb.get(3).getParametroInicial())));
		setIdtipooperacao(new SysTipoOperacao(Integer.parseInt(parametrosWeb.get(9).getParametroInicial())));
		setNumero(Long.parseLong(parametrosWeb.get(4).getParametroInicial()));
		if (parametrosWeb.get(5).getParametroInicial() != null)
			setSerie(Integer.parseInt(parametrosWeb.get(5).getParametroInicial()));
		setValortotal(NumberFunction.round(Double.parseDouble(parametrosWeb.get(7).getParametroInicial().replace(",", "."))));
		setSaldo(getValortotal());
		criarParcela(numeroParcela);
		return this;
	}
	
	public void criarParcela(int numeroParcela) {
		setDesdobramento(numeroParcela + "/" + getIdformapagamento().getQuantidadeparcela());
		setDatavencimento(new Util().calcularDataVencimento(this, numeroParcela));
	}
	
	public void paga(double valor) {
		this.saldo -= valor;
	}
	
	public void atualiza(double valor) {
		paga(valor);
		if (this.saldo == 0)
			setDatapagamento(Calendar.getInstance());
	}
	
	public void estorna() {
		setDatapagamento(null);
	}
	
	public void cancela() {
		setDatapagamento(Calendar.getInstance());
		setSaldo(0.0);
	}
	
	public double calcula() {
		return (this.valortotal - this.valorjuros) + this.valordesconto;
	}
	
	public String getCreditoDebito() {
		if (getIddefinicao().getIdtipo().getDescricao().equals("CLIENTE"))
			return "C";
		else
			return "D";
	}
	
	@Override
	public Object clone() {
		// TODO Auto-generated method stub
		try {
			return super.clone();
		} catch (CloneNotSupportedException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}
	
}
