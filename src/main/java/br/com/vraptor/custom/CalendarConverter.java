package br.com.vraptor.custom;

import java.util.Calendar;

import javax.enterprise.context.ApplicationScoped;

import br.com.caelum.vraptor.Convert;

//@Convert(Calendar.class)
//@ApplicationScoped
public class CalendarConverter extends br.com.caelum.vraptor.converter.CalendarConverter {

	@Override
	public Calendar convert(String value, Class<? extends Calendar> type) {
		// TODO Auto-generated method stub
		
		return null;
	}
	
}
