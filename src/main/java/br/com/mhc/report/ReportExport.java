package br.com.mhc.report;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;

public class ReportExport implements ReportEngine {

	private JasperPrint print;
	
	@Override
	public ReportEngine with(Object o) {
		// TODO Auto-generated method stub
		this.print = (JasperPrint) o;
		return this;
	}
	
	@Override
	public Object run(Report report) {
		// TODO Auto-generated method stub
		return export(this.print, report);
	}

	private FileInputStream export(JasperPrint print, Report report) {
		JRExporter exporter = report.getType().getType().getExporter();
		OutputStream os = getOutPut(report.getPath(), report.getName(), report.getType().getType());
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, os);
		try {
			exporter.exportReport();
		} catch (JRException e) {
			// TODO Auto-generated catch block
			throw new ReportException("Não foi possível exportar o relatório");
		}
		try {
			return new FileInputStream(new File(String.format("%s/%s", report.getPath(), report.getFinalName())));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			throw new ReportException("Não foi possível encontrar o arquivo gerado pelo relatório");
		}
	}
	
	private FileOutputStream getOutPut(String path, String name, Type type) {
		try {
			return new FileOutputStream(String.format("%s/%s.%s", path, name, type.getExtension()));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			throw new ReportException("Não foi possível encontrar o caminho para exportar o relatório");
		}
	}
	
}
