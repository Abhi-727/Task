package com.org.service;

import java.util.List;

import com.org.entity.TaskEntity;
import com.org.formbinding.TaskBinding;

public interface ITaskService {
	
	TaskEntity createTask(TaskBinding taskbinding, Integer userId) throws Exception;
	
	
	List<TaskEntity> taskList(Integer userId);

	String deleteTask(Integer taskId, Integer userId);
}
