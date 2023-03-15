package com.yjh.green.hospital;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yjh.green.hospital.bo.HospitalBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/hospital")
@RestController
public class HospitalRestController {

	@Autowired
	private HospitalBO hospitalBO;
	
	@PostMapping("/register")
	public Map<String, String> hospitalRegister(	
		@RequestParam("hospitalName") String hospitalName
		, @RequestParam("subject") String subject
		, @RequestParam("telnumber") String telnumber
		, @RequestParam("medicalStaff") String medicalStaff
		, @RequestParam(value="homepage", required = false) String homepage
		, HttpSession session) {
		
		int adminId = (Integer)session.getAttribute("adminId");
		
		int count = hospitalBO.addRegister(adminId, hospitalName, subject, subject, telnumber, medicalStaff, homepage);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
	
		return result;
		
	}
}