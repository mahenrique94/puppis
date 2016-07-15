package br.com.puppis.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "ps_produtoservico")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class PsProdutoServico implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "idclasse", referencedColumnName = "id", nullable = false)
	private PsClasse idclasse;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 120, message = "{minimo.0.maximo.120}")
	@Column(length = 120, columnDefinition = "varchar(120)", nullable = false, unique = true)
	private String descricao;
	@Column(nullable = false)
	private Boolean aceitadesconto;
	@OneToOne
	@JoinColumn(name = "idtipo", referencedColumnName = "id", nullable = false)
	private PsTipo idtipo;
	@ManyToOne
	@JoinColumn(name = "idunidademedida", referencedColumnName = "id", nullable = false)
	private PsUnidadeMedida idunidademedida;
	@Column(nullable = false)
	private Boolean inativo;
	@Size(min = 0, max = 30, message = "{minimo.0.maximo.30}")
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = true)
	private String marca;
	@Size(min = 0, max = 120, message = "{minimo.0.maximo.120}")
	@Column(length = 120, columnDefinition = "varchar(120)", nullable = true, unique = true)
	private String codigobarra;
	@Column(columnDefinition = "text", nullable = true)
	private String observacao;
	@Size(min = 0, max = 255, message = "{minimo.0.maximo.255}")
	@Column(length = 255, columnDefinition = "varchar(255)", nullable = true)
	private String pathimagem;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "idprodutoservico")
	private PsEstoque estoque;
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "idprodutoservico")
	private PsCusto custo;
	
	public PsProdutoServico() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
		setInativo(false);
		setAceitadesconto(true);
	}
	public PsProdutoServico(Long id) {
		this();
		setId(id);
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public PsClasse getIdclasse() {
		return idclasse;
	}
	public void setIdclasse(PsClasse idclasse) {
		this.idclasse = idclasse;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Boolean getAceitadesconto() {
		return aceitadesconto;
	}
	public void setAceitadesconto(Boolean aceitadesconto) {
		this.aceitadesconto = aceitadesconto;
	}
	public PsTipo getIdtipo() {
		return idtipo;
	}
	public void setIdtipo(PsTipo idtipo) {
		this.idtipo = idtipo;
	}
	public PsUnidadeMedida getIdunidademedida() {
		return idunidademedida;
	}
	public void setIdunidademedida(PsUnidadeMedida idunidademedida) {
		this.idunidademedida = idunidademedida;
	}
	public Boolean getInativo() {
		return inativo;
	}
	public void setInativo(Boolean inativo) {
		this.inativo = inativo;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getCodigobarra() {
		return codigobarra;
	}
	public void setCodigobarra(String codigobarra) {
		this.codigobarra = codigobarra;
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
	public PsCusto getCusto() {
		return custo;
	}
	public void setCusto(PsCusto custo) {
		this.custo = custo;
	}
	public PsEstoque getEstoque() {
		return estoque;
	}
	public void setEstoque(PsEstoque estoque) {
		this.estoque = estoque;
	}
	
}
