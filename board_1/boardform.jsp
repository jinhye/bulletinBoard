<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List board : form</title>
</head>
<body>
	<script>
	function deletecheck(){
		if(document.boardform.passwd.value==""){
			alert("Input password");
			document.boardform.passwd.focus();
			return;
		}
		
		ok=confirm("Do you want to delete?");
		if(ok){
			document.boardform.menu.value='delete';
			document.boardform.submit();
		}else{
			return;
		}
	}
	
	function insertcheck(){
		if(document.boardform.name.value==""){
			alert("input your name");
			document.boardform.name.focus();
			return;
		}
		if(document.boardform.passwd.value==""){
			alert("input your password");
			document.boardform.passwd.focus();
			return;
		}
		document.boardform.menu.value='insert';
		document.boardform.submit();
	}
	
	function updatecheck(){
		if(document.boardform.name.value==""){
			alert("input your name");
			document.boardform.name.focus();
			return;
		}
		if(document.boardform.passwd.value==""){
			alert("input your password");
			document.boardform.passwd.focus();
			return;
		}
		document.boardform.menu.value='update';
		document.boardform.submit();
	}
	
	
	
	
	
	</script>




</body>
</html>