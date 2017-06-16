package SERVICE.Impl;

import java.util.List;

import DAO.Faculty_Program_Model_Interface;
import DAO.Impl.Faculty_Program_Model_Interface_Impl;
import Model.Faculty_ProgramModel;
import SERVICE.Faculty_Program_Model_Service;

public class Faculty_Program_Model_Service_Impl implements Faculty_Program_Model_Service {
	Faculty_Program_Model_Interface model = new Faculty_Program_Model_Interface_Impl();

	@Override
	public List<Faculty_ProgramModel> getAllRecord() {

		return model.getAllRecord();
	}

	@Override
	public List<Faculty_ProgramModel> getAllRecord(int id) {
		return model.getAllRecord(id);
	}

}
