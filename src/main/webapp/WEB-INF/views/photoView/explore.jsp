<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-22
  Time: 오전 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/js/bootstrap.bundle.js">
<html>
<head>
    <title>explore</title>
  <%--db에 저장되어있는 모든 사진들을 나열해준다.--%>

  <script src="/resources/js/jquery.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../../layout/header.jsp" flush="false"></jsp:include>
<div class="title-row" id="yui_3_16_0_1_1669076338500_11711">
  <h3 id="yui_3_16_0_1_1669076338500_11710">둘러보기</h3>
</div>
  <div>
    <div class="img-fluid" id="img" style="transform: translate(0px, 4px); width: auto; height: 300px;">
      <div class="photo-list-photo-container" id="yui_3_16_0_1_1669076338500_11691">
      <img loading="lazy" src="D:project_img/${users.image[i]}" height="100%" width="100%">

      <div class="interaction-view" id="yui_3_16_0_1_1669076338500_9295"><div class="photo-list-photo-interaction" id="yui_3_16_0_1_1669076338500_11690">
        <a class="overlay" href="/photos/fabianf_/52511837941/in/explore-2022-11-20/" tabindex="0" role="heading" aria-level="3" aria-label="The last Light 출처: Fabian Fortmann" id="yui_3_16_0_1_1669076338500_11689"></a>
        <div class="extra-tools">
        </div>
        <div class="interaction-bar" title="The last Light 출처: Fabian Fortmann" id="yui_3_16_0_1_1669076338500_10466">
          <div class="text">
            <a href="/photos/fabianf_/52511837941/in/explore-2022-11-20/" class="title" tabindex="-1">The last Light</a>
            <a href="/photos/fabianf_/" class="attribution">
              출처: Fabian Fortmann
            </a>
          </div>

        </div>
      </div></div>
    </div></div>
  </div>
</body>
</html>
