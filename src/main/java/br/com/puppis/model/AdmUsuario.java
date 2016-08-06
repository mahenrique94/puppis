package br.com.puppis.model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "adm_usuario")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class AdmUsuario implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 60, message = "{minimo.0.maximo.60}")
	@Pattern(regexp = "^([\\dA-Z]+(\\s[\\dA-Z]+)*)$")
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = false, unique = true)
	private String nome;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 20, message = "{minimo.0.maximo.20}")
	@Pattern(regexp = "^([\\dA-Z]*)$")
	@Column(length = 20, columnDefinition = "varchar(20)", nullable = false, unique = true)
	private String usuario;
	@NotNull
	@NotEmpty
	@Size(min = 8, max = 8, message = "{minimo.8.maximo.8}")
	@Pattern(regexp = "^([\\dA-Z]+([\\dA-Z]+)*){8,8}$")
	@Column(length = 8, columnDefinition = "varchar(8)", nullable = false)
	private String senha;
	@ManyToOne
	@JoinColumn(name = "idgrupo", referencedColumnName = "id", nullable = false)
	private AdmGrupo idgrupo;
	@Column(nullable = false)
	private Boolean inativo;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	@OneToMany
	@JoinColumn(name = "idusuario", referencedColumnName = "id", insertable = false, updatable = false)
	private Set<AdmUsuarioComercio> comercios;
	
	public AdmUsuario() {
		setInativo(false);
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public AdmUsuario(Integer id) {
		this();
		setId(id);
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public AdmGrupo getIdgrupo() {
		return idgrupo;
	}
	public void setIdgrupo(AdmGrupo idgrupo) {
		this.idgrupo = idgrupo;
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
	public Set<AdmUsuarioComercio> getComercios() {
		return Collections.unmodifiableSet(comercios);
	}
	
	public boolean isAdministrador(AdmUsuario admUsuario) {
		if (admUsuario.getIdgrupo().getDescricao().equals("ADMINISTRADOR"))
			return true;
		else
			return false;
	}
	
}