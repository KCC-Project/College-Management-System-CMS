package com.util;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	// converting the input string into date format
	public static Date convertToDate(String inputDate) {
	    try {
			return new SimpleDateFormat("yyyy-MM-dd").parse(inputDate);
		} catch (ParseException e) {
			try {
				return new SimpleDateFormat("yyyy/MM/dd").parse(inputDate);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	    return null;
	}
	
	// converting the input date into string format 
	public static String convertToString(Date inputDate) {
		
	    return new SimpleDateFormat("yyyy-MM-dd").format(inputDate);
	}
}
