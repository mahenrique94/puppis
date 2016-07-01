package br.com.hebi.financeiro;

import br.com.hebi.dao.GenericDao;
import br.com.hebi.model.FinDocumento;
import br.com.hebi.model.SysTipoOperacao;

public class GerenciadorDeEstorno extends GerenciadorDeDocumento {

	@Override
	public void gerencia(GenericDao dao, FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao) {
		// TODO Auto-generated method stub
		finDocumento = (FinDocumento) dao.edit(finDocumento);
		if (finDocumento.getIdtipooperacao().getDescricao().equals("BAIXA")) { // Estornando uma baixa
			FinDocumento finDocumentoEntrada = (FinDocumento) dao.edit(finDocumento.getIddocumento());
			finDocumentoEntrada.estorna();
			finDocumentoEntrada.setSaldo(finDocumentoEntrada.getSaldo() + finDocumento.calcula());
			dao.save(finDocumentoEntrada);
			dao.save(this.criaExtrato(finDocumentoEntrada, sysTipoOperacao, finDocumento.calcula()));
			dao.delete(finDocumento);
		} else { // Estornando um cancelamento
			finDocumento.estorna();
			finDocumento.setIdtipooperacao(new SysTipoOperacao(3)); // 3 = ENTRADA
			finDocumento.setSaldo(finDocumento.calcula());
			dao.save(this.criaExtrato(finDocumento, sysTipoOperacao, finDocumento.getSaldo()));
		}
	}
	
	@Override
	public Gerenciador pega(String operacao) {
		// TODO Auto-generated method stub
		if (operacao.equals("ESTORNO")) {
			return this;
		} else {
			setOperacao(operacao);
			return proximo(new GerenciadorDeCancelamento()); 
		}
	}

	@Override
	public Gerenciador proximo(Gerenciador gerenciadorDeDocumento) {
		// TODO Auto-generated method stub
		return gerenciadorDeDocumento.pega(getOperacao());
	}

}
