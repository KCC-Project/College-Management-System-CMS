package SERVICE;

import java.util.List;

import Model.ForgetEmailUserModel;

public interface ForgetEmailUserModelServiceInterface {
	List<ForgetEmailUserModel> getForgetEmailSearched(String email);
}
