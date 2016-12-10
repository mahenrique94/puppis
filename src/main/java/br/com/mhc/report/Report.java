package br.com.mhc.report;

import java.sql.Connection;
import java.util.Map;


public class Report {
	
	private Connection connection;
	private Map<String, Object> parameters;
	private String path;
	private String name;
	private ReportType type;
	
	public Report(Connection connection, Map<String, Object> parameters, String path, String name, ReportType type) {
		this.connection = connection;
		this.parameters = parameters;
		this.path = path;
		this.name = name;
		this.type = type;
	}
	
	public Connection getConnection() {
		return connection;
	}
	public Map<String, Object> getParameters() {
		return parameters;
	}
	public String getPath() {
		return path;
	}
	public String getName() {
		return name;
	}
	public ReportType getType() {
		return type;
	}
	
	public String getFinalName() {
		return String.format("%s.%s", getName(), getType().getType().getExtension());
	}
	
}
