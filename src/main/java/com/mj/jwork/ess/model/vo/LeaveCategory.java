package com.mj.jwork.ess.model.vo;

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
public class LeaveCategory {
	
	private int lCategoryNo; // 휴가구분번호
	private String lCategoryName; // 휴가구분번호 0:연차 1:조의(3) 2:산전후(90) 3:결혼(1) 4:결혼(3) 5:리프레쉬휴가 6:조의 7:산전후(120) 8:공가

}
