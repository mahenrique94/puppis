package br.com.puppis.financeiro;

import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.FinDocumento;
import br.com.puppis.model.FinExtrato;
import br.com.puppis.model.SysTipoOperacao;

public class GerenciadorBaixa extends GerenciadorDocumento {

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
		dao.save(this.criaExtrato(finDocumento, sysTipoOperacao, valorTotal, finDocumentoClonado.getIdhistorico().getDescricao()));
	}

	@Override
	public Gerenciador pega(String operacao) {
		// TODO Auto-generated method stub
		if (operacao.equals("BAIXA")) {
			return this;
		} else {
			setOperacao(operacao);
			return proximo(new GerenciadorEstorno()); 
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
