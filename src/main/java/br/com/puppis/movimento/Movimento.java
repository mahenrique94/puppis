package br.com.puppis.movimento;

import java.util.List;

import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.ComNota;
import br.com.puppis.model.ComNotaItem;
import br.com.puppis.model.PsMovimento;
import br.com.puppis.model.PsMovimentoItem;
import br.com.puppis.model.PsMovimentoSaldo;
import br.com.puppis.model.PsProdutoServico;

public class Movimento {
	
	private GenericDao dao;
	private MovimentoTipo tipo;
	
	public void movimenta(final GenericDao dao, final ComNota nota, final MovimentoTipo tipo) {
		this.dao = dao;
		this.tipo = tipo;
		criarMovimento(nota, tipo.getId());
	}
	public void movimenta(final GenericDao dao, final long idProduto, final double quantidade, final MovimentoTipo tipo) {
		this.dao = dao;
		this.tipo = tipo;
		criarMovimento(idProduto, quantidade, tipo.getId());
	}
	
	private void criarMovimento(ComNota nota, int idMovimentoTipo) {
		getDao().save(new PsMovimento(idMovimentoTipo, nota.getNumero() != null ? nota.getNumero() : nota.getId()));
		criarMovimentoItem(nota.getItens(), (PsMovimento) getDao().getObj());
	}
	private void criarMovimento(long idProduto, double quantidade, int idMovimentoTipo) {
		getDao().save(new PsMovimento(idMovimentoTipo, 0));
		criarMovimentoItem((PsProdutoServico) getDao().edit(new PsProdutoServico(idProduto)), quantidade, (PsMovimento) getDao().getObj());
	}
	
	private void criarMovimentoItem(List<ComNotaItem> itens, PsMovimento movimento) {
		PsMovimentoItem movimentoItem = null;
		for (ComNotaItem item : itens) {
			getDao().save(new PsMovimentoItem(movimento, item.getIdprodutoservico(), item.getId()));
			criarMovimentoSaldo((PsMovimentoItem) getDao().getObj(), item.getQuantidade(), item.getIdprodutoservico().getEstoque().getQuantidade());
		}
	}
	private void criarMovimentoItem(PsProdutoServico produtoServico, double quantidade, PsMovimento movimento) {
		getDao().save(new PsMovimentoItem(movimento, produtoServico, 0));
		criarMovimentoSaldo((PsMovimentoItem) getDao().getObj(), quantidade, produtoServico.getEstoque().getQuantidade());
	}
	
	private void criarMovimentoSaldo(PsMovimentoItem movimentoItem, double quantidade, double quantidadeAtual) {
		getDao().save(new PsMovimentoSaldo(movimentoItem, quantidade, getTipo().getFator() == 1 ? (quantidadeAtual - quantidade) : (quantidadeAtual + quantidade), quantidadeAtual));
	}
	
	private GenericDao getDao() {
		return this.dao;
	}
	private MovimentoTipo getTipo() {
		return tipo;
	}
	
}
