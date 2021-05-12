<%@page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>동아줄 : 로그인</title>
    <link rel="stylesheet" href="/resources/css/login.css">
</head>


<body>
    <div class="wrap">
        <div class="login">
            <h2 id="title">Dongazul</h2>
            <div id="outter">
                <div class="between1"></div>
                <form action="/login/signInPost" method="POST">
                    <c:if test="${number == null}">
                        <div class="login_id">
                            <label for="email">E-mail</label>
                            <input type="text" id="email" name="email" placeholder="Email"><br>
                            <hr id="bar1">
                        </div>
                        <div class="login_pw">
                            <label for="passwd">Password</label>
                            <input type="password" id="passwd" name="passwd" placeholder="Password"><br>
                            <hr id="bar2">
                        </div>
                        <div class="login_etc">
                            <label for="rememberme">rememberMe</label>
                            <input type="checkbox" name="rememberme"><br>
                        </div>

                        <div class="between2"></div>

                        <div class="submit">
                            <input type="submit" value="Sign-In">
                        </div>
                    </c:if>

                </form>
                <div class="submit">
                    <form action="/member/signUp" method="GET">
                        <input type="submit" value="Sign-Up" />
                    </form>
                </div>
                <div class="submit">
                    <form action="/login/findId" method="get">
                        <input type="submit" value="forgot email?">
                    </form>
                </div>
                <div class="submit">
                    <form action="/login/findPw" method="get">
                        <input type="submit" value="forgot password?">
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
    var msg = '${msg}';
    if (msg.length > 0) {
        alert(msg);
    }
	$(document).ready(function () {
   
	     $("#email").focus( function() {
	          $( "#bar1" ).css( "border", "1.2px solid #E089AC" );
	          $( "#bar1" ).css( "backgroundcolor", "rgb(9, 204, 9)" );
	        } );
	        
	        $("#email").blur( function() {
	            $( "#bar1" ).css( "border", "0.1px solid rgb(150, 150, 150)" );
	            $( "#bar1" ).css( "background-color", "rgb(150, 150, 150)" );
	        } );
	        
	        $("#passwd").focus( function() {
	            $( "#bar2" ).css( "border", "1.2px solid #E089AC" );
	            $( "#bar2" ).css( "backgroundcolor", "rgb(9, 204, 9)" );
	        } );
	        
	        $("#passwd").blur( function() {
	            $( "#bar2" ).css( "border", "0.1px solid rgb(150, 150, 150)" );
	            $( "#bar2" ).css( "background-color", "rgb(150, 150, 150)" );
	        } );
    })
    
</script>
</body>

</html>