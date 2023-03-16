<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    input[type=text]{
        width:100px;
        height:25px;
        border: 1px solid rgb(170, 170, 170);
        border-radius: 5px;
        text-align: center; 
    }
    #textBox{
        resize: none;
        width:690px;
        height:190px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }#textBox::placeholder{
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
        font-size:12px;
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
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />

    <div class="businessOuter">

        <h4><b>신청</b></h4>
        
        <form action="insert.bt" class="enrollForm" name="btEnroll" onsubmit="return confirm('출장신청을 등록하시겠습니까?');">
            
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
                        &nbsp;신청자&nbsp; <input type="text" name="" value="${ e.empName }"> 
                        &nbsp;소속&nbsp; <input type="text" name="" value="${ e.deptName }"> 
                        <input type="hidden" name="empNo" value="${ e.empNo }">
                    </div>
                    <div style="background:rgb(234, 234, 234); width:520px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        <img src="resources/images/ess/clock.png" alt="" style="width:30px; height:30px">
                        시작일&nbsp; <input type="text" id="datepicker1" name="btStart" value=""> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종료일&nbsp; <input type="text" id="datepicker2" name="btEnd" value=""> 
                    </div>

                    <!-- datepicker -->
                    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
                    <script>	
                                
                    $(function(){
                        
                        
                        $("#datepicker1").datepicker({
                            changeMonth: true, 
                            changeYear: true,
                            minDate: '0',
                            nextText: '다음 달',
                            prevText: '이전 달',
                            yearRange: 'c-50:c+20',
                            showButtonPanel: true, 
                            currentText: '오늘 날짜',
                            closeText: '닫기',
                            dateFormat: "yy-mm-dd",
                            showAnim: "slide",
                            showMonthAfterYear: true, 
                            dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
                            onSelect: function(selected){
                                $("#datepicker2").datepicker("option", "minDate", selected);
                            }
                        });	
                        
                        $("#datepicker2").datepicker({
                            changeMonth: true, 
                            changeYear: true,
                            minDate: '0',
                            nextText: '다음 달',
                            prevText: '이전 달',
                            yearRange: 'c-50:c+20',
                            showButtonPanel: true, 
                            currentText: '오늘 날짜',
                            closeText: '닫기',
                            dateFormat: "yy-mm-dd",
                            showAnim: "slide",
                            showMonthAfterYear: true, 
                            dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
                            onSelect: function(selected){
                                $("#datepicker1").datepicker("option", "maxDate", selected);
                            }
                        });	
                        
                        
                        
                    });
                    
                    </script> 

                    <!-- 에러 해결 시작 - 홈짱 -->

                    <script>

                        jQuery.browser = {};
                        
                        (function () {
                        
                            jQuery.browser.msie = false;
                        
                            jQuery.browser.version = 0;
                        
                            if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
                        
                                jQuery.browser.msie = true;
                        
                                jQuery.browser.version = RegExp.$1;
                        
                            }
                        
                        })();
                        
                        </script>
                        
                        <!-- 에러 해결 종료 - 홈짱 -->

                    <div style="background:rgb(234, 234, 234); width:490px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br><br>
                <div class="textWrap">
                    <div class="textCount">0자</div><div class="textTotal">/200자</div>
                </div>
                <textarea name="btContent" id="textBox" cols="30" rows="10" maxlength="199" placeholder="출장신청 내용을 입력해주세요."></textarea>
                <div style="float: right; margin-top:160px;">
                    <button type="reset" class="btn btn-secondary">취소</button>
                    <button type="submit" class="btn btn-success" >출장신청하기</button>
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