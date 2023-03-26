<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 조직도 트리 -->
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<link rel="stylesheet" type="text/css" href="resources/css/treeview/jquery.treeview.css"/>
<style>

     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}
     .outer{
        width: 960px;
    }
    .emp-area{
        float: left;
        width: 250px; height: 130px; border: 1px grey solid;
        overflow: auto;
    }
    .emp-area div{
        margin-left: 5px;
    }
    #projectEnrollForm th,td{
        
        padding: 20px;
    }
    #added-list{
      border:1px solid grey; width: 240px; height: 600px;
      float: left;
      margin-left:20px
    }
    #added-list div{
        margin-left: 5px;
        overflow: auto;
      
    }
    #emp-list,#add-btn, #dept-list{
        float: left;
      
    }
    #emp-list{
        margin-left:30px;
    }
    #dept-list div{
        font-size: 18px;
        margin-top: 10px;
        font-weight: 600;
    }
 
   #add-btn{
    line-height: 600px;
    margin-left: 30px;
   }
     #tree{
        font-size: 12px;
    }
     .receiverInput{
        height: 40px;
        border-bottom: 1px solid rgb(193, 193, 193);
    }
    
    #receiver:focus{
        outline: none; 
    }
    #receiver-list{
        margin-top: 0px;
        list-style-type : none;
        line-height: 30px;
        padding: 0px;
        margin-bottom: 0px;
    }
    .receiver-li{
        display: inline-block;
        background-color: lightgray;
        color: black;
        border-radius: 1em;
        padding-left: 7px;
        padding-right: 7px;
        font-size: 13px;
    }
    .receiver-delete{
        display: inline-block;
        background-color: none;
        margin-right: 15px;
        font-size: 18px;
        box-sizing: border-box;
        line-height: 30px;
    }
    .receiver-delete:hover{cursor: pointer;}
  
  
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <jsp:include page="../common/menubar.jsp"/>
    <div class="outer" style="width:940px;margin:20px;">
        <h3>프로젝트 등록</h3>
        <hr>
        <div>
            <form action="insert.project">
                <table id="projectEnrollForm">
                    <tr>
                        <th>프로젝트명</th>
                        <td><input type="text" name="title"></td>
                    </tr>
                    <tr>
                        <th>프로젝트 기간</th>
                        <td><input type="date" name="startDate"> - <input type="date" name="endDate"></td>
                        <th>진행상태</th>
                        <td>
                            <select name="status" id="status">
                                <option value="1">정상</option>
                                <option value="2">지연</option>
                                <option value="3">매우지연</option>
                                <option value="4">완료</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>프로젝트 책임자</th>
                        <td>
                            <div class="emp-area">
                            </div>
                            &nbsp;
                             <button type="button" id="chart" class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside">주소록</button>
                                    <li class="dropdown-menu">
                                        <div class="employeeChart">
                                            <ul id="tree" class="filetree treeview-famfamfam">
            
                        
                                                
                                          
                                            </ul>
                                            
                                        </div>
                                        
                                    </li>
                        </td>
                    </tr>
                
                    <tr>
                        <th>프로젝트 참여자</th>
                        <td>
                             <div class="receiverInput">
                                  <ul id="receiver-list">
                                      <c:if test="${ not empty reply }">
                                          <input type='hidden' name='receiverNo' value='${ reply.senderNo }'>
                                          <input type='hidden' name='receiver' value='${ reply.sender }'>
                                          <li class='receiver-li'>${ reply.sender }</li>
                                          <div class='receiver-delete'>&times;</div>
                                      </c:if>
                                  </ul>
                                  <input type="text" id="receiver" value="">
                              </div>
                           &nbsp;
                              <button type="button" id="chart" class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside">주소록</button>
                                    <li class="dropdown-menu">
                                        <div class="employeeChart">
                                            <ul id="tree" class="filetree treeview-famfamfam">
            
                        
                                                
                                          
                                            </ul>
                                            
                                        </div>
                                        
                                    </li>
                    
               
                        </td>
                    </tr>
                    <tr>
                        <th>프로젝트 열람자</th>
                        <td>
                            <div class="emp-area">
                                
                           </div>
                           &nbsp;
                             <button type="button" id="chart" class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside">주소록</button>
                                    <li class="dropdown-menu">
                                        <div class="employeeChart">
                                            <ul id="tree" class="filetree treeview-famfamfam">
            
                        
                                                
                                          
                                            </ul>
                                            
                                        </div>
                                        
                                    </li>
                    
               
                        </td>
                    </tr>
                    <tr>
                        <th>프로젝트 내용</th>
                        <td>
                            <textarea name="" id="" cols="50" rows="10" style="resize: none;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td><input type="file"></td>
                    </tr>
                </table>
                <div align="center">
                    <button class="btn btn-sm btn-light" type="button">이전으로</button>
                    <button class="btn btn-sm btn-primary" type="submit" onclick="">등록하기</button>
               		  <button type="button" id="chart" class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside">주소록</button>
               
                </div>
            </form>
            <br clear="both">
        </div>

    </div>
    <!-- 사원추가 모달 -->
    <div class="modal" id="addEmp">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">주소록</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <div id="add-emp-modal"  >
                    <div id="dept-list">
                        <div>총무팀</div>
                        <div>개발팀</div>
                        <div>인사팀</div>
                    </div>
                    <div id="emp-list"  >
                  
                        <table class="table" >
                          
                            <tr>
                                <th></th>
                                <th>사번</th>
                                <th>이름</th>
                                <th>부서</th>
                                <th>직급</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>231231</td>
                                <td>정여진</td>
                                <td>총무부</td>
                                <td>대리</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>231231</td>
                                <td>정여진</td>
                                <td>총무부</td>
                                <td>대리</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>231231</td>
                                <td>정여진</td>
                                <td>총무부</td>
                                <td>대리</td>
                            </tr>
                          
            
                        </table>
                       
                    </div>
                 
                    <button id="add-btn"class="btn btn-sm btn-secondary">></button>
                    
                  
                    <div id="added-list" >
                          
                        <div>21231정여진</div>                         
                        <div>12321정철수</div>
                        <div>21231정여진</div>                         
                        <div>12321정철수</div>
                        <div>21231정여진</div>                         
                        <div>12321정철수</div>
                      
                    </div>
                    <br clear="both">
                    <br><br>
                    <div id="pagingArea" style="margin-left: 240px;">
                        <ul class="pagination">
                            <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                            <li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">1</a></li>
                            <li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">2</a></li>
                            <li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">3</a></li>
                            <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1 }">></a></li> 
                        </ul>
                    </div>
               
                </div>
                
            </div>
  
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="" class="btn btn-secondary">완료</button>
            </div>
    
        </div>
        </div>
    </div>
      <script src="resources/js/treeview/jquery.cookie.js" type="text/javascript"></script>
      <script src="resources/js/treeview/jquery.treeview.js" type="text/javascript"></script>

            <script>
                $(document).ready(function(){
                    
                    // 주소록 버튼 클릭시
                    $(document).on("click", "#chart", function(){

                        $.ajax({
                            url: "employeeChart.emp",
                            success: function(deptList){
                                console.log(deptList);
                                let chart = "";
                                for(let i=0; i<deptList.length; i++){
                                    //console.log(deptList[i]);
                                    if(deptList[i].deptName == "사장"){
                                        chart += "<li><span class='emp' empNo='" + deptList[i].teamList[0].empList[0].empNo + "' empName='" + deptList[i].teamList[0].empList[0].empName + "'>" 
                                                                            + deptList[i].teamList[0].empList[0].jobName + '&nbsp;' + deptList[i].teamList[0].empList[0].empName + "</span></li>";
                                    } else{
                                        chart += '<li class="closed"><span class="folder">' + deptList[i].deptName + '</span>';
                                        for(let j=0; j<deptList[i].teamList.length; j++){
                                            if(deptList[i].teamList[j].teamName == "임원"){
                                                for (let k=0; k<deptList[i].teamList[j].empList.length; k++){
                                                    chart += '<ul><li><span class="emp" empNo="' + deptList[i].teamList[j].empList[k].empNo + '" empName="' + deptList[i].teamList[j].empList[k].empName + '">'
                                                            + deptList[i].teamList[j].empList[k].jobName + '&nbsp;' + deptList[i].teamList[j].empList[k].empName + '</span></li></ul>';
                                                }
                                            } else{
                                                chart += '<ul><li class="closed"><span class="folder">' + deptList[i].teamList[j].teamName + '</span>';
                                                for(let k=0; k<deptList[i].teamList[j].empList.length; k++){
                                                    chart += '<ul><li><span class="emp" empNo="' + deptList[i].teamList[j].empList[k].empNo + '" empName="' + deptList[i].teamList[j].empList[k].empName + '">'
                                                        + deptList[i].teamList[j].empList[k].jobName + '&nbsp;' + deptList[i].teamList[j].empList[k].empName + '</span></li></ul>';
                                                }
                                                chart+= '</li></ul>';

                                            }
                                            
                                        }
                                        chart += "</li>";
                                    }
                                    
                                }

                                $("#tree").html(chart);
                                $("#tree").treeview({});

                            }, error: function(){
                                console.log("조직도 조회용 ajax 통신 실패");
                            }

                        })

                    })


                    // 주소록에서 사원을 클릭할 때
                    $(document).on("click", ".emp", function(){

                        const empNo = $(this).attr("empNo");
                        const empName = $(this).attr("empName");
                        //console.log(empNo + empName);

                        if($("#receiver-list").children().length == 0){ 
                        // li 요소가 없을 때
                            $("#receiver-list").append($("<input type='hidden' name='receiverNo' value='" + empNo + "'><input type='hidden' name='receiver' value='" + empName + "'><li class='receiver-li'>" + empName + "</li><div class='receiver-delete'>&times;</div>"));
                            $("#receiver-list").css("width", "$('#receiver-list').children().eq(0).val().length + 30");
                        } else { 
                        // li 요소가 있을 때
                            for(let i=0; i<$("#receiver-list").children().length; i++){
                                if($("#receiver-list").children().eq(i).val() == empNo){
                                    alert("중복된 사람입니다.");
                                    return;
                                }
                            }
                            $("#receiver-list").append($("<input type='hidden' name='receiverNo' value='" + empNo + "'><input type='hidden' name='receiver' value='" + empName + "'><li class='receiver-li'>" + empName + "</li><div class='receiver-delete'>&times;</div>"));
                            
                        }

                    })
                    
                    
                });
            </script>

   <script>
            

            // 사번으로 사원 조회해서 메일 수신자 목록에 추가하기
            $("#receiver").keydown(function() { // 'input[type="text"]'
                if(event.keyCode == 13 || event.keyCode == 32) {
                    event.preventDefault();
                    let receiver = $(this).val();

                    if($(this).val() == ""){
                        alert("받는 사람을 지정해주세요");
                        return;
                    }

                    $.ajax({
                        url: "findEmployee.ma",
                        data:{empNo: receiver},
                        success: function(e){

                            //console.log(e);
                            if(e == null){
                                alert("일치하는 사원이 없습니다.")
                                $("#receiver").val("");
                                $("#receiver").focus();
                            } else{
                                if($("#receiver-list").children().length == 0){ // li 요소가 없을 때
                                    $("#receiver-list").append($("<input type='hidden' name='receiverNo' value='" + e.empNo + "'><input type='hidden' name='receiver' value='" + e.empName + "'><li class='receiver-li'>" + e.empName + "</li><div class='receiver-delete'>&times;</div>"));
                                    $("#receiver-list").css("width", "$('#receiver-list').children().eq(0).val().length + 30");
                                    $("#receiver").val("");
                                    $("#receiver").focus();
                                } else { // li 요소가 있을 때
                                    for(let i=0; i<$("#receiver-list").children().length; i++){
                                        if($("#receiver-list").children().eq(i).val() == e.empNo){
                                            alert("중복된 사람입니다.");
                                            $("#receiver").val("");
                                            $("#receiver").focus();
                                            return;
                                        }
                                    }
                                    $("#receiver-list").append($("<input type='hidden' name='receiverNo' value='" + e.empNo + "'><input type='hidden' name='receiver' value='" + e.empName + "'><li class='receiver-li'>" + e.empName + "</li><div class='receiver-delete'>&times;</div>"));
                                    $("#receiver").val("");
                                    $("#receiver").focus();
                                }
                            }

                        }, error:function(){
                            console.log("사원 조회용 ajax 통신 실패");
                        }
                    })
                    
                }
            });

            // X 버튼 눌러서 수신자 목록에서 제거
            $(document).on("click", ".receiver-delete", function(){
                $(this).prev().prev().prev().remove();
                $(this).prev().prev().remove();
                $(this).prev().remove();
                $(this).remove();
            })



        </script>

</body>
</html>