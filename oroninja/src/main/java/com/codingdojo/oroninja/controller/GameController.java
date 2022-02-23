package com.codingdojo.oroninja.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.oroninja.entity.Activity;

@Controller
public class GameController {
	
	@RequestMapping("/")
	public String index() {
		return "redirect:/gold";
	}
	
	@RequestMapping(value = "/gold", method = RequestMethod.GET)
	public String gold(HttpSession session) {
		if (session.getAttribute("balance") == null) {
			session.setAttribute("balance", 0);
		}
		
		if (session.getAttribute("activities") == null) {
			ArrayList<Activity> activities = new ArrayList<Activity>();
			session.setAttribute("activities", activities);
		}
		
		System.out.println("get: " + session.getAttribute("activities"));
		
		return "index";
	}
	
	@RequestMapping(value = "/game", method = RequestMethod.POST)
	public String game(@RequestParam(value = "q", required = true) String locationQuery, HttpSession session) {
		Integer balance = (int) session.getAttribute("balance");
		Activity result = game(locationQuery, balance);

		if (session.getAttribute("activities") != null) {
			System.out.println("post: " + session.getAttribute("activities"));
			ArrayList<Activity> activities = (ArrayList<Activity>) session.getAttribute("activities");
			activities.add(result);
			session.setAttribute("activities", activities);
		}
		
		session.setAttribute("balance", result.getBalance());

		return "redirect:/gold";
	}
	
	@RequestMapping("/reset")
	public String reset(HttpSession session) {
		session.setAttribute("balance", 0);
		ArrayList<Activity> activities = new ArrayList<Activity>();
		session.setAttribute("activities", activities);
		return "redirect:/gold";
	}
	
	
	
	
	private Activity game(String location, Integer balance) {
		
		Activity activity = new Activity();
		
		if (location.contains("casino")) {
			Integer gold = randomGenerator(2, 50);
			Integer type = randomGenerator(0, 1);
			
			if (type == 0) {
				activity.setType("earned");
				activity.setBalance(balance + gold);
			} else {
				activity.setType("lost");
				activity.setBalance(balance - gold);
			}
			
			activity.setAmount(gold);
			activity.setCreatedAt(new Date());
			activity.setGame(location);
		} else {
			activity.setType("earned");
			activity.setCreatedAt(new Date());
			
			if (location.contains("farm")) {
				Integer gold = randomGenerator(10, 20);
				activity.setBalance(balance + gold);
				activity.setAmount(gold);
				activity.setGame(location);
			} else if (location.contains("cave")) {
				Integer gold = randomGenerator(5, 10);
				activity.setBalance(balance + gold);
				activity.setAmount(gold);
				activity.setGame(location);
			} else if (location.contains("house")) {
				Integer gold = randomGenerator(2, 5);
				activity.setBalance(balance + gold);
				activity.setAmount(gold);
				activity.setGame(location);
			}
		}
		
		return activity;
	}
	
	private Integer randomGenerator(int min, int max) {
		Random random = new Random();
		int randomNumber = random.nextInt((max + 1) - min);
		int result = randomNumber + min;
		return result;
	}
	
}
