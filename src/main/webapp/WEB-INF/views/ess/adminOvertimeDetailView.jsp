<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style>
    /* outer영역 */
    .businessOuter{
        padding:50px;
        margin:auto;
    }
    /* content영역 */
    .enrollForm{
        margin-top: 30px;
    }
    .header{
        display: flex;
    }
    input{
        width:100px;
        border: 1px solid rgb(170, 170, 170);
        border-radius: 5px;
    }
    textarea{
        resize: none;
        width:690px;
        height:190px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }
    button[type=button]{
        height:30px;
        width:60px;
        border-radius: 5px;
        font-size: 14px;
        line-height: 5px;
    }
    button[type=submit]{
        width:125px;
        height:30px;
        border-radius: 5px;
        font-size: 14px;
        line-height: 5px;
    }
    .textWrap{
        margin-left: 630px;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600;
        color:rgb(50,50,50)
    }
</style>
</head>
<body>
    <div class="businessOuter">

        <h4><b>신청</b></h4>

        <form action="adminUpdate.bt" method="" class="enrollForm">

            
            <div class="body">
                <div style="display: flex;">
                    <img src="" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">&nbsp;출장일정, 필요정보 입력</div>
                    <div style="background:rgb(234, 234, 234); width:700px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <img src="" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        &nbsp;신청자&nbsp; <input type="text" name="" value="로그인사원이름"> 
                        &nbsp;소속&nbsp; <input type="text" name="" value="로그인사원소속"> 
                    </div>
                    <div style="background:rgb(234, 234, 234); width:550px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        시작일&nbsp; <input type="date" name="" value="" style="width:150px; text-align: center; height:20px;"> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종료일&nbsp; <input type="date" name="" value="" style="width:150px; text-align: center; height:20px;"> 
                    </div>
                    <div style="background:rgb(234, 234, 234); width:452px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br><br>
                <div class="textWrap">
                    <span class="textCount">0자</span><span class="textTotal">/200자</span>
                </div>
                <textarea name="" id="" cols="30" rows="10" placeholder="출장신청 내용을 입력해주세요."></textarea>
                <div style="float: right; margin-top:160px;">
                    <button type="button" class="btn btn-secondary">취소</button>
                    <button type="submit" class="btn btn-success">시간외근무신청</button>
                </div>

            </div>

        </form>

    </div>
</body>
</html>