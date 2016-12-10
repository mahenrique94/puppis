package br.com.mhc.report;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;

public class ReportCompile implements ReportEngine {

	@Override
	public Object run(Report report) {
		// TODO Auto-generated method stub
		return compile(report.getPath(), report.getName());
	}
	
	private JasperReport compile(String path, String reportName) {
		try {
			return JasperCompileManager.compileReport(String.format("%s/%s.jrxml", path, reportName));
		} catch (JRException e) {
			// TODO Auto-generated catch block
			throw new ReportException("Não foi possível compilar o relatório");
		}
	}

	@Override
	public ReportEngine with(Object o) {
		// TODO Auto-generated method stub
		return this;
	}

}
