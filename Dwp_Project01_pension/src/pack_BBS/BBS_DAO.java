package pack_BBS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import pack_DBCP.DBConnectionMgr;

public class BBS_DAO {
	
	private DBConnectionMgr objPool = null;
	private Connection objConn= null;
	private Statement objStmt = null;
	private PreparedStatement objPstmt = null;
	private ResultSet objRS = null;
	
	BBS_VO objVO = null;
	List<BBS_VO> objList = null;
	
	private String sql = "";	

	public BBS_DAO() {
		objPool = DBConnectionMgr.getInstance();
	}
	
	
	//리뷰페이지 글쓰기 메서드 시작	
	public int mtd_reviewsWrite(HttpServletRequest req, String uid, String uName) {

		//String savePath = "D:/Bigdata_Java_220511/wonho/silsp/07_JSP/Dwp_Project01_pension/WebContent/BBS/reviews/reviews_Upload";
		String savePath = "C:/Users/EZEN201/git/project_pension/Dwp_Project01_pension/WebContent/BBS/reviews/reviews_Upload";
		int rtn=0;
		
		try {
			MultipartRequest objMulti = new MultipartRequest(
					req,
					savePath,
					50*1024*1024, //byte단위
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
			
			String title = objMulti.getParameter("title");
			String content = objMulti.getParameter("content");
			String originalFN = objMulti.getOriginalFileName("uploadFileName");
			String systemFN = "";
			long fileSize = 0;
			if(originalFN != null) {
				systemFN = objMulti.getFilesystemName("uploadFileName");
				fileSize=objMulti.getFile("uploadFileName").length();
			}
			objConn = objPool.getConnection();
			//insert into BBS_reviews(title, content, originalFN, systemFN,
			//fileSize, reportingDate, writer) values('제목','테스트용',
			//'파일이름','서버에저장된파일이름',1,now(),'이용자')
			sql="insert into BBS_reviews(uid, uName, title, content, originalFN, systemFN, ";
			sql+="fileSize, reportingDate) values(?,?,?,?,?,?,?,now())";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uid);
			objPstmt.setString(2, uName);
			objPstmt.setString(3, title);
			objPstmt.setString(4, content);
			objPstmt.setString(5, originalFN);
			objPstmt.setString(6, systemFN);
			objPstmt.setLong(7, fileSize);

			rtn = objPstmt.executeUpdate();
			
		}catch(Exception e) {
			e.getStackTrace();
			//System.out.println(e.getMessage());
		}finally {
			objPool.freeConnection(objConn);
		}
		
		return rtn;
	}
	//리뷰페이지 글쓰기 메서드 종료

	
	//리뷰페이지 출력 메서드 시작
	public List<BBS_VO> mtd_reviewsList(){
		

		
		try {
			objConn = objPool.getConnection();
			sql = "select num, title, uid, reportingDate, views from BBS_reviews order by num desc";
			objStmt = objConn.createStatement();
			objRS = objStmt.executeQuery(sql);
			
			objList = new Vector<BBS_VO>();
			
			while(objRS.next()) {
					objVO = new BBS_VO();
					objVO.setNum(objRS.getInt("num"));
					objVO.setTitle(objRS.getString("title"));
					objVO.setUid(objRS.getString("uid"));
					objVO.setReportingDate(objRS.getString("reportingDate"));
					objVO.setViews(objRS.getInt("views"));
					objList.add(objVO);
			}
		}catch(Exception e) {
			System.out.print("reviewsList e : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		return objList;
	}
	//리뷰페이지 출력 메서드 시작
	
	
	//리뷰페이지 자세히보기 페이지 출력 메서드 시작
	public List<BBS_VO> mtd_reviewsDetail(int num){
		

		
		try {
			objConn = objPool.getConnection();
			//select title, uid, reportingDate, views, content from BBS_reviews where num=1;
			sql = "select title, uid, reportingDate, views, content from BBS_reviews where num="+num;
			objStmt = objConn.createStatement();
			objRS = objStmt.executeQuery(sql);
			
			objList = new Vector<BBS_VO>();
			
			if(objRS.next()) {
					objVO = new BBS_VO();
					objVO.setTitle(objRS.getString("title"));
					objVO.setUid(objRS.getString("uid"));
					objVO.setReportingDate(objRS.getString("reportingDate"));
					objVO.setViews(objRS.getInt("views"));
					objVO.setContent(objRS.getString("content"));
					objList.add(objVO);
			}
		}catch(Exception e) {
			System.out.print("reviewsList e : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn);
		}
		return objList;
	}
	//리뷰페이지 자세히보기 페이지 출력 메서드 종료
	
	
	//리뷰페이지 자세히보기 페이지 내용 수정 메서드 시작
	public  int mtd_reviewsModify(int num, String title, String content) {

		int rtn=0;

		try {
			objConn = objPool.getConnection();
			sql="update BBS_reviews set title=?, content=? where num=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, title);
			objPstmt.setString(2, content);
			objPstmt.setInt(3, num);

			rtn = objPstmt.executeUpdate();

			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			objPool.freeConnection(objConn);
		}
		
		return rtn;
	}
	//리뷰페이지 자세히보기 페이지 내용 수정 메서드 종료


	//리뷰페이지 자세히보기 글 삭제 메서드 시작
	public int mtd_reviewsDelete(int num) {
		int rtn=0;
		
		try {
			objConn = objPool.getConnection();
			sql="delete from BBS_reviews where num = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, num);

			rtn = objPstmt.executeUpdate();

			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			objPool.freeConnection(objConn);
		}
		
		return rtn;
	}
	//리뷰페이지 자세히보기 글 삭제 메서드 종료







}
