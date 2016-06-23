package br.com.hebi.model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
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
@Table(name = "sys_tipooperacao")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
public class SysTipoOperacao implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@NotNull
	@NotEmpty
	@Size(min = 1, max = 1, message = "{minimo.1.maximo.1}")
	@Column(length = 1, columnDefinition = "char(1)", nullable = false)
	private String tipo;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 30, message = "{minimo.0.maximo.30}")
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = false, unique = true)
	private String descricao;
	@ManyToOne
	@JoinColumn(name = "idmodulo", referencedColumnName = "id", nullable = false)
	private SysModulo idmodulo;
	@Size(min = 0, max = 30, message = "{minimo.0.maximo.30}")
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = true)
	private String gruporesumo;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public SysTipoOperacao() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public SysTipoOperacao(Integer id) {
		this();
		setId(id);
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getGruporesumo() {
		return gruporesumo;
	}
	public void setGruporesumo(String gruporesumo) {
		this.gruporesumo = gruporesumo;
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
	public SysModulo getIdmodulo() {
		return idmodulo;
	}
	public void setIdmodulo(SysModulo idmodulo) {
		this.idmodulo = idmodulo;
	}
	
}
