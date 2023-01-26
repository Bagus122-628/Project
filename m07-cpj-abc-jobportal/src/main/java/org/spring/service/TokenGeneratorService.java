package org.spring.service;

public class TokenGeneratorService {

	public String getToken(int num) {

		final String leater = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890";

		StringBuilder str = new StringBuilder();

		for (int i = 0; i < num; i++) {
			int index = (int) (Math.random() * leater.length());
			str.append(leater.charAt(index));
		}

		return str.toString();
	}
}