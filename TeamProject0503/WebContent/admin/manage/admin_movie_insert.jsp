<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<title>와츄</title>

 	<!--  border/writeForm.jsp -->
<h1>영화DB 입력폼</h1>
</head>
<body>
<form action="./AdminMovieJoinAction.am" method="post">
<table border="0">
<tr><td>제목(한글)</td>
	<td><input type="text" name="mv_kor_title"></td></tr>
<tr><td>제목(영제)</td>
	<td><input type="text" name="mv_eng_title"></td></tr>
<tr><td>개봉년도</td>
	<td><input type="text" name="mv_year"></td></tr>
<tr><td>국내/해외</td>
	<td><input type="text" name="mv_country"></td></tr>
<tr><td>관람등급</td>
	<td><input type="text" name="mv_age"></td></tr>
<tr><td>장르</td>
	<td><input type="text" name="mv_genre"></td></tr>
<tr><td>러닝타임</td>
	<td><input type="text" name="mv_time"></td></tr>
<tr><td>감독</td>
	<td><input type="text" name="mv_director"></td></tr>
<tr><td>출연</td>
	<td><input type="text" name="mv_actor"></td></tr>
<tr><td>시놉시스</td>
	<td><textarea cols="40" rows="10" name="mv_story"></textarea></tr>
<tr><td>예고편 링크주소</td>
	<td><input type="text" name="mv_video"></td></tr>

<tr><td colspan="2">
			<input type="submit" value="글쓰기">

<!-- <tr><td>포스터</td>
	<td><input type="file" name="poster"></td></tr>
<tr><td>스틸컷1</td>
	<td><input type="file" name="steelcut"></td></tr>
<tr><td>스틸컷2</td>
	<td><input type="file" name="steelcut2"></td></tr> -->

</td></tr>
</table>
</form>
</body>
</html>