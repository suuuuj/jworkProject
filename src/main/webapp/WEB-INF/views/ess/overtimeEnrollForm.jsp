<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    .tooltip-inner {
        font-size: 11px; /* 툴팁 텍스트의 글자 크기 조정 */
        white-space: pre-wrap; /* 줄바꿈을 허용하고, 빈칸도 유지함 */
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
                        &nbsp;&nbsp;신청자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="" value="${ e.empName }"> 
                        &nbsp;소속&nbsp; <input type="text" name="" value="${ e.deptName }"> 
                        <input type="hidden" name="empNo" value="${ e.empNo }">
                        <input type="hidden" name="deptCode" value="${ e.deptCode }">
                        <input type="hidden" name="teamCode" value="${ e.teamCode }">
                        <input type="hidden" name="jobCode" value="${ e.jobCode }">
                    </div>
                    <div style="background:rgb(234, 234, 234); width:500px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <img src="resources/images/ess/clock.png" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        &nbsp;<a href="#" data-toggle="tooltip" 
                        title="시간외근무 : 18:00:00 ~ 22:00:00&#10;야간 : 22:00:00 ~ 24:00:00        &#10;주말 : 토요일,일요일,공휴일      " style="text-decoration: none; color:rgb(50,50,50);">구분</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <script>
                            $(function () {
                                $('[data-toggle="tooltip"]').tooltip()
                            })
                        </script>
                        &nbsp;<select name="otCategory" id="">
                            <option value="0">시간외 근무</option>
                            <option value="1">야간</option>
                            <option value="2">주말</option>
                        </select> 
                    </div>
                    <div style="background:rgb(234, 234, 234); width:639px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px;">
                        &nbsp;근무날짜 / 시간&nbsp; <input type="text" id="datepicker" name="enrollDate" value=""> 

                        <!-- datepicker -->
                        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
                        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></scrip>
                        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
                        
                        <script>	  
                        $(function(){
                            
                            $("#datepicker").datepicker({
                                changeMonth: true, 
                                changeYear: true,
                                maxDate: '0',
                                nextText: '다음 달',
                                prevText: '이전 달',
                                yearRange: 'c-50:c+20',
                                showButtonPanel: true, 
                                currentText: '오늘 날짜',
                                closeText: '닫기',
                                dateFormat: "yy-mm-dd",
                                showAnim: "slide",
                                showMonthAfterYear: true, 
                                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
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

                        <select name="otStart" value="" style="border:1px solid rgb(170, 170, 170); border-radius: 5px; width:80px; margin-left: 20px;">
                            
                            <!-- 30분단위 맞추는거 어렵다 따흐흑 -->
                            <script>
                                for(var i=0; i<49; i++){
		                            var hour = "";
		                            var min = ":00";
		                            
		                            if((Math.ceil(i/2))<9){
		                            	
		                                hour = (Math.floor(i/2));
		                                
		                            }else{
		                            	
		                                hour = (Math.floor(i/2));
		                                if(hour<10){
		                                    hour = "0"+hour;
		                                }
		                                if(i % 2 != 0){
		                                    min = ":30";
		                                }
		                                document
		                                .write('<option value=' + hour + min + '>' + hour + min + '</option>');
		                                
		                            }
		                        }
                            </script>
                        </select>
                        <span style="font-size: 20px;">~</span>
                        <select name="otEnd" value="" id="" style="border:1px solid rgb(170, 170, 170); border-radius: 5px; width:80px; text-align: center; height:23px">
                            <!-- 30분단위 select돌리기 수정하기 -->
                            <script>
                                for(var i=0; i<49; i++){
		                            var hour = "";
		                            var min = ":00";
		                            
		                            if((Math.ceil(i/2))<9){
		                            	
		                                hour = (Math.floor(i/2));
		                                
		                            }else{
		                            	
		                                hour = (Math.floor(i/2));
		                                if(hour<10){
		                                    hour = "0"+hour;
		                                }
		                                if(i % 2 != 0){
		                                    min = ":30";
		                                }
		                                document
		                                .write('<option value=' + hour + min + '>' + hour + min + '</option>');
		                                
		                            }
		                        }
                            </script>
                        </select>&nbsp;
                    </div>
                    <div style="background:rgb(234, 234, 234); width:450px; height:1px; margin-top:20px; margin-left: 5px;">&nbsp;</div>
                </div>

                <br><br>
                <div class="textWrap">
                    <div class="textCount">&nbsp;&nbsp;0자</div><div class="textTotal">/200자</div>
                </div>
                <textarea name="otContent" id="textBox" cols="30" rows="10" maxlength="199" placeholder="시간외 근무신청 내용을 입력해주세요."></textarea>
                <div style="float: right; margin-top:160px;">
                    <button type="reset" class="btn btn-secondary">취소</button>
                    <button type="submit" class="btn btn-success">시간외근무신청</button>
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