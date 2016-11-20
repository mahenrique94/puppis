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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;

@Entity
@Table(name = "ps_composicao", uniqueConstraints = {@UniqueConstraint(columnNames = {"idprodutoservico", "idcomposicao"})})
public class PsComposicao implements Serializable {
	
	@Id
	@SequenceGenerator(name = "ps_composicao", sequenceName = "sqps_composicao", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ps_composicao")
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "idprodutoservico", referencedColumnName = "id", nullable = false)
	private PsProdutoServico idprodutoservico;
	@ManyToOne
	@JoinColumn(name = "idcomposicao", referencedColumnName = "id", nullable = false)
	private PsProdutoServico idcomposicao;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private double quantidade;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable =  false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable =  false)
	private Calendar dataupdate;
	
	public PsComposicao() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public PsComposicao(Integer id) {
		// TODO Auto-generated constructor stub
		this();
		setId(id);
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public PsProdutoServico getIdprodutoservico() {
		return idprodutoservico;
	}
	public void setIdprodutoservico(PsProdutoServico idprodutoservico) {
		this.idprodutoservico = idprodutoservico;
	}
	public PsProdutoServico getIdcomposicao() {
		return idcomposicao;
	}
	public void setIdcomposicao(PsProdutoServico idcomposicao) {
		this.idcomposicao = idcomposicao;
	}
	public double getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(double quantidade) {
		this.quantidade = quantidade;
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
