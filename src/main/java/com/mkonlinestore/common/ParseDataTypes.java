package com.mkonlinestore.common;

public class ParseDataTypes {
	public double parseDouble(String strNumber) {
		if (strNumber != null && strNumber.length() > 0) {
			try {
				return Double.parseDouble(strNumber);
			} 
			catch(Exception e) {
				return -1;   // or some value to mark this field is wrong. or make a function validates field first ...
			}
		}
		else 
			return 0;
	}
	
	public int parseInt(String strNumber) {
		if (strNumber != null && strNumber.length() > 0) {
			try {
				return Integer.parseInt(strNumber);
			} 
			catch(Exception e) {
				return -1;   // or some value to mark this field is wrong. or make a function validates field first ...
			}
		}
		else 
			return 0;
	}

}
