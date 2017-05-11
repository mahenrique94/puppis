package br.com.puppis.model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
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
@Table(name = "adm_tipoacesso")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class AdmTipoAcesso implements Serializable {

	@Id
	@SequenceGenerator(name = "adm_tipoacesso", sequenceName = "sqadm_tipoacesso", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "adm_tipoacesso")
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
//	@Version
//	private Integer versao;
	
	public AdmTipoAcesso() {
		setDatacreate(getDatacreate() != null ? getDatacreate() : Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
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
