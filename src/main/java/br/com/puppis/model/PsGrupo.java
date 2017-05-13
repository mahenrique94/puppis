package br.com.puppis.model;

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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "ps_grupo")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class PsGrupo implements Serializable{
	
	@Id
	@SequenceGenerator(name = "ps_grupo", sequenceName = "sqps_grupo", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ps_grupo")
	private Integer id;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 30, message = "{minimo.0.maximo.30}")
	@Pattern(regexp = "^(([A-Z\\d])+(\\s[A-Z\\d]+)*)$", message = "{pattern.espacoLetraNumero}")
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = false, unique = true)
	private String descricao;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public PsGrupo() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public PsGrupo(Integer id) {
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
