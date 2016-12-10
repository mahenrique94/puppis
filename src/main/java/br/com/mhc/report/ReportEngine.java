package br.com.mhc.report;

public interface ReportEngine {
	
	public ReportEngine with(Object o);
	public Object run(Report report);

}
