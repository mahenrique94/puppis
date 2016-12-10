package br.com.mhc.report;

import java.sql.Connection;
import java.util.Map;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

public class ReportFill implements ReportEngine {

	private JasperReport jasper;
	
	@Override
	public ReportEngine with(Object o) {
		// TODO Auto-generated method stub
		this.jasper = (JasperReport) o;
		return this;
	}
	
	@Override
	public Object run(Report report) {
		// TODO Auto-generated method stub
		return fill(report.getConnection(), report.getParameters(), this.jasper);
	}
	
	private JasperPrint fill(Connection connection, Map parameters, JasperReport jasper) {
		try {
			return JasperFillManager.fillReport(jasper, parameters, connection);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			throw new ReportException("Não foi possível preencher o relatório"); 
		}
	}

}
