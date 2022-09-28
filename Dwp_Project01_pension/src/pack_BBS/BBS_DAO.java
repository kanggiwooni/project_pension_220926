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
	private String session = "uid";
	

	public BBS_DAO() {
		objPool = DBConnectionMgr.getInstance();
	}
	
	
	//리뷰페이지 글쓰기 메서드 시작	
	public int mtd_reviewsWrite(HttpServletRequest req, String uid, String uName) {

		System.out.println("들어는왔다!");
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
			
			System.out.println("test1");
			objConn = objPool.getConnection();
			System.out.println("test2");
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
			sql = "select num, title, uid, reportingDate, views from BBS_reviews order by num";
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
	
}
