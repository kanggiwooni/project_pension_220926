package pack_member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class MemberDAO {

	private DBConnectionMgr objPool;
	private Connection objConn;
	private Statement objStmt;
	private PreparedStatement objPstmt;
	private ResultSet objRS;
	
	public MemberDAO() {
		objPool = DBConnectionMgr.getInstance();
	}
	
	/* 회원가입 시작 */
	public int mtd_join(MemberVO objVO) {
		
		int rtnCnt = 0;
		
		try {
			
			objConn = objPool.getConnection();
			
			String sql = "insert into member";
			sql += " (uid, upw, uName, uEmail, gender, uBirth, uZipcode, uAddr, joinTM)";
			sql += " values (?, ?, ?, ?, ?, ?, ?, ?, now())";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, objVO.getUid());
			objPstmt.setString(2, objVO.getUpw());
			objPstmt.setString(3, objVO.getuName());
			objPstmt.setString(4, objVO.getuEmail());
			objPstmt.setString(5, objVO.getGender());
			objPstmt.setString(6, objVO.getuBirth());
			objPstmt.setString(7, objVO.getuZipcode());
			objPstmt.setString(8, objVO.getuAddr());
			rtnCnt = objPstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		
		return rtnCnt;
		
	}
	/* 회원가입 끝 */
	
	/* ID중복확인 시작 */
	public int mtd_idCheck(String uid) {
		
		int idCheck = -1;
		
		try {
			
			objConn = objPool.getConnection();
			
			String sql = "select count(*) from member";
			sql += " where uid=?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uid);
			objRS = objPstmt.executeQuery();
			
			if (objRS.next()) {
				idCheck = objRS.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		
		return idCheck;
		
	}
	/* ID중복확인 끝 */
	
	/* 우편번호 찾기 시작 */
	public List<ZipcodeBean> zipcodeRead(String area3) {
		
		List<ZipcodeBean> objList = new Vector<>(); 
		
		try {
			
			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection();		
			
						
			String sql = "select zipcode, area1, area2, area3, area4 ";
			         sql += " from tblZipcode where area3 like ?";

			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, "%"+ area3 +"%");
			objRS = objPstmt.executeQuery();
			
			while (objRS.next()) {
				ZipcodeBean zipBean = new ZipcodeBean();
				zipBean.setZipcode(objRS.getString(1));
				zipBean.setArea1(objRS.getString(2));
				zipBean.setArea2(objRS.getString(3));
				zipBean.setArea3(objRS.getString(4));
				zipBean.setArea4(objRS.getString(5));
				
				objList.add(zipBean);
			}
			
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		} 
		
		return objList;
		
	}
	/* 우편번호 찾기 끝 */
	
	/* 로그인 시작 */
	public String mtd_login(String uid, String upw) {
		
		String uName = null;
		
		try {
			
			objConn = objPool.getConnection();
			
			String sql = "select uName from member";
			sql += " where uid=? and upw=?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uid);
			objPstmt.setString(2, upw);
			objRS = objPstmt.executeQuery();
			
			if (objRS.next()) {
				uName = objRS.getString("uName");
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		
		return uName;
	}
	/* 로그인 끝 */
	
}
