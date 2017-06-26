package com.service;

import java.util.List;

import com.model.ForgetEmailUserModel;

public interface ForgetEmailUserModelServiceInterface {
	List<ForgetEmailUserModel> getForgetEmailSearched(String email);

	boolean isAuthenticated(String tableName,int id,String code);
	boolean resetPassword(String tableName,int id,String verificationCode,String password); 
}
