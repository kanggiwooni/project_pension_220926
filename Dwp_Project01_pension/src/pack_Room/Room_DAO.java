package pack_Room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class Room_DAO {
	
	private DBConnectionMgr objPool = null;
	private Connection objConn= null;
	private Statement objStmt = null;
	private PreparedStatement objPstmt = null;
	private ResultSet objRS = null;

	Room_VO objVO = null;
	List<Room_VO> objList = null;
	
	private String sql = "";	
	
	public Room_DAO() {
		objPool = DBConnectionMgr.getInstance();
	}
	
	//객실정보 출력 메서드 시작
	public List<Room_VO> mtd_roomInfo(int type){
		
		try {
			objConn = objPool.getConnection();
			sql = "select rName, rLimit, rPrice, rPictures from roomInfo where num="+type;
			objStmt = objConn.createStatement();
			objRS = objStmt.executeQuery(sql);
			
			objList = new Vector<Room_VO>();
			
			if(objRS.next()) {
					objVO = new Room_VO();
					
					objVO.setrName(objRS.getString("rName"));
					objVO.setrLimit(objRS.getInt("rLimit"));
					objVO.setrPrice(objRS.getInt("rPrice"));
					objVO.setrPictures(objRS.getInt("rPictures"));
					objList.add(objVO);
			}
		}catch(Exception e) {
			System.out.print("roomInfo e : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		return objList;
	}
	//객실정보 출력 메서드 끝
	
}
