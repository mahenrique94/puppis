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
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "fin_extrato")
public class FinExtrato implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "iddocumento", referencedColumnName = "id", nullable = false)
	private FinDocumento iddocumento;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public FinExtrato() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public FinExtrato(Long id) {
		// TODO Auto-generated constructor stub
		this();
		setId(id);
	}
	public FinExtrato(FinDocumento finDocumento) {
		this();
		setIddocumento(finDocumento);
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public FinDocumento getIddocumento() {
		return iddocumento;
	}
	public void setIddocumento(FinDocumento iddocumento) {
		this.iddocumento = iddocumento;
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
