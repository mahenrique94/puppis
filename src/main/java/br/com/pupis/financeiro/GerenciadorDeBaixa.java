package br.com.pupis.financeiro;

import br.com.pupis.dao.GenericDao;
import br.com.pupis.model.FinDocumento;
import br.com.pupis.model.FinExtrato;
import br.com.pupis.model.SysTipoOperacao;

public class GerenciadorDeBaixa extends GerenciadorDeDocumento {

	@Override
	public void gerencia(GenericDao dao, FinDocumento finDocumento, SysTipoOperacao sysTipoOperacao) {
		// TODO Auto-generated method stub
		double valorTotal = finDocumento.getValortotal() != null ? finDocumento.getValortotal() : 0.0;
		double valorDesconto = finDocumento.getValordesconto() != null ? finDocumento.getValordesconto() : 0.0;
		double valorJuros = finDocumento.getValorjuros() != null ? finDocumento.getValorjuros() : 0.0;
		double valor = calcularValorBaixa(valorTotal, valorDesconto, valorJuros);
		finDocumento = (FinDocumento) dao.edit(finDocumento);
		FinDocumento finDocumentoClonado = (FinDocumento) finDocumento.clone();
		finDocumento.atualiza(valor);
		dao.save(finDocumento);
		finDocumentoClonado.setIddocumento(finDocumento);
		finDocumentoClonado.setIdtipooperacao(sysTipoOperacao);
		finDocumentoClonado.setValortotal(valorTotal);
		finDocumentoClonado.setValordesconto(valorDesconto);
		finDocumentoClonado.setValorjuros(valorJuros);
		dao.save(finDocumentoClonado.novoClonado());
		dao.save(this.criaExtrato(finDocumento, sysTipoOperacao, valor));
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
	
	private double calcularValorBaixa(double valorTotal, double valorDesconto, double valorJuros) {
		return (valorTotal - valorJuros) + valorDesconto;
	}
	
}
