package br.com.mhc.report;

import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.export.JRPdfExporter;

public enum Type {

	PDF("PDF", "application/pdf", "pdf", new JRPdfExporter());
	
	private String type;
	private String application;
	private String extension;
	private JRExporter exporter;
	
	private Type(String type, String application, String extension, JRExporter exporter) {
		this.type = type;
		this.application = application;
		this.extension = extension;
		this.exporter = exporter;
	}
	
	public String getType() {
		return type;
	}
	public String getApplication() {
		return application;
	}
	public String getExtension() {
		return extension;
	}
	public JRExporter getExporter() {
		return exporter;
	}
	
}
