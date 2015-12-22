package br.com.netsis.model;

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

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "ps_produtoservico", uniqueConstraints = {@UniqueConstraint(columnNames = {"idgrupo", "idclasse", "id"})})
public class PsProdutoServico implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "idgrupo", referencedColumnName = "id", nullable = false)
	private PsGrupo idgrupo;
	@ManyToOne
	@JoinColumn(name = "idclasse", referencedColumnName = "id", nullable = false)
	private PsClasse idclasse;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 120, message = "{minimo.0.maximo.120}")
	@Column(length = 120, columnDefinition = "varchar(120)", nullable = false, unique = true)
	private String descricao;
	@NotNull
	@NotEmpty
	@Size(min = 1, max = 1, message = "{minimo.1.maximo.1}")
	@Column(length = 1, columnDefinition = "char(1)", nullable = false)
	private String aceitadesconto;
	@OneToOne
	@JoinColumn(name = "idtipo", referencedColumnName = "id", nullable = false)
	private PsTipo idtipo;
	@ManyToOne
	@JoinColumn(name = "idunidademedida", referencedColumnName = "id", nullable = false)
	private PsUnidadeMedida idunidademedida;
	@Size(min = 1, max = 1, message = "{minimo.1.maximo.1}")
	@Column(length = 1, columnDefinition = "char(1)", nullable = false)
	private String inativo;
	@Size(min = 0, max = 30, message = "{minimo.0.maximo.30}")
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = true)
	private String marca;
	@Size(min = 0, max = 120, message = "{minimo.0.maximo.120}")
	@Column(length = 120, columnDefinition = "varchar(120)", nullable = true, unique = true)
	private String codigobarra;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "idproduto")
	private PsEstoque estoque;
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "idproduto")
	private PsCusto custo;
	
	public PsProdutoServico() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
		setInativo("F");
		setAceitadesconto("F");
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
	public PsGrupo getIdgrupo() {
		return idgrupo;
	}
	public void setIdgrupo(PsGrupo idgrupo) {
		this.idgrupo = idgrupo;
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
	public String getAceitadesconto() {
		return aceitadesconto;
	}
	public void setAceitadesconto(String aceitadesconto) {
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
	public String getInativo() {
		return inativo;
	}
	public void setInativo(String inativo) {
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
