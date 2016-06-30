package br.com.hebi.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "adm_comercio")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class AdmComercio implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 60, message = "{minimo.0.maximo.60}")
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = false, unique = true)
	private String nomerazaosocial;
	@Size(min = 0, max = 60, message = "{minimo.0.maximo.60}")
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = true, unique = true)
	private String nomefantasia;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "idcomercio")
	private AdmEndereco endereco;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "idcomercio")
	private AdmDocumento documento;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "idcomercio")
	private AdmContato contato;
	@Column(nullable = false)
	private Boolean inativo;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public AdmComercio() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
		setInativo(false);
	}
	public AdmComercio(Integer id) {
		this();
		setId(id);
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNomerazaosocial() {
		return nomerazaosocial;
	}
	public void setNomerazaosocial(String nomerazaosocial) {
		this.nomerazaosocial = nomerazaosocial;
	}
	public String getNomefantasia() {
		return nomefantasia;
	}
	public void setNomefantasia(String nomefantasia) {
		this.nomefantasia = nomefantasia;
	}
	public AdmEndereco getEndereco() {
		return endereco;
	}
	public void setEndereco(AdmEndereco endereco) {
		this.endereco = endereco;
	}
	public AdmDocumento getDocumento() {
		return documento;
	}
	public void setDocumento(AdmDocumento documento) {
		this.documento = documento;
	}
	public AdmContato getContato() {
		return contato;
	}
	public void setContato(AdmContato contato) {
		this.contato = contato;
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
