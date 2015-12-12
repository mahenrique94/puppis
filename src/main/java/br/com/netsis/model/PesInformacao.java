package br.com.netsis.model;

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

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "pes_informacao")
public class PesInformacao implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@OneToOne
	@JoinColumn(name = "idpessoa", referencedColumnName = "id", nullable = true, unique = true)
	private PesPessoa idpessoa;
	
	// FORNECEDOR
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = true)
	private String tipofornecedor;
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = true)
	private String ramofornecedor;
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = true)
	private String nucleofornecedor;
	@Column(length = 50, columnDefinition = "varchar(255)", nullable = true)
	private String sitefornecedor;
	@Column(length = 30, columnDefinition = "varchar(60)", nullable = true)
	private String nomevendedor;
	
	// FUNCIONARIO
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = true)
	private String setor;
	@Column(length = 120, columnDefinition = "varchar(120)", nullable = true)
	private String cargo;
	@Column(length = 12, columnDefinition = "varchar(12)", nullable = true)
	private String tipocontratacao;
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = true)
	private String nacionalidade;
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = true)
	private String nivelformacao;
	@Column(length = 120, columnDefinition = "varchar(120)", nullable = true)
	private String especializacao;
	@Temporal(TemporalType.DATE)
	@Column(nullable = true)
	private Calendar datanascimento;
	@Temporal(TemporalType.DATE)
	@Column(nullable = true)
	private Calendar dataadmissao;
	@Temporal(TemporalType.DATE)
	@Column(nullable = true)
	private Calendar datademissao;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public PesInformacao() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public PesInformacao(Long id) {
		this();
		setId(id);
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public PesPessoa getIdpessoa() {
		return idpessoa;
	}
	public void setIdpessoa(PesPessoa idpessoa) {
		this.idpessoa = idpessoa;
	}
	public String getTipofornecedor() {
		return tipofornecedor;
	}
	public void setTipofornecedor(String tipofornecedor) {
		this.tipofornecedor = tipofornecedor;
	}
	public String getRamofornecedor() {
		return ramofornecedor;
	}
	public void setRamofornecedor(String ramofornecedor) {
		this.ramofornecedor = ramofornecedor;
	}
	public String getNucleofornecedor() {
		return nucleofornecedor;
	}
	public void setNucleofornecedor(String nucleofornecedor) {
		this.nucleofornecedor = nucleofornecedor;
	}
	public String getSitefornecedor() {
		return sitefornecedor;
	}
	public void setSitefornecedor(String sitefornecedor) {
		this.sitefornecedor = sitefornecedor;
	}
	public String getNomevendedor() {
		return nomevendedor;
	}
	public void setNomevendedor(String nomevendedor) {
		this.nomevendedor = nomevendedor;
	}
	public String getSetor() {
		return setor;
	}
	public void setSetor(String setor) {
		this.setor = setor;
	}
	public String getCargo() {
		return cargo;
	}
	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
	public String getTipocontratacao() {
		return tipocontratacao;
	}
	public void setTipocontratacao(String tipocontratacao) {
		this.tipocontratacao = tipocontratacao;
	}
	public String getNacionalidade() {
		return nacionalidade;
	}
	public void setNacionalidade(String nacionalidade) {
		this.nacionalidade = nacionalidade;
	}
	public String getNivelformacao() {
		return nivelformacao;
	}
	public void setNivelformacao(String nivelformacao) {
		this.nivelformacao = nivelformacao;
	}
	public String getEspecializacao() {
		return especializacao;
	}
	public void setEspecializacao(String especializacao) {
		this.especializacao = especializacao;
	}
	public Calendar getDatanascimento() {
		return datanascimento;
	}
	public void setDatanascimento(Calendar datanascimento) {
		this.datanascimento = datanascimento;
	}
	public Calendar getDataadmissao() {
		return dataadmissao;
	}
	public void setDataadmissao(Calendar dataadmissao) {
		this.dataadmissao = dataadmissao;
	}
	public Calendar getDatademissao() {
		return datademissao;
	}
	public void setDatademissao(Calendar datademissao) {
		this.datademissao = datademissao;
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
