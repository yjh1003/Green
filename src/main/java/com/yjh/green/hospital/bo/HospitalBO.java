package com.yjh.green.hospital.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yjh.green.common.FileManagerService;
import com.yjh.green.hospital.dao.HospitalDAO;
import com.yjh.green.hospital.model.Hospital;

@Service
public class HospitalBO {

	@Autowired
	private HospitalDAO hospitalDAO;
	
	
	public int addRegister (int userId, String hospitalName, String subject, String address, String telnumber, String medicalStaff, String homepage) {
		
		return hospitalDAO.insertRegister(userId, hospitalName, subject, address, telnumber, medicalStaff, homepage);
	}
	
	public List<Hospital> getHospitaltList(int userId) {
		return hospitalDAO.selectHospitalList(userId);
	}
	
	public int deleteHospital(int hospitalId) {
				
		return hospitalDAO.deleteHospital(hospitalId);
	}
	
	public List<Hospital> SearchList(String keyword, String searchType) {
		
		List<Hospital> searchList = hospitalDAO.searchListContaining(keyword, searchType);
		
		return searchList;
	}
	
	public int addReview (int userId, int hospitalId, String title, double treat, double medicalStaff_kindness, double staff_kindness, double cleanliness, double avg_evaluation, String content, MultipartFile imagePath) {
		
		String imageFile = FileManagerService.saveFile(userId, imagePath);
		
		return hospitalDAO.insertReview(userId, hospitalId, title, treat, medicalStaff_kindness, staff_kindness, cleanliness, avg_evaluation, content, imageFile);
	}
	
	
}
