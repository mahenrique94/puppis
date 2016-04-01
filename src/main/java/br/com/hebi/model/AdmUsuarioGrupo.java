package br.com.hebi.model;

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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "adm_usuariogrupo")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class AdmUsuarioGrupo implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@OneToOne
	@JoinColumn(name = "idtipoacesso", referencedColumnName = "id", nullable = false)
	private AdmUsuarioTipoAcesso idtipoacesso;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 30, message = "{minimo.0.maximo.30}")
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = false, unique = true)
	private String descricao;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public AdmUsuarioGrupo() {
		// TODO Auto-generated constructor stub
		setDatacreate(getDatacreate() != null ? getDatacreate() : Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public AdmUsuarioGrupo(Integer id) {
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
	public AdmUsuarioTipoAcesso getIdtipoacesso() {
		return idtipoacesso;
	}
	public void setIdtipoacesso(AdmUsuarioTipoAcesso idtipoacesso) {
		this.idtipoacesso = idtipoacesso;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
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
