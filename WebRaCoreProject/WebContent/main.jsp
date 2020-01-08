<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<html>
    <head>
        <script>
        function disp(){
            var inputlist =document.getElementsByClassName("usermanagement");
            for(var i=0;i<inputlist.length;i++){
                if( inputlist[i].style.display=="block")
        inputlist[i].style.display="none";
        else
        inputlist[i].style.display="block";
    }
        };
        </script>
        <body>
     <%--    <%String username = (String)request.getSession().getAttribute("username") ;%>
          <h3>Welcome <%=username %></h3> --%>
          <c:out value="${sessionScope['username']}"></c:out>
            <h1>RA academy </h1>
          
            <div>
                <div onclick="disp();">
                <a><b>User management</b> </a>
            </div>
            <div class="usermanagement" style="display: none;"><a>create User </a>
                <br>
            </div>
            </div>
        </body>
    </head>
</html>
</body>
</html>