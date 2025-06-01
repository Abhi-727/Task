package com.org.service;

import java.security.PublicKey;
import java.util.Optional;

import com.org.entity.UserEntity;
import com.org.formbinding.UserBinding;

public interface IUserReg {
	
	String registeruser(UserBinding user);
	UserEntity loginUser(String name, String identity);
	
}
