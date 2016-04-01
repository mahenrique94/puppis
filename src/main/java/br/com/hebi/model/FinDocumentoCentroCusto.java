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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "fin_documentocentrocusto")
public class FinDocumentoCentroCusto implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "iddocumento", referencedColumnName = "id", nullable = false)
	private FinDocumento iddocumento;
	@ManyToOne
	@JoinColumn(name = "idcentrocusto", referencedColumnName = "id", nullable = false)
	private CadCentroCusto idcentrocusto;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public FinDocumentoCentroCusto() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public FinDocumentoCentroCusto(Integer id) {
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
	public FinDocumento getIddocumento() {
		return iddocumento;
	}
	public void setIddocumento(FinDocumento iddocumento) {
		this.iddocumento = iddocumento;
	}
	public CadCentroCusto getIdcentrocusto() {
		return idcentrocusto;
	}
	public void setIdcentrocusto(CadCentroCusto idcentrocusto) {
		this.idcentrocusto = idcentrocusto;
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
