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
@Table(name = "tbl_precopessoa", uniqueConstraints = {@UniqueConstraint(columnNames = {"idpreco", "iddefinicao"})})
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class TblPrecoPessoa implements Serializable {
	
	@Id
	@SequenceGenerator(name = "tbl_precopessoa", sequenceName = "sqtbl_precopessoa", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "tbl_precopessoa")
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "idpreco", referencedColumnName = "id", nullable = false)
	private TblPreco idpreco;
	@ManyToOne
	@JoinColumn(name = "iddefinicao", referencedColumnName = "id", nullable = false)
	private PesDefinicao iddefinicao;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public TblPrecoPessoa() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public TblPrecoPessoa(Integer id) {
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
	public TblPreco getIdpreco() {
		return idpreco;
	}
	public void setIdpreco(TblPreco idpreco) {
		this.idpreco = idpreco;
	}
	public PesDefinicao getIddefinicao() {
		return iddefinicao;
	}
	public void setIddefinicao(PesDefinicao iddefinicao) {
		this.iddefinicao = iddefinicao;
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
