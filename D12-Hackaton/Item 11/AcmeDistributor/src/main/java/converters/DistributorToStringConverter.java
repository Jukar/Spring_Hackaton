package converters;

import javax.transaction.Transactional;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import domain.Distributor;

@Component
@Transactional
public class DistributorToStringConverter implements Converter<Distributor, String>{
	@Override
	public String convert(Distributor source) {
		String result;

		if (source == null)
			result = null;
		else
			result = String.valueOf(source.getId());

		return result;
	}
}