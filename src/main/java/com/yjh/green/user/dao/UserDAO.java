package com.yjh.green.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yjh.green.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email
			, @Param("type") String type);
	
	public int selectCountByLoginId(String loginId);
	
	public User selectUser(
			@Param("loginId")String loginId
			,@Param("password")String password);
	
	public User selectUserById(@Param("id") int id);
}
