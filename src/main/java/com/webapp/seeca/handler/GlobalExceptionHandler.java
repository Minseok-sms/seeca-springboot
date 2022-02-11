package com.webapp.seeca.handler;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

import com.webapp.seeca.dto.ResponseDto;



@ControllerAdvice // 모든 exception을 받아줌.
@RestController
public class GlobalExceptionHandler {
	
	@ExceptionHandler(value = Exception.class)
	public ResponseDto<String> handleArgumentException(Exception e) {
		return new ResponseDto<String>(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
	}

}
