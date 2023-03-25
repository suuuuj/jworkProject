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
        margin:auto;
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
    .workTable>tbody>tr:hover{
        opacity: 0.7;
        cursor: pointer;
    }
    .workSelect button{
        width:60px;
        height:30px;
        border-radius: 5px;
        line-height: 5px;
        font-size: 14px;
        margin-bottom: 3px;
    }
    .workSelect input[type=text]{
        width:150px;
        height:28px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
        font-size:14px;
    }
    .workSelect select{
        width:100px;
        height:30px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
        font-size:14px;
    }
    #deleteBtn{
        float: right; 
        width:60px; 
        height:30px; 
        line-height: 5px; 
        font-size:14px;
    }
    .paging-area button{
        width:30px;
        height:30px;
        border:none;
        border-radius: 5px;
        line-height: 5px;
    }
    #deleteBtn button{
        width:60px;
        height:30px;
        border-radius: 5px;
        line-height: 5px;
        font-size: 14px;
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
    .modal-footer{
        margin-top:15px;
    }
    .textWrap{
        margin-left: 265px;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600px;
        color:rgb(50,50,50)
    }
</style>
</head>
<body>
    <jsp:include page = "../common/menubar.jsp" />
    <div class="workOuter">

        <h4><b>출퇴근시간변경</b></h4>
        <div class="work-area">

            <div class="workSelect" style="float:right;">
                <select name="" id="">
                    <option value="">&nbsp;-선택안함-&nbsp;</option>
                    <option value="">결재대기(1차)</option>
                    <option value="">결재대기(2차)</option>
                    <option value="">승인</option>
                    <option value="">반려</option>
                </select>
                <input type="text" name="" value="" placeholder="&nbsp;사원명/사원번호">
                <button type="button" class="btn btn-success">검색</button>
            </div>

            <br>

            <table class="workTable">
                <thead>
                        <tr style="font-weight: 600; background: rgb(234, 234, 234);">
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
                            <tr>
                                <td onclick="event.cancelBubble=true"><input type="checkbox" id="" name="ck" value="${w.wt_no}"></td>
                                <td>${w.emp_no}</td>
                                <td>${w.deptName}</td>
                                <td>${w.teamName}</td>
                                <td>${w.jobName}</td>
                                <td>${w.empName}</td>
                                <td>${w.attDate}</td>
                                <td>출근시간변경</td>
                                <td>${w.approval_check}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
            </table>
            <br>
        <button id="deleteBtn" class="btn btn-danger" onclick="deleteMethod();">삭제</button>
        </div>

        <script>
            $(function(){
                // checkbox 전체선택 
                $("#firstCk").click(function(){
                    if($("#firstCk").is(":checked")){
                        $("input[name=ck]").prop("checked", true);
                    } else $("input[name=ck]").prop("checked", false);
                });

                $("input[type=checkbox]").click(function(){
                    var total = $("input[name=ck]").length;
                    var checked = $("input[name=ck]:checked").length;

                    if(total != checked){
                        $("#firstCk").prop("checked", false);
                    }else{
                        $("#firstCk").prop("checked", true);
                    }
                })

                // check 삭제
                function deleteMethod(){
                    // 체크박스 체크된 항목
                    const cb = $('input[name=ck]:cheked').val();
                    const selectdElements = document.querySelectorAll(cb);

                    // 체크박스 체크된 항목의 개수
                    const selectedElementsCnt = selectedElements.length;

                    if(selectedElementsCnt == 0){
                        alert("삭제할 항목을 선택해주세요.");
                        return false;
                    }else{
                        if(confirm("정말로 삭제하시겠습니까?")){
                            // 배열생성
                            const arr = new ArrayList(selectedElementsCnt);

                            document.querySelectorAll('input[name=ck]:checked').forEach(function(v,i){
                                arr[i] = v.value;
                            });

                            const form = document.createElement('form');
                            form.setAttribute('method', 'post'); // Post메소드적용
                            form.setAttribute('action', 'delete.wt');

                            var input1 = document.createElement('input');
                            input1.setAttribute('type', 'hidden');
                            input1.setAttribute("name", "boardIds");
                            input1.setAttribute("value", arr);
                            form.appendChild(input1);
                            cosole.log(form);
                            document.body.appendChild(form);
                            form.submit();
                        }
                    }

                }

                // Modal 
                $(".workTable>tbody>tr").click(function(){
                    $("#workModal").modal('show');
                });

            })
        </script>

        <br><br>
        <div class="paging-area" style="text-align:center;">
            <button><</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>></button>
        </div>

    </div>

    <!-- The Modal -->
    <div class="modal fade" id="workModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title" style="color:rgb(0,172,0);">출퇴근 시간변경</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button><br>
                </div>
                
                <!-- Modal body -->
                <form action="update.at" method="">
                    <div class="modal-body" style="width:360px; margin:auto;">
                        <span class="modalS">수정할 날짜</span> 
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;2023.03.20" style="float:right;" readonly><br>
                        <span class="modalS">지정 출근시간</span> 
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;09:20:53" readonly><br>
                        <span class="modalS">지정 퇴근시간</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;19:20:53" readonly><br>
                        <hr>
                        <span class="modalS">수정할 출근시간</span> 
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;09:20:53" readonly><br>
                        <span class="modalS">수정할 퇴근시간</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;19:20:53" readonly><br>
                        <hr>
                        <span>신청사유</span>
                        <br>
                        <div class="textWrap">
                            <span class="textCount">0자</span><span class="textTotal">/100자</span>
                        </div>
                        <textarea name="" id="" readonly>100글자가얼마나되는지볼께요100글자가얼마나되는지볼께요100글자가얼마나되는지볼께요100글자가얼마나되는지볼께요100글자가얼마나되는지볼께요100글자가얼마나되는지볼께요100글자가얼마나되</textarea>
                        
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button class="btn btn-success" type="submit">승인</button>
                        <button class="btn btn-warning" type="button">반려</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">목록</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>