package br.com.hebi.financeiro;

import br.com.hebi.dao.GenericDao;
import br.com.hebi.model.FinDocumento;
import br.com.hebi.model.SysTipoOperacao;

public class GerenciadorDeCancelamento extends GerenciadorDeDocumento {

	@Override
	public void gerencia(GenericDao dao, FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao) {
		// TODO Auto-generated method stub
		finDocumento = (FinDocumento) dao.edit(finDocumento);
		finDocumento.cancela();
		finDocumento.setIdtipooperacao(sysTipoOperacao);
		dao.save(finDocumento);
	}
	
	@Override
	public Gerenciador pega(String operacao) {
		// TODO Auto-generated method stub
		if (operacao.equals("CANCELAMENTO")) {
			return this;
		} else {
			setOperacao(operacao);
			return proximo(null); 
		}
	}

	@Override
	public Gerenciador proximo(Gerenciador gerenciadorDeDocumento) {
		// TODO Auto-generated method stub
		throw new RuntimeException("Não foi possível localizar um gerenciador para a operação : " + getOperacao());
	}

}
