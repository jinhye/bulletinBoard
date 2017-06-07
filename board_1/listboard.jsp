<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ListBoard : content list</title>
</head>
<body>
	<h2>List Board Program</h2>
	<hr>
	<center>
		<%@page import="java.util.ArrayList, univ.BoardEntity, java.text.SimpleDateFormat" %>
		<jsp:useBean id="brddb" class="univ.BoardDBCP" scope="page" />
		<%
			ArrayList<BoardEntity> list = brddb.getBoardList();
			int counter = list.size();
			int row = 0;
			
			if(counter > 0){
		%>
		<table width="800" border="0" cellpadding="1" cellspacing="3">
			<tr>
				<th><font color="blue"><b>Number</b></font></th>
				<th><font color="blue"><b>Title</b></font></th>
				<th><font color="blue"><b>Address</b></font></th>
				<th><font color="blue"><b>Writer</b></font></th>
				<th><font color="blue"><b>Date</b></font></th>
				<th><font color="blue"><b>Email</b></font></th>
			</tr>
		<%
		String[] col={"khaki", "wheat", "tomato", "coral", "rosybrown"};
		int aa = 0;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		for(BoardEntity brd : list) {
				String color = col[aa];
				aa++;
				if(aa % 5 == 0)
					aa=0;
		%>
		<tr bgcolor=<%=color %>
			onmouseover="this.style.backgroundColor='SkyBlue'"
			onmouseout="this.style.backgroundColor='<%=color %>'">
			<!--  Transfer id for Modify and Delete -->
			<td align=center><a href="editboard.jsp?id=<%=brd.getId() %>"><%=brd.getId() %></a></td>
			<td align=left><%=brd.getTitle() %></td>
			<td align=center><%=brd.getAddr() %></td>
			<td align=center><%=brd.getName() %></td>
			<!--  Date is printted out as 2017-6-5 10:33:21 -->
			<td align=center><%=df.format(brd.getRegdate()) %></td>
			<td align=center><%=brd.getEmail() %></td>
		</tr>
		<%
				}
		%>
		</table>
	<%
		}
	%>
	<hr width=90%>
	<p>
		The number of searched list is <%=counter %>
	</center>
	<hr>
	<center>
		<form name=form method=post action=editboard.jsp>
			<input type=submit value="List Register">
		</form>
	</center>
</body>
</html>