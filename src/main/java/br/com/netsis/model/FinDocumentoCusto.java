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
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "fin_documentocusto")
public class FinDocumentoCusto implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@OneToOne
	@JoinColumn(name = "iddocumento", referencedColumnName = "id", nullable = false)
	private FinDocumento iddocumento;
	@NotNull
	@NotEmpty
	@Size(min = 0, max = 7, message = "{minimo.0.maximo.7}")
	@Column(length = 7, columnDefinition = "varchar(7)", nullable = false)
	private String desdobramento;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = false)
	private Double valortotal;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double valordesconto;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double valorjuros;
	@DecimalMin("0.0")
	@Digits(integer = 10, fraction = 2, message = "{numeric.10.2}")
	@Column(nullable = true)
	private Double saldo;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datavencimento;
	@OneToOne
	@JoinColumn(name = "idhistorico", referencedColumnName = "id", nullable = true)
	private FinHistorico idhistorico;
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public FinDocumentoCusto() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public FinDocumentoCusto(Long id) {
		// TODO Auto-generated constructor stub
		this();
		setId(id);
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
	public String getDesdobramento() {
		return desdobramento;
	}
	public void setDesdobramento(String desdobramento) {
		this.desdobramento = desdobramento;
	}
	public Double getValortotal() {
		return valortotal;
	}
	public void setValortotal(Double valortotal) {
		this.valortotal = valortotal;
	}
	public Double getValordesconto() {
		return valordesconto;
	}
	public void setValordesconto(Double valordesconto) {
		this.valordesconto = valordesconto;
	}
	public Double getValorjuros() {
		return valorjuros;
	}
	public void setValorjuros(Double valorjuros) {
		this.valorjuros = valorjuros;
	}
	public Double getSaldo() {
		return saldo;
	}
	public void setSaldo(Double saldo) {
		this.saldo = saldo;
	}
	public Calendar getDatavencimento() {
		return datavencimento;
	}
	public void setDatavencimento(Calendar datavencimento) {
		this.datavencimento = datavencimento;
	}
	public FinHistorico getIdhistorico() {
		return idhistorico;
	}
	public void setIdhistorico(FinHistorico idhistorico) {
		this.idhistorico = idhistorico;
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
