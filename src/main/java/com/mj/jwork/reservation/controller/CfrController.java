package com.mj.jwork.reservation.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mj.jwork.common.template.FileUpload;
import com.mj.jwork.reservation.model.service.CfrService;
import com.mj.jwork.reservation.model.vo.CfRoom;


@Controller
public class CfrController {
	
	
	@Autowired
	private CfrService cService;
	
	
	@RequestMapping("enrollForm.cfr")
	public String enrollForm() {
		
		return "reservation/cfRoomEnrollForm";
	}
	
	@RequestMapping("insert.cfr")
	public String insertCfr(CfRoom cfr,MultipartFile upfile,HttpSession session,Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
		
			
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/");
			
			cfr.setFirstImg(saveFilePath);
			
		}
		int result = cService.enrollCfr(cfr);
		
		if(result>0) {//성공 = > 알랄문구
			session.setAttribute("alertMsg", "회의실 등록 성공");
			return "redirect:list.cfr";
			
		}else {
			model.addAttribute("errorMsg", "회의실 등록 실패");
			return "common/errorPage";
		}
	}
	
	
	
	@ResponseBody
	@RequestMapping("uploadFirstImg.cfr")
	public void uploadProfileImg(MultipartFile uploadFile,HttpSession session,CfRoom cfr) {
		
		
		}
	
	@ResponseBody
	@RequestMapping(value="add.eq",produces="application/html; charset=utf-8")
	public String ajaxAddEq(String equipment) {
		return equipment;
	}
	}



