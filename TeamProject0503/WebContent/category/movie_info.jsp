<%@page import="net.admin.manage.db.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
<%	
	int mv_num =Integer.parseInt(request.getParameter("mv_num"));
	MovieBean moviebean =(MovieBean)request.getAttribute("moviebean");
	
	String story = moviebean.getMv_story();
	if(story != null){
  		story = story.replaceAll("<br>", "\r\n");
  	}
	String img_genre= "";
	if(moviebean.getMv_genre().equals("animation")){
		img_genre="animation";
	}else if(moviebean.getMv_genre().equals("comedy")){
		img_genre="comedy";
	}else if(moviebean.getMv_genre().equals("indie")){
		img_genre="indie";
	}else if(moviebean.getMv_genre().equals("sf")){
		img_genre="sf";
	}else if(moviebean.getMv_genre().equals("action")){
		img_genre="action";
	}else if(moviebean.getMv_genre().equals("horror") || moviebean.getMv_genre().equals("thriller")){
		img_genre="thriller";
	}else if(moviebean.getMv_genre().equals("romance") || moviebean.getMv_genre().equals("drama")){
		img_genre="romance";
	}
	
	String genre="";
	if(moviebean.getMv_genre().equals("animation")){
		genre="애니메이션";
	}else if(moviebean.getMv_genre().equals("comedy")){
		genre="코미디";
	}else if(moviebean.getMv_genre().equals("indie")){
		genre="독립영화";
	}else if(moviebean.getMv_genre().equals("sf")){
		genre="sf";
	}else if(moviebean.getMv_genre().equals("action")){
		genre="액션";
	}else if(moviebean.getMv_genre().equals("thriller")){
		genre="스릴러";
	}else if(moviebean.getMv_genre().equals("romance")){
		genre="로맨스";
	}else if(moviebean.getMv_genre().equals("horror")){
		genre="공포";
	}else if(moviebean.getMv_genre().equals("drama")){
		genre="드라마";
	}
	
	String age = "";
	if(moviebean.getMv_age()==0){
		age = "전체이용가";
	}else if(moviebean.getMv_age()==12){
		age = "12세이용가";
	}else if(moviebean.getMv_age()==15){
		age="15세이용가";
	}else if(moviebean.getMv_age()==19){
		age="청소년이용불가";
	}
		
%>
<header></header>
<article>
	<section>
	<img src="">
		<table>
			<tr>
				<td>영화한글 제목 <%=moviebean.getMv_kor_title()%>연도<%=moviebean.getMv_year() %> </td><td><a href=""><input type="button" value="즐겨찾기"></a></td>
			</tr>
			<tr>
				<td>외국어제목 <%=moviebean.getMv_eng_title()%> </td>
			</tr>
			<tr>
				<td>장르 <%=genre%> | 나라 <%=moviebean.getMv_country() %> </td><td>러닝타임 <%=moviebean.getMv_time() %> </td><td>나이제한<%=age %> </td>
			</tr>
			<tr>
				<td>감독 <%=moviebean.getMv_director()%> </td>
			</tr>
			<tr>
				<td>주연 <%=moviebean.getMv_actor() %> </td>
			</tr>
			<tr>
			<td>평균평점<img src=""></td>
			</tr>
			<tr>
			<!--사용자가 별점 주는 란   -->
			<td>
				<input type="button" value="1점">
				<input type="button" value="2점">
				<input type="button" value="3점">
				<input type="button" value="4점">
				<input type="button" value="5점">
			</td>
			<td>영화관람하러가기 <input type="button" value="영화관람"></td>
			</tr>
		
		</table> 
				<textarea cols="30" rows="30"> <%=story %></textarea><br>
				<!--예고편  -->
				<iframe src="<%=moviebean.getMv_video()%>"></iframe><br>
				<!--스틸컷  -->
				<table>
				<tr>
					<td>
						<img src="./images/<%=img_genre%>/<%=moviebean.getMv_eng_title().replaceAll(" ","")+"_s.jpg"%>">
						<img src="./images/<%=img_genre%>/<%=moviebean.getMv_eng_title().replaceAll(" ","")+"_s2.jpg"%>">
					</td>
				</tr>
				</table>
				<!--댓글   -->
				<table>
					<tr><td>작성자</td><td>내용</td><td>남긴날짜</td>
					<td>수정<input type="button" value="수정"></td>
					<td>삭제<input type="button" value="삭제"></td>
					<td>추천<input type="button" value="추천"></td>
					<td>신고<input type="button" value="신고"></td></tr>
				</table>
				<!--댓글 쓰는 란  -->
				<textarea cols="50" rows="15"></textarea><br>
				
				
	</section>
</article>
<footer></footer>
</body>
</html>