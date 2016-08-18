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
import javax.persistence.TemporalType;
import javax.persistence.Temporal;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "adm_usuariocomercio", uniqueConstraints = {@UniqueConstraint(columnNames = {"idusuario", "idcomercio"})})
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class AdmUsuarioComercio implements Serializable {

	@Id
	@SequenceGenerator(name = "adm_usuariocomercio", sequenceName = "sqadm_usuariocomercio", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "adm_usuariocomercio")
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "idusuario", referencedColumnName = "id", nullable = false)
	private AdmUsuario idusuario;
	@ManyToOne
	@JoinColumn(name  = "idcomercio", referencedColumnName = "id", nullable = false)
	private AdmComercio idcomercio;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	
	public AdmUsuarioComercio() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
	}
	public AdmUsuarioComercio(Integer id) {
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
	public AdmUsuario getIdusuario() {
		return idusuario;
	}
	public void setIdusuario(AdmUsuario idusuario) {
		this.idusuario = idusuario;
	}
	public AdmComercio getIdcomercio() {
		return idcomercio;
	}
	public void setIdcomercio(AdmComercio idcomercio) {
		this.idcomercio = idcomercio;
	}
	public Calendar getDatacreate() {
		return datacreate;
	}
	public void setDatacreate(Calendar datacreate) {
		this.datacreate = datacreate;
	}
	
}
