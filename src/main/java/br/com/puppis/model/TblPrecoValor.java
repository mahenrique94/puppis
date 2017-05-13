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
@Table(name = "tbl_precovalor")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class TblPrecoValor implements Serializable {
	
	@Id
	@SequenceGenerator(name = "tbl_precovalor", sequenceName = "sqtbl_precovalor", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "tbl_precovalor")
	private Integer id;	
	@ManyToOne
	@JoinColumn(name = "idtabelaprecopessoa", referencedColumnName = "id", nullable = false)
	private TblPrecoPessoa idtabelaprecopessoa;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valor;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valorpromocao;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valordesconto;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valorparcelamento;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valorfaturado;
	@Column(nullable = false)
	private Boolean inativo;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar datavigenciainicial;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar datavigenciafinal;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public TblPrecoValor() {
		// TODO Auto-generated constructor stub
		setValordesconto(0.0);
		setValorfaturado(0.0);
		setValorparcelamento(0.0);
		setValorpromocao(0.0);
		setInativo(false);
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public TblPrecoValor(Integer id) {
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
	public TblPrecoPessoa getIdtabelaprecopessoa() {
		return idtabelaprecopessoa;
	}
	public void setIdtabelaprecopessoa(TblPrecoPessoa idtabelaprecopessoa) {
		this.idtabelaprecopessoa = idtabelaprecopessoa;
	}
	public Double getValor() {
		return valor;
	}
	public void setValor(Double valor) {
		this.valor = valor;
	}
	public Double getValorpromocao() {
		return valorpromocao;
	}
	public void setValorpromocao(Double valorpromocao) {
		this.valorpromocao = valorpromocao;
	}
	public Double getValordesconto() {
		return valordesconto;
	}
	public void setValordesconto(Double valordesconto) {
		this.valordesconto = valordesconto;
	}
	public Double getValorparcelamento() {
		return valorparcelamento;
	}
	public void setValorparcelamento(Double valorparcelamento) {
		this.valorparcelamento = valorparcelamento;
	}
	public Double getValorfaturado() {
		return valorfaturado;
	}
	public void setValorfaturado(Double valorfaturado) {
		this.valorfaturado = valorfaturado;
	}
	public Boolean getInativo() {
		return inativo;
	}
	public void setInativo(Boolean inativo) {
		this.inativo = inativo;
	}
	public Calendar getDatavigenciafinal() {
		return datavigenciafinal;
	}
	public void setDatavigenciafinal(Calendar datavigenciafinal) {
		this.datavigenciafinal = datavigenciafinal;
	}
	public Calendar getDatavigenciainicial() {
		return datavigenciainicial;
	}
	public void setDatavigenciainicial(Calendar datavigenciainicial) {
		this.datavigenciainicial = datavigenciainicial;
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
