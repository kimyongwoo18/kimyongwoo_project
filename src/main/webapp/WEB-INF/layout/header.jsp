<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-17
  Time: 오후 4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/js/bootstrap.bundle.js">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <style>

        #icon-main{
            margin-right: 20px;

        }
    </style>
</head>
<body>
<nav class="sticky-sm-top p-3 text-bg-dark">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <i class="bi bi-camera" id="icon-main" style=font-size:2rem></i>
            </a>
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <c:choose>
                    <c:when test="${sessionScope.loginEmail == null}">
                        <li><a href="/user/save" class="nav-link px-2 text-white">가입하기</a></li>
                        <li><a href="#" class="nav-link px-2 text-white">둘러보기</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/user/info?user_email=${sessionScope.loginEmail}" class="nav-link px-2 text-white">${sessionScope.loginName}</a></li>
                        <li><a href="#" class="nav-link px-2 text-white">둘러보기</a></li>
                        <li><a href="/photo/save" class="nav-link px-2 text-white">사진올리기</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
            </form>

            <div class="text-end">
                <c:choose>
                    <c:when test="${sessionScope.loginEmail == null}">
                        <button type="button" class="btn btn-outline-light me-2" onclick=location.href="/user/login">로그인</button>
                    </c:when>

                    <c:otherwise>
                        <button type="button" class="btn btn-outline-light me-2" onclick=location.href="/user/logout">로그아웃</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>
</body>
</html>
