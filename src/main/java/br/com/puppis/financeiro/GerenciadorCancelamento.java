package br.com.puppis.financeiro;

import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.FinDocumento;
import br.com.puppis.model.SysTipoOperacao;

public class GerenciadorCancelamento extends GerenciadorDocumento {

	@Override
	public void gerencia(GenericDao dao, FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao) {
		// TODO Auto-generated method stub
		finDocumento = (FinDocumento) dao.edit(finDocumento);
		finDocumento.cancela();
		finDocumento.setIdtipooperacao(sysTipoOperacao);
		dao.save(finDocumento);
		dao.save(this.criaExtrato(finDocumento, sysTipoOperacao, 0.0));
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