package br.com.puppis.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "fin_documentocentrocusto")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class FinDocumentoCentroCusto implements Serializable {
	
	@Id
	@SequenceGenerator(name = "fin_documentocentrocusto", sequenceName = "sqfin_documentocentrocusto", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "fin_documentocentrocusto")
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
	public FinDocumentoCentroCusto(long idDocumento, int idCentroCusto) {
		// TODO Auto-generated constructor stub
		this();
		setIddocumento(new FinDocumento(idDocumento));
		setIdcentrocusto(new CadCentroCusto(idCentroCusto));
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
