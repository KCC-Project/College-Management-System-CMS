package SERVICE.Impl;

import DAO.StudentModelInterface;
import DAO.Impl.StudentModelImpl;
import Model.StudentModel;
import SERVICE.StudentServiceInterface;

public class StudentServiceImpl implements StudentServiceInterface {

	StudentModelInterface model = new StudentModelImpl();

	public boolean save(StudentModel studentModel) {
		return model.save(studentModel);

	}

}
