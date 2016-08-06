package br.com.puppis.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.CascadeType;
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

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.Range;

@Entity
@Table(name = "ps_movimento")
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class PsMovimento implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "idmovimentotipo", referencedColumnName = "id", nullable = false)
	private PsMovimentoTipo idmovimentotipo;
	@Range(min = 0, message = "{minimo.0}")
	@Column(nullable = true)
	private Long nrodocumento;	
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Calendar datacreate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Calendar dataupdate;
	
	public PsMovimento() {
		// TODO Auto-generated constructor stub
		setDatacreate(Calendar.getInstance());
		setDataupdate(Calendar.getInstance());
	}
	public PsMovimento(Integer id) {
		// TODO Auto-generated constructor stub
		this();
		setId(id);
	}
	public PsMovimento(int idMovimentoTipo, long nroDocumento) {
		this();
		setIdmovimentotipo(new PsMovimentoTipo(idMovimentoTipo));
		setNrodocumento(nroDocumento);
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public PsMovimentoTipo getIdmovimentotipo() {
		return idmovimentotipo;
	}
	public void setIdmovimentotipo(PsMovimentoTipo idmovimentotipo) {
		this.idmovimentotipo = idmovimentotipo;
	}
	public Long getNrodocumento() {
		return nrodocumento;
	}
	public void setNrodocumento(Long nrodocumento) {
		this.nrodocumento = nrodocumento;
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
