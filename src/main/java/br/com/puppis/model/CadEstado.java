package br.com.puppis.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "cad_estado")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
public class CadEstado implements Serializable {

	@Id
	private Integer id;
	@NotNull
	@NotEmpty
	@Size(min = 2, max = 2, message = "{minimo.2.maximo.2}")
	@Column(length = 2, columnDefinition = "char(2)", nullable = false, unique = true)
	private String uf;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 60, message = "{minimo.0.maximo.60}")
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = false, unique = true)
	private String descricao;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 60, message = "{minimo.0.maximo.60}")
	@OneToOne
	@JoinColumn(name = "idpais", referencedColumnName = "id", nullable = false)
	private CadPais idpais;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public CadEstado() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public CadEstado(Integer id) {
		this();
		setId(id);
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public CadPais getIdpais() {
		return idpais;
	}
	public void setIdpais(CadPais idpais) {
		this.idpais = idpais;
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
