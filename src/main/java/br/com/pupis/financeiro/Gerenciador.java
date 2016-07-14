package br.com.pupis.financeiro;

import br.com.pupis.dao.GenericDao;
import br.com.pupis.model.FinDocumento;
import br.com.pupis.model.FinExtrato;
import br.com.pupis.model.SysTipoOperacao;

public interface Gerenciador {

	default public FinExtrato criaExtrato(FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao, double valor) {
		return FinExtrato.criaExtratoDeBaixa(finDocumento, sysTipoOperacao, valor);
	};
	
	public Gerenciador pega(String operacao);
	public Gerenciador proximo(Gerenciador gerenciadorDeDocumento);
	public void gerencia(GenericDao dao, FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao);
	
}
