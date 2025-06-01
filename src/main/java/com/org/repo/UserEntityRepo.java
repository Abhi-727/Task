package com.org.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.org.entity.UserEntity;

public interface UserEntityRepo extends JpaRepository<UserEntity, Integer> {

	UserEntity findByUserMailAndUserIdentity(String name, String identity);

	UserEntity findByUserId(Integer userid);

}
