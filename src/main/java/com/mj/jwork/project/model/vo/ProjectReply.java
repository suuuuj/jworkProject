package com.mj.jwork.project.model.vo;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class ProjectReply { //프로젝트 댓글 테이블

	 private int replyNo;
	 private int refProject;
	 private int replyWriter;
	 private String replyContent;
	 private Date enrollDate;
}
