package com.org.repository;

import org.springframework.data.repository.CrudRepository;

import com.org.model.User;

public interface IUserRepo extends CrudRepository<User, Integer>{
	
	
}
