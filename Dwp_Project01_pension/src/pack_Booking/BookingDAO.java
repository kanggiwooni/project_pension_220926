package pack_Booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

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
	public List<RoomVO> mtd_getRoomInfo() {
		
		List<RoomVO> objList = new Vector<RoomVO>();
		
		try {
			objConn = objPool.getConnection();;
			
			String sql = "select num, rName, rLimit, rPrice from roomInfo";
			sql += " order by num asc";
			
			objStmt = objConn.createStatement();
			objRS = objStmt.executeQuery(sql);
			
			while (objRS.next()) {
				RoomVO rVO = new RoomVO();
				rVO.setNum(objRS.getInt("num"));
				rVO.setrName(objRS.getString("rName"));
				rVO.setrLimit(objRS.getInt("rLimit"));
				rVO.setrPrice(objRS.getInt("rPrice"));
				objList.add(rVO);
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
	public RoomVO mtd_getRoomInfo(int num) {
		
		RoomVO rVO = new RoomVO();
		
		try {
			objConn = objPool.getConnection();;
			
			String sql = "select num, rName, rLimit, rPrice from roomInfo";
			sql += " where num = ?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, num);
			objRS = objPstmt.executeQuery();
			
			if (objRS.next()) {
				rVO.setNum(objRS.getInt("num"));
				rVO.setrName(objRS.getString("rName"));
				rVO.setrLimit(objRS.getInt("rLimit"));
				rVO.setrPrice(objRS.getInt("rPrice"));
			}
			
		} catch (Exception e) {
			System.out.print("e : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		
		return rVO;
		
	}
	/* 선택한 객실 정보 불러오기 끝 */
	
	/* 해당 날짜 예약 여부 확인 시작 */
	public boolean mtd_chkBooking(int rNum, String date) {
		
		boolean chk = false;
		
		try {
			objConn = objPool.getConnection();;
			
			String sql = "select count(*) from roomBooking";
			sql += " where rNum=? and bDate like ?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, rNum);
			objPstmt.setString(2, date+"%");
			objRS = objPstmt.executeQuery();
			
			if (objRS.next()) {
				if (objRS.getInt(1) > 0) {
					chk = true;
				}
			}
			
		} catch (Exception e) {
			System.out.print("e : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		
		return chk;
		
	}
	/* 해당 날짜 예약 여부 확인 끝 */
	
}
