package br.com.mhc.relatorio;

import java.io.OutputStream;
import java.sql.Connection;
import java.util.Map;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;

public class RelatorioBuilder {

	private final String nomeRelatorio;
	private final Map<String, Object> parameters;
	private final Connection connection;
	
	public RelatorioBuilder(String nomeRelatorio, Map<String, Object> parameters, Connection connection) {
		// TODO Auto-generated constructor stub
		this.nomeRelatorio = nomeRelatorio;
		this.parameters = parameters;
		this.connection = connection;
	}
	
	public void gera(OutputStream os) {
		try {
			JasperPrint jasperPrint = JasperFillManager.fillReport(getNomeRelatorio(), getParameters(), getConnection());
			JRExporter exporter = new JRPdfExporter();
			exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
			exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, os);
			exporter.exportReport();
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getNomeRelatorio() {
		return nomeRelatorio;
	}
	public Map<String, Object> getParameters() {
		return parameters;
	}
	public Connection getConnection() {
		return connection;
	}
	
}
