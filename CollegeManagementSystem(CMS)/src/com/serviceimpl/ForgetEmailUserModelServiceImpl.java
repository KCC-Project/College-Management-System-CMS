package com.serviceimpl;

import java.util.List;

import com.dao.forget_reset.ForgetEmailUserModelInterface;
import com.daoimpl.forget_reset_password.ForgetEmailUserModelInterfaceImpl;
import com.model.ForgetEmailUserModel;
import com.service.ForgetEmailUserModelServiceInterface;

public class ForgetEmailUserModelServiceImpl implements ForgetEmailUserModelServiceInterface {
	ForgetEmailUserModelInterface forget = new ForgetEmailUserModelInterfaceImpl();

	public List<ForgetEmailUserModel> getForgetEmailSearched(String email) {
		return forget.getForgetEmailSearched(email);
	}

	public boolean isAuthenticated(String tableName, int id, String code) {
		return forget.isAuthenticated(tableName, id, code);
	}

	@Override
	public boolean resetPassword(String tableName, int id, String verificationCode, String password) {
		return forget.resetPassword(tableName, id, verificationCode, password);
	}

}
