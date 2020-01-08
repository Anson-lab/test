<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.l7.core.dto.UserDTO"%>
<%@ page import="com.l7.core.dto.RoleDTO"%>
<%@ page import="com.l7.core.dto.FeatureDTO"%>
<%@ page import="java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<title>Welcome</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="JSP/CSS/main.css">
<script src="https://use.fontawesome.com/ff07793490.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="JSP/JavaScript/main.js"></script>
</head>
<c:set var="roles" scope="session"
	value="<%=new HashSet<RoleDTO>(((UserDTO) request.getSession().getAttribute(\"user\")).getRoleList())%>" />

<!--    do in java set current role in session -->
<c:set var="priorityRole" scope="session" value="" />
<c:set var="priorityRole0" scope="session" value="" />
<c:set var="minPriority" scope="session" value="100" />
<c:forEach items="${roles}" var="role">
<c:choose>
 <c:when test="${role.getPriority()!=0}">
	
		<c:if test="${role.getPriority()<minPriority}">
			<c:set var="minPriority" scope="session"
				value="${role.getPriority()}" />
			<c:set var="priorityRole" scope="session" value="${role.roleName}" />
		</c:if>
	</c:when>
	<c:otherwise>
		<c:set var="priorityRole0" scope="session" value="${role.roleName}" />
	</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${minPriority==100}">
	<c:set var="priorityRole" scope="session" value="${priorityRole0}" />
</c:if>
<body  onload="roleChange('${priorityRole}')">
	


	<nav class="navbar navbar-expand-lg  navbar-dark bg-dark">
		<a class="navbar-brand" href="#"><img src="JSP/Images/RaLogo.png" /></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Ra
						academy <span class="sr-only">(current)</span>
				</a></li>


				<c:set var="tempModuleName" scope="session" value="" />
				<c:forEach items="${roles}" var="role">

					<c:forEach items="${role.getFeatureList()}" var="feature">

						<c:if test="${feature.getModuleName()!=tempModuleName}">
							<c:if test="${tempModuleName!=''}">
		</div>
		</li>
</c:if>
<li class="nav-item dropdown moduleAll ${role.getRoleName()}M"
	style="display: none"><a class="nav-link dropdown-toggle" href="#"
	id="navbarDropdown" role="button" data-toggle="dropdown"
	aria-haspopup="true" aria-expanded="false"> <c:out
			value="${feature.getModuleName()} "></c:out>
</a>
	<div class="dropdown-menu" aria-labelledby="navbarDropdown">







		<c:set var="tempModuleName" scope="session"
			value="${feature.getModuleName()}" />
		</c:if>

		<p class="dropdown-item" onclick="selectedFeature('${feature.getFeatureName().trim()}')"><%-- onclick="selectedFeature('${feature.getFeatureName()}')" --%>
		
		 <c:out
				value="${feature.getFeatureName()}"></c:out>
				
				</p>


		</c:forEach>

		</c:forEach>



		</ul>

		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#"><c:out
						value="${sessionScope.user.username}" /> logged in as </a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <span id="selectedRole">Role</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">

					<c:forEach items="${roles}" var="role">
						<a class="dropdown-item" href="#"
							onclick="roleChange('${role.roleName}')">${role.roleName}</a>

					</c:forEach>
					<a class="dropdown-item" href="Logout">Logout</a>

				</div></li>

		</ul>


	</div>
</nav>

<form id="selectedFeatureForm" action="Main" method="POST" style="display: none">
<input id="selectedFeatureInput" type="text" name="selectedFeature">
</form>

<!-- ........................Include pages with content ..................... -->


<c:choose>
<c:when test="${featureSelected=='Upload previous batch assessment details as excel'}">
<jsp:include page="excelUpload.jsp" />


</c:when>

<c:otherwise>

</c:otherwise>
</c:choose>



<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</body>

</html>