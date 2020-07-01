package dao;

public class Board {
	
	private int board_id;
	private String subject;
	private String user_name;
	private int hits;
	private String reg_date;
	private String contents;
	private String category;
	private int pros;
	private int cons;
	
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int number) {
		this.board_id = number;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getUsername() {
		return user_name;
	}
	public void setUsername(String user_name) {
		this.user_name = user_name;
	}

	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getRegDate() {
		return reg_date;
	}
	public void setRegDate(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	public int getPros() {
		return pros;
	}
	public void setPros(int pros) {
		this.pros = pros;
	}
	public int getCons() {
		return cons;
	}
	public void setCons(int cons) {
		this.cons = cons;
	}
}
