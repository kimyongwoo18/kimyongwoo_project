<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-18
  Time: 오전 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
    <title>userSave</title>
</head>
<style>
    body {
        min-height: 100vh;

        background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
        background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
        max-width: 680px;

        margin-top: 80px;
        padding: 32px;

        background: #fff;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
</style>
</head>

<body>
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <h4 class="mb-3">회원가입</h4>
            <form class="validation-form" action="/user/save" method="post" enctype="multipart/form-data">

                <div class="mb-3">
                    <label for="user_email">이메일</label>
                    <input type="email" class="form-control" id="user_email" name="user_email" placeholder="you@example.com" required>
                    <div class="invalid-feedback">
                        이메일을 입력해주세요.
                    </div>
                </div>
                <div class="mb-3">
                    <label for="user_password">비밀번호</label>
                    <input type="password" class="form-control" id="user_password" name="user_password" required>
                    <div class="invalid-feedback">
                        비밀번호를 입력해주세요.
                    </div>
                </div>
                <div class="mb-3">
                    <label for="user_name">이름</label>
                    <input type="text" class="form-control" id="user_name" name="user_name" required>
                    <div class="invalid-feedback">
                        이름을 입력해주세요.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="user_intro">소개<span class="text-muted">&nbsp;(필수 아님)</span></label>
                    <textarea class="form-control" name="user_intro" id="user_intro" cols="30" rows="10"></textarea>
                </div>

                <div class="mb-3">
                    <label for="user_profile">프로필사진<span class="text-muted">&nbsp;(필수 아님)</span></label>
                    <input type="file" class="form-control" id="user_profile" name="user_profile" accept=".png, .jpg, .jpeg">
                </div>


                <div class="mb-4"></div>
                <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
            </form>
        </div>
    </div>
    <footer class="my-3 text-center text-small">
        <p class="mb-1">&copy; PictureControll</p>
    </footer>
</div>
<script>
    window.addEventListener('load', () => {
        const forms = document.getElementsByClassName('validation-form');

        Array.prototype.filter.call(forms, (form) => {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                form.classList.add('was-validated');
            }, false);
        });
    }, false);
</script>
</body>

</html>
