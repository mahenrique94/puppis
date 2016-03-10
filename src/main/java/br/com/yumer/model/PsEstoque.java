package br.com.yumer.model;

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
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
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
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double quantidade;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double quantidademin;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double quantidadeven;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double quantidademax;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public PsEstoque() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
		setQuantidade(0.0);
		setQuantidadeven(0.0);
	}
	public PsEstoque(Long id) {
		this();
		setId(id);
	}
	public PsEstoque(Integer idGrupo, Integer idClasse, Long idProduto) {
		this();
		setIdgrupo(new PsGrupo(idGrupo));
		setIdclasse(new PsClasse(idClasse));
		setIdproduto(new PsProdutoServico(idProduto));
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
	public Double getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(Double quantidade) {
		this.quantidade = quantidade;
	}
	public Double getQuantidademin() {
		return quantidademin;
	}
	public void setQuantidademin(Double quantidademin) {
		this.quantidademin = quantidademin;
	}
	public Double getQuantidadeven() {
		return quantidadeven;
	}
	public void setQuantidadeven(Double quantidadeven) {
		this.quantidadeven = quantidadeven;
	}
	public Double getQuantidademax() {
		return quantidademax;
	}
	public void setQuantidademax(Double quantidademax) {
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
