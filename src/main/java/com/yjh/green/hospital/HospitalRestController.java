package com.yjh.green.hospital;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.yjh.green.hospital.bo.HospitalBO;

@RequestMapping("/hospital")
@RestController
public class HospitalRestController {

	@Autowired
	private HospitalBO hospitalBO;
	
	@PostMapping("/register")
	public Map<String, String> hospitalRegister(
		 @RequestParam("hospitalName") String hospitalName
		, @RequestParam("subject") String subject
		, @RequestParam("address") String address
		, @RequestParam("telnumber") String telnumber
		, @RequestParam("medicalStaff") String medicalStaff
		, @RequestParam(value="homepage", required = false) String homepage
		, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = hospitalBO.addRegister(userId, hospitalName, subject, address, telnumber, medicalStaff, homepage);

		Map<String, String> result = new HashMap<>();
			
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
	
		return result;
		
	}
	
	@GetMapping("/delete")
	public Map<String, String> deleteHospital(@RequestParam("hospitalId") int hospitalId) {
		
		int count = hospitalBO.deleteHospital(hospitalId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	
	@PostMapping("/review")
	public Map<String, String> hospitalReview(
			@RequestParam("hospitalId") int hospitalId
			, @RequestParam("title") String title
			, @RequestParam("treat") double treat
			, @RequestParam("medicalStaff_kindness") double medicalStaff_kindness
			, @RequestParam("staff_kindness") double staff_kindness
			, @RequestParam("cleanliness") double cleanliness
			, @RequestParam("avg_evaluation") double avg_evaluation
			, @RequestParam("content") String content
			, @RequestParam("imagePath") MultipartFile imagePath
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = hospitalBO.addReview(userId, hospitalId, title, treat, medicalStaff_kindness, staff_kindness, cleanliness, avg_evaluation, content, imagePath);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
			

	
}
