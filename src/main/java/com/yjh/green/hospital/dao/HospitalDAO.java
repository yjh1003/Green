package com.yjh.green.hospital.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public interface HospitalDAO {

	public int insertRegister(
			@Param("adminId") int adminId
			, @Param("hospitalName") String hospitalName
			, @Param("subject") String subject
			, @Param("telnumber") String telnumber
			, @Param("medicalStaff") String medicalStaff
			, @Param("homepage") String homepage); 
	
}
