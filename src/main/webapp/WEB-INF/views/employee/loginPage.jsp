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
    
        /* .outer {width:1200px; margin:auto; display: flex;
                justify-content: center;} */
        .login-area {
            width:100%; height:100%; display: flex;
            justify-content: center; align-items: center; 
        }
        .login-form {font-size: 14px; margin-top: 10%;}
        #login{float:left;}
        /* 로그인 문구 */
        #logo-img {text-align:center; margin-right: 20px;}
        /* #login h2 {font-weight:600; color:rgb(74, 133, 89);} */
        /* 아이디, 비밀번호 input */
        #login-id, #login-pwd {text-align:center; height:13%; }
        #login-id input, #login-pwd input {
            border:3px solid rgb(85, 85, 85); border-radius:5px;
            width:280px; height:50px; font-weight: 600; color: rgb(95, 95, 95);
            padding-left:10px;  margin: 10px 0px 3px 10px; 
        }
        #login-id input:hover {
            background-color: #FECCBE;  color: rgb(255, 255, 255);
        }
        #login-pwd input:hover {
            background-color: #FEEBB6;
        }
        /* 비밀번호 찾기 */
        /* #find-pwd {text-align: right; padding-right: 20px; height:50px;}
        #find-pwd a {text-decoration:none; color:gray; font-size:13px;} */
        /* 로그인 버튼 */
        #login-btn {text-align:center; float:left; margin: 10px 0px 10px 5px; width: 90px;}
        #login-btn input {
            width:90%; height:112px; 
            border: 3px solid rgb(85, 85, 85); border-radius:5px; 
            background-color: #DDECCA; color: rgb(83, 83, 83); font-weight: 600;
        }
        #login-btn input:hover {
            background-color: #CCD2F0; color: rgb(255, 255, 255);
        }

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
                
                <div id="logo-img"><img class="logo" src="resources/images/common/jworkLogo.png" width="300px"/></div>
                <div id="login-area">
                    <div id="login">
                        <div id="login-id"><input type="text" name="empNo" placeholder="사번" required></div>
                        <div id="login-pwd"><input type="password" name="empPwd" placeholder="비밀번호" required></div>
                    <!-- <div id="find-pwd"><a href="">비밀번호 찾기</a></div> -->
                    </div>
                    <div id="login-btn"><input type="submit" value="로그인"></div>
                </div>

            </form>

        </div>
    </div>

</body>
</html>