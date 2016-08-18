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
@Table(name = "adm_tipoacessomodulo", uniqueConstraints = {@UniqueConstraint(columnNames = {"idtipoacesso", "idmodulo"})})
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class AdmTipoAcessoModulo implements Serializable {
	
	@Id
	@SequenceGenerator(name = "adm_tipoacessomodulo", sequenceName = "sqadm_tipoacessomodulo", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "adm_tipoacessomodulo")
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "idtipoacesso", referencedColumnName = "id", nullable = false)
	private AdmTipoAcesso idtipoacesso;
	@ManyToOne
	@JoinColumn(name = "idmodulo", referencedColumnName = "id", nullable = false)
	private SysModulo idmodulo;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	
	public AdmTipoAcessoModulo() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
	}
	public AdmTipoAcessoModulo(Integer id) {
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
	public AdmTipoAcesso getIdtipoacesso() {
		return idtipoacesso;
	}
	public void setIdtipoacesso(AdmTipoAcesso idtipoacesso) {
		this.idtipoacesso = idtipoacesso;
	}
	public SysModulo getIdmodulo() {
		return idmodulo;
	}
	public void setIdmodulo(SysModulo idmodulo) {
		this.idmodulo = idmodulo;
	}
	public Calendar getDatacreate() {
		return datacreate;
	}
	public void setDatacreate(Calendar datacreate) {
		this.datacreate = datacreate;
	}

}
