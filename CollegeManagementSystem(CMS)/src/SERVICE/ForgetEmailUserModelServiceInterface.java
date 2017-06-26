package SERVICE;

import java.util.List;

import Model.ForgetEmailUserModel;

public interface ForgetEmailUserModelServiceInterface {
	List<ForgetEmailUserModel> getForgetEmailSearched(String email);

	boolean isAuthenticated(String tableName,int id,String code);
	boolean resetPassword(String tableName,int id,String verificationCode,String password); 
}
