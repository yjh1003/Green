package com.yjh.green.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yjh.green.common.EncryptUtils;
import com.yjh.green.user.dao.UserDAO;
import com.yjh.green.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(
			String loginId
			, String password
			, String name
			, String phoneNumber
			, String email
			, String type) {
				
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, phoneNumber, email, type);
				
	}
	
	
	public boolean duplicateId(String loginId) {
		
		int count = userDAO.selectCountByLoginId(loginId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public User getUser(String loginId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
		
	}
	
	public User getUserById(int id) {
		return userDAO.selectUserById(id);
	}
	
	
}
