package br.com.netsis.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Min;

@Entity
@Table(name = "ps_estoque", uniqueConstraints = {@UniqueConstraint(columnNames = {"idgrupo", "idclasse", "idproduto"})})
public class PsEstoque implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@OneToOne
	@JoinColumn(name = "idgrupo", referencedColumnName = "id", nullable = false)
	private PsGrupo idgrupo;
	@OneToOne
	@JoinColumn(name = "idclasse", referencedColumnName = "id", nullable = false)
	private PsClasse idclasse;
	@OneToOne
	@JoinColumn(name = "idproduto", referencedColumnName = "id", nullable = false)
	private PsProdutoServico idproduto;
	@Column(nullable = false)
	private Integer quantidade;
	@Min(0)
	@Column(nullable = true)
	private Integer quantidademin;
	@Min(0)
	@Column(nullable = true)
	private Integer quantidadeven;
	@Min(0)
	@Column(nullable = true)
	private Integer quantidademax;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public PsEstoque() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
		setQuantidade(0);
	}
	public PsEstoque(Long id) {
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
	public PsProdutoServico getIdproduto() {
		return idproduto;
	}
	public void setIdproduto(PsProdutoServico idproduto) {
		this.idproduto = idproduto;
	}
	public Integer getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}
	public Integer getQuantidademin() {
		return quantidademin;
	}
	public void setQuantidademin(Integer quantidademin) {
		this.quantidademin = quantidademin;
	}
	public Integer getQuantidadeven() {
		return quantidadeven;
	}
	public void setQuantidadeven(Integer quantidadeven) {
		this.quantidadeven = quantidadeven;
	}
	public Integer getQuantidademax() {
		return quantidademax;
	}
	public void setQuantidademax(Integer quantidademax) {
		this.quantidademax = quantidademax;
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
