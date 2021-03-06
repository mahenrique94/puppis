package br.com.puppis.model;

import java.io.Serializable;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
@Table(name = "pes_pessoa")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class PesPessoa implements Serializable {

	@Id
	@SequenceGenerator(name = "pes_pessoa", sequenceName = "sqpes_pessoa", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "pes_pessoa")
	private Long id;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 60, message = "{minimo.0.maximo.60}")
	@Pattern(regexp = "^(([A-Z\\d\\.\\/\\-])+(\\s[A-Z\\d\\.\\/\\-]+)*)$", message = "{pattern.espacoLetraNumeroBarraPontoTraco}")
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = false, unique = true)
	private String nomerazaosocial;
	@Size(min = 0, max = 60, message = "{minimo.0.maximo.60}")
	@Pattern(regexp = "^(([A-Z\\d\\.\\/\\-])+(\\s[A-Z\\d\\.\\/\\-]+)*)$", message = "{pattern.espacoLetraNumeroBarraPontoTraco}")
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = true, unique = true)
	private String nomefantasia;
	@Size(min = 0, max = 30, message = "{minimo.0.maximo.30}")
	@Pattern(regexp = "^(([A-Z\\d])+(\\s[A-Z\\d]+)*)$", message = "{pattern.espacoLetraNumero}")
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = true)
	private String apelido;
	@ManyToOne
	@JoinColumn(name = "idsexo", referencedColumnName = "id", nullable = true)
	private PesSexo idsexo;
	@ManyToOne
	@JoinColumn(name = "idestadocivil", referencedColumnName = "id", nullable = true)
	private PesEstadoCivil idestadocivil;
	@Column(nullable = false)
	private Boolean inativo;
	@Pattern(regexp = "^([A-Z\\d\\s\\.\\/\\-\\,]+)$", message = "{pattern.textarea}")
	@Column(columnDefinition = "text", nullable = true)
	private String observacao;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "idpessoa")
	private PesDocumento documento;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "idpessoa")
	private PesEndereco endereco;
	
	public PesPessoa() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
		setInativo(false);
	}
	public PesPessoa(Long id) {
		this();
		setId(id);
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
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
	public String getApelido() {
		return apelido;
	}
	public void setApelido(String apelido) {
		this.apelido = apelido;
	}
	public PesSexo getIdsexo() {
		return idsexo;
	}
	public void setIdsexo(PesSexo idsexo) {
		this.idsexo = idsexo;
	}
	public PesEstadoCivil getIdestadocivil() {
		return idestadocivil;
	}
	public void setIdestadocivil(PesEstadoCivil idestadocivil) {
		this.idestadocivil = idestadocivil;
	}
	public Boolean getInativo() {
		return inativo;
	}
	public void setInativo(Boolean inativo) {
		this.inativo = inativo;
	}
	public String getObservacao() {
		return observacao;
	}
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	public PesDocumento getDocumento() {
		return documento;
	}
	public void setDocumento(PesDocumento documento) {
		this.documento = documento;
	}
	public PesEndereco getEndereco() {
		return endereco;
	}
	public void setEndereco(PesEndereco endereco) {
		this.endereco = endereco;
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
