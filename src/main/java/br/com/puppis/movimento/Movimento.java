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
	
	public void movimenta(final GenericDao dao, final long numeroDocumento, final long idProdutoServico, final double quantidade, final MovimentoTipo tipo) {
		this.dao = dao;
		this.tipo = tipo;
		criarMovimento(numeroDocumento, idProdutoServico, quantidade);
	}
	
	private void criarMovimento(long numeroDocumento, long idProdutoServico, double quantidade) {
		getDao().save(new PsMovimento(this.tipo.getId(), numeroDocumento));
		criarMovimentoItem(idProdutoServico, quantidade, (PsMovimento) getDao().getObj());
	}
	
	private void criarMovimentoItem(long idProdutoServico, double quantidade, PsMovimento movimento) {
		PsMovimentoItem movimentoItem = null;
		PsProdutoServico item = (PsProdutoServico) getDao().edit(new PsProdutoServico(idProdutoServico));
		getDao().save(new PsMovimentoItem(movimento, item));
		criarMovimentoSaldo((PsMovimentoItem) getDao().getObj(), quantidade, item.getEstoque().getQuantidade());
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
