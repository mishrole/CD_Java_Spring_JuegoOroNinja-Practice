package com.codingdojo.oroninja.entity;

import java.util.Date;

import lombok.Data;

@Data
public class Activity {
	private String game;
	private String type;
	private Integer balance;
	private Integer amount;
	private Date createdAt;
}
