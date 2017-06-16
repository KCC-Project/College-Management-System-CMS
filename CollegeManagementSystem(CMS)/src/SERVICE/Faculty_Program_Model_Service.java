package SERVICE;

import java.util.List;

import Model.Faculty_ProgramModel;

public interface Faculty_Program_Model_Service {
	List<Faculty_ProgramModel> getAllRecord();
	List<Faculty_ProgramModel> getAllRecord(int id);
}
