package com.org.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;


import jakarta.transaction.Transactional;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.entity.TaskEntity;
import com.org.entity.UserEntity;
import com.org.formbinding.TaskBinding;
import com.org.repo.TaskEntityRepo;
import com.org.repo.UserEntityRepo;

@Service
public class TaskSerImpl implements ITaskService {

	@Autowired
	private TaskEntityRepo taskrepo;

	@Autowired
	private UserEntityRepo userrepo;

	
	@Override
	@Transactional
	public TaskEntity createTask(TaskBinding task, Integer userId) throws Exception {

		TaskEntity taskentity = new TaskEntity();

		BeanUtils.copyProperties(task, taskentity);

		if(taskentity.getTaskDate() == null) {
			throw new Exception("Task completion date is mandatory");
		}

		long givenDate = taskentity.getTaskDate().toEpochDay();
		long currentDate = LocalDate.now().toEpochDay();

		if(givenDate < currentDate) {
			throw new Exception("Only current date and future dates are allowed");
		}

		if (taskentity.getTaskTime() != null) {
			LocalDateTime taskDateTime = LocalDateTime.of(taskentity.getTaskDate(), taskentity.getTaskTime());
			if (taskDateTime.isBefore(LocalDateTime.now())) {
				throw new Exception("Only future times are allowed");
			}
		}

		TaskEntity taskinfo = taskrepo.save(taskentity);
		UserEntity user = userrepo.findByUserId(userId);

		if (user != null) {
			taskinfo.setUser(user);
			taskrepo.save(taskinfo);
		}
		return taskinfo;
	}

	@Override
	public List<TaskEntity> taskList(Integer userId) {
		UserEntity user = userrepo.findByUserId(userId);
		List<TaskEntity> task = taskrepo.findByUser(user);
		return task;
	}

	@Override
	@Transactional
	public String deleteTask(Integer taskId, Integer userId) {
		UserEntity user = userrepo.findByUserId(userId);

		if (user != null) {
			Optional<TaskEntity> task = taskrepo.findById(taskId);

			if (task.isPresent() && task.get().getUser().getUserId().equals(userId)) {
				taskrepo.deleteById(taskId);
				return "DELETED";
			}
		}
		return "NOT_FOUND";
	}

}

