<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8"/>
	
	<script src="/resources/sockjs.min.js"></script>
	<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
</head>
	<link rel="stylesheet" href="/resources/css/rooms.css">
	<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<body>
	<div class ="wrap">
	<div class="chat-container">
		<div class="chat-header">
			<button id="close" class="header-btn"></button>
			<button id="minimize" class="header-btn"></button>
			<button id="maximize" class="header-btn"></button>
			  </div>
    <div class="chatbox" id="chatbox"></div>
  
	<div class="text-box">
	<form id="chatForm">
		<textarea id="message" name="message"></textarea>
		<button id="send">send</button>
		<div class="clearfix"></div>
	</form>
	<form action="/chat/windows" method="get">
            <input type="submit" value="←">
        </form>
	</div>
	
</div>

</div>

	 
	<script>
		$(document).ready(function(){
			
			$("#chatForm").submit(function(event){
				event.preventDefault();
				if ($("#message").val() == '' || $("#message").val() == 'undefined') return;
				sock.send($("#message").val());
				$("#message").val('').focus();
			}); // charForm
			
			$("#message").keyup(function(e) {
				
				e.preventDefault();
				var code = e.keyCode ? e.keyCode : e.which;
				
				if (code == 13) {
					
					if (e.shiftKey === true) {
						// shift 키가 눌려진 상태에서는 new line 입력 
						} else {
							
							$('#chatForm').submit(); 
							} 
					
					return false; 
					} 
				});

			$('#chatbox').scrollTop($('#chatbox')[0].scrollHeight);
			
		});
		
		var sock = new SockJS("/echo");
		
		sock.onopen = function(e) {
			$(".chatbox").append('${profile.nickname}님이 채팅방에 입장하셨습니다.<br>')
		}
		
		sock.onmessage = function(e){
		
			$(".chatbox").append('<div class="my-bubble bubble">'+ e.data +'</div>');
			$('.chatbox').scrollTop($('#chatbox')[0].scrollHeight);
		} // sock
		
		sock.onclose = function(){
			$('.chatbox').append('${profile.nickname}님이 채팅방에 나가셨습니다. <br>')
			$(".chatbox").append("연결 종료");
		} // onclose
		
	</script>
	
	  
</body>
</html>