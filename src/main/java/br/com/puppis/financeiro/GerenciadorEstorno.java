package br.com.puppis.financeiro;

import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.FinDocumento;
import br.com.puppis.model.SysTipoOperacao;

public class GerenciadorEstorno extends GerenciadorDocumento {

	@Override
	public void gerencia(GenericDao dao, FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao) {
		// TODO Auto-generated method stub
		finDocumento = (FinDocumento) dao.edit(finDocumento);
		if (finDocumento.getIdtipooperacao().getDescricao().equals("BAIXA")) { // Estornando uma baixa
			FinDocumento finDocumentoEntrada = (FinDocumento) dao.edit(finDocumento.getIddocumento());
			finDocumentoEntrada.estorna();
			finDocumentoEntrada.setSaldo(finDocumentoEntrada.getSaldo() + finDocumento.calcula());
			dao.save(finDocumentoEntrada);
			dao.save(this.criaExtrato(finDocumentoEntrada, sysTipoOperacao, finDocumento.getValortotal(), finDocumentoEntrada.getIdhistorico().getDescricao()));
			dao.delete(finDocumento);
		} else { // Estornando um cancelamento
			finDocumento.estorna();
			finDocumento.setIdtipooperacao(new SysTipoOperacao(3)); // 3 = ENTRADA
			finDocumento.setSaldo(finDocumento.calcula());
			dao.save(finDocumento);
		}
	}
	
	@Override
	public Gerenciador pega(String operacao) {
		// TODO Auto-generated method stub
		if (operacao.equals("ESTORNO")) {
			return this;
		} else {
			setOperacao(operacao);
			return proximo(new GerenciadorCancelamento()); 
		}
	}

	@Override
	public Gerenciador proximo(Gerenciador gerenciadorDeDocumento) {
		// TODO Auto-generated method stub
		return gerenciadorDeDocumento.pega(getOperacao());
	}

}
