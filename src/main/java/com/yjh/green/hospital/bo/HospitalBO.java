package com.yjh.green.hospital.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yjh.green.hospital.dao.HospitalDAO;

@Service
public class HospitalBO {

	@Autowired
	private HospitalDAO hospitalDAO;
	
	
	public int addRegister (int adminId, String hospitalName, String subject, String address, String telnumber, String medicalStaff, String hompage) {
		
		return hospitalDAO.insertRegister(adminId, hospitalName, subject, telnumber, medicalStaff, hompage);
	}
}
