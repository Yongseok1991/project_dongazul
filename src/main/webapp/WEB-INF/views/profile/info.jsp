<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>동아줄 : 내 프로필</title>

    <!--fontawesome ---->
    <script src="https://kit.fontawesome.com/dc299fac74.js" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <link rel="stylesheet" href="/resources/css/info.css">
    <style>
        #nav {
            margin-top: 5px;
            margin-right: 30px;
            font-family: 'arial';
            width: 70px;
            float: right;
        }

        #nav ul {
            width: 70px;
            margin: 0;
            padding: 0;
        }

        #nav ul.menu li {
            position: relative;
            float: left;
            width: 70px;
            list-style-type: none;
            font-size: 14px;
            margin-top: 5px;
        }

        #nav ul.menu li a {
            display: block;
            width: 70px;
            height: 25px;
            line-height: 20px;
            text-indent: 10px;
            color: #000;
            font-weight: bold;
            text-decoration: none;
        }

        #nav ul.menu li a:hover {
            background: #eee;
        }

        #nav ul.menu li .sub a {
            position: relative;
            float: left;
            display: block;
            width: 150px;
            margin-top: -10px;
            z-index: 999;

        }

        #nav ul.menu li .sub a:hover {
            background: #444;
            color: #E089AC;
        }
    </style>
</head>



<body>

    <div id="wrapper">
        <div id="nav">
            <ul class="menu">
                <li><a href="#">MENU</a>
                    <ul class="sub">
                        <li><a href="/login/signOut" class="btn-menu">로그아웃</a></li>
                        <li><a href="/member/checkPw" class="btn-menu">회원정보수정</a></li>
                        <li><a href="/member/dropOut" class="btn-menu">회원탈퇴</a></li>
                    </ul>
                </li>
            </ul>
        </div>



        <div class="profile-main">
            <div class="photo-name">
                <div class="photo-pro">
                    <c:if test="${ profile != null }">
                        <img src="${ profile.imageRoot }" alt="img1" class="img1">
                    </c:if>
                </div>
                <h2 class="values">
                    ${profile.nickname}, &nbsp;<span>${profile.age}</span>
                </h2>

                <h3>좋아요 ${profile.likesCount}</h3>
            </div>

        </div>
        <div class="setting">
            <div class="set">
                <!-- a를 원래 버튼으로 기능 넣어줘야함 -->
                <a href="#" class="fas fa-cog fasrow"></a>
                <p>설정</p>

            </div>
            <div class="set">
                <a href="/profile/update?email=${member.email}" class="fas fa-id-card fasrow profile-up"></a>
                <p>프로필 수정</p>
            </div>
            <div class="set">
                <a href="/profile/create" class="fas fa-camera fasrow"></a>
                <p>미디어 추가</p>
            </div>
        </div>

        <form action="/matching/swipe" method="get">
            <input type="submit" value="←">
        </form>




    </div>

    <script type="text/javascript">
        $(document).ready(function () {


            $("#nav ul.sub").hide();
            $("#nav ul.menu li").click(function () {
                $("ul", this).slideToggle("fast");
            });

        })

        var msg = '${msg}';
        if (msg.length > 0) {
            alert(msg);
        }
    </script>
</body>

</html>