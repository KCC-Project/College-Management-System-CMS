package com.dao;

import java.util.List;

import com.model.ForgetEmailUserModel;

public interface ForgetEmailUserModelInterface {
	List<ForgetEmailUserModel> getForgetEmailSearched(String email);  //for getting email,code,tablename,id
	boolean isAuthenticated(String tableName,int id,String code);     //for checking if info send from gmail is valid or not
	boolean resetPassword(String tableName,int id,String verificationCode,String password);   //for resetting password
}
