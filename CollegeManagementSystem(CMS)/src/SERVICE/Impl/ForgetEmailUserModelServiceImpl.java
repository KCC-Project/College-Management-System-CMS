package SERVICE.Impl;

import java.util.List;

import DAO.ForgetEmailUserModelInterface;
import DAO.Impl.ForgetEmailUserModelInterfaceImpl;
import Model.ForgetEmailUserModel;
import SERVICE.ForgetEmailUserModelServiceInterface;

public class ForgetEmailUserModelServiceImpl implements ForgetEmailUserModelServiceInterface {
	ForgetEmailUserModelInterface forget = new ForgetEmailUserModelInterfaceImpl();

	public List<ForgetEmailUserModel> getForgetEmailSearched(String email) {
		return forget.getForgetEmailSearched(email);
	}

	public boolean isAuthenticated(String tableName, int id, String code) {
		return forget.isAuthenticated(tableName, id, code);
	}

}
