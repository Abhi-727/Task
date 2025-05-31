package com.org.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.model.User;
import com.org.repository.IUserRepo;

@Service
public class UserImpl implements IUserService {
	
	@Autowired
	public IUserRepo repo;
	
	@Override
	public String userDetails(User user) {
	 User users =repo.save(user);
		return "User ordered the products with user id :"+users.getUserId();
	}

}
