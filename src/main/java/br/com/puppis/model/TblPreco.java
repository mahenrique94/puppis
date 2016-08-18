package br.com.puppis.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "tbl_preco")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class TblPreco implements Serializable {
	
	@Id
	@SequenceGenerator(name = "tbl_preco", sequenceName = "sqtbl_preco", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "tbl_preco")
	private Integer id;
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
	
	public TblPreco() {
		// TODO Auto-generated constructor stub
		setInativo(false);
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public TblPreco(Integer id) {
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
	public Boolean getInativo() {
		return inativo;
	}
	public void setInativo(Boolean inativo) {
		this.inativo = inativo;
	}
	public Calendar getDatavigenciainicial() {
		return datavigenciainicial;
	}
	public void setDatavigenciainicial(Calendar datavigenciainicial) {
		this.datavigenciainicial = datavigenciainicial;
	}
	public Calendar getDatavigenciafinal() {
		return datavigenciafinal;
	}
	public void setDatavigenciafinal(Calendar datavigenciafinal) {
		this.datavigenciafinal = datavigenciafinal;
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
