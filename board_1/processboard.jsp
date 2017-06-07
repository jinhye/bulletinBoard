<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Board : register modify delete</title>
</head>
<body>
	<!--  java beans for list register, modify, and delete -->
	<jsp:useBean id="brd" class="univ.BoardEntity" scope="page" />
	<jsp:useBean id="brddb" class="univ.BoardDBCP" scope="page" />
	
	<%
	//save one of insert, update, delete
	String menu = request.getParameter("menu");
	
	//insert or update module
	if(menu.equals("delete") || menu.equals("update")){
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		int idnum = Integer.parseInt(id);
		
		//checking password
		if(!brddb.isPasswd(idnum, passwd)){
	%>
	<!--  move to previous if unmatched -->
	<script>
		alert("Invalid Password");
		history.go(-1);
	</script>
	<%
		} else{
			if(menu.equals("delete")){
				brddb.deleteDB(idnum);
			}else if (menu.equals("update")){
	%>
	<!--  field id when update -->
	<jsp:setProperty name="brd" property="id" />
	<jsp:setProperty name="brd" property="name" />
	<jsp:setProperty name="brd" property="title" />
	<jsp:setProperty name="brd" property="email" />
	<jsp:setProperty name="brd" property="content" />
	<jsp:setProperty name="brd" property="addr" />
	
	<%
				brddb.updateDB(brd);
			}
			response.sendRedirect("listboard.jsp");
		}
	}else if(menu.equals("insert")){
	%>
	<!--  field id when insert -->
	<jsp:setProperty name="brd" property="id" />
	<jsp:setProperty name="brd" property="name" />
	<jsp:setProperty name="brd" property="title" />
	<jsp:setProperty name="brd" property="email" />
	<jsp:setProperty name="brd" property="content" />
	<jsp:setProperty name="brd" property="addr" />
	
	<%
			brddb.insertDB(brd);
			response.sendRedirect("listboard.jsp");
	}
	%>
</body>
</html>