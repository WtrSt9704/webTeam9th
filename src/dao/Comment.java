package dao;

public class Comment {
	
	private int comment_id;
	private int board_id;
	private String user_id;
	private String user_name;
	private String contents;
	private String reg_date;
	private String stand;
	private int up;
	private int opposition;
	
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int number) {
		this.board_id = number;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public String getUserId() {
		return user_id;
	}
	public void setUserId(String user_id) {
		this.user_id = user_id;
	}
	public String getUsername() {
		return user_name;
	}
	public void setUsername(String user_name) {
		this.user_name = user_name;
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
	public String getStand() {
		return stand;
	}
	public void setStand(String stand) {
		this.stand = stand;
	}
	public int getUP() {
		return up;
	}
	public void setUP(int up) {
		this.up = up;
	}
	public int getOpposition() {
		return opposition;
	}
	public void setOpposition(int opposition) {
		this.opposition = opposition;
	}
}
