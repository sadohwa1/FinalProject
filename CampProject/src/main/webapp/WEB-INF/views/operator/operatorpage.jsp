<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/home.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp" />
	 <section>
        <div>
            <h2>캠핑장 관리</h2>
            <hr>
            <div id="campList">
            <c:forEach items="${campList }" var="c">
            <a href="/opCampView.do?campNo=${c.campNo }">
                <div class="camp_box">
                	<div class="img_wrapper">
                    	<img src="resources/upload/camp/${c.pictureList[0].filepath }">
                    </div>
                    <div>${c.campName }</div>
                </div>
            </a>
            </c:forEach>
            	<a href="insertCamp.do">
                <div class="camp_box add_camp">
                    <div>+</div>
                </div>
                </a>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>