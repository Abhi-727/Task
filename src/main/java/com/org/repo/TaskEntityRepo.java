package com.org.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.org.entity.TaskEntity;
import com.org.entity.UserEntity;

public interface TaskEntityRepo extends JpaRepository<TaskEntity, Integer> {

	List<TaskEntity> findByUser(UserEntity user);
}
