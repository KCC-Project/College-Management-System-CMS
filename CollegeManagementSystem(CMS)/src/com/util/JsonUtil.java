package com.util;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

public class JsonUtil {
	private static ObjectMapper objectMapper;
	static {
		objectMapper = new ObjectMapper();
	}

	public static String convertJavaToJson(Object obj) {
		String jsonResult = null;
		try {
			jsonResult = objectMapper.writeValueAsString(obj);
		} catch (JsonGenerationException e) {
			System.out.println("Exception occured while converting java object into json object " + e.getMessage());
		} catch (JsonMappingException e) {
			System.out.println("Exception occured while converting java object into json object " + e.getMessage());
		} catch (IOException e) {
			System.out.println("Exception occured while converting java object into json object " + e.getMessage());
		}

		return jsonResult;
	}

	public static <T> T convertJsonToJava(String jsonString, Class<T> cls) {
		T result = null;
		try {
			result = objectMapper.readValue(jsonString, cls);
		} catch (JsonParseException e) {
			System.out.println("Exception occured while converting json object into java object " + e.getMessage());
		} catch (JsonMappingException e) {
			System.out.println("Exception occured while converting json object into java object " + e.getMessage());
		} catch (IOException e) {
			System.out.println("Exception occured while converting json object into java object " + e.getMessage());
		}
		return result;
	}
}
