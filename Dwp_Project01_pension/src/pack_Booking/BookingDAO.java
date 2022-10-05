package pack_Booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import pack_BBS.BBS_VO;
import pack_DBCP.DBConnectionMgr;

public class BookingDAO {
	
	private DBConnectionMgr objPool;
	private Connection objConn;
	private Statement objStmt;
	private PreparedStatement objPstmt;
	private ResultSet objRS;
	
	public BookingDAO() {
		objPool = DBConnectionMgr.getInstance();
	}
	
	/* 모든 객실 정보 불러오기 시작 */
	public List<BookingVO> mtd_getRoomInfo() {
		
		List<BookingVO> objList = new Vector<BookingVO>();
		
		try {
			objConn = objPool.getConnection();;
			
			String sql = "select num, rName, rLimit, rPrice from roomInfo";
			sql += " order by num asc";
			
			objStmt = objConn.createStatement();
			objRS = objStmt.executeQuery(sql);
			
			while (objRS.next()) {
				BookingVO bVO = new BookingVO();
				bVO.setNum(objRS.getInt("num"));
				bVO.setrName(objRS.getString("rName"));
				bVO.setrLimit(objRS.getInt("rLimit"));
				bVO.setrPrice(objRS.getInt("rPrice"));
				objList.add(bVO);
			}
			
		} catch (Exception e) {
			System.out.print("e : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		
		return objList;
		
	}
	/* 모든 객실 정보 불러오기 끝 */
	
	/* 선택한 객실 정보 불러오기 시작 */
	public BookingVO mtd_getRoomInfo(int num) {
		
		BookingVO bVO = new BookingVO();
		
		try {
			objConn = objPool.getConnection();;
			
			String sql = "select num, rName, rLimit, rPrice from roomInfo";
			sql += " where num = ?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, num);
			objRS = objPstmt.executeQuery();
			
			if (objRS.next()) {
				bVO.setNum(objRS.getInt("num"));
				bVO.setrName(objRS.getString("rName"));
				bVO.setrLimit(objRS.getInt("rLimit"));
				bVO.setrPrice(objRS.getInt("rPrice"));
			}
			
		} catch (Exception e) {
			System.out.print("e : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		
		return bVO;
		
	}
	/* 선택한 객실 정보 불러오기 끝 */
	
}
