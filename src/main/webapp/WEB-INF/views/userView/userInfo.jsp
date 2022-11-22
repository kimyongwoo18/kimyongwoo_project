<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-18
  Time: 오후 4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/js/bootstrap.bundle.js">
<html>
<head>
    <title>userInfo</title>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <style>

    </style>
</head>
<body>
<jsp:include page="../../layout/header.jsp" flush="false"></jsp:include>
<div class="container" style="height: 300px;background-color: #0dcaf0">
    <div class="container text-center">
        <div class="row">
            <div class="col-sm-4">
                <h3>${users.user_name}</h3>
                <img src="${pageContext.request.contextPath}/D://project_img/"+${users.storedProfileName}" width="100" height="100">
            </div>
            <div class="col-sm-8">
                <h5>소개</h5>
                <h6>${users.user_intro}</h6>
            </div>
        </div>

</div>
<div class="container-fluid">
    <h5>내가올린 이미지</h5>
    <div>
        <%--올리는 이미지들.--%>
    </div>
</div>
<footer class="my-3 text-center text-small">
    <p class="mb-1">&copy; PictureControll</p>
</footer>
</body>
</html>
