import java.sql.Timestamp;

public class MemberDTO {
	private String id;
	private String pass;
	private String name;
	private Timestamp date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPass() {
		return pass;
	}
	public void setPass(String id) {
		this.id = id;
	}
	
	public String setName() {
		return name;
	}
	public void getName(String name) {
		this.name = name;
	}
	
	public Timestamp setDate() {
		return date;
	}
	public void getDate(Timestamp date) {
		this.date = date;
	}
}
