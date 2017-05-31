package SERVICE.Impl;

import DAO.LoginDAOInterface;
import DAO.Impl.LoginDAOImpl;
import Model.LoginModel;
import SERVICE.LoginServiceInterface;

public class LoginServiceImpl implements LoginServiceInterface {
	LoginDAOInterface loginInterface = new LoginDAOImpl();

	public boolean getUserEntryPassword(LoginModel loginModel) {
		return loginInterface.getUserEntryPassword(loginModel);
	}

}
