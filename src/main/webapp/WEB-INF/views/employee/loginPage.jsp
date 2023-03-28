<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>

    <!--제이쿼리-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
    <!-- 부트스트랩 5버전 -->
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> 

    <style>
	    /*sweetalert css*/
	    .swal-button{
	        background-color: rgb(172, 222, 172);
	        font-size: 12px;
	        text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
	    }
	    .swal-button:hover{
	        background-color: rgb(206, 236, 206);
	        font-size: 12px;
	        text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
	    }
	    .swal-title { font-size: 20px;}
    
        .outer {width:1200px; margin:auto;}
        .login-area {margin:auto; margin-top: 100px; width:600px; height:500px; padding-top: 100px; border: 1px solid gainsboro;}
        .login-form {margin:auto; width:400px; height:500px; margin-top: -50px;}
        /* 로그인 문구 */
        #logo-img {text-align:center;}
        #login h2 {font-weight:600; color:rgb(74, 133, 89);}
        /* 아이디, 비밀번호 input */
        #login-id, #login-pwd {text-align:center; height:13%;}
        #login-id input, #login-pwd input {border:1px solid rgb(74, 133, 89); width:90%; height:50px; 
            padding-left:10px; border-radius:3px;}
        /* 비밀번호 찾기 */
        #find-pwd {text-align: right; padding-right: 20px; height:50px;}
        #find-pwd a {text-decoration:none; color:gray; font-size:13px;}
        /* 로그인 버튼 */
        #login-btn {text-align:center;}
        #login-btn input {width:90%; height:50px;}
        
    </style>
</head>
<body>
	<c:if test="${not empty alertMsg }">
		<script>
			//alertify.alert('${alertMsg}');
            swal('${alertMsg}', '', 'success');
		</script>
		<c:remove var="alertMsg" scope="session"/>	
	</c:if>
    <c:if test="${not empty errorMsg }">
		<script>
			//alertify.alert('${alertMsg}');
            swal('${errorMsg}', '', 'error');
		</script>
		<c:remove var="errorMsg" scope="session"/>	
	</c:if>
	    
	
    <div class="outer">
        <div class="login-area">
            
            <form action="login.emp" method="post" class="login-form">
                
                <div id="logo-img"><img class="logo" src="resources/images/common/jwork_logo.png" width="250px"/></div>
                <div id="login-id"><input type="text" name="empNo" placeholder="사번" required></div>
                <div id="login-pwd"><input type="password" name="empPwd" placeholder="비밀번호" required></div>
                <div id="find-pwd"><a href="">비밀번호 찾기</a></div>
                <div id="login-btn"><input type="submit" class="btn btn-success" value="로그인"></div>

            </form>

        </div>
    </div>

</body>
</html>