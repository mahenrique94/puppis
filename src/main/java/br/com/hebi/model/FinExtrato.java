package br.com.hebi.model;

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
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "fin_extrato")
public class FinExtrato implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "iddocumento", referencedColumnName = "id", nullable = false)
	private FinDocumento iddocumento;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valor;
	@NotNull
	@NotEmpty
	@Size(min = 1, max = 1, message = "{minimo.1.maximo.1}")
	@Column(length = 1, columnDefinition = "char(1)", nullable = false)
	private String creditodebito;
	@ManyToOne
	@JoinColumn(name = "idtipooperacao", referencedColumnName = "id", nullable = true)
	private SysTipoOperacao idtipooperacao;
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
	public FinExtrato(FinDocumento finDocumento) {
		this();
		setIddocumento(finDocumento);
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public FinDocumento getIddocumento() {
		return iddocumento;
	}
	public void setIddocumento(FinDocumento iddocumento) {
		this.iddocumento = iddocumento;
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
	public SysTipoOperacao getIdtipooperacao() {
		return idtipooperacao;
	}
	public void setIdtipooperacao(SysTipoOperacao idtipooperacao) {
		this.idtipooperacao = idtipooperacao;
	}
	public Calendar getDatacreate() {
		return datacreate;
	}
	public void setDatacreate(Calendar datacreate) {
		this.datacreate = datacreate;
	}
	
	public static FinExtrato criaExtratoDeBaixa(FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao, double valor) {
		FinExtrato finExtrato = new FinExtrato(finDocumento);
		finExtrato.setIdtipooperacao(sysTipoOperacao);
		finExtrato.setCreditodebito(CreditoDebito.getCreditoDebito(sysTipoOperacao.getDescricao(), finDocumento.getIddefinicao().getIdtipo().getDescricao()));
		finExtrato.setValor(valor);
		return finExtrato;
	}
	
}
