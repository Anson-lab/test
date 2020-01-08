<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
/* String s=null;
s.length(); */
%><%-- 
<c:set var="first" value="setm" scope="session"></c:set>
<c:set var="second" value="1" scope="session"></c:set>
<c:out value="${first/second}"></c:out> --%>
<%-- <c:set var="userName" value="${null}" scope="session"></c:set>
<c:out value="${userName.length}">
	</c:out> --%>
 

	<%-- <c:forEach items="${cookie}" var="ck">
		
		
		<c:if test="${ck.key == 'userCookie'}">
			<c:set var="userName" value="${ck.value.value}" scope="session">
			</c:set>			
		</c:if>
	
		<c:if test="${ck.key == 'passwordCookie'}">
			<c:set var="password" value="${ck.value.value}" scope="session">
			</c:set>
		</c:if>
	</c:forEach>
	
	<c:if test="${userName == 'admin'&& password=='admin'}">
	<c:out value="${userName}">
	</c:out>
	<c:out value="${password}">
	</c:out>
	</c:if>
	
<c:redirect url="/main.jsp"></c:redirect> --%>
	<form action="RaLogin" method="POST">
		<input type="text" name="username"> <br> <input
			type="password" name="password"> <br>
		<button type="submit">Submit</button>
		<input type="checkbox" name="remember"> remember me
	</form>
</body>
</html>