package SERVICE;

import java.util.List;

import Model.StudentModel;

public interface StudentServiceInterface {
	public boolean save(StudentModel studentModel);
	List<StudentModel> getAllRecord();
	StudentModel readId(int id);
	int delete(int id);
	int update(StudentModel stu);
}
