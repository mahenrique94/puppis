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
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "ps_movimentosaldo")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class PsMovimentoSaldo implements Serializable {

	@Id
	@SequenceGenerator(name = "ps_movimentosaldo", sequenceName = "sqps_movimentosaldo", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ps_movimentosaldo")
	private Integer id;
	@ManyToOne
	@JoinColumn(name  = "idmovimentoitem", referencedColumnName = "id", nullable = false)
	private PsMovimentoItem idmovimentoitem;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double quantidade;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double saldoanterior;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double saldoatual;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public PsMovimentoSaldo() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public PsMovimentoSaldo(Integer id) {
		// TODO Auto-generated constructor stub
		this();
		setId(id);
	}
	public PsMovimentoSaldo(PsMovimentoItem idMovimentoItem, double quantidade, double saldoAnterior, double saldoAtual) {
		this();
		setIdmovimentoitem(idMovimentoItem);
		setQuantidade(quantidade);
		setSaldoanterior(saldoAnterior);
		setSaldoatual(saldoAtual);
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public PsMovimentoItem getIdmovimentoitem() {
		return idmovimentoitem;
	}
	public void setIdmovimentoitem(PsMovimentoItem idmovimentoitem) {
		this.idmovimentoitem = idmovimentoitem;
	}
	public Double getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(Double quantidade) {
		this.quantidade = quantidade;
	}
	public Double getSaldoanterior() {
		return saldoanterior;
	}
	public void setSaldoanterior(Double saldoanterior) {
		this.saldoanterior = saldoanterior;
	}
	public Double getSaldoatual() {
		return saldoatual;
	}
	public void setSaldoatual(Double saldoatual) {
		this.saldoatual = saldoatual;
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
