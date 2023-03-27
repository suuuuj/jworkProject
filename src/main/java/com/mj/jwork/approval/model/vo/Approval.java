package com.mj.jwork.approval.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Approval {
	 private int appNo;
	 private String docNo;
	 private int empNo;
	 private String docType;
	 private String createDate;
	 private String updateDate;
	 private String docTitle;
	 private String docContent;
	 private String docOriginName;
	 private String docFilePath;
	 private String appStatus;
	 private String docStatus;
	 private int appCount;
	 private int appTurn;
	 private String quitDate;
	 
	 
	 private String empName;
	 private String docName;
	 private String jobName;
	 private String reReason;
	 
	 private int targetNo;
	 
	 ArrayList<AppLine> alist;
	 ArrayList<Reference> rlist;

}
