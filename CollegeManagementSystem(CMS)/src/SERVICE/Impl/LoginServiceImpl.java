package SERVICE.Impl;

import DAO.LoginDAOInterface;
import DAO.Impl.LoginDAOImpl;
import Model.LoginModel;
import SERVICE.LoginServiceInterface;

public class LoginServiceImpl implements LoginServiceInterface {
	LoginDAOInterface loginInterface = new LoginDAOImpl();

	public void getUserEntryPassword(LoginModel loginModel) {
		loginInterface.getUserEntryPassword(loginModel);
	}

}
