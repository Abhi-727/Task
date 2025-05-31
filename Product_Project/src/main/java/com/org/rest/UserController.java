package com.org.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.org.model.User;
import com.org.service.IUserService;

@RestController
public class UserController {
	
	@Autowired
	public IUserService service;
	
	@PostMapping("/save")
	public ResponseEntity<String> saveUser(@RequestBody User user){
		
	String info =service.userDetails(user);
	
		return new ResponseEntity<String>(info,HttpStatus.CREATED);
	}
	
}
