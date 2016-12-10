package br.com.mhc.report;

import java.io.FileInputStream;

import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

public class ReportBuilder {
	
	private final ReportEngine reportCompile = new ReportCompile();
	private final ReportEngine reportFill = new ReportFill();
	private final ReportEngine reportExport = new ReportExport();
	
	public FileInputStream build(Report report) {
		JasperReport jasper = (JasperReport) this.reportCompile.run(report);
		JasperPrint print = (JasperPrint) this.reportFill.with(jasper).run(report);
		return (FileInputStream) this.reportExport.with(print).run(report);
	}
	
}
