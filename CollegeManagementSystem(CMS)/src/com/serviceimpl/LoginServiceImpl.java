package com.serviceimpl;

import com.dao.login_logout.LoginDAOInterface;
import com.daoimpl.login_logout.LoginDAOImpl;
import com.model.LoginModel;
import com.service.LoginServiceInterface;

public class LoginServiceImpl implements LoginServiceInterface {
	LoginDAOInterface loginInterface = new LoginDAOImpl();

	public boolean getUserEntryPassword(LoginModel loginModel) {
		return loginInterface.getUserEntryPassword(loginModel);
	}

}
