package com.mj.jwork.reservation.controller;


import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.common.template.FileUpload;
import com.mj.jwork.common.template.Pagination;
import com.mj.jwork.reservation.model.service.CfrService;
import com.mj.jwork.reservation.model.vo.CfRoom;


@Controller
public class CfrController {
	
	
	@Autowired
	private CfrService cService;
	
	@RequestMapping("list.cfr")
	public ModelAndView selectCfrList(@RequestParam(value="cpage",defaultValue="1")int currentPage,ModelAndView mv) {
		int listCount = cService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		ArrayList<CfRoom>list = cService.selectList(pi);
		
		mv.addObject("list",list)
		.addObject("pi",pi)
		.setViewName("reservation/managerCfrMain");
		
		return mv;
	}
	
	
	@RequestMapping("enrollForm.cfr")
	public String enrollForm() {
		
		return "reservation/cfRoomEnrollForm";
	}
	
	@RequestMapping("insert.cfr")
	public String insertCfr(CfRoom cfr,MultipartFile upfile,HttpSession session,Model model) {
		String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/");
		cfr.setFirstImg(saveFilePath);
		int result = cService.enrollCfr(cfr);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회의실 등록 성공");
			return "redirect:list.cfr";
			
		}else {
			model.addAttribute("errorMsg", "회의실 등록 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="add.eq",produces="application/html; charset=utf-8")
	public String ajaxAddEq(String equipment) {
		return equipment;
	}
	
	@ResponseBody
	@RequestMapping(value="delete.cfr",produces="application/json; charset=utf-8")
	public String deleteCfr(String cfrName,Model model,HttpSession session) {
		
		int result= cService.deleteCfr(cfrName);
		return new Gson().toJson(result);
		
	}
	
	
	/* 
	@ResponseBody
	@RequestMapping("uploadFirstImg.cfr")
	public String uploadProfileImg(MultipartFile uploadFile,HttpSession session,String originalFile,CfRoom cfr) {
		
		if(uploadFile!=null) {
			
			String saveFilePath = FileUpload.saveFile(uploadFile,session,"resources/uploadFiles/");
			cfr.setFirstImg(saveFilePath);
			int result= cService.updateFirstImg(cfr);
			if(result>0) {
				if(!originalFile.equals("")) {
					new File(session.getServletContext().getRealPath(originalFile)).delete();
					return saveFilePath;
				}
				return session.getServletContext().getRealPath(originalFile);
			}
			
		}
		return session.getServletContext().getRealPath(originalFile);
		}
		*/
	
	@ResponseBody
	@RequestMapping(value="alist.cfr",produces="application/json; charset=utf-8" )
	public String ajaxSelectCfrList() {
		ArrayList<CfRoom>list = cService.ajaxSelectCfrList();
		 return new Gson().toJson(list);
		
	}
	
	@ResponseBody
	@RequestMapping(value="adetail.cfr",produces="application/json; charset=utf-8" )
	public String ajaxCfrDetail(String cfrName) {
		
		CfRoom cfr = cService.selectCfr(cfrName);
		return new Gson().toJson(cfr);
	}
	
	@RequestMapping("update.cfr")
	public String ajaxupdateCfr(CfRoom cfr,HttpSession session,MultipartFile reupfile) {

		if(!reupfile.getOriginalFilename().equals("")) {
		
			if(cfr.getFirstImg() != null) {
				new File(session.getServletContext().getRealPath(cfr.getFirstImg())).delete();
			
			}
				String saveFilePath= FileUpload.saveFile(reupfile, session, "resources/uploadFiles/");
				cfr.setFirstImg(saveFilePath);

			}

				int result= cService.updateCfr(cfr);
				if(result>0) {
					session.setAttribute("alertMsg", "회의실 수정 성공");
					return "redirect: list.cfr";
					
				}else {
					session.setAttribute("alertMsg", "회의실 수정 실패");
					return "redirect: list.cfr";
				}
			}
				
				
		}
	
	



