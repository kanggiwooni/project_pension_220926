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
			
			String sql = "select num, rName, rLimit, rPrice, rPictures from roomInfo";
			sql += " where num = ?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, num);
			objRS = objPstmt.executeQuery();
			
			if (objRS.next()) {
				rVO.setNum(objRS.getInt("num"));
				rVO.setrName(objRS.getString("rName"));
				rVO.setrLimit(objRS.getInt("rLimit"));
				rVO.setrPrice(objRS.getInt("rPrice"));
				rVO.setrPictures(objRS.getInt("rPictures"));
			}
			
		} catch (Exception e) {
			System.out.print("e : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		
		return rVO;
		
	}
	/* 선택한 객실 정보 불러오기 끝 */
	
	/* 객실이름으로 객실 정보 불러오기 시작 */
	public RoomVO mtd_getRoomInfo(String rName) {
		
		RoomVO rVO = new RoomVO();
		
		try {
			objConn = objPool.getConnection();;
			
			String sql = "select num, rName, rLimit, rPrice, rPictures from roomInfo";
			sql += " where rName = ?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, rName);
			objRS = objPstmt.executeQuery();
			
			if (objRS.next()) {
				rVO.setNum(objRS.getInt("num"));
				rVO.setrName(objRS.getString("rName"));
				rVO.setrLimit(objRS.getInt("rLimit"));
				rVO.setrPrice(objRS.getInt("rPrice"));
				rVO.setrPictures(objRS.getInt("rPictures"));
			}
			
		} catch (Exception e) {
			System.out.print("e : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		
		return rVO;
		
	}
	/* 객실이름으로 객실 정보 불러오기 끝 */
	
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
	
	/* 예약 정보 입력 시작 */
	public int mtd_insertBooking(BookingVO bVO) {
		
		int rtnCnt = 0;
		
		try {
			objConn = objPool.getConnection();;
			
			String sql = "insert into roomBooking";
			sql += " (bDate, bPeople, rNum, rName, uid, uName, uPhone, uEmail, uRequest, payPrice, bookTM)";
			sql += " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, bVO.getbDate());
			objPstmt.setInt(2, bVO.getbPeople());
			objPstmt.setInt(3, bVO.getrNum());
			objPstmt.setString(4, bVO.getrName());
			objPstmt.setString(5, bVO.getUid());
			objPstmt.setString(6, bVO.getuName());
			objPstmt.setString(7, bVO.getuPhone());
			objPstmt.setString(8, bVO.getuEmail());
			objPstmt.setString(9, bVO.getuRequest());
			objPstmt.setInt(10, bVO.getPayPrice());
			rtnCnt = objPstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.print("e : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		
		return rtnCnt;
		
	}
	/* 예약 정보 입력 끝 */
	
	/* 예약 내역 조회 시작 */
	public List<BookingVO> mtd_bookInfo(String uid) {
		
		List<BookingVO> objList = new Vector<BookingVO>();
		
		try {
			objConn = objPool.getConnection();;
			
			String sql = "select bNum, bDate, bPeople, rName, uid, uName";
			sql += ", uPhone, uEmail, uRequest, payPrice";
			sql += " from roomBooking where uid=? order by bNum desc";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uid);
			objRS = objPstmt.executeQuery();
			
			while (objRS.next()) {
				BookingVO bVO = new BookingVO();
				bVO.setbNum(Integer.parseInt(objRS.getString("bNum")));
				bVO.setbDate(objRS.getString("bDate"));
				bVO.setbPeople(Integer.parseInt(objRS.getString("bPeople")));
				bVO.setrName(objRS.getString("rName"));
				bVO.setUid(objRS.getString("uid"));
				bVO.setuName(objRS.getString("uName"));
				bVO.setuPhone(objRS.getString("uPhone"));
				bVO.setuEmail(objRS.getString("uEmail"));
				bVO.setuRequest(objRS.getString("uRequest"));
				bVO.setPayPrice(Integer.parseInt(objRS.getString("payPrice")));
				objList.add(bVO);
			}
			
		} catch (Exception e) {
			System.out.print("e : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		
		return objList;
		
	}
	/* 예약 내역 조회 끝 */
	
}
