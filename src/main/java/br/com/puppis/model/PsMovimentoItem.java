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

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "ps_movimentoitem", uniqueConstraints = {@UniqueConstraint(columnNames = {"idmovimento", "idprodutoservico"})})
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class PsMovimentoItem implements Serializable {
	
	@Id
	@SequenceGenerator(name = "ps_movimentoitem", sequenceName = "sqps_movimentoitem", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ps_movimentoitem")
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "idmovimento", referencedColumnName = "id", nullable = false)
	private PsMovimento idmovimento;
	@ManyToOne
	@JoinColumn(name = "idprodutoservico", referencedColumnName = "id", nullable = false)
	private PsProdutoServico idprodutoservico;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public PsMovimentoItem() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public PsMovimentoItem(Integer id) {
		// TODO Auto-generated constructor stub
		this();
		setId(id);
	}
	public PsMovimentoItem(PsMovimento idMovimento, PsProdutoServico idProdutoServico) {
		this();
		setIdmovimento(idMovimento);
		setIdprodutoservico(idProdutoServico);
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public PsMovimento getIdmovimento() {
		return idmovimento;
	}
	public void setIdmovimento(PsMovimento idmovimento) {
		this.idmovimento = idmovimento;
	}
	public PsProdutoServico getIdprodutoservico() {
		return idprodutoservico;
	}
	public void setIdprodutoservico(PsProdutoServico idprodutoservico) {
		this.idprodutoservico = idprodutoservico;
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
