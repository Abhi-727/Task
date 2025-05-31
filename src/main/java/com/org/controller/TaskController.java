package com.org.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.org.entity.TaskEntity;
import com.org.formbinding.TaskBinding;
import com.org.formbinding.UserBinding;
import com.org.service.ITaskService;
import com.org.service.IUserReg;


@Controller
public class TaskController{

	@Autowired
	private ITaskService service;
	
	@Autowired
	private IUserReg userService;

	private Integer userId;

	@GetMapping("/createtask")
	public String taskPage(@RequestParam Integer userId, Model model) {

		this.userId = userId;

		TaskBinding taskbinding = new TaskBinding();
		model.addAttribute("TaskBinding", taskbinding);
		model.addAttribute("userId", userId);

		// model.addAttribute("task", new TaskBinding());

		return "createtask";
	}

	@PostMapping("/createtask")
	public String handleTaskPage(@ModelAttribute("TaskBinding") TaskBinding taskbinding, Model model) {		
		
		
		TaskEntity taskdetails=service.createTask(taskbinding, userId);
		
		System.out.println(taskdetails);
		
		UserBinding userbinding = new UserBinding();
		model.addAttribute("UserBinding", userbinding);
		
		 // UserEntity task = taskbinding.getUserId();
		  
		 // System.out.println(task);
		 
		model.addAttribute("task", "Task created");
		model.addAttribute("userId", userId);

		System.out.println("create task : userid  checking " +userId);
		
		return "redirect:/createtask?userId="+userId;
	}
	
	
	  @GetMapping("/viewtask") 
	  public String displayTask(@RequestParam Integer userId,  Model model) {
		  
		this.userId =userId;
		
		UserBinding taskbinding = new UserBinding();
		model.addAttribute("UserBinding", taskbinding);
		
		  List<TaskEntity> list = service.taskList(userId);
		  
		  model.addAttribute("task", list);
		  model.addAttribute("userId", userId);
		  
		  System.out.println("checking userid : " + userId);
		  return "viewtask";
	  }

	  @GetMapping("/delete")
	public String deletetask(@RequestParam Integer userId, @RequestParam Integer taskId) {
		this.userId = userId;
		  service.deleteTask(taskId, userId);

		  return "redirect:/viewtask?userId="+userId;
	  }
}