package Model;

public class ForgetEmailUserModel {
	private int id;
	private String email;
	private String type;
	public ForgetEmailUserModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "ForgetEmailUserModel [id=" + id + ", email=" + email + ", type=" + type + "]";
	}

}
