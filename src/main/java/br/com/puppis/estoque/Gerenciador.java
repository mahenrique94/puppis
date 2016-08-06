package br.com.puppis.estoque;

import java.util.Calendar;

import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.PsMovimento;

public interface Gerenciador {

	public void gerencia(GenericDao dao, long idNota, long idProdutoServico, double quantidade, double valorVenda);
	public Gerenciador pega(String operacao, Calendar dataAtualizacao);
	public Gerenciador proximo(Gerenciador proximo);
	
}
