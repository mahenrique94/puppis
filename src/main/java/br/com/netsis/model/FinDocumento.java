package br.com.netsis.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

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
	@JoinColumn(name = "idpessoa", referencedColumnName = "id", nullable = false)
	private PesPessoa idpessoa;
	@ManyToOne
	@JoinColumn(name = "idtipooperacao", referencedColumnName = "id", nullable = false)
	private SysTipoOperacao idtipooperacao;
	@Min(0)
	@Column(nullable = false)
	private Long numero;
	@Min(0)
	@Column(nullable = true)
	private Integer serie;
	@Size(min = 0, max = 120, message = "{minimo.0.maximo.120}")
	@Column(length = 120, columnDefinition = "varchar(120)", nullable = true)
	private String codigobarra;
	@ManyToOne
	@JoinColumn(name = "idtipodocumento", referencedColumnName = "id", nullable = false)
	private FinTipoDocumento idtipodocumento;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataemissao;
	@OneToOne
	@JoinColumn(name = "idhistorico", referencedColumnName = "id", nullable = true)
	private FinHistorico idhistorico;
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
	public PesPessoa getIdpessoa() {
		return idpessoa;
	}
	public void setIdpessoa(PesPessoa idpessoa) {
		this.idpessoa = idpessoa;
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

}
