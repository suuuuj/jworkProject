package com.mj.jwork.reservation.model.vo;

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
public class Car {//차량테이블
	
	 private String carName;
	 private String carImg;
	 private String carType;
	 private String gearType;
	 private String color;
	 private String maker;
	 private String fuelType;
	 private String modelYear;
	 private String etc;
	 private String status;

}
