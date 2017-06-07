<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Board : list form</title>
</head>
<!--  file boardform.js : checking for form values -->
<script language=javaScript src="boardform.js" charset="utf-8"></script>
<body>
	<%@page import="univ.*" %>
	<%
		String name = "";
		String email = "";
		String title = "";
		String content = "";
		String headline = "Register";
		String addr = "";
		
		String id = request.getParameter("id");
		if(id != null){
			int idnum = Integer.parseInt(id);
			BoardDBCP brddb = new BoardDBCP();
			BoardEntity brd = brddb.getBoard(idnum);
			name = brd.getName();
			email = brd.getEmail();
			title = brd.getTitle();
			content = brd.getContent();
			addr = brd.getAddr();
			headline = "modify delete";
		}
	%>
	<h2>
		List Board
		<%=headline %>
		program
	</h2>
	<hr>
	<center>
		<form name=boardform method=post action="processboard.jsp">
			<!--  menu : insert, modify, or delete -->
			<input type=hidden name="menu" value="insert">
			<input type=hidden name="id" value=<%=id%>>
			
			<table width=100% border=0 cellspacing=0 cellpadding=7>
				<tr>
					<td align=center>
						<table border=0 width="90%">
							<tr>
								<td colspan=2>
									<table>
										<tr>
											<td width=50>Name: </td>
											<td width=40><input type=text name=name value="<%=name%>" size=30 maxlength=20 ></td>
											<td width=80>Email: </td>
											<td width=40><input type=text name=email size=30 value="<%=email %>" maxlength=30></td>
										</tr>
										<tr>
											<td width=40>Address: </td>
											<td colspan=3><input type=text name=addr size=60 value="<%=addr %>" maxlength=30></td>
										</tr>
										<tr>
											<td width=40>Title: </td>
											<td colspan=3><input type=text name=title size=60 value="<%=title %>" maxlength=30></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan=2>Password: <input type=password name=passwd size=20 maxlength=15>
									<font color=red>We need your password if you want to modify or delete</font>
								</td>
							</tr>
							<tr>
								<td colspan=2 height=5><hr size=2></td>
							</tr>
							<tr>
								<td colspan=2>
									<%
										if(id == null) {
									%>
									
									<input type=button value="Register" onClick="insertcheck()">
									<%
										}else{
									%>
									<input type=button value="updated" onClick="updatecheck()">
									<input type=button value="Delete" onClick="deletecheck()">
									<%
										}
									%>
									<input type="button" value="showList" onClick="location.href='listboard.jsp'">
									<input type=reset value="Cancel">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>		
		</form>	
	</center>
</body>
</html>