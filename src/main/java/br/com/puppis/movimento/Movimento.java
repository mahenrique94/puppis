package br.com.puppis.movimento;

import java.util.List;

import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.ComNota;
import br.com.puppis.model.ComNotaItem;
import br.com.puppis.model.PsMovimento;
import br.com.puppis.model.PsMovimentoItem;
import br.com.puppis.model.PsMovimentoSaldo;

public class Movimento {
	
	private GenericDao dao;
	private MovimentoTipo tipo;
	
	public GenericDao getDao() {
		return this.dao;
	}
	public MovimentoTipo getTipo() {
		return tipo;
	}

	public void movimenta(final GenericDao dao, final ComNota nota, final MovimentoTipo tipo) {
		this.dao = dao;
		this.tipo = tipo;
		criarMovimento(nota, tipo.getId());
	}
	
	private void criarMovimento(ComNota nota, int idMovimentoTipo) {
		getDao().save(new PsMovimento(idMovimentoTipo, nota.getNumero() != null ? nota.getNumero() : nota.getId()));
		criarMovimentoItem(nota.getItens(), (PsMovimento) getDao().getObj());
	}
	
	private void criarMovimentoItem(List<ComNotaItem> itens, PsMovimento movimento) {
		PsMovimentoItem movimentoItem = null;
		for (ComNotaItem item : itens) {
			getDao().save(new PsMovimentoItem(movimento, item.getIdprodutoservico(), item.getId()));
			criarMovimentoSaldo((PsMovimentoItem) getDao().getObj(), item.getQuantidade(), item.getIdprodutoservico().getEstoque().getQuantidade());
		}
	}
	
	private void criarMovimentoSaldo(PsMovimentoItem movimentoItem, double quantidade, double quantidadeAtual) {
		getDao().save(new PsMovimentoSaldo(movimentoItem, quantidade, getTipo().getFator() == 1 ? (quantidadeAtual - quantidade) : (quantidadeAtual + quantidade), quantidadeAtual));
	}
	
}
