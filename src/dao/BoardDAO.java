package dao;
import dao.Categorys.category;
import dao.DB_connection;
import java.sql.*;
import java.util.ArrayList;


public class BoardDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static BoardDAO instance;
	
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		if(instance==null) instance = new BoardDAO();
		return instance;
	}
	
	public String getDate() {
		
		String sql = "select curdate()";
		try {
			conn = DB_connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
			rs.close();
			conn.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}
	
	
	public String gettime() {
			
			String sql = "select curtime()";
			try {
				conn = DB_connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getString(1);
				}
				
				conn.close();
				pstmt.close();
				rs.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return "";
	}
	
	public ArrayList<Board> getBoards_simple(String category, int page){
		String sql = "select board_id,subject, user_name, hits,reg_date from board where category=? order by board_id desc";
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			conn = DB_connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board bd = new Board();
				bd.setBoard_id(rs.getInt(1));
				bd.setSubject(rs.getString(2));
				bd.setUsername(rs.getString(3));
				bd.setHits(rs.getInt(4));
				bd.setRegDate(rs.getString(5));
				list.add(bd);
			}
			
			conn.close();
			if(pstmt!=null) pstmt.close();
			rs.close();
			
		}catch(Exception e) {
			
		}
		return list;
	}
	
	public ArrayList<Board> getBoards_simple_all(int page){
		String sql = "select board_id,subject, user_name, hits,reg_date from board order by board_id desc";
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			conn = DB_connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board bd = new Board();
				bd.setBoard_id(rs.getInt(1));
				bd.setSubject(rs.getString(2));
				bd.setUsername(rs.getString(3));
				bd.setHits(rs.getInt(4));
				bd.setRegDate(rs.getString(5));
				list.add(bd);
			}
			
			conn.close();
			if(pstmt!=null) pstmt.close();
			rs.close();
			
		}catch(Exception e) {
			
		}
		return list;
	}
	
	public ArrayList<Board> getBoards_simple_hot(int page){
		String sql = "select board_id,subject, user_name, hits,reg_date from board order by hits desc";
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			conn = DB_connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board bd = new Board();
				bd.setBoard_id(rs.getInt(1));
				bd.setSubject(rs.getString(2));
				bd.setUsername(rs.getString(3));
				bd.setHits(rs.getInt(4));
				bd.setRegDate(rs.getString(5));
				list.add(bd);
			}
			
			conn.close();
			if(pstmt!=null) pstmt.close();
			rs.close();
			
		}catch(Exception e) {
			
		}
		return list;
	}
	
	public Board getBoard_detail(int board_id){
		String sql = "select * from board where board_id=?";
		Board bd = new Board();
		try {
			conn = DB_connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bd.setBoard_id(rs.getInt(1));
				bd.setCategory(rs.getString(3));
				bd.setUsername(rs.getString(4));
				bd.setSubject(rs.getString(5));
				bd.setContents(rs.getString(6));
				bd.setHits(rs.getInt(7) + 1);
				bd.setRegDate(rs.getString(8));
				bd.setPros(rs.getInt(9));
				bd.setCons(rs.getInt(10));
			}
			conn.close();
			if(pstmt!=null) pstmt.close();
			rs.close();
			
		}catch(Exception e) {
			
		}
		return bd;
	}
	
	public int view(int bid, int hits) {
		
		String sql = "update board set hits=? where board_id=?";
		int rs_check = 0;
		
		try {
			conn = DB_connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hits);
			pstmt.setInt(2, bid);
			rs_check = pstmt.executeUpdate();
			
			if(pstmt!=null) pstmt.close();
			conn.close();
			
		}catch(Exception e) {
			
		}
		return rs_check;
	}
	
	public int pros_up(int bid) {
		
		String sql = "update board set pros=pros+1 where board_id=?";
		int rs_check = 0;
		System.out.println("아아아아 : " + bid);
		try {
			conn = DB_connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs_check = pstmt.executeUpdate();
			
			if(pstmt!=null) pstmt.close();
			conn.close();
			
		}catch(Exception e) {
			
		}
		return rs_check;
	}
	
	public int cons_up(int bid) {
		
		String sql = "update board set cons=cons+1 where board_id=?";
		int rs_check = 0;
		
		try {
			conn = DB_connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs_check = pstmt.executeUpdate();
			
			if(pstmt!=null) pstmt.close();
			conn.close();
			
		}catch(Exception e) {
			
		}
		return rs_check;
	}
	
	public int com_up(int cid) {
		
		String sql = "update comment set up=up+1 where comment_id=?";
		int rs_check = 0;
		
		try {
			conn = DB_connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cid);
			rs_check = pstmt.executeUpdate();
			
			if(pstmt!=null) pstmt.close();
			conn.close();
			
		}catch(Exception e) {
			
		}
		return rs_check;
	}
	

	public int insertVisitor(String reg_date, String user_id, String user_name, String category, String subject, String content) {
		
		String sql = "insert into board(reg_date, user_id, user_name, category, subject, contents) values(?,?,?,?,?,?)";
		int rs_check=0;
		
		try {
			conn = DB_connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reg_date);
			pstmt.setString(2, user_id);
			pstmt.setString(3, user_name);
			pstmt.setString(4, category);
			pstmt.setString(5, subject);
			pstmt.setString(6, content);
			
			rs_check=pstmt.executeUpdate();
			
			if(pstmt!=null) pstmt.close();
			conn.close();
			
		}catch(Exception e) {
			
		}
		
		return rs_check;
	}
	
	public int insertComment(String reg_date, String user_id, String user_name, String content, int board_id, String stand ,int opposition) {
			
		String sql = "insert into comment(reg_date, user_id, user_name, contents, board_id,stand,opposition) values(?,?,?,?,?,?,?)";
		int rs_check=0;
		
		try {
			conn = DB_connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reg_date);
			pstmt.setString(2, user_id);
			pstmt.setString(3, user_name);
			pstmt.setString(4, content);
			pstmt.setInt(5, board_id);
			pstmt.setString(6, stand);
			pstmt.setInt(7, opposition);
			
			
			rs_check=pstmt.executeUpdate();
			
			if(pstmt!=null) pstmt.close();
			conn.close();
			
		}catch(Exception e) {
			
		}
		
		return rs_check;
	}

	public int insertComment(String reg_date, String user_id, String user_name, String content, int board_id, String stand) {
		
		String sql = "insert into comment(reg_date, user_id, user_name, contents, board_id, stand) values(?,?,?,?,?,?)";
		int rs_check=0;
		
		try {
			conn = DB_connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reg_date);
			pstmt.setString(2, user_id);
			pstmt.setString(3, user_name);
			pstmt.setString(4, content);
			pstmt.setInt(5, board_id);
			pstmt.setString(6, stand);
			rs_check=pstmt.executeUpdate();
			
			if(pstmt!=null) pstmt.close();
			conn.close();
			
		}catch(Exception e) {
			
		}
		
		return rs_check;
	}
	
	public ArrayList<Comment> getComments(int bid, String stand, int page){
		String sql = "select comment_id,user_name,contents,reg_date,up,opposition from comment where board_id=? AND stand=? order by comment_id asc";
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			conn = DB_connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			pstmt.setString(2, stand);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Comment bd = new Comment();
				bd.setComment_id(rs.getInt(1));
				bd.setUsername(rs.getString(2));
				bd.setContents(rs.getString(3));
				bd.setRegDate(rs.getString(4));
				bd.setUP(rs.getInt(5));
				bd.setOpposition(rs.getInt(6));
				list.add(bd);
			}
			
			conn.close();
			if(pstmt!=null) pstmt.close();
			rs.close();
			
		}catch(Exception e) {
			
		}
		return list;
	}
}