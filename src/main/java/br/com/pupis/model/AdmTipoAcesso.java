package br.com.pupis.model;

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
import javax.persistence.UniqueConstraint;
import javax.persistence.Version;
import javax.validation.constraints.AssertFalse;
import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "adm_tipoacesso")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class AdmTipoAcesso implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 30, message = "{minimo.0.maximo.30}")
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = false, unique = true)
	private String descricao;
	@Column(nullable = false)
	private Boolean salvar;
	@Column(nullable = false)
	private Boolean editar;
	@Column(nullable = false)
	private Boolean deletar;
	@Column(nullable = false)
	private Boolean listar;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
//	@Version
//	private Integer versao;
	
	public AdmTipoAcesso() {
		setDatacreate(getDatacreate() != null ? getDatacreate() : Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
		setDeletar(false);
		setEditar(false);
		setListar(false);
		setSalvar(false);
	}
	public AdmTipoAcesso(Integer id) {
		this();
		setId(id);
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Boolean getSalvar() {
		return salvar;
	}
	public void setSalvar(Boolean salvar) {
		this.salvar = salvar;
	}
	public Boolean getEditar() {
		return editar;
	}
	public void setEditar(Boolean editar) {
		this.editar = editar;
	}
	public Boolean getDeletar() {
		return deletar;
	}
	public void setDeletar(Boolean deletar) {
		this.deletar = deletar;
	}
	public Boolean getListar() {
		return listar;
	}
	public void setListar(Boolean listar) {
		this.listar = listar;
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
//	public Integer getVersao() {
//		return versao;
//	}
//	public void setVersao(Integer versao) {
//		this.versao = versao;
//	}
	
}
