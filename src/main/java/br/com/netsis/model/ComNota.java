package br.com.netsis.model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "com_nota")
public class ComNota implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idfuncionario", referencedColumnName = "id", nullable = false)
	private AdmUsuario idfuncionario;
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idcliente", referencedColumnName = "id", nullable = true)
	private PesPessoa idcliente;
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idfornecedor", referencedColumnName = "id", nullable = true)
	private PesPessoa idfornecedor;
	@Temporal(TemporalType.DATE)
	@Column(nullable = true)
	private Calendar dataentrada;
	@Temporal(TemporalType.DATE)
	@Column(nullable = true)
	private Calendar dataemissao;
	@Min(0)
	@Column(nullable = true)
	private Integer numeronota;
	@Min(0)
	@Column(nullable = true)
	private Integer serienota;
	@Column(nullable = false)
	private Boolean atualizada;
	@Column(nullable = false)
	private Boolean cancelada;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	@OneToOne
	@JoinColumn(name = "idtipooperacao", referencedColumnName = "id", nullable = false)
	private SysTipoOperacao idtipooperacao;
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "idnota")
	private ComNotaCusto custo;
	@OneToMany
	@JoinColumn(name="idnota", referencedColumnName = "id", insertable = false, updatable = false)
	private List<ComNotaItens> itens;
	
	public ComNota() {
		setAtualizada(false);
		setCancelada(false);
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public ComNota(Long id) {
		this();
		setId(id);
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public AdmUsuario getIdfuncionario() {
		return idfuncionario;
	}
	public void setIdfuncionario(AdmUsuario idfuncionario) {
		this.idfuncionario = idfuncionario;
	}
	public PesPessoa getIdcliente() {
		return idcliente;
	}
	public void setIdcliente(PesPessoa idcliente) {
		this.idcliente = idcliente;
	}
	public PesPessoa getIdfornecedor() {
		return idfornecedor;
	}
	public void setIdfornecedor(PesPessoa idfornecedor) {
		this.idfornecedor = idfornecedor;
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
	public Calendar getDataentrada() {
		return dataentrada;
	}
	public void setDataentrada(Calendar dataentrada) {
		this.dataentrada = dataentrada;
	}
	public Calendar getDataemissao() {
		return dataemissao;
	}
	public void setDataemissao(Calendar dataemissao) {
		this.dataemissao = dataemissao;
	}
	public Integer getNumeronota() {
		return numeronota;
	}
	public void setNumeronota(Integer numeronota) {
		this.numeronota = numeronota;
	}
	public Integer getSerienota() {
		return serienota;
	}
	public void setSerienota(Integer serienota) {
		this.serienota = serienota;
	}
	public Boolean getAtualizada() {
		return atualizada;
	}
	public void setAtualizada(Boolean atualizada) {
		this.atualizada = atualizada;
	}
	public Boolean getCancelada() {
		return cancelada;
	}
	public void setCancelada(Boolean cancelada) {
		this.cancelada = cancelada;
	}
	public SysTipoOperacao getIdtipooperacao() {
		return idtipooperacao;
	}
	public void setIdtipooperacao(SysTipoOperacao idtipooperacao) {
		this.idtipooperacao = idtipooperacao;
	}
	public ComNotaCusto getCusto() {
		return custo;
	}
	public void setCusto(ComNotaCusto custo) {
		this.custo = custo;
	}
	public List<ComNotaItens> getItens() {
		return itens;
	}
	public void setItens(List<ComNotaItens> itens) {
		this.itens = itens;
	}
	
}
