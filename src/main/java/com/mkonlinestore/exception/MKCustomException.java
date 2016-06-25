package com.mkonlinestore.exception;

public class MKCustomException extends RuntimeException{
	   
	private static final long serialVersionUID = 1L;
	
	private String exceptionMsg;
	   
	   public MKCustomException(String exceptionMsg) {
	      this.exceptionMsg = exceptionMsg;
	   }
	   
	   public String getExceptionMsg(){
	      return this.exceptionMsg;
	   }
	   
	   public void setExceptionMsg(String exceptionMsg) {
	      this.exceptionMsg = exceptionMsg;
	   }
	}
