package br.com.hebi.financeiro;

import br.com.hebi.dao.GenericDao;
import br.com.hebi.model.FinDocumento;
import br.com.hebi.model.SysTipoOperacao;

public class GerenciadorDeBaixa extends GerenciadorDeDocumento {

	@Override
	public void gerencia(GenericDao dao, FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao) {
		// TODO Auto-generated method stub
		double valorTotal = finDocumento.getValortotal();
		finDocumento = (FinDocumento) dao.edit(finDocumento);
		FinDocumento finDocumentoClonado = (FinDocumento) finDocumento.clone();
		finDocumento.atualiza(valorTotal);
		dao.save(finDocumento);
		finDocumentoClonado.setIddocumento(finDocumento);
		finDocumentoClonado.setIdtipooperacao(sysTipoOperacao);
		dao.save(finDocumentoClonado.novoClonado());
	}

	@Override
	public Gerenciador pega(String operacao) {
		// TODO Auto-generated method stub
		if (operacao.equals("BAIXA")) {
			return this;
		} else {
			setOperacao(operacao);
			return proximo(new GerenciadorDeEstorno()); 
		}
	}

	@Override
	public Gerenciador proximo(Gerenciador gerenciadorDeDocumento) {
		// TODO Auto-generated method stub
		return gerenciadorDeDocumento.pega(getOperacao());
	}

}
