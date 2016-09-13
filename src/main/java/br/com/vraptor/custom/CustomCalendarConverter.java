package br.com.vraptor.custom;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.enterprise.inject.Specializes;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.CalendarConverter;
import br.com.caelum.vraptor.converter.ConversionException;
import br.com.caelum.vraptor.converter.ConversionMessage;

/** @auth Matheus Castiglioni
 *  Classe para converter um Calendar para o padrão correto
 *  Tive que sobrescerver a classe do vrpator pois sempre quando tentava salvar data com horas(dd/MM/yyyy HH:mm)
 *  no banco de dados a hora ficava zerada.
 *  @example(25/05/1994 18:30)
 *  @result 25/05/1994 00:00 
 */
@Convert(Calendar.class)
@Specializes
public class CustomCalendarConverter extends CalendarConverter {

	/** @auth Matheus Castiglioni
	 *  Método responsável por receber qualquer data e converte-la
	 *  @param value - Data digitada na input, type - Tipo da data que esta chegando
	 *  @return date - Data convertido de String para Calendar pronta para persistir no banco
	 */
	@Override
	public Calendar convert(String value, Class<? extends Calendar> type) {
		// TODO Auto-generated method stub
		Calendar date = Calendar.getInstance();
		try {
			if (value != null && !value.equals("")) {
				// Verificando se a data esta com hora
				if (value.indexOf("/") >= 0 && value.indexOf(":") >= 0)
					date.setTime(new SimpleDateFormat("dd/MM/yyyy HH:mm").parse(value));
				// Verificando se a data esta sem hora
				if (value.indexOf("/") >= 0 && value.indexOf(":") < 0)
					date.setTime(new SimpleDateFormat("dd/MM/yyyy").parse(value));
				// Verificando se a data esta apenas com hora
				if (value.indexOf("/") < 0 && value.indexOf(":") >= 0) {
					// Verificando se a hora esta com segundos
					if (value.length() == 5)
						value += ":00";
					date.setTime(new SimpleDateFormat("HH:mm:ss").parse(value));
				}
				return date;
			} else {
				return null;
			}
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			throw new ConversionException(new ConversionMessage("is_not_a_valid_date", "Não foi possível converter a data: " + value));
		}
	}
	
}
