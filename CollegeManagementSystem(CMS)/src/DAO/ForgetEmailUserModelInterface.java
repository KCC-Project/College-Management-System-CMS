package DAO;

import java.util.List;

import Model.ForgetEmailUserModel;

public interface ForgetEmailUserModelInterface {
	List<ForgetEmailUserModel> getForgetEmailSearched(String email);

	boolean isAuthenticated(String tableName,int id,String code);
}
