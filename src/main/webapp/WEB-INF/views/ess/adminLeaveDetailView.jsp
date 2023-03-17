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
    .outer{
        width:960px;
        height:1000px;
        border:1px solid black;
    }
    /* 메뉴바 영역 */
    .title{
        color:rgb(50,50,50);
        margin-left: 30px;
        margin-top:30px;
    }
    .selectBar{
        margin-left: 30px;
    }
    .selectBar>span{
        color:rgba(50, 50, 50, 0.79);
        font-size:15px;
        font-weight: 600;
    }
    .selectBar>div{
        margin-top:10px;
        height:3px;
        float: left;
    }
    /* content영역 */
    .enrollForm{
        margin-left:30px;
        margin-right: 30px;
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
    .textWrap{
        margin-left: 630px;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600;
        color:rgb(50,50,50)
    }
    .btnWrap button{
        width:60px;
        height:30px;
        font-size: 14px;
        line-height: 5px;
    }
</style>
</head>
<body>

	<jsp:include page = "../common/menubar.jsp" />
    <div class="leaveOuter">
        <h4><b>휴가 > ${ lc.lcName } 등록</b></h4>
       
        <form action="insert.le" method="" class="enrollForm" name="leEnroll" onsubmit="return confirm('휴가신청을 등록하시겠습니까?');">

            <div class="header">
                <%-- <div style="margin-left: 10px; margin-top:15px; color:rgba(50, 50, 50); font-size: 15px; font-weight: 600;">${ l.lcName }</div> --%>
                <input type="hidden" name="leaveCategory" value="${ l.lcNo }" >
            </div>
            
            <br>
            
            <div class="body">
                <div style="display: flex;">
                    <img src="resources/images/ess/pencil.png" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">&nbsp;휴가일정, 필요정보 입력</div>
                    <div style="background:rgb(234, 234, 234); width:610px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <img src="resources/images/ess/mark.png" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        &nbsp;신청자&nbsp; <input type="text" name="" value="${ le.empName }"> 
                        &nbsp;소속&nbsp; <input type="text" name="" value="${ le.deptName }">
                        <input type="hidden" name="empNo" value="${ le.empNo }">
                    </div>
                    <div style="background:rgb(234, 234, 234); width:460px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <img src="resources/images/ess/clock.png" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        시작일&nbsp;&nbsp; <input type="text" name="leaveStart" value="${le.leaveStart}" readonly> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종료일&nbsp; <input type="text" name="leaveEnd" value="${le.leaveEnd}" readonly> 
                    </div>
                    <div style="background:rgb(234, 234, 234); width:441px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br><br>
                
                <div class="textWrap">
                    <div class="textCount">&nbsp;&nbsp;${le.leaveContent.length}자</div><div class="textTotal">/200자</div>
                </div>
                
                
	            <textarea name="leaveContent" id="textBox" cols="30" rows="10" maxlength="199" placeholder="휴가신청 내용을 입력해주세요." readonly>${le.leaveContent}</textarea>
	            <div class="btnWrap" style="float: right; margin-top:160px;">
                    <button type="submit" class="btn btn-success">승인</button>
                    <button type="button" onclick="" class="btn btn-warning">반려</button>
                    <button type="button" onclick="" class="btn btn-secondary">목록</button>
                </div>
				
            </div>
            
	    </form>

    </div>
</body>
</html>