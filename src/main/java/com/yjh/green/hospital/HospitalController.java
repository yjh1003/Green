package com.yjh.green.hospital;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/hospital")
@Controller
public class HospitalController {

	@GetMapping("/recommend/view")
	public String recommendView() {
		return "/hospital/recommend";
	}

	@GetMapping("/register/view")
	public String registerView() {
		return "/hospital/register";
	}
	
}
