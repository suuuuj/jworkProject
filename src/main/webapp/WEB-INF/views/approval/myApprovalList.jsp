<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        box-sizing: border-box;
    }
    .content{
        margin: auto; 
        padding:4%
    }
    .btnArea{
        width: 540px;
    }
    .inputSearch{
        width:170px;
        border-radius: 3px;
    }
    #appListTB{
        font-size: small;
        text-align: center;
            
    }
    
    #appListTB td{
    	 vertical-align : middle;   
    }
    
   .btnArea button, .searchArea button{
        font-size: 12px;
        height: 27px;
		border: 0;
		border-radius: 5px;
		width: 39px;
		color: white;
        margin-bottom: 6px;
    }
    .my.pagination.justify-content-end.pagination-sm>li>a{
        color: rgb(14, 126, 14);
        font-weight: bolder;
   } 
</style>
</head>
<body>
 <jsp:include page="../common/menubar.jsp"/>
        <div>
            <h4 style="display: inline-block;" style="float: left;"><b>기안 문서함</b></h4>
            <div align="right">
                <button type="button" class="btn btn-outline-success" onclick="location.href='enrollForm.app'">결재 문서 작성</button>
            </div>
        </div>
        <br>
        <div class="btnNSerch">
            <table>
                <tr>
                    <td class="btnArea">
                        <button type="button" id="allBtn" style="background: green;">전체</button>
                        <button type="button" id="waitBtn" style="background: gray;">대기</button>
                        <button type="button" id="ingBtn" style="background: gray;">진행</button>
                        <button type="button" id="finBtn" style="background: gray;">완료</button>
                        <button type="button" id="reBtn" style="background: gray;">반려</button>
                    </td>
                    
                    
                    <td class="searchArea">
                        <select class="searchBox">
                            <option selected>결재종류</option>
                            <option value="">제목</option>
                        </select>
                        <input type="text" class="inputSearch">
                        <button type="button" class="btn btn-success btn-sm mr-2" onclick="">검색</button>
                    </td>
                </tr>
            </table>
        </div>
        <br>
        
        <table class="table table-hover" id="appListTB" >
            <colgroup>
				<col width="10%">
                <col width="11%">
                <col width="11%">
                <col width="*">
                <col width="11%">
                <col width="5%">
                <col width="11%">
            </colgroup>
            <thead >
                <tr>
					<th scope="col">번호</th>
                    <th scope="col">기안일</th>
                    <th scope="col">결재종류</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">파일</th>
                    <th scope="col">결재상태</th>
                </tr>
            </thead>
            <tbody id="defaultAllTB">

            </tbody>
        </table>
		<br>
		<br>
		<div id="pagingArea">
			
				<ul class="my pagination justify-content-end pagination-sm">
			
				</ul>
		</div>
        
        <script>
        
        	let statusCode = 100;
	      
        	function selectAppList(status, cpage){
        		$.ajax({
        			url: "btnList.app",
        			data:{
        				empNo: ${loginUser.empNo},
        				appStatus: status,
        				cpage: cpage
        				},
        			success:function(map){
        				//console.log(map);
        				/*
        					map
        					{
        					  listCount : 10,
        					  pi : {currentPage:x, listCount:x, ... },
        					  list : [{empNo:xx, ...}, {}, ]
        					}
        				*/
        				
        				let value = "";
        				
        				for(i=0; i<map.list.length; i++){
        					value += "<tr>"
        						     + "<td class='ano'>" + map.list[i].appNo + "</td>"
								     + "<td>" + map.list[i].createDate + "</td>"
								     + "<td>" + map.list[i].docType + "</td>"
								     + "<td>" + map.list[i].docTitle + "</td>"
								     + "<td>" + map.list[i].empName + "</td>"
								     + "<td>";
					        if(map.list[i].docOriginName != null){
						       value += "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-folder2-open' viewBox='0 0 16 16'> <path d='M1 3.5A1.5 1.5 0 0 1 2.5 2h2.764c.958 0 1.76.56 2.311 1.184C7.985 3.648 8.48 4 9 4h4.5A1.5 1.5 0 0 1 15 5.5v.64c.57.265.94.876.856 1.546l-.64 5.124A2.5 2.5 0 0 1 12.733 15H3.266a2.5 2.5 0 0 1-2.481-2.19l-.64-5.124A1.5 1.5 0 0 1 1 6.14V3.5zM2 6h12v-.5a.5.5 0 0 0-.5-.5H9c-.964 0-1.71-.629-2.174-1.154C6.374 3.334 5.82 3 5.264 3H2.5a.5.5 0 0 0-.5.5V6zm-.367 1a.5.5 0 0 0-.496.562l.64 5.124A1.5 1.5 0 0 0 3.266 14h9.468a1.5 1.5 0 0 0 1.489-1.314l.64-5.124A.5.5 0 0 0 14.367 7H1.633z'/>";
					        }
					        value += "</td> <td>" + map.list[i].appStatus + "</td></tr>"
        				}
        				$("#appListTB tbody").html(value);
        				
        				//페이징바
        	            let page="";
        	            if(map.pi.currentPage ==1){
        	               page += "<li class='page-item disabled' ><a class='page-link' href='#' style='color:rgb(196, 197, 197)'>Previous</a></li>"
        	            }else{
        	               page += "<li class='page-item'><a class='page-link' onclick='selectAppList(" + statusCode + ", " + (map.pi.currentPage-1) + ");'>Previous</a></li>"
        	            }
        	            
        	            for(var p=map.pi.startPage; p<=map.pi.endPage; p++){
        	               page += "<li class='page-item'><a class='page-link' onclick='selectAppList(" + statusCode + ", " + p + ");'>" + p + "</a></li>"
        	            }
        	            
        	            if(map.pi.currentPage == map.pi.maxPage){
        	               page += "<li class='page-item disabled'><a class='page-link ' href='#' style='color:rgb(196, 197, 197)'>Next</a></li>"
        	            }else{
        	               page += "<li class='page-item'><a class='page-link' onclick='selectAppList(" + statusCode + ", " + (map.pi.currentPage+1) + ");'>Next</a></li>"
        	            }
        	            
        	            $(".pagination").html(page);
						
       		     }, error:function(){
   						console.log("ajax 통신 실패");
   				 	}
        		})
			}
        	
        	$(function(){
        		selectAppList(100, 1);
        	})
        	
        	//각 버튼 누를시 뜨는 리스트
        	$("#allBtn").click(function(){
        		selectAppList(100, 1);
				$(this).css("background-color", "green").css("color", "white");
				$("#waitBtn").css("background-color", "gray").css("color", "white");
				$("#ingBtn").css("background-color", "gray").css("color", "white");
				$("#finBtn").css("background-color", "gray").css("color", "white");
				$("#reBtn").css("background-color", "gray").css("color", "white");
				statusCode = 100;
    		})
    		
    		$("#waitBtn").click(function(){
        		selectAppList(0, 1);
				$(this).css("background-color", "green").css("color", "white");
				$("#allBtn").css("background-color", "gray").css("color", "white");
				$("#ingBtn").css("background-color", "gray").css("color", "white");
				$("#finBtn").css("background-color", "gray").css("color", "white");
				$("#reBtn").css("background-color", "gray").css("color", "white");

				statusCode = 0;
    		})
        	
        	$("#ingBtn").click(function(){
        		selectAppList(1, 1);
				$(this).css("background-color", "green").css("color", "white");
				$("#allBtn").css("background-color", "gray").css("color", "white");
				$("#waitBtn").css("background-color", "gray").css("color", "white");
				$("#finBtn").css("background-color", "gray").css("color", "white");
				$("#reBtn").css("background-color", "gray").css("color", "white");

				statusCode = 1;
    		})
    		
    		$("#finBtn").click(function(){
        		selectAppList(2, 1);
				$(this).css("background-color", "green").css("color", "white");
				$("#allBtn").css("background-color", "gray").css("color", "white");
				$("#waitBtn").css("background-color", "gray").css("color", "white");
				$("#ingBtn").css("background-color", "gray").css("color", "white");
				$("#reBtn").css("background-color", "gray").css("color", "white");
				
				statusCode = 2;
    		})
    		
    		$("#reBtn").click(function(){
        		selectAppList(3, 1);
				$(this).css("background-color", "green").css("color", "white");
				$("#allBtn").css("background-color", "gray").css("color", "white");
				$("#waitBtn").css("background-color", "gray").css("color", "white");
				$("#finBtn").css("background-color", "gray").css("color", "white");
				$("#ingBtn").css("background-color", "gray").css("color", "white");
				
				statusCode = 3;
    		})
        
        	$(function(){
        		$(document).on("click", "#defaultAllTB>tr",function(){
        			location.href='myDetail.app?no='+$(this).children(".ano").text();
        		})
        	})

        </script>
        
        <br>
    

    </div> <!-- end of outer-->
</div>
</div>
</div>
    
</body>
</html>