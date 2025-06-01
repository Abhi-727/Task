package com.org.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.entity.UserEntity;
import com.org.formbinding.UserBinding;
import com.org.repo.UserEntityRepo;

@Service
public class UserRegImpl implements IUserReg {

	@Autowired
	private UserEntityRepo repo;

	@Override
	public String registeruser(UserBinding user) {

		String mail = user.getUserMail();
		String password = user.getUserIdentity();
		
		UserEntity userEntity = repo.findByUserMailAndUserIdentity(mail, password);
		
		if(userEntity != null)
			return "User Already Exists";
		else {
			UserEntity userdetails = new UserEntity();
			BeanUtils.copyProperties(user, userdetails);
			repo.save(userdetails);
		}

		return "Registered successfully";
	}

	@Override
	public UserEntity loginUser(String name, String identity) {

		UserEntity userpswd = repo.findByUserMailAndUserIdentity(name, identity);

		if (userpswd != null) {
			return userpswd;
		} else
			return null;

	}

}
