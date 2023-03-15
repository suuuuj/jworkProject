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
    .workingOuter{
        padding:50px;
        margin:auto;
    }
    /* content영역 */
    .select-area{
    	margin-top: 30px;
    	font-size: 14px;
        color:rgb(50,50,50);
    }
    .select-area input[type=date]{
        width:110px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        font-size: 14px;
        color:rgb(50, 50, 50);
    }
    .select-area button{
        width:60px;
        height:30px;
        font-size: 12px;
        line-height:5px;
        margin-bottom: 3px;
    }
    .businessTable, .overTable{
        width:100%;
        border-top:1px solid rgb(234, 234, 234);
        text-align: center;
        font-size: 14px;
        color:rgb(50,50,50);
        border-top:1px solid rgb(234, 234, 234);
    }
    .businessTable td, .overTable td{
        border-bottom: 1px solid rgb(234, 234, 234);
        color:rgb(50, 50, 50);
        height:30px;
    }
    .paging-area button{
        width:30px;
        height:30px;
        border:none;
        border-radius: 5px;
    }
    .businessTable tbody input[type=text]{
        width:100px;
        height:20px;
        text-align: center;
        border:none;
    }
    .overTable tbody input[type=text]{
    	width:60px;
        height:20px;
        text-align: center;
        border:none;
    }
    .businessList, .overList{
        height:350px;
    }
    .businessTable button, .overTable button{
        width:50px;
        height:25px;
        font-size: 11px;
        line-height:5px;
        color:white;
    }
    #bpagingArea, #opagingArea{
    	width:fit-content;
    	margin:auto;
    }
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />

	<div class="workingOuter">

		<h4><b>신청</b></h4>

		<div class="select-area" style="float: right">
			<input type="date" name="startDate" value=""> <span
				style="font-size: 20px; color: rgb(170, 170, 170)">~</span> <input
				type="date" name="endDate" value="">
			<button type="button" class="btn btn-success" onclick="">검색</button>
		</div>
		<br>
		<br>
		<div class="businessList">
			<span style="font-size: 15px; font-weight: 600;">출장신청</span> 
			<input type="text" name="" value="" id="bCount" style="font-size: 15px; color: rgb(0, 172, 0); font-weight: 600; border: none; text-align: left;">
			<br>
			<br>
			<table class="businessTable">
				<thead>
					<tr
						style="font-weight: 600; height: 30px; background-color: rgba(0, 172, 0, 0.219);">
						<td width="120px">이름</td>
						<td width="120px;">부서명</td>
						<td width="120px;">신청종류</td>
						<td width="300px;">일자</td>
						<td width="180px;">결재현황</td>
						<td width="70"></td>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>

			<br>
			<br>

			<div id="bpagingArea">
				<ul class="pagination bpagination">
				
				</ul>
			</div>

		</div>

		<br>
		<br>

		<div class="overList">
			<span style="font-size: 15px; font-weight: 600;">시간외 근무신청</span> 
			<input type="text" name="" value="" id="oCount" style="font-size: 15px; color: rgb(0, 172, 0); font-weight: 600; border: none; text-align: left;">
			<br>
			<br>
			<table class="overTable">
				<thead>
					<tr style="font-weight: 600; height: 30px; background-color: rgba(0, 172, 0, 0.219);">
						<td width="120px">이름</td>
						<td width="120px;">부서명</td>
						<td width="120px;">신청종류</td>
						<td width="120px;">일자</td>
						<td width="200px;">시간</td>
						<td width="150px;">결재현황</td>
						<td width="70"></td>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>

			<br>
			<br>

			<div id="opagingArea">
				<ul class="pagination opagination">
				
				</ul>
			</div>

		</div>

		<script>
			$(function(){
	            $(".businessTable>tbody button").click(function(){
	                if(confirm("신청을 취소하시겠습니까?") == true){
	                    location.href = 'delete.bt?no=' + ''
	                }
	            });
	
	            $(".overTable>tbody button").click(function(){
	                if(confirm("신청을 취소하시겠습니까?")){
	                    location.href = 'delete.ot?no=' + ''
	                }
	            })
	
	            
	        })
        </script>
		<script>
	            $(function(){
	            	
	            	businesstripList(1);
	            	
	            	overtimeList(1);
	            })
	            
	            function businesstripList(page){
	            	$.ajax({
	            		url:"list.bt",
	            		type:"POST",
	            		dataType:"json",
	            		data:{
	            			empNo : ${e.empNo},
	            			bpage : page
	            		},
	            		success:function(bmap){
	            			//console.log(bmap.bPi.currentPage);
	            			
	            			// count
	            			$("#bCount").attr('value', bmap.bListCount);
	            			
	            			// tbody
	            			let value = "";
	            			for(var i=0; i<bmap.bList.length; i++){
	            				value += "<tr>"
	            				        + "<td>" + bmap.bList[i].empName + "</td>"
	            				        + "<td>" + bmap.bList[i].deptName + "</td>"
	            				        + "<td>출장</td>"
	            				        + "<td><input type='text' name='btStart' value='" + bmap.bList[i].btStart + "'><span style='font-size: 15px; font-weight: 600;'>~</span><input type='text' name='btEnd' value='" + bmap.bList[i].btEnd + "'></td>"
	            				        + "<td>" + bmap.bList[i].btCheck + "</td>"
	            				        + "<td><button class='btn btn-warning' onclick='deleteBusinesstrip(" + bmap.bList[i].btNo +");'>취소</button></td>"
	            				       + "</tr>";
	            				       
	            				$(".businessTable tbody").html(value);
	            			};
	            			
	            			// 페이징바 만들때 해당 페이지숫자 클릭시 => businessTripList(클릭한숫자);
	            			let page = "";
	            			if(bmap.bPi.currentPage == 1){
	            				page += "<li class='page-item' disabled><a class='page-link' href='#'><</a></li>"
	            			}else{
	            				page += "<li class='page-item'><a class='page-link' onclick='businesstripList(" + (bmap.bPi.currentPage-1) + ");'><</a></li>"
	            			}
	            			
	            			for(var b=bmap.bPi.startPage; b<=bmap.bPi.endPage; b++){
	            			
	            				page += "<li class='page-item'><a class='page-link' onclick='businesstripList(" + b + ");'>" + b + "</a></li>"
	            			}
	            			
	            			if(bmap.bPi.currentPage == bmap.bPi.maxPage){
	            				page += "<li class='page-item' disabled><a class='page-link' href='#'>></a></li>"
	            			}else{
	            				page += "<li class='page-item'><a class='page-link' onclick='businesstripList(" + (bmap.bPi.currentPage+1) + ");'>></a></li>"
	            			}
	            			
	            			$(".bpagination").html(page);
	            			
	            		},
	            		error:function(){
	            			console.log("출장신청 ajax통신 실패");
	            		}
	            	});
	            }
	            
	            function overtimeList(page){
	            	$.ajax({
	            		url:"list.ot",
	            		type:"POST",
	            		dataType:"json",
	            		data:{
	            			empNo : ${e.empNo},
	            			opage : page
	            		},
	            		success:function(omap){
	            			//console.log(omap);
	            			
	            			// count
	            			$("#oCount").attr('value', omap.oListCount);
	            			
	            			// tbody
	            			let value = "";
	            			for(var i=0; i<omap.oList.length; i++){
	            				value += "<tr>"
	            				        + "<td>" + omap.oList[i].empName + "</td>"
	            				        + "<td>" + omap.oList[i].deptName + "</td>"
	            				        + "<td>" + omap.oList[i].otCategory + "</td>"
	            				        + "<td>" + omap.oList[i].enrollDate + "</td>"
	            				        + "<td><input type='text' name='otStart' value='" + omap.oList[i].otStart + "'><span style='font-size: 15px; font-weight: 600;'>~</span><input type='text' name='otEnd' value='" + omap.oList[i].otEnd + "'></td>"
	            				        + "<td>" + omap.oList[i].otCheck + "</td>"
	            				        + "<td><button class='btn btn-warning' onclick='deleteOvertime(" + omap.oList[i].otNo + ");'>취소</button></td>"
	            				       + "</tr>";
	            				       
	            				$(".overTable tbody").html(value);
	            			};
	            			
	            			// 페이징바 만들때 해당 페이지숫자 클릭시 => businessTripList(클릭한숫자);
	            			let page = "";
	            			if(omap.oPi.currentPage == 1){
	            				page += "<li class='page-item' disabled><a class='page-link' href='#'><</a></li>"
	            			}else{
	            				page += "<li class='page-item'><a class='page-link' onclick='overtimeList(" + (omap.oPi.currentPage-1) + ");'><</a></li>"
	            			}
	            			
	            			for(var o=omap.oPi.startPage; o<=omap.oPi.endPage; o++){
	            			
	            				page += "<li class='page-item'><a class='page-link' onclick='overtimeList(" + o + ");'>" + o + "</a></li>"
	            			}
	            			
	            			if(omap.oPi.currentPage == omap.oPi.maxPage){
	            				page += "<li class='page-item' disabled><a class='page-link' href='#'>></a></li>"
	            			}else{
	            				page += "<li class='page-item'><a class='page-link' onclick='overtimeList(" + (omap.oPi.currentPage+1) + ");'>></a></li>"
	            			}
	            			
	            			$(".opagination").html(page);
	            			
	            			
	            		},
	            		error:function(){
	            			console.log("시간외근무신청 ajax통신 실패");
	            		}
	            	});
	            }
	            
	            function deleteBusinesstrip(no){
	            	if(confirm("출장신청을 삭제하시겠습니까?")){
	            		//console.log(no);
	            		location.href = 'delete.bt?btNo=' + no;
	            	}
	            }
	            
	            function deleteOvertime(no){
	            	if(confirm("시간외 근무신청을 삭제하시겠습니까?"))
	            		//console.log(no);
		            	location.href = 'delete.ot?otNo=' + no;
	            }
            </script>

	</div>
</body>
</html>