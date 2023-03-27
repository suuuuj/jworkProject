package com.mj.jwork.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mj.jwork.project.model.service.ProjectService;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService pService;

	
	@RequestMapping("enrollForm.project")
	public String projectEnrollForm() {
		
		return "project/projectEnrollForm";
	}
}
