package com.yjh.green.hospital;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yjh.green.hospital.bo.HospitalBO;
import com.yjh.green.hospital.model.Hospital;

@RequestMapping("/hospital")
@Controller
public class HospitalController {
	
	@Autowired
	private HospitalBO hospitalBO;

	@GetMapping("/recommend/view")
	public String recommendView() {
		return "/hospital/recommend";
	}

	@GetMapping("/register/view")
	public String registerView() {
		return "/hospital/register";
	}

	@GetMapping("/register/list")
	public String registerList(
			HttpSession session
			, Model model) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<Hospital> hospitalList = hospitalBO.getHospitaltList(userId);
		
		model.addAttribute("hospitalList", hospitalList);
		
		return "/hospital/registerlist";
	}
	

	@GetMapping("/search")
	public String searchList(
			String keyword
			, String searchType
			, Model model) {
		
		List<Hospital> searchList = hospitalBO.SearchList(keyword, searchType);
		
		model.addAttribute("searchList", searchList);
		
		return "/hospital/search";
	}
	
	@GetMapping("/review/create")
	public String hospitalReview() {
		return "/hospital/review";
	}
	
	@GetMapping("/review/list")
	public String reviewList() {
		return "/hospital/reviewlist";
	}
	
	
}
