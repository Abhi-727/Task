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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class TaskController{

	@Autowired
	private ITaskService service;

	private Integer userId;

	@GetMapping("/createtask")
	public String taskPage(@RequestParam Integer userId, Model model) {

		this.userId = userId;

		TaskBinding taskbinding = new TaskBinding();
		model.addAttribute("TaskBinding", taskbinding);
		model.addAttribute("userId", userId);

		return "createtask";
	}

	@PostMapping("/createtask")
	public String handleTaskPage(@ModelAttribute("TaskBinding") TaskBinding taskbinding, Model model, RedirectAttributes redirectAttributes) {
		
		try {
			service.createTask(taskbinding, userId);
			redirectAttributes.addFlashAttribute("task", "Task created !");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMsg", e.getMessage());
			return "redirect:/createtask?userId="+userId;
		}

		model.addAttribute("userId", userId);
		return "redirect:/createtask?userId="+userId;
	}
	
	
	  @GetMapping("/viewtask") 
	  public String displayTask(@RequestParam Integer userId,  Model model) {
		  
		this.userId =userId;
		
		UserBinding taskbinding = new UserBinding();
		model.addAttribute("UserBinding", taskbinding);

		try {
			List<TaskEntity> list = service.taskList(userId);
			model.addAttribute("task", list);
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "viewtask";
		}
		  model.addAttribute("userId", userId);
		  return "viewtask";
	  }

	@GetMapping("/delete")
	public String deleteTask(@RequestParam Integer userId, @RequestParam Integer taskId) {
		String status = service.deleteTask(taskId, userId);
		return "redirect:/viewtask?userId=" + userId;
	}
}