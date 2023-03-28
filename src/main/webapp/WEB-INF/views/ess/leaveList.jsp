<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Modal -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<title>Insert title here</title>
<style>
    /* outer영역 */
    .leaveOuter{
        margin: auto; 
        padding:5%
    }
    /* content영역 */
    div{
        box-sizing: border-box;
    }
    select{
        width:120px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        color:rgb(50,50,50);
        font-size: 12px;
    }
    .select-area input{
        width:100px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        color:rgb(50,50,50);
        font-size: 14px;
    }
    .select-area button{
        width:50px;
        height:30px;
        font-size: 12px;
        line-height:normal;
    }
    .leaveTable{
        border-top: 1px solid rgb(234, 234, 234);
        width:100%;
        text-align: center;
    }
    .leaveTable td{
        border-bottom:1px solid rgb(234, 234, 234);
        height:30px;
        font-size: 14px;
        color:rgb(50,50,50);
    }
    .leaveTable input{
        border:none;
        height:30px;
        width:80px;
    }
    .leaveTable>tbody tr:hover{
        opacity:0.7;
        cursor: pointer;
    }
    .leaveTable>tbody button{
    	width:40px;
    	height:25px;
    }
    .leaveTable>tbody button{
        width:60px;
        height:30px;
        text-align: center;
        font-size: 12px;
        color:rgb(50,50,50);
        line-height:normal;
    }
    #pagingArea{
    	width:fit-content;
    	margin:auto;
    }
    /* modal영역 */
    .modal-content{
        font-size: 14px;
        border:1px solid red;
        margin:auto;
        height:550px;
    }
    .modal-body input{
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
    }
    .modalS{
        display: inline-block;
        margin-bottom: 10px;
    }
    .modal-body textarea{
        resize: none;
        width:300px;
        height:260px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }
    .textWrap{
        margin-left: 230px;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600;
        color:rgb(50,50,50)
    }
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>

    <div class="leaveOuter">

        <h4><b>휴가</b></h4>
        
        <div class="vacation">
            <!--
            <div class="select-area">
                <div style="float:left">
                    <select name="" id="" style="font-size:14px;">
                        <option value="">&nbsp;- 휴가목록-</option>
                        <option value="">&nbsp;연차</option>
                        <option value="">&nbsp;보건</option>
                        <option value="">&nbsp;조의</option>
                        <option value="">&nbsp;결혼</option>
                        <option value="">&nbsp;산전후</option>
                        <option value="">&nbsp;리프레쉬휴가</option>
                    </select>
                </div>

                <div style="float:right">
                    <input type="date" name="startDate" value="&nbsp;2023.03.05">
                    <span style="font-size: 20px; color:rgb(170, 170, 170)">~</span>
                    <input type="date" name="endDate" value="&nbsp;2023.03~12">
                    <button class="btn btn-success">검색</button>
                </div>
            </div>
            -->

            <div class="vacationDetail">
                <br>
                <table class="leaveTable">
                    <thead>
                        <tr style="color:rgb(51,51,51); font-size: 14px; font-weight: 600; height:40px;">
                            <td width="40px;">No.</td>
                            <td width="100px;">이름</td>
                            <td width="100px;">부서명</td>
                            <td width="150px;">휴가종류</td>
                            <td width="300px;">사용기간</td>
                            <td width="120px;">결재현황</td>
                            <td width="100"></td>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="a" items="${ list }">
	                        <tr>
                                <td>${ a.leaveNo }</td>
	                            <td>${ a.empName }</td>
	                            <td>${ a.deptName }</td>
	                            <td>${ a.lcName }</td>
	                            <td>
	                                <input type="text" name="stDate" value="${ a.leaveStart }" readonly>
	                                <span>~&nbsp;&nbsp;&nbsp;</span>
	                                <input type="text" name="edDate" value="${ a.leaveEnd }" readonly>
	                            </td>
	                            <td>${ a.leaveCheck }</td>
	                            <td onclick="event.cancelBubble=true"><button class="btn btn-warning" id="deleteBtn" style="width:50px; height:25px; font-size:10px; line-height:1px;" onclick="deleteFunction(${a.leaveNo})">취소</button></td>
	                        </tr>
                       	</c:forEach>
                    </tbody>
                </table>

                <script>
                    $(function(){
                        $(".leaveTable>tbody tr").click(function(){
                            $.ajax({
                                url:"detail.le",
                                data:{
                                    empNo:${e.empNo},
                                    leaveNo:$(".leaveTable>tbody tr").children().eq(0).text()
                                },
                                success:function(leave){
                                    $(".modal-body input[name=lcName]").val(leave.lcName);
                                    $(".modal-body input[name=leaveStart]").val(leave.leaveStart);
                                    $(".modal-body input[name=leaveEnd]").val(leave.leaveEnd);
                                    $(".modal-body textarea").text(leave.leaveContent);
                                    $(".textCount").text(leave.leaveContent.length + "자");
                                    $("#leaveModal").modal('show');
                                    
                                },
                                error:function(){
                                    console.log("휴가상세조회 ajax통신 실패");
                                }
                            });
                            
                        });
                    })
                </script>

                <script>
                    function deleteFunction(no){
                        if(confirm('휴가등록을 취소하시겠습니까?')){
                                    location.href='delete.le?no=' + no;
                                }
                    }
                </script>
            
                <br><br>

                <div id="pagingArea">
	                <ul class="pagination">
	                
	                	<c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">
	                    		<li class="page-item" disabled><a class="page-link" href="#"><</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="list.le?cpage=${ pi.currentPage-1 }"><</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    <li class="page-item"><a class="page-link" href="list.le?cpage=${ p }">${ p }</a></li>
	                    </c:forEach>
	                    
	              
	            				      <c:choose>
		                    <c:when test="${ pi.currentPage eq pi.maxPage }">
		                    	<li class="page-item" disabled><a class="page-link" href="#">></a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item"><a class="page-link" href="list.le?cpage=${ pi.currentPage+1 }">></a></li>
		                    </c:otherwise>
	                    </c:choose>
	                </ul>
            	</div>
            
            </div>
        </div>


    </div>

    <!-- The Modal -->
    <div class="modal fade" id="leaveModal">
        <div class="modal-dialog modal-dialog-centered"  style="width:400px;">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title" style="color:rgb(0,172,0); margin-left:20px;">휴가신청</h4>
                <button type="button" class="close" data-dismiss="modal" onclick="modalClose();">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" style="width:90%; margin:auto;">
                    <span class="modalS">휴가등록</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="lcName" value="&nbsp;&nbsp;" style="width:220px;" readonly><br>
                    <span class="modalS">신청날짜
	                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="leaveStart" value="&nbsp;&nbsp;2023.03.20" style="width:100px;" readonly>
		                <span>~</span>
		                <input type="text" name="leaveEnd" value="&nbsp;&nbsp;2023.03.21" style="width:100px;" readonly>
                    </span>
                    <br>
                    <span>신청사유</span>
                    <br>
                    <div class="textWrap">
                        <span class="textCount"></span><span class="textTotal">/200자</span>
                    </div>
                    <textarea name="leaveContent" id="" readonly></textarea>
                    
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="modalClose();">Close</button>
                </div>
            
            </div>
        </div>
    </div>

    <script>
        function modalClose(){
            $('#leaveModal').modal('hide'); 
            $('#leaveModal').hide();
            $('.jquery-modal').click();
    }

    </script>
</body>
</html>