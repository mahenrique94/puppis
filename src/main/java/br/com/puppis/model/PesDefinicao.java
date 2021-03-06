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

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "pes_definicao")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class PesDefinicao implements Serializable {
	
	@Id
	@SequenceGenerator(name = "pes_definicao", sequenceName = "sqpes_definicao", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "pes_definicao")
	private Long id;
	@ManyToOne
	@JoinColumn(name = "idpessoa", referencedColumnName = "id", nullable = false)
	private PesPessoa idpessoa;
	@ManyToOne
	@JoinColumn(name = "idtipo", referencedColumnName = "id", nullable = false)
	private PesTipo idtipo;
	@Column(nullable = false)
	private Boolean inativo;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public PesDefinicao() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
		setInativo(false);
	}
	public PesDefinicao(Long id) {
		// TODO Auto-generated constructor stub
		this();
		setId(id);
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public PesPessoa getIdpessoa() {
		return idpessoa;
	}
	public void setIdpessoa(PesPessoa idpessoa) {
		this.idpessoa = idpessoa;
	}
	public PesTipo getIdtipo() {
		return idtipo;
	}
	public void setIdtipo(PesTipo idtipo) {
		this.idtipo = idtipo;
	}
	public Boolean getInativo() {
		return inativo;
	}
	public void setInativo(Boolean inativo) {
		this.inativo = inativo;
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
