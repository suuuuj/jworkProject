<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
     div{box-sizing: border-box;}
     figure {
  text-align: center;
    }
   #day-select a, #reservation-table a{
        text-decoration: none;
        color: black;
    }
    .outer{
        width: 960px;
    }
    
    #carDetailView tr td{
    	 height: 30px;
    }
 .fc-toolbar-chunk *{
	 float:left!important;
	 margin-left:14px!important;
	}
	.fc-daygrid-day-frame,.fc-timegrid-axis-frame-liquid,.fc-timegrid-axis{
	display:none;
	}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.4/index.global.min.js'></script>
   
    <script>
    document.addEventListener('DOMContentLoaded', function() {
    	  var calendarEl = document.getElementById('calendar');

    	  var calendar = new FullCalendar.Calendar(calendarEl, {
    		  schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
    		  expandRows: true,
    		  timeZone: 'local',
    		  selectable: true,
    		 slotMinTime: "09:00:00", // 최소시간
             slotMaxTime: "20:00:00", // 최대시간 (23시까지만 화면에 보여짐)
    	    initialView: 'resourceTimeGridDay',
    	    nowIndicator: true, 
    	    dateClick: function(info) {
              //  alert('Clicked on: ' + info.dateStr);
                // change the day's background color just for fun
              /*   info.dayEl.style.backgroundColor = '#d6dfcc'; */
               // $("#reservationForm").modal("show");
              
            },
    	    headerToolbar: {
    	    	left:'',
                center: 'prev,title,next',
               right:'today,listWeek'/* ,timeGridWeek' */
            },
            
            buttonText: {
                prev:"<",
                next:">",
                today: "오늘",
                month:"월",
                week:"주",
                day:"일",
                list: "목록",
            },
            nowIndicator: true, // 현재 시간 마크
            navLinks:false, // 달력상의 날짜를 클릭할 수 있는지 여부, 클릭시 일 달력/주 달력으로 넘어감(Boolean, default:false/Demo)
            locale: 'ko',
            day:'numeric',
            navLinks: true,
           	select:function(info){

        		$.ajax({
        			url:"detail.car",
        			data:{carName:info.resource.id},
        			success:function(c){
        				$("#carName").text(c.carName);
        				$("#reserveCarName").attr("value",c.carName);
        				$("#carImg").attr("src",c.carImg);
        				$("#carType").text(c.carType);
        				$("#gearType").text(c.gearType);
        				$("#color").text(c.color);
        				$("#maker").text(c.maker);
        				$("#fuelType").text(c.fuelType);
        				$("#modelYear").text(c.modelYear);
        				
        				if(c.status == 'Y'){
        					$("#status").text("정상").css("color","blue");
        				}else{
        					$("#status").text("고장").css("color","red");
        					$("#reserveBtn").attr("disabled",true);
        				}
        				$("span[id=etc]").text(c.etc);


        			},error:function(){
        				
        				console.log("ajax통신 실패");
        			}
        			
        		});
        		
        		$("#carDetailView").modal("show");
        		
           	},
    	    resources: [
    	      $.ajax({
    	    		url:"list.acar",
    	    		success:function(list){
    	    			for(let i=0; i<list.length; i++){
    	    				calendar.addResource({
    	    				id:list[i].carName,
    	    				title:list[i].carName,
    	    				url:list[i].carImg
    	    				})
    	    			}
    	    		}
    	    		
    	    	})
    	    ], 
    	 
                 events: [
                 	
                 ]
                 
    	  })

    	  calendar.render();
    	});
		
    
 
    	
   
    </script>
  	
</head>
<body>
   
    <jsp:include page="../common/menubar.jsp"/>
    <div style="width: 940px; margin:20px;">
        <h2>차량 예약 현황</h2>
        <hr>
         <div id='calendar' style="margin:20px;">
          
           
            </div>
        
        <div>
     
           
    </div>
          
			<!--   <script>
			   $(function() {
			       //input을 datepicker로 선언
			       $("#datepicker").datepicker({
			          dateFormat: 'yy-mm-dd' //달력 날짜 형태
			           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
			           ,changeYear: true //option값 년 선택 가능
			           ,changeMonth: true //option값  월 선택 가능                
			           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
			           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
			           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
			           ,buttonText: "선택" //버튼 호버 텍스트              
			           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
			           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
			           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
			           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
			           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
			           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)   
			       });                    
			       
			       //초기값을 오늘 날짜로 설정해줘야 합니다.
			      //$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
			   		
			       
				    // Cannot read property 'msie' of undefined 에러 나올때
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
				   
			   }); -->
      
        </div>
       



    <!-- 상세보기 -->
     <script>
            	function detailView(carName){
            		
            		$.ajax({
            			url:"detail.car",
            			data:{carName:carName},
            			success:function(c){
            				$("#carName").text(c.carName);
            				$("#reserveCarName").attr("value",c.carName);
            				$("#carImg").attr("src",c.carImg);
            				$("#carType").text(c.carType);
            				$("#gearType").text(c.gearType);
            				$("#color").text(c.color);
            				$("#maker").text(c.maker);
            				$("#fuelType").text(c.fuelType);
            				$("#modelYear").text(c.modelYear);
            				
            				if(c.status == 'Y'){
            					$("#status").text("정상").css("color","blue");
            				}else{
            					$("#status").text("고장").css("color","red");
            					$("#reserveBtn").attr("disabled",true);
            				}
            				$("span[id=etc]").text(c.etc);


            			},error:function(){
            				
            				console.log("ajax통신 실패");
            			}
            			
            		});
            	}
            
            </script>

    <!-- 차량 상세 조회 -->
    <div class="modal" id="carDetailView">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">차량 상세 정보</h4>
            <button type="button" class="close" data-dismiss="modal" onclick=" $('#carDetailView').modal('hide');">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <table id="carDetailView">
                    <tr >
                        <th >차량명</th>
                        <td>
                            <div class="col-10">
                            	<span id="carName"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>차량 대표 이미지</th>
                        <td>
                        	 <img id="carImg" src="<c:out value='${car.carImg}' default='resources/uploadFiles/imgAdd.png'/>"   width="100px" height="70px" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th >차량종류</th>
                        <td>
                          <div class="col-10">
                         	 <span id="carType"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >기어형식</th>
                        <td>
                           <div class="col-10">
                           	<span id="gearType"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >차량색상</th>
                        <td>
                           <div class="col-10">
                           	<span id="color"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >제조사</th>
                        <td>
                           <div class="col-10">
                           	<span id="maker"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >연료형식</th>
                        <td>
                           <div class="col-10">
                           	<span id="fuelType"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >차량연식</th>
                        <td>
                          <div class="col-10">
                          	<span id="modelYear"></span>
                            </div>
                        </td>                   
                    </tr>
                    <tr>
                        <th>설비상태</th>
                        <td>
                        	<span id="status"></span>
                            
                        </td>
                    </tr>
                    <tr>
                        <th >비고</th>
                        <td>
                        	<span id="etc"></span>
                        </td>
                    </tr>

                </table>
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
            	<form action="reservForm.car" method="post">
            		<input type="hidden"  name="carName" id="reserveCarName" >
            		<button type="submit" class="btn btn-sm btn-primary"  type="submit" id="reserveBtn">예약하기</button>
            	</form>
                <button type="button" class="btn btn-sm btn-light" data-dismiss="modal" onclick=" $('#carDetailView').modal('hide');">닫기</button>
            </div>
    
        </div>
        </div>
    </div>
    
    
  
</body>
</html>