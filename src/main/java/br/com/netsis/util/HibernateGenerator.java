package br.com.netsis.util;

import java.util.Properties;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import br.com.netsis.model.AdmComercio;
import br.com.netsis.model.AdmContato;
import br.com.netsis.model.AdmDocumento;
import br.com.netsis.model.AdmEndereco;
import br.com.netsis.model.AdmTipoAcesso;
import br.com.netsis.model.AdmUsuario;
import br.com.netsis.model.CadCentroCusto;
import br.com.netsis.model.CadCidade;
import br.com.netsis.model.CadEstado;
import br.com.netsis.model.CadPais;
import br.com.netsis.model.ComNota;
import br.com.netsis.model.ComNotaCusto;
import br.com.netsis.model.ComNotaItens;
import br.com.netsis.model.FinBanco;
import br.com.netsis.model.FinFormaPagamento;
import br.com.netsis.model.FinTipoContaBancaria;
import br.com.netsis.model.PesContato;
import br.com.netsis.model.PesDocumento;
import br.com.netsis.model.PesEndereco;
import br.com.netsis.model.PesEstadoCivil;
import br.com.netsis.model.PesPessoa;
import br.com.netsis.model.PesSexo;
import br.com.netsis.model.PesTipo;
import br.com.netsis.model.PsClasse;
import br.com.netsis.model.PsCusto;
import br.com.netsis.model.PsEstoque;
import br.com.netsis.model.PsGrupo;
import br.com.netsis.model.PsProdutoServico;
import br.com.netsis.model.PsTipo;
import br.com.netsis.model.PsUnidadeMedida;
import br.com.netsis.model.SysModulo;
import br.com.netsis.model.SysTipoOperacao;

public class HibernateGenerator {
	private static final String HIBERNATE_PROPERTIES = "src/main/resources/hibernate.properties";

	public static void main(String[] args) {
		createDB(AdmComercio.class, AdmContato.class, AdmDocumento.class, AdmEndereco.class, AdmTipoAcesso.class,
				AdmUsuario.class, CadCentroCusto.class, CadCidade.class, CadEstado.class, CadPais.class, ComNota.class,
				ComNotaCusto.class, ComNotaItens.class, FinBanco.class, FinFormaPagamento.class, FinTipoContaBancaria.class,
				PesContato.class, PesDocumento.class, PesEndereco.class, PesEstadoCivil.class, PesPessoa.class, PesSexo.class,
				PesTipo.class, PsClasse.class, PsCusto.class, PsEstoque.class, PsGrupo.class, PsProdutoServico.class,
				PsTipo.class, PsUnidadeMedida.class, SysModulo.class, SysTipoOperacao.class);
	}

	private static void createDB(Class<?>... clazzz) {
		Configuration cfg = new Configuration();
		cfg.setProperties(getProperties());
		Class[] arrayOfClass = clazzz;
		int j = clazzz.length;
		for (int i = 0; i < j; i++) {
			Class<?> clazz = arrayOfClass[i];
			cfg.addAnnotatedClass(clazz);
		}
		cfg.configure();
		SchemaExport export = new SchemaExport(cfg);
		export.setOutputFile(String.format("src/main/dbsql/%s.sql", "netsis"));
		export.setFormat(true);
		export.create(true, true);
	}

	private static void createDB() {
		Configuration cfg = new Configuration();
		cfg.setProperties(getProperties());
		cfg.addAnnotatedClass(AdmComercio.class);
		cfg.addAnnotatedClass(AdmContato.class);
		cfg.addAnnotatedClass(AdmDocumento.class);
		cfg.addAnnotatedClass(AdmEndereco.class);
		cfg.addAnnotatedClass(AdmTipoAcesso.class);
		cfg.addAnnotatedClass(AdmUsuario.class);
		cfg.addAnnotatedClass(CadCentroCusto.class);
		cfg.addAnnotatedClass(CadCidade.class);
		cfg.addAnnotatedClass(CadEstado.class);
		cfg.addAnnotatedClass(CadPais.class);
		cfg.addAnnotatedClass(ComNota.class);
		cfg.addAnnotatedClass(ComNotaCusto.class);
		cfg.addAnnotatedClass(ComNotaItens.class);
		cfg.addAnnotatedClass(FinBanco.class);
		cfg.addAnnotatedClass(FinFormaPagamento.class);
		cfg.addAnnotatedClass(FinTipoContaBancaria.class);
		cfg.addAnnotatedClass(PesContato.class);
		cfg.addAnnotatedClass(PesDocumento.class);
		cfg.addAnnotatedClass(PesEndereco.class);
		cfg.addAnnotatedClass(PesEstadoCivil.class);
		cfg.addAnnotatedClass(PesPessoa.class);
		cfg.addAnnotatedClass(PesSexo.class);
		cfg.addAnnotatedClass(PesTipo.class);
		cfg.addAnnotatedClass(PsClasse.class);
		cfg.addAnnotatedClass(PsCusto.class);
		cfg.addAnnotatedClass(PsEstoque.class);
		cfg.addAnnotatedClass(PsGrupo.class);
		cfg.addAnnotatedClass(PsProdutoServico.class);
		cfg.addAnnotatedClass(PsTipo.class);
		cfg.addAnnotatedClass(PsUnidadeMedida.class);
		cfg.addAnnotatedClass(SysModulo.class);
		cfg.addAnnotatedClass(SysTipoOperacao.class);
		cfg.configure();
		SchemaExport export = new SchemaExport(cfg);
		export.setOutputFile("src/main/dbsql/sac_script.sql");
		export.setFormat(true);
		export.create(true, true);
	}

	private static final Properties getProperties() {
		Properties prop = new Properties();
		prop.put("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
		prop.put("hibernate.connection.driver_class", "org.postgresql.Driver");
		prop.put("hibernate.connection.url","jdbc:postgresql://localhost:5432/NETSIS");
		prop.put("hibernate.connection.username", "postgres");
		prop.put("hibernate.connection.password", "root");
		prop.put("hibernate.hbm2ddl.auto", "create-drop");
		return prop;
	}
}
