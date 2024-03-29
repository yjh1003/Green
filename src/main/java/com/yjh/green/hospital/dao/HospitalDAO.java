package com.yjh.green.hospital.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yjh.green.hospital.model.Hospital;

@Repository
public interface HospitalDAO {

	public int insertRegister(
			@Param("userId") int userId
			, @Param("hospitalName") String hospitalName
			, @Param("subject") String subject
			, @Param("address") String address
			, @Param("telnumber") String telnumber
			, @Param("medicalStaff") String medicalStaff
			, @Param("homepage") String homepage); 
	
	public List<Hospital> selectHospitalList(@Param("userId") int userId);
	
	public int deleteHospital(@Param("hospitalId") int hospitalId);
	
	public List<Hospital> searchListContaining(
			@Param("keyword") String keyword
			,@Param("String searchType") String searchType);
	
	
	public int insertReview(
			@Param("userId") int userId
			, @Param("title") String title
			, @Param("treat") double treat
			, @Param("medicalStaff_kindness") double medicalStaff_kindness
			, @Param("staff_kindness") double staff_kindness
			, @Param("cleanliness") double cleanliness
			, @Param("content") String content);
	 						
	}
