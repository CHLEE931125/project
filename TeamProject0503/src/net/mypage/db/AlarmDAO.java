package net.mypage.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AlarmDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
	public List <AlarmBean>getAlarms(String id){
		List<AlarmBean> alarmlist = new ArrayList<AlarmBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = getConnection();
			sql="select * from alarm where a_id=? order by a_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){			
				AlarmBean ab = new AlarmBean();
				ab.setA_num(rs.getInt("a_num"));
				ab.setA_alarm_name(rs.getInt("a_alarm_name"));
				ab.setA_end_day(rs.getString("a_end_day"));
				ab.setA_movie_name(rs.getString("a_movie_name"));
				alarmlist.add(ab);
				}
		 }catch(Exception e) {
			//예외 생기면 변수 e에 저장
			//예외를 잡아서 처리 -> 메시지 출력
			e.printStackTrace();
			}finally{
				//예외가 발생하든 말든 상관없이 마무리작업
				//객체 기억장소 마무리
				if(rs!=null)try{rs.close();}catch(SQLException e){e.printStackTrace();}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException e){e.printStackTrace();}
				if(con!=null)try{con.close();}catch(SQLException e){e.printStackTrace();}
			}
		return alarmlist;
	}//end getAlarms
	
	public void insertAlarm(AlarmBean ab){
		System.out.println("insertAlarm");
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		try{ //예외가 발생할 것 같은 명령, 	필수적으로 외부파일접근, 디비접근
			 con = getConnection();
			 sql="insert into alarm (a_id,a_alarm_name,a_end_day,a_movie_name) values(?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ab.getA_id()); 
			pstmt.setInt(2, ab.getA_alarm_name()); 
			pstmt.setString(3, ab.getA_end_day()); 
			pstmt.setString(4, ab.getA_movie_name()); 
			
			pstmt.executeUpdate();
		} catch(Exception e) {
				//예외 생기면 변수 e에 저장
				//예외를 잡아서 처리 -> 메시지 출력
				e.printStackTrace();
				}finally{
					//예외가 발생하든 말든 상관없이 마무리작업
					//객체 기억장소 마무리
					if(pstmt!=null){
						try{pstmt.close();						
						}catch(SQLException e){
							e.printStackTrace();
						}
					 }
						if(con!=null){
							try{con.close();
							}catch(SQLException e){
								e.printStackTrace();
							 }
							}
				}
		}//insertAlarm() 메서드
	
	public void deleteAlarm(int a_num){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			//1,2 디비연결
			con=getConnection();			
			sql="delete from alarm where a_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, a_num);
			//4 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}//end deleteAlarm
	
	
	
}
