package univ;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;


public class BoardDBCP {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	public BoardDBCP(){
		try{
			InitialContext xtx = new InitialContext();
			ds = (DataSource) xtx.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void connect(){
		try{
			con = ds.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void disconnect(){
		if(pstmt != null){
			try{
				pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(con != null){
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<BoardEntity> getBoardList(){
		connect();
		ArrayList<BoardEntity> list = new ArrayList<BoardEntity>();
		
		String SQL = "select * from board_1 order by id desc";
		try{
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardEntity brd = new BoardEntity();
				brd.setId(rs.getInt("id"));
				brd.setName(rs.getString("name"));
				brd.setPasswd(rs.getString("passwd"));
				brd.setTitle(rs.getString("title"));
				brd.setAddr(rs.getString("addr"));
				brd.setEmail(rs.getString("email"));
				brd.setRegdate(rs.getTimestamp("regdate"));
				brd.setContent(rs.getString("content"));
				list.add(brd);
			}
			rs.close();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			disconnect();
		}
		return list;
	}
	
	public BoardEntity getBoard(int id){
		connect();
		String SQL = "select * from board_1 where id = ?";
		BoardEntity brd = new BoardEntity();
		
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,  id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			brd.setId(rs.getInt("id"));
			brd.setName(rs.getString("Name"));
			brd.setPasswd(rs.getString("passwd"));
			brd.setTitle(rs.getString("title"));
			brd.setAddr(rs.getString("addr"));
			brd.setEmail(rs.getString("email"));
			brd.setRegdate(rs.getTimestamp("regdate"));
			brd.setContent(rs.getString("content"));
			rs.close();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			disconnect();
		}return brd;
	}
	
	//Insert method
	public boolean insertDB(BoardEntity board){
		boolean success = false;
		connect();
		String sql = "insert into board_1 values(board_seq.nextval, ?, ?, ?, ?, sysd1, board.getName())";
		try{
			pstmt.setString(2,  board.getPasswd());
			pstmt.setString(3,  board.getTitle());
			pstmt.setString(4, board.getEmail());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getAddr());
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			disconnect();
		}return success;
	}
		
	//Update method
	public boolean updateDB(BoardEntity board){
		boolean success = false;
		connect();
		String sql = "update board_1 set name=?, title=?, email=?, content=?, addr=? where id=?";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  board.getName());
			pstmt.setString(2,  board.getTitle());
			pstmt.setString(3,  board.getEmail());
			pstmt.setString(4,  board.getContent());
			pstmt.setString(5,  board.getAddr());
			pstmt.setInt(6,  board.getId());
			int rowUdt = pstmt.executeUpdate();
			
			if(rowUdt == 1)
				success = true;
		}catch(SQLException e){
			e.printStackTrace();
			return success;
		}finally{
			disconnect();
		}return success;
	}
	
	//Delete method
	public boolean deleteDB(int id){
		boolean success = false;
		connect();
		String sql = "delete from board_1 where id=?";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,  id);
			pstmt.executeUpdate();
			success = true;
		}catch(SQLException e){
			e.printStackTrace();
			return success;
		}finally{
			disconnect();
		}return success;
	}
	
	//inspection id and passwd in database
	public boolean isPasswd(int id, String passwd){
		boolean success = false;
		connect();
		String sql = "select passwd from board_1 where id=?";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,  id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String orgPasswd = rs.getString(1);
			if(passwd.equals(orgPasswd))
				success = true;
			System.out.println(success);
			rs.close();
		}catch(SQLException e){
			e.printStackTrace();
			return success;
		}finally{
			disconnect();
		}return success;
	}
}
