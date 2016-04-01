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

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "fin_extrato")
public class FinExtrato implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "iddocumentocusto", referencedColumnName = "id", nullable = false)
	private FinDocumentoCusto iddocumentocusto;
	@ManyToOne
	@JoinColumn(name = "idtipooperacao", referencedColumnName = "id", nullable = false)
	private SysTipoOperacao idtipooperacao;
	@NotNull
	@NotEmpty
	@Column(length = 1, columnDefinition = "char(1)", nullable = false)
	private String creditodebito;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valor;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public FinExtrato() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public FinExtrato(Long id) {
		// TODO Auto-generated constructor stub
		this();
		setId(id);
	}
	public FinExtrato(Long idDocumentoCusto, Integer idTipoOperacao, Double valor) {
		this();
		setIddocumentocusto(new FinDocumentoCusto(idDocumentoCusto));
		setIdtipooperacao(new SysTipoOperacao(idTipoOperacao));
		setValor(valor);
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public FinDocumentoCusto getIddocumentocusto() {
		return iddocumentocusto;
	}
	public void setIddocumentocusto(FinDocumentoCusto iddocumentocusto) {
		this.iddocumentocusto = iddocumentocusto;
	}
	public SysTipoOperacao getIdtipooperacao() {
		return idtipooperacao;
	}
	public void setIdtipooperacao(SysTipoOperacao idtipooperacao) {
		this.idtipooperacao = idtipooperacao;
	}
	public String getCreditodebito() {
		return creditodebito;
	}
	public void setCreditodebito(String creditodebito) {
		this.creditodebito = creditodebito;
	}
	public Double getValor() {
		return valor;
	}
	public void setValor(Double valor) {
		this.valor = valor;
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

	public FinExtrato criar(FinDocumentoCusto finDocumentoCusto, SysTipoOperacao sysTipoOperacao) {
		double valor = finDocumentoCusto.getValortotal() + finDocumentoCusto.getValordesconto() + finDocumentoCusto.getValorjuros();
		FinExtrato finExtrato = new FinExtrato(finDocumentoCusto.getId(), sysTipoOperacao.getId(), valor);
		if (new CreditoDebito().getCreditoDebito(sysTipoOperacao.getDescricao(), finDocumentoCusto.getIddocumento().getIdpessoa().getIdtipo().getDescricao()).equals("C"))
			finExtrato.setCreditodebito("C");
		else
			finExtrato.setCreditodebito("D");
		return finExtrato;
	}
	
}
