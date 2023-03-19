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
    .leaveOuter{
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
    #textBox{
        resize: none;
        width:690px;
        height:190px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }
    .textWrap{
        margin-left: 610px;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600;
        color:rgb(50,50,50)
    }
    .btnWrap button{
        width:50px;
        height:30px;
        font-size: 12px;
        line-height: 5px;
    }
</style>
</head>
<body>

	<jsp:include page = "../common/menubar.jsp" />
    <div class="leaveOuter">
        <h4><b>휴가 > ${ lc.lcName } 등록</b></h4>
       
        <form action="adminUpdate.le" method="" class="enrollForm" name="leEnroll" onsubmit="return confirm('휴가승인을 등록하시겠습니까?');">

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
                        &nbsp;신청자&nbsp; <input type="text" name="" value="${ lc.empName }"> 
                        &nbsp;소속&nbsp; <input type="text" name="" value="${ lc.deptName }">
                        <input type="hidden" name="empNo" value="${ lc.empNo }">
                        <input type="hidden" name="deptCode" value="${ lc.deptCode }">
                        <input type="hidden" name="teamCode" value="${ lc.teamCode }">
                    </div>
                    <div style="background:rgb(234, 234, 234); width:460px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <img src="resources/images/ess/clock.png" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        시작일&nbsp;&nbsp; <input type="text" name="leaveStart" value="${lc.leaveStart}"> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종료일&nbsp; <input type="text" name="leaveEnd" value="${lc.leaveEnd}"> 
                    </div>
                    <div style="background:rgb(234, 234, 234); width:441px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br><br>
                
                <div class="textWrap">
                    <span class="textCount">&nbsp;&nbsp;${lc.leaveContent.length()}자</span><span class="textTotal">/200자</span>
                </div>
                
                
	            <textarea name="leaveContent" id="textBox" cols="30" rows="10" maxlength="199" placeholder="휴가신청 내용을 입력해주세요.">${lc.leaveContent}</textarea>
	            <div class="btnWrap" style="float: right; margin-top:160px;">
                    <button type="submit" class="btn btn-success">승인</button>
                    <button type="button" onclick="leaveReturn(${lc.leaveNo});" class="btn btn-warning" id="leaveReturn">반려</button>
                    <button type="button" onclick="location.href='admin.ot'" class="btn btn-secondary">목록</button>
                </div>
				
            </div>
            
	    </form>

        <script>

            $(function(){
                if(${not empty lc.failDate} || ${not empty lc.secondDate}){
                    $("#leaveReturn").attr("disabled", true);
                }
            })

            $(function(){
                $("#leaveReturn").click(function(){
                    if(confirm("휴가등록을 반려하시겠습니까?")){
                        location.href='adminReturn.le?leaveNo=${lc.leaveNo}';
                    }
                    
                })
            })
        </script>

    </div>
</body>
</html>