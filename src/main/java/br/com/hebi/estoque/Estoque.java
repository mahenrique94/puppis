package br.com.hebi.estoque;

import br.com.hebi.model.ComNotaItens;

public class Estoque {

	private Integer idgrupo;
	private Integer idclasse;
	private Long idproduto;
	private Double valoranterior;
	private Double valorpago;
	private Double porclucro;
	private Double valorunitario;
	private Double valortotal;
	private Double quantidade;
	private Double quantidadevendida;
	
	public Integer getIdgrupo() {
		return idgrupo;
	}
	public void setIdgrupo(Integer idgrupo) {
		this.idgrupo = idgrupo;
	}
	public Integer getIdclasse() {
		return idclasse;
	}
	public void setIdclasse(Integer idclasse) {
		this.idclasse = idclasse;
	}
	public Long getIdproduto() {
		return idproduto;
	}
	public void setIdproduto(Long idproduto) {
		this.idproduto = idproduto;
	}
	public Double getValoranterior() {
		return valoranterior;
	}
	public void setValoranterior(Double valoranterior) {
		this.valoranterior = valoranterior;
	}
	public Double getValorpago() {
		return valorpago;
	}
	public void setValorpago(Double valorpago) {
		this.valorpago = valorpago;
	}
	public Double getPorclucro() {
		return porclucro;
	}
	public void setPorclucro(Double porclucro) {
		this.porclucro = porclucro;
	}
	public Double getValorunitario() {
		return valorunitario;
	}
	public void setValorunitario(Double valorvenda) {
		this.valorunitario = valorvenda;
	}
	public Double getValortotal() {
		return valortotal;
	}
	public void setValortotal(Double valortotal) {
		this.valortotal = valortotal;
	}
	public Double getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(Double quantidade) {
		this.quantidade = quantidade;
	}
	public Double getQuantidadevendida() {
		return quantidadevendida;
	}
	public void setQuantidadevendida(Double quantidadevendida) {
		this.quantidadevendida = quantidadevendida;
	}
	
	public Estoque criaEstoque(ComNotaItens comNotaItens) {
		Estoque estoque = new Estoque();
		estoque.setIdgrupo(comNotaItens.getIditem().getIdgrupo().getId());
		estoque.setIdclasse(comNotaItens.getIditem().getIdclasse().getId());
		estoque.setIdproduto(comNotaItens.getIditem().getId());
		estoque.setValoranterior(comNotaItens.getIditem().getCusto().getValoranterior() == 0.0 ? comNotaItens.getValorunitario() : comNotaItens.getIditem().getCusto().getValorpago());
		estoque.setValorpago(comNotaItens.getValorunitario());
		estoque.setPorclucro(comNotaItens.getPorclucro() != null ? comNotaItens.getPorclucro() : 0.0);
		estoque.setValorunitario(comNotaItens.getValorunitario());
		estoque.setQuantidade(comNotaItens.getQuantidade());
		estoque.setQuantidadevendida(comNotaItens.getIditem().getEstoque().getQuantidadeven());
		return estoque;
	}
	
}
