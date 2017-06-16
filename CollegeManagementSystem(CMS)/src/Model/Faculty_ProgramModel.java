package Model;

public class Faculty_ProgramModel {
	private String faculty_Programe_Name;
	private int ID;

	public Faculty_ProgramModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Faculty_ProgramModel(String faculty_Programe_Name, int iD) {
		super();
		this.faculty_Programe_Name = faculty_Programe_Name;
		ID = iD;
	}

	public String getFaculty_Programe_Name() {
		return faculty_Programe_Name;
	}

	public void setFaculty_Programe_Name(String faculty_Programe_Name) {
		this.faculty_Programe_Name = faculty_Programe_Name;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	@Override
	public String toString() {
		return "Faculty_ProgramModel [faculty_Programe_Name=" + faculty_Programe_Name + ", ID=" + ID + "]";
	}

}
