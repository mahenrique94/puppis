package br.com.hebi.financeiro;

import br.com.hebi.dao.GenericDao;
import br.com.hebi.model.FinDocumento;
import br.com.hebi.model.FinExtrato;
import br.com.hebi.model.SysTipoOperacao;

public interface Gerenciador {

	default public FinExtrato criaExtrato(FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao, double valor) {
		return FinExtrato.criaExtratoDeBaixa(finDocumento, sysTipoOperacao, valor);
	};
	
	public Gerenciador pega(String operacao);
	public Gerenciador proximo(Gerenciador gerenciadorDeDocumento);
	public void gerencia(GenericDao dao, FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao);
	
}
