package br.com.puppis.financeiro;

import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.FinDocumento;
import br.com.puppis.model.FinExtrato;
import br.com.puppis.model.SysTipoOperacao;

public interface Gerenciador {

	default public FinExtrato criaExtrato(FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao, double valor, String historico) {
		return FinExtrato.cria(finDocumento, sysTipoOperacao, valor, historico);
	};
	
	public Gerenciador pega(String operacao);
	public Gerenciador proximo(Gerenciador gerenciadorDeDocumento);
	public void gerencia(GenericDao dao, FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao);
	
}
