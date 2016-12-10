package br.com.mhc.report;

public class ReportTypeFactory {

	public static ReportType findType(String type) {
		switch (type) {
		case "PDF":
			return new ReportPDF();
		default:
			return null;
		}
	}
	
}
