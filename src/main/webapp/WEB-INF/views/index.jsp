<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-17
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/js/bootstrap.bundle.js">
<html>
<head>
    <title>index</title>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <style>
        .main_picture{
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="main_picture" style="background-image: url(https://www.c3korea.net/wp-content/uploads/2020/09/03-%ED%95%9C%EA%B8%B8%EC%82%AC.jpg;)">
    <div class="form-floating text-center m-auto">
        <button class="btn btn-dark" onclick="location.href='/'">
            <h3>이미지 구경하기</h3>
        </button>
    </div>
</div>
</body>
</html>
