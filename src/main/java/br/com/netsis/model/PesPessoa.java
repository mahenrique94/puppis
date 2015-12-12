package br.com.netsis.model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "pes_pessoa")
public class PesPessoa implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 60, message = "{minimo.0.maximo.60}")
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = false, unique = true)
	private String nomerazaosocial;
	@Size(min = 0, max = 60, message = "{minimo.0.maximo.60}")
	@Column(length = 60, columnDefinition = "varchar(60)", nullable = true, unique = true)
	private String nomefantasia;
	@ManyToOne
	@JoinColumn(name = "tipo", referencedColumnName = "id", nullable = false)
	private PesTipo tipo;
	@Size(min = 0, max = 30, message = "{minimo.0.maximo.30}")
	@Column(length = 30, columnDefinition = "varchar(30)", nullable = true)
	private String apelido;
	@Size(min = 1, max = 1, message = "{minimo.1.maximo.1}")
	@Column(length = 1, columnDefinition = "char(1)", nullable = true)
	private String sexo;
	@Size(min = 0, max = 15, message = "{minimo.0.maximo.15}")
	@Column(length = 15, columnDefinition = "varchar(15)", nullable = true)
	private String estadocivil;
	@NotNull
	@NotEmpty
	@Size(min = 1, max = 1, message = "{minimo.1.maximo.1}")
	@Column(length = 1, columnDefinition = "char(1)", nullable = false)
	private String inativo;
	@Column(columnDefinition = "text", nullable = true)
	private String observacao;
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "idpessoa")
	private PesDocumento documento;
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "idpessoa")
	private PesEndereco endereco;
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "idpessoa")
	private PesInformacao informacao;
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "idpessoa")
	private PesInformacaoBancaria informacaoBancaria;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public PesPessoa() {
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
		setInativo("F");
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
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getEstadocivil() {
		return estadocivil;
	}
	public void setEstadocivil(String estadocivil) {
		this.estadocivil = estadocivil;
	}
	public String getInativo() {
		return inativo;
	}
	public void setInativo(String inativo) {
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
	public PesInformacao getInformacao() {
		return informacao;
	}
	public void setInformacao(PesInformacao informacao) {
		this.informacao = informacao;
	}
	public PesInformacaoBancaria getInformacaoBancaria() {
		return informacaoBancaria;
	}
	public void setInformacaoBancaria(PesInformacaoBancaria informacaoBancaria) {
		this.informacaoBancaria = informacaoBancaria;
	}
	public PesTipo getTipo() {
		return tipo;
	}
	public void setTipo(PesTipo tipo) {
		this.tipo = tipo;
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
