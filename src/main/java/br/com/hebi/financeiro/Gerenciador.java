package br.com.hebi.financeiro;

import br.com.hebi.dao.GenericDao;
import br.com.hebi.model.FinDocumento;
import br.com.hebi.model.SysTipoOperacao;

public interface Gerenciador {

	public Gerenciador pega(String operacao);
	public Gerenciador proximo(Gerenciador gerenciadorDeDocumento);
	public void gerencia(GenericDao dao, FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao);
	
}
