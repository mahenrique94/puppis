package br.com.netsis.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Range;

@Entity
@Table(name = "adm_contato")
public class AdmContato implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@OneToOne
	@JoinColumn(name = "idcomercio", referencedColumnName = "id", nullable = false, unique = true)
	private AdmComercio idcomercio;
	@Range(min = 0, max = 100, message = "{ddd}")
	@Column(nullable = true)
	private Integer ddd;
	@Size(min = 0, max = 9, message = "{telefone}")
	@Column(length = 10, columnDefinition = "varchar(10)", nullable = true)
	private String telefone;
	@Email
	@Size(min = 0, max = 255, message = "{email}")
	@Column(length = 255, columnDefinition = "varchar(255)", nullable = true)
	private String email;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public AdmContato() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public AdmContato(Integer id) {
		this();
		setId(id);
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public AdmComercio getIdcomercio() {
		return idcomercio;
	}
	public void setIdcomercio(AdmComercio idcomercio) {
		this.idcomercio = idcomercio;
	}
	public Integer getDdd() {
		return ddd;
	}
	public void setDdd(Integer ddd) {
		this.ddd = ddd;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
