package com.yjh.green.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yjh.green.hospital.bo.HospitalBO;
import com.yjh.green.hospital.dao.Page;
import com.yjh.green.hospital.model.Hospital;

import jakarta.servlet.http.HttpSession;

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
	

//	@GetMapping("/search")
//	public String searchList(
//			String keyword
//			, String searchType
//			, Model model
//			, @PageableDefault(page = 0, size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
//		
//		Page<Hospital> searchList = hospitalBO.SearchList(keyword, searchType, pageable);
//		
//		model.addAttribute("searchList", searchList);
//		
//		return "/hospital/search";
//	}
	
	@GetMapping("/review/create")
	public String hospitalReview() {
		return "/hospital/review";
	}
	
	
}
