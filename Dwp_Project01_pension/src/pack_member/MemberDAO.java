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
			sql += " (uid, upw, uName, uBirth, uPhone, uEmail, gender, uZipcode, uAddr, joinTM)";
			sql += " values (?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, objVO.getUid());
			objPstmt.setString(2, objVO.getUpw());
			objPstmt.setString(3, objVO.getuName());
			objPstmt.setString(4, objVO.getuBirth());
			objPstmt.setString(5, objVO.getuPhone());
			objPstmt.setString(6, objVO.getuEmail());
			objPstmt.setString(7, objVO.getGender());
			objPstmt.setString(8, objVO.getuZipcode());
			objPstmt.setString(9, objVO.getuAddr());
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
	
	/* 회원 정보 불러오기 시작 */
	public MemberVO getMemberData(String uid) {
		
		MemberVO mVO = new MemberVO();
		
		try {
			
			objConn = objPool.getConnection();
			
			String sql = "select uid, upw, uName, uBirth, uPhone, uEmail, gender, uZipcode, uAddr";
			sql += " from member where uid=?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uid);
			objRS = objPstmt.executeQuery();
			
			if (objRS.next()) {
				mVO.setUid(objRS.getString("uid"));
				mVO.setUpw(objRS.getString("upw"));
				mVO.setuName(objRS.getString("uName"));
				mVO.setuBirth(objRS.getString("uBirth"));
				mVO.setuPhone(objRS.getString("uPhone"));
				mVO.setuEmail(objRS.getString("uEmail"));
				mVO.setGender(objRS.getString("gender"));
				mVO.setuZipcode(objRS.getString("uZipcode"));
				mVO.setuAddr(objRS.getString("uAddr"));
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		
		return mVO;
	}
	/* 회원 정보 불러오기 끝 */
	
	/* 회원정보 수정 시작 */
	public int mtd_modify(String uid, MemberVO objVO) {
		
		int rtnCnt = 0;
		
		try {
			
			objConn = objPool.getConnection();
			
			System.out.println("DB접속");
			
			String sql = "update member set";
			sql += " upw=?, uBirth=?, uPhone=?, uEmail=?, gender=?, uZipcode=?, uAddr=?";
			sql += " where uid=?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, objVO.getUpw());
			objPstmt.setString(2, objVO.getuBirth());
			objPstmt.setString(3, objVO.getuPhone());
			objPstmt.setString(4, objVO.getuEmail());
			objPstmt.setString(5, objVO.getGender());
			objPstmt.setString(6, objVO.getuZipcode());
			objPstmt.setString(7, objVO.getuAddr());
			objPstmt.setString(8, uid);
			
			rtnCnt = objPstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		
		return rtnCnt;
		
	}
	/* 회원정보 수정 끝 */

	/* 회원탈퇴 시작 */
	public int mtd_delete(String uid) {
		
		int rtnCnt = 0;
		
		try {
			
			objConn = objPool.getConnection();
			
			String sql = "delete from member where uid=?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uid);
			rtnCnt = objPstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		
		return rtnCnt;
	}
	/* 회원탈퇴 끝 */
	
}
