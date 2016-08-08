package br.com.puppis.model;

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
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

@Entity
@Table(name = "com_nota")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class ComNota implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "idcomercio", referencedColumnName = "id", nullable = false)
	private AdmComercio idcomercio;
	@OneToOne
	@JoinColumn(name = "idusuario", referencedColumnName = "id", nullable = false)
	private AdmUsuario idusuario;
	@OneToOne
	@JoinColumn(name = "iddefinicao", referencedColumnName = "id", nullable = true)
	private PesDefinicao iddefinicao;
	@Temporal(TemporalType.DATE)
	@Column(nullable = true)
	private Calendar dataemissao;
	@Temporal(TemporalType.DATE)
	@Column(nullable = true)
	private Calendar dataatualizacao;
	@Temporal(TemporalType.DATE)
	@Column(nullable = true)
	private Calendar datacancelamento;
	@Range(min = 0, message = "{minimo.0}")
	@Column(nullable = true)
	private Integer numero;
	@Range(min = 0, message = "{minimo.0}")
	@Column(nullable = true)
	private Integer serie;
	@OneToOne
	@JoinColumn(name = "idtipooperacao", referencedColumnName = "id", nullable = false)
	private SysTipoOperacao idtipooperacao;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "idnota")
	private ComNotaCusto custo;
	@OneToMany
	@JoinColumn(name="idnota", referencedColumnName = "id", insertable = false, updatable = false)
	private List<ComNotaItem> itens;
	
	public ComNota() {
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
	public AdmComercio getIdcomercio() {
		return idcomercio;
	}
	public void setIdcomercio(AdmComercio idcomercio) {
		this.idcomercio = idcomercio;
	}
	public AdmUsuario getIdusuario() {
		return idusuario;
	}
	public void setIdusuario(AdmUsuario idusuario) {
		this.idusuario = idusuario;
	}
	public PesDefinicao getIddefinicao() {
		return iddefinicao;
	}
	public void setIddefinicao(PesDefinicao iddefinicao) {
		this.iddefinicao = iddefinicao;
	}
	public Calendar getDataemissao() {
		return dataemissao;
	}
	public void setDataemissao(Calendar dataemissao) {
		this.dataemissao = dataemissao;
	}
	public Calendar getDataatualizacao() {
		return dataatualizacao;
	}
	public void setDataatualizacao(Calendar dataatualizacao) {
		this.dataatualizacao = dataatualizacao;
	}
	public Calendar getDatacancelamento() {
		return datacancelamento;
	}
	public void setDatacancelamento(Calendar datacancelamento) {
		this.datacancelamento = datacancelamento;
	}
	public Integer getNumero() {
		return numero;
	}
	public void setNumero(Integer numero) {
		this.numero = numero;
	}
	public Integer getSerie() {
		return serie;
	}
	public void setSerie(Integer serie) {
		this.serie = serie;
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
	public Calendar getDataupdate() {
		return dataupdate;
	}
	public void setDataupdate(Calendar dataupdate) {
		this.dataupdate = dataupdate;
	}
	public ComNotaCusto getCusto() {
		return custo;
	}
	public void setCusto(ComNotaCusto custo) {
		this.custo = custo;
	}
	public List<ComNotaItem> getItens() {
		return itens;
	}
	public void setItens(List<ComNotaItem> itens) {
		this.itens = itens;
	}
	
}
