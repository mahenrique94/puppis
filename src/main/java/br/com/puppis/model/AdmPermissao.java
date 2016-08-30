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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "adm_permissao")
public class AdmPermissao implements Serializable {
	
	@Id
	@SequenceGenerator(name = "adm_permissao", sequenceName = "sqadm_permissao", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "adm_permissao")
	private Integer id;
	@ManyToOne
	@JoinColumn(name  = "idusuario", referencedColumnName = "id", nullable = false)
	private AdmUsuario idusuario;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 30, message = "{minimo.0.maximo.30}")
	@Pattern(regexp = "^([A-Z]*)$")
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = false)
	private String tabela;
	@Column(nullable = false)
	private Boolean formulario;
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
	
	public AdmPermissao() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public AdmPermissao(Integer id) {
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
	public String getTabela() {
		return tabela;
	}
	public void setTabela(String tabela) {
		this.tabela = tabela;
	}
	public Boolean getFormulario() {
		return formulario;
	}
	public void setFormulario(Boolean formulario) {
		this.formulario = formulario;
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

}
