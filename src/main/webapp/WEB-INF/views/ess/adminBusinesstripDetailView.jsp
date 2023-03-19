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
    .businesstripOuter{
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
    input[type=text]{
        width:100px;
        border: 1px solid rgb(170, 170, 170);
        border-radius: 5px;
        text-align: center; 
    }
    #btText{
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
        margin-left: 620px;
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
    <jsp:include page="../common/menubar.jsp"/>
    <div class="businesstripOuter">

        <h4><b>신청</b></h4>

        <form action="adminUpdate.bt" method="" class="enrollForm">

            
            <div class="body">
                <div style="display: flex;">
                    <img src="resources/images/ess/pencil.png" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">&nbsp;출장일정, 필요정보 입력</div>
                    <div style="background:rgb(234, 234, 234); width:660px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <img src="resources/images/ess/mark.png" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        &nbsp;신청자&nbsp; <input type="text" name="" value="${ b.empName }"> 
                        &nbsp;소속&nbsp; <input type="text" name="" value="${ b.deptName }"> 
                        <input type="hidden" name="empNo" value="${ b.empNo }">
                    </div>
                    <div style="background:rgb(234, 234, 234); width:520px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        <img src="resources/images/ess/clock.png" alt="" style="width:30px; height:30px">
                        시작일&nbsp; <input type="text" name="btStart" value="${b.btStart}"> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종료일&nbsp; <input type="text" name="btEnd" value="${b.btEnd}"> 
                    </div>
                    <div style="background:rgb(234, 234, 234); width:490px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br><br>
                <div class="textWrap">
                    <span class="textCount">${b.btContent.length()}자</span><span class="textTotal">/200자</span>
                </div>
                <textarea name="" id="btText" cols="30" rows="10" placeholder="출장신청 내용을 입력해주세요.">${b.btContent}</textarea>
                <div class="btnWrap" style="float: right; margin-top:160px;">
                    <button type="submit" class="btn btn-success">승인</button>
                    <button type="button" onclick="btReturn(${b.btNo});" class="btn btn-warning" id="btReturn">반려</button>
                    <button type="button" onclick="location.href='admin.bt'" class="btn btn-secondary">목록</button>
                </div>
                

            </div>

        </form>

        <script>
            $(function(){
                if(${not empty b.failDate} || ${not empty b.secondDate}){
                    $("#btReturn").attr("disabled", true);
                }
            })

            function btReturn(no){
                if(confirm("출장등록을 반려하시겠습니까?")){
                    location.href='adminReturn.bt?btNo=' + no;
                }
                
            }
        </script>
        


    </div>
</body>
</html>