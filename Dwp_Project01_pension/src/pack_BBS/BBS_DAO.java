package pack_BBS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

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
	private List<BBS_VO> objList = null;
	private String sql = "";
	private String session = "uid";
	
	public BBS_DAO() {
		objPool = DBConnectionMgr.getInstance();
	}
	
	public int mtd_reviewsWrite(HttpServletRequest req) {
		
		String savePath = "D:/Bigdata_Java_220511/wonho/silsp/07_JSP/Dwp_Project01_pension/WebContent/BBS/reviews/reviews_Upload";
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
			sql="insert into BBS_reviews(title, content, originalFN, systemFN, ";
			sql+="fileSize, reportingDate, writer) values(?,?,?,?,?,now(),?)";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, title);
			objPstmt.setString(2, content);
			objPstmt.setString(3, originalFN);
			objPstmt.setString(4, systemFN);
			objPstmt.setLong(5, fileSize);
			objPstmt.setString(6, session);
			rtn = objPstmt.executeUpdate();
			
		}catch(Exception e) {
			e.getStackTrace();
			//System.out.println(e.getMessage());
		}finally {
			objPool.freeConnection(objConn);
		}
		
		return rtn;
	}
}
