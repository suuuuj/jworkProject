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
<!-- Modal -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<title>Insert title here</title>
<style>
    /* outer영역 */
    .worktimeOuter{
       padding:50px;
    }

    /* content영역 */
    .work-area{
        margin-top: 30px;
    }
    .work-area>span{
        color:rgb(51,51,51);
        font-size: 17px;
        font-weight: 600;
    }
    .workSelect select{
        width:100px;
        height:30px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
        font-size:14px;
    }
    .workTable{
        width:100%;
        text-align: center;
        margin-top:30px;
        border-collapse: collapse;
        border-spacing: 0;
        font-size: 14px;
        color:rgb(51,51,51);
    }
    .workTable td{
        width:182px;
        height:30px;
        color:rgb(50,50,50);
        border-bottom: 1px solid rgb(234, 234, 234);
    }
    .workTable button{
        width:60px;
        height: 30px;
        font-size: 12px;
        line-height: 5px;
        color:white;
    }
    .workTable>tbody>tr:hover{
        opacity: 0.7;
        cursor: pointer;
    }
    .paging-area button{
        width:30px;
        height:30px;
        border:none;
        border-radius: 5px;
    }
    #pagingArea{
    	width:fit-content;
    	margin:auto;
    }
    /* modal영역 */
    .modal-content{
        height:600px;
        width:400px;
        font-size: 14px;
    }
    .modal-body input{
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        float:right;
    }
    .modalS{
        display: inline-block;
        margin-bottom: 10px;
    }
    .modal-body textarea{
        resize: none;
        width:330px;
        height:130px;
        margin:auto;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }
    .textWrap{
        margin-left: 255px;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600px;
        color:rgb(50,50,50)
    }
</style>
</head>
<body>
    <jsp:include page = "../common/menubar.jsp" />
    <div class="worktimeOuter">

        <h4><b>근무</b></h4>

        <div class="work-area">

            <span>출퇴근 시간 변경</span> <br>
            <div class="workSelect" style="float:right;">
                <select name="" id="">
                    <option value="">&nbsp;-선택안함-&nbsp;</option>
                    <option value="">결재대기(1차)</option>
                    <option value="">결재대기(2차)</option>
                    <option value="">승인</option>
                    <option value="">반려</option>
                </select>
            </div>

            <br>
            
            <table class="workTable">
                <thead>
                    <tr style="font-weight: 600; background-color: rgba(0, 172, 0, 0.075);">
                        <td><input type="checkbox" name="" value="" id="firstCk"></td>
                        <td>사번</td>
                        <td>소속</td>
                        <td>팀명</td>
                        <td>직위</td>
                        <td>이름</td>
                        <td>조정일</td>
                        <td>제목</td>
                        <td>진행상황</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="w" items="${list}">
                        <tr onclick="workDetailFunction(${w.wtNo});">
                            <td onclick="event.cancelBubble=true"><input type="checkbox" id="" name="ck" value=""></td>
                            <td>${w.empNo}</td>
                            <td>${w.deptName}</td>
                            <td>${w.teamName}</td>
                            <td>${w.jobName}</td>
                            <td>${w.empName}</td>
                            <td>${w.attDate}</td>
                            <td>출근시간변경</td>
                            <td>${w.approvalCheck}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script>
            function workDetailFunction(no){
                $.ajax({
                    url:"detailModify.wt",
                    data:{
                        wtNo:no
                    },
                    success:function(w){
                        $("#workModal input[name=workDate]").val(w.attDate);
                        $("#workModal input[name=workStart]").val(w.startTime);
                        $("#workModal input[name=workEnd]").val(w.endTime);
                        $("#workModal input[name=attNo]").val(w.attNo);

                        if(w.reStartTime != null){
                            $("#workModal input[name=reStartTime]").val(w.reStartTime);
                        }else{
                            $("#workModal input[name=reStartTime]").val(w.startTime);
                        }

                        if(w.reEndTime != null){
                            $("#workModal input[name=reEndTime]").val(w.reEndTime);
                        }else{
                            $("#workModal input[name=reEndTime]").val(w.endTime);
                        }
                        $("#reContent").text(w.reContent);

                        var length = w.reContent.length;
                        $(".textCount").text(length + '자');

                    },
                    error:function(){
                        console.log("근태수정상세페이지 ajax 통신실패");
                    }
                })

            }
            $(function(){
                $(".workTable>tbody>tr").click(function(){
                    $("#workModal").modal('show');
                })
            })
        </script>

        <br><br>
        <div id="pagingArea">
			<ul class="pagination">

				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item" disabled><a class="page-link" href="#"><</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="admin.ot?cpage=${ pi.currentPage-1 }"><</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<li class="page-item"><a class="page-link"
						href="admin.ot?cpage=${ p }">${ p }</a></li>
				</c:forEach>


				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<li class="page-item" disabled><a class="page-link" href="#">></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="admin.ot?cpage=${ pi.currentPage+1 }">></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

    </div>

    <!-- The Modal -->
    <div class="modal fade" id="workModal">
        <div class="modal-dialog modal-dialog-centered" style="width:400px;">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title" style="color:rgb(0,172,0)">출퇴근 시간변경</h4>
                <button type="button" class="close" data-dismiss="modal" onclick="workClose();">&times;</button><br>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" style="width:360px; margin:auto;">
                    <span class="modalS">수정할 날짜</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="workDate" value="" style="float:right;" readonly><br>
                    <span class="modalS">지정 출근시간</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="workStart" value="" readonly><br>
                    <span class="modalS">지정 퇴근시간</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="workEnd" value="" readonly><br>
                    <hr>
                    <span class="modalS">수정할 출근시간</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="reStartTime" value="" readonly><br>
                    <span class="modalS">수정할 퇴근시간</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="reEndTime" value="" readonly><br>
                    <hr>
                    <span>신청사유</span>
                    <br>
                    <div class="textWrap">
                        <span class="textCount"></span><span class="textTotal">/100자</span>
                    </div>
                    <textarea name="" id="reContent" readonly></textarea>
                    
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="workClose();">Close</button>
                </div>
            
            </div>
        </div>
    </div>

    <script>
        function workClose(){
            $('#workModal').modal('hide'); 
            $('#workModal').hide();
            $('.jquery-modal').click();
    }

    </script>

</body>
</html>