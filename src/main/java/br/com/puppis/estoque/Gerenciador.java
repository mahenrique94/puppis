package br.com.puppis.estoque;

import br.com.puppis.dao.GenericDao;

public interface Gerenciador {

	public void gerencia(GenericDao dao, long idProdutoServico, double quantidade, double valorVenda);
	public Gerenciador pega(String operacao);
	public Gerenciador proximo(Gerenciador proximo);
	
}
