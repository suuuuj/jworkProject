<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<title>Insert title here</title>
<style>
    /* outer영역 */
    .overtimeOuter{
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
        height:25px;
        border: 1px solid rgb(170, 170, 170);
        border-radius: 5px;
        text-align: center; 
    }
    .enrollForm select{
        width:100px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        height:25px;
    }
    #textBox{
        resize: none;
        width:690px;
        height:190px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }
    #textBox::placeholder{
    	font-size:13px;
    }
    button[type=reset]{
        border:none;
        height:30px;
        width:50px;
        border-radius: 5px;
        color: rgba(50, 50, 50);
        font-size:13px;
    }
    button[type=submit]{
        border:none;
        width:100px;
        height:30px;
       border-radius: 5px;
        font-size:11px;
    }
    .textWrap{
        width:690px;
        text-align: right;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600;
        color:rgb(50,50,50)
    }
    .textWrap div{
        display: inline-block; 
    }
    label{
        font-size: 13px; 
        font-weight: 600; 
        color:rgb(50,50,50); 
        margin-left: 3px;
    }
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />

    <div class="overtimeOuter">

        <h4><b>신청</b></h4>
        
        <form action="insert.ot" class="enrollForm" name="otEnroll" onsubmit="return confirm('시간외 근무를 등록하시겠습니까?');">

            
            <div class="body">
                <div style="display: flex;">
                    <img src="resources/images/ess/pencil.png" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">&nbsp;시간외 근무일정, 필요정보 입력</div>
                    <div style="background:rgb(234, 234, 234); width:629px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <img src="resources/images/ess/mark.png" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        &nbsp;&nbsp;신청자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="" value="${ o.empName }" readonly> 
                        &nbsp;소속&nbsp; <input type="text" name="" value="${ o.deptName }" readonly> 
                        <input type="hidden" name="empNo" value="${ e.empNo }">
                    </div>
                    <div style="background:rgb(234, 234, 234); width:500px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <img src="resources/images/ess/clock.png" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        &nbsp;구분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        &nbsp;<select name="otCategory" id="otCategory">
                            <option value="0">시간외 근무</option>
                            <option value="1">야간</option>
                            <option value="2">주말</option>
                        </select> 
                    </div>
                    <div style="background:rgb(234, 234, 234); width:639px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <script>
                    $(function(){
                        if(${o.otCategory} == 0){
                            $("#otCategory").val("0").prop("selected", true);
                        }else if(${o.otCategory == 1}){
                            $("#otCategory").val("1").prop("selected", true);
                        }else{
                            $("#otCategory").val("2").prop("selected", true);
                        }
                    })
                </script>

                <br>

                <div style="display: flex;">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px;">
                        &nbsp;근무날짜 / 시간&nbsp; <input type="text" id="" name="enrollDate" value="${o.enrollDate}" readonly> 

                        <input type="text" name="otStart" value="${o.otStart}" style="border:1px solid rgb(170, 170, 170); border-radius: 5px; width:80px; margin-left: 20px;" readonly>
                        <span style="font-size: 20px;">~</span>
                        <input type="text" name="otEnd" value="${o.otEnd}" id="" style="border:1px solid rgb(170, 170, 170); border-radius: 5px; width:80px; text-align: center; height:25px" readonly>
                        &nbsp;
                    </div>
                    <div style="background:rgb(234, 234, 234); width:450px; height:1px; margin-top:20px; margin-left: 5px;">&nbsp;</div>
                </div>

                <br><br>
                <div class="textWrap">
                    <div class="textCount">&nbsp;&nbsp;0자</div><div class="textTotal">/200자</div>
                </div>
                <textarea name="otContent" id="textBox" cols="30" rows="10" maxlength="199" placeholder="시간외 근무신청 내용을 입력해주세요." readonly></textarea>
                <div style="float: right; margin-top:160px;">
                    <button type="button" class="btn btn-secondary" onclick="list.wt">목록</button>
                    <button type="button" class="btn btn-warning" onclick="deleteFunction()">삭제</button>
                </div>

            </div>

        </form>

        <script>
            $(function(){
                $("#textBox").keyup(function(e){
                    let content = $(this).val();

                    if(content == 0 || content == ""){
                        $(".textCount").text('0자');
                    }else{
                        $('.textCount').text(content.length + '자');
                    }

                    if(content.length > 200){
                        $(this).val($(this).val().substring(0, 200));

                        alert("글자수는 200자까지 입력 가능합니다.");
                    };
                });
            })
            
        </script>


    </div>
</body>
</html>