package br.com.netsis.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Properties;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import br.com.netsis.model.AdmComercio;
import br.com.netsis.model.AdmContato;
import br.com.netsis.model.AdmDocumento;
import br.com.netsis.model.AdmEndereco;
import br.com.netsis.model.AdmUsuario;
import br.com.netsis.model.FinBanco;
import br.com.netsis.model.CadCentroCusto;
import br.com.netsis.model.CadCidade;
import br.com.netsis.model.CadEstado;
import br.com.netsis.model.SysModulo;
import br.com.netsis.model.PesNucleo;
import br.com.netsis.model.CadPais;
import br.com.netsis.model.PesRamo;
import br.com.netsis.model.PesSetor;
import br.com.netsis.model.SysTipoOperacao;
import br.com.netsis.model.ComNota;
import br.com.netsis.model.ComNotaCusto;
import br.com.netsis.model.ComNotaItens;
import br.com.netsis.model.PesContato;
import br.com.netsis.model.PesDocumento;
import br.com.netsis.model.PesEndereco;
import br.com.netsis.model.PesInformacao;
import br.com.netsis.model.PesInformacaoBancaria;
import br.com.netsis.model.PesPessoa;
import br.com.netsis.model.PesTipo;
import br.com.netsis.model.PsClasse;
import br.com.netsis.model.PsCusto;
import br.com.netsis.model.PsEstoque;
import br.com.netsis.model.PsGrupo;
import br.com.netsis.model.PsProdutoServico;
import br.com.netsis.model.PsTipo;
import br.com.netsis.model.PesCargo;
import br.com.netsis.model.PesEspecializacao;
import br.com.netsis.model.SysEstadoCivil;
import br.com.netsis.model.FinFormaPagamento;
import br.com.netsis.model.SysNacionalidade;
import br.com.netsis.model.SysNivelFormacao;
import br.com.netsis.model.SysSexo;
import br.com.netsis.model.AdmTipoAcesso;
import br.com.netsis.model.SysTipoContaBancaria;
import br.com.netsis.model.SysTipoContratacao;
import br.com.netsis.model.SysTipoFornecedor;
import br.com.netsis.model.SysUnidadeMedida;

public class HibernateGenerator {
	private static final String HIBERNATE_PROPERTIES = "src/main/resources/hibernate.properties";

	public static void main(String[] args) {
//		createDB(AdmUsuario.class, CadBanco.class, CadPais.class, CadEstado.class, CadCidade.class, CadCentroCusto.class,
//				CadNucleo.class, CadSetor.class, CadRamo.class, CadModulo.class, CadTipoOperacao.class, 
//				AdmComercio.class, AdmEndereco.class, AdmDocumento.class, 
//				AdmContato.class, PesPessoa.class, PesEndereco.class, PesInformacao.class, PesInformacaoBancaria.class, 
//				PesContato.class, PesDocumento.class, PesTipo.class,		
//				SysCargo.class, SysEspecializacao.class, SysEstadoCivil.class, SysFormaPagamento.class, 
//				SysNacionalidade.class, SysNivelFormacao.class, SysSexo.class, SysTipoAcesso.class,
//				SysTipoContaBancaria.class, SysTipoContratacao.class, SysTipoFornecedor.class,SysUnidadeMedida.class
//				PsGrupo.class, PsClasse.class, PsProdutoServico.class, PsEstoque.class, PsCusto.class, PsTipo.class
//				ComNota.class, ComNotaCusto.class, ComNotaItens.class);
		createDB(FinBanco.class, CadCentroCusto.class, SysModulo.class, PesNucleo.class, PesRamo.class, PesSetor.class,
				SysTipoOperacao.class);
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
//		cfg.addAnnotatedClass(AdmComercio.class);
//		cfg.addAnnotatedClass(AdmContato.class);
//		cfg.addAnnotatedClass(AdmDocumento.class);
//		cfg.addAnnotatedClass(AdmEndereco.class);
//		cfg.addAnnotatedClass(AdmTipoAcesso.class);
//		cfg.addAnnotatedClass(AdmUsuario.class);
//		cfg.addAnnotatedClass(CadCidade.class);
//		cfg.addAnnotatedClass(CadEstado.class);
//		cfg.addAnnotatedClass(CadPais.class);
		
//		cfg.addAnnotatedClass(CadBanco.class);
//		cfg.addAnnotatedClass(CadCentroCusto.class);
//		cfg.addAnnotatedClass(CadSetor.class);
//		cfg.addAnnotatedClass(CadRamo.class);
//		cfg.addAnnotatedClass(CadNucleo.class);
//		cfg.addAnnotatedClass(CadCidade.class);
		cfg.addAnnotatedClass(PesCargo.class);
		cfg.addAnnotatedClass(PesEspecializacao.class);
		cfg.addAnnotatedClass(SysEstadoCivil.class);
		cfg.addAnnotatedClass(FinFormaPagamento.class);
		cfg.addAnnotatedClass(SysNacionalidade.class);
		cfg.addAnnotatedClass(SysNivelFormacao.class);
		cfg.addAnnotatedClass(SysSexo.class);
		cfg.addAnnotatedClass(SysTipoContaBancaria.class);
		cfg.addAnnotatedClass(SysTipoContratacao.class);
		cfg.addAnnotatedClass(SysTipoFornecedor.class);
		cfg.addAnnotatedClass(SysUnidadeMedida.class);
//		cfg.addAnnotatedClass(PesEndereco.class);
//		cfg.addAnnotatedClass(PesInformacao.class);
//		cfg.addAnnotatedClass(PesInformacaoBancaria.class);
//		cfg.addAnnotatedClass(PesContato.class);
//		cfg.addAnnotatedClass(PesPessoa.class);
//		cfg.addAnnotatedClass(PesDocumento.class);
//		cfg.addAnnotatedClass(PesTipo.class);
//		cfg.addAnnotatedClass(PsGrupo.class);
//		cfg.addAnnotatedClass(PsClasse.class);
//		cfg.addAnnotatedClass(PsEstoque.class);
//		cfg.addAnnotatedClass(PsProdutoServico.class);
//		cfg.addAnnotatedClass(PsCusto.class);
//		cfg.addAnnotatedClass(PsTipo.class);
//		cfg.addAnnotatedClass(CadModulo.class);
//		cfg.addAnnotatedClass(CadTipoOperacao.class);
//		cfg.addAnnotatedClass(ComNota.class);
//		cfg.addAnnotatedClass(ComNotaCusto.class);
//		cfg.addAnnotatedClass(ComNotaItens.class);
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
