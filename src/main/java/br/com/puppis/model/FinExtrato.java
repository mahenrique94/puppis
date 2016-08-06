package br.com.puppis.model;

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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

@Entity
@Table(name = "fin_extrato")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class FinExtrato implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Range(min = 0, message = "{minimo.0}")
	@Column(nullable = true)
	private Long numerodocumento;
	@ManyToOne
	@JoinColumn(name = "iddefinicao", referencedColumnName = "id", nullable = true)
	private PesDefinicao iddefinicao;
	@ManyToOne
	@JoinColumn(name = "idcontabancaria", referencedColumnName = "id", nullable = true)
	private FinContaBancaria idcontabancaria;
	@ManyToOne
	@JoinColumn(name = "idtipooperacao", referencedColumnName = "id", nullable = true)
	private SysTipoOperacao idtipooperacao;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valor;
	@NotNull
	@NotEmpty
	@Size(min = 1, max = 1, message = "{minimo.1.maximo.1}")
	@Pattern(regexp = "(C|D){1}")
	@Column(length = 1, columnDefinition = "char(1)", nullable = false)
	private String creditodebito;
	@Pattern(regexp = "[aA-zZ0-9\"\'(){}*,.\\/\\s-]*")
	@Column(columnDefinition = "text", nullable = true)
	private String historico;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	
	public FinExtrato() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
	}
	public FinExtrato(Long id) {
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
	public Long getNumerodocumento() {
		return numerodocumento;
	}
	public void setNumerodocumento(Long numerodocumento) {
		this.numerodocumento = numerodocumento;
	}
	public PesDefinicao getIddefinicao() {
		return iddefinicao;
	}
	public void setIddefinicao(PesDefinicao iddefinicao) {
		this.iddefinicao = iddefinicao;
	}
	public FinContaBancaria getIdcontabancaria() {
		return idcontabancaria;
	}
	public void setIdcontabancaria(FinContaBancaria idcontabancaria) {
		this.idcontabancaria = idcontabancaria;
	}
	public SysTipoOperacao getIdtipooperacao() {
		return idtipooperacao;
	}
	public void setIdtipooperacao(SysTipoOperacao idtipooperacao) {
		this.idtipooperacao = idtipooperacao;
	}
	public Double getValor() {
		return valor;
	}
	public void setValor(Double valor) {
		this.valor = valor;
	}
	public String getCreditodebito() {
		return creditodebito;
	}
	public void setCreditodebito(String creditodebito) {
		this.creditodebito = creditodebito;
	}
	public String getHistorico() {
		return historico;
	}
	public void setHistorico(String historico) {
		this.historico = historico;
	}
	public Calendar getDatacreate() {
		return datacreate;
	}
	public void setDatacreate(Calendar datacreate) {
		this.datacreate = datacreate;
	}
	
	public static FinExtrato cria(FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao, double valor, String historico) {
		FinExtrato finExtrato = new FinExtrato();
		finExtrato.setNumerodocumento(finDocumento.getNumero());
		finExtrato.setIddefinicao(finDocumento.getIddefinicao());
		finExtrato.setIdcontabancaria(finDocumento.getIdcontabancaria());
		finExtrato.setIdtipooperacao(sysTipoOperacao);
		finExtrato.setCreditodebito(CreditoDebito.getCreditoDebito(sysTipoOperacao.getDescricao(), finDocumento.getIddefinicao().getIdtipo().getDescricao()));
		finExtrato.setValor(valor);
		finExtrato.setHistorico(historico);
		return finExtrato;
	}
	
}
