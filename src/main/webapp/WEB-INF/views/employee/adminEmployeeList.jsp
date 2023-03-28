<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .content{
        margin: auto; 
        padding:4%;
    }
    .employeeList {
        font-size: 14px;
    }
    /**/
    #search-area{
        display: inline-flex;
    }
    #condition, #keyword {
        height: 30px;
        border-radius: 5px; border: 1px solid gainsboro;
        float: left; margin-right: 5px; padding: 5px;     
    }
    #search-btn{
        position: absolute;
        left: 530px;
        border: 0px;
        background-color: rgba(255, 255, 255, 0);
    }
    #enroll-area {
        float: right; margin-right: 10px;
    }

    /*표*/
    #list-area{
        text-align: center;
        line-height: 25px;
        color: rgb(75, 75, 75);
        
    }
    #list-area button{
        height: 25px; line-height: 5px;
        font-size: 14px;
    }
    /*모달*/
    #employeeModal {
        margin: 15px; font-size: 14px;
    }
    /*왼쪽프로필*/
    #img-area{ display: block; float: left; margin-right: 20px;}
    #profileImg{
        float: left; margin:10px; 
		width:110px; height:110px;
        border:1px solid gainsboro; border-radius: 50%;
	}
    /*오른쪽프로필*/
    .basic{
        float: right; 
    }
    .basic-info, .detail-info{
        border: solid 1px gainsboro;
        margin: 10px; padding: 20px;
        width: 720px;
    }
    #basic {
        display: inline-block;
    }
    #basic th{
        width: 150px; height: 40px; padding-left: 20px;
        font-weight: 500; 
    }
    #detail th, #detail td {
        height: 40px; padding-left: 15px;
        font-weight: 500;   
    }
    #detail td { padding-left: 30px;}
    #basic input {
        width: 290px; height: 30px; font-size: 14px;
    }
    #detail input, #detail select {
        width: 200px; height: 30px; font-size: 14px;
        border: 1px solid gainsboro; border-radius: 5px;
        padding: 5px;
    }
    #detail textarea {
        resize: none; font-size: 14px; width: 544px;
    }

    /*페이징*/
    .pagination {
        text-decoration: none;
    }
    .pagination a {
        color: rgb(40, 40, 40); border: 0; font-size: 14px;
    }
    .pagination a:hover:not(.active) {background-color: rgb(238, 247, 227);}
    .pagination a:hover {
        text-decoration: none;
    }
    .page-item{
        padding: 10px;
    }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

        <div class="innerOuter">
            <h4 style="display: inline-block;" style="float: left;" ><b>사원 관리</b></h4>
            <br><br>

            <div class="employeeList">
                <div id="search-area">
                    <form action="" method="get">
                        <input type="hidden" name="cpage" value="1">
                        <select name="condition" id="condition" style="width: 100px;">
                            <option value="empNo">사번</option>
                            <option value="empName">이름</option>
                            <option value="teamName">부서</option>
                        </select> 
                        <label>               
                        <input type="text" class="" id="keyword" name="keyword" value="${ keyword }">
                        <button type="submit" id="search-btn"><img src="resources/images/common/search.png" width="20px"></button>
                        </label> 
                    </form>
                </div>
                <div id="enroll-area">
                    <a href="<c:url value='/employeeExcel.ad' />"><img src="resources/images/common/excel.png" width="25px"></a> &nbsp;
                    <button type="button" onclick="location.href='enrollEmpForm.ad'" class="btn btn-outline-success btn-sm" style="width: 80px;">사원 등록</button>
                </div>
                <table id="list-area" class="table table-sm">
                    
                    <thead>
                        <tr>
                            <!-- <th></th> -->
                            <th>사번</th>
                            <th>이름</th>
                            <th>부서</th>
                            <th>직급</th>
                            <th>전화번호</th>
                            <th>입사일</th>
                            <th>재직여부</th>
                            <th>계정</th>
                            <!-- <th>계정관리</th> -->
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="e" items="${list}">
                            <tr>
                                <!-- <td></td> -->
                                <td>${ e.empNo }</td>
                                <td data-bs-toggle="modal" data-bs-target="#selectEmployee" onclick="viewDetail(${ e.empNo })">${ e.empName }</td>
                                <td>${ e.deptName } - ${ e.teamName }</td>
                                <td>${ e.jobName }</td>
                                <td>${ e.phone }</td>
                                <td>${ e.enrollDate }</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${ empty e.resignDate }">
                                            재직
                                        </c:when>
                                        <c:otherwise>
                                            퇴사
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${ e.accountStatus eq 'Y'}">
                                            정상
                                        </c:when>
                                        <c:otherwise>
                                            정지
                                        </c:otherwise>
                                    </c:choose>           
                                </td>
                                <!--
                                <td>
                                    <c:choose>
                                        <c:when test="${ empty e.resignDate && e.accountStatus eq 'Y' }"> 재직/정상
                                            <button type="button" onclick="" class="btn btn-outline-warning btn-sm">정지</button>
                                        </c:when>
                                        <c:when test="${ empty e.resignDate && e.accountStatus eq 'N' }"> 재직/정지
                                            <button type="button" onclick="" class="btn btn-outline-success btn-sm">복구</button>
                                        </c:when>
                                        <c:when test="${ not empty e.resignDate && e.accountStatus eq 'Y' }"> 퇴사/정상
                                            <button type="button" onclick="" class="btn btn-outline-warning btn-sm">정지</button>
                                        </c:when>
                                        <c:otherwise> 퇴사/정지
                                            <button type="button" onclick="" class="btn btn-outline-success btn-sm">복구</button>
                                        </c:otherwise>
                                    </c:choose>
                                    
                                </td>
                                -->
                            </tr>
                        </c:forEach>
                            
                    </tbody>
                </table>

                
        
                <br>
        
                <div id="paging-area" align="center">
                    <ul class="pagination justify-content-center">
                        <c:if test="${ pi.currentPage ne 1 }"> <!-- 내가보고있는페이지가 1이 아닐경우 -->
                            <li class="page-item" disabled><a href="employeeList.ad?cpage=${ pi.currentPage - 1 }"><</a></li>
                        </c:if>
                        
                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            <c:choose>
                                <c:when test="${ empty condition and empty keyword }"> <!-- 검색 전일 때 -->
                                    <li class="page-item"><a href="employeeList.ad?cpage=${ p }">${ p }</a></li>
                                </c:when>
                                <c:otherwise>	<!-- 검색 후 -->
                                    <li class="page-item"><a href="employeeSearch.ad?cpage=${ p }&condition=${ condition }&keyword=${ keyword }">${ p }</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        
                        <c:if test="${ pi.currentPage ne pi.maxPage }"><!-- 내가보고있는페이지가 마지막페이지가 아닐경우 -->
                            <li class="page-item"><a href="employeeList.ad?cpage=${ pi.currentPage + 1 }">></a></li>
                        </c:if>
                    </ul>
                </div>



            </div>

        </div>

        <!-- 사원 상세 조회/수정 모달 -->
        <div class="modal fade" id="selectEmployee" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-body" id="employeeModal">             

                    <div class="profile-detail">
                        <form action="updateEmployee.ad" method="post">
                            <input type="hidden" name="empNo">
                            <div class="basic-info">
                                <h6>기본 정보</h6>
                                <hr>
                                <div id="img-area">
                                    <img id="profileImg" src="">
                                    <input type="file" id="profileImgFile" style="display:none;">
                                    <br>
                                </div>

                                <script>
                                    $(function(){
                                        $("#profileImgFile").change(function(){
                                            let formData = new FormData();
                                            let uploadFile = this.files[0];
                                            
                                            formData.append("uploadFile", uploadFile);
                                            formData.append("empNo", $("input[name=empNo]").val());
                                            formData.append("originalFile", profileUrl);
                                        
                                            $.ajax({
                                                url:"uploadProfile.ad",
                                                data:formData,
                                                processData:false, 
                                                contentType:false,
                                                type:"POST",
                                                success:function(){
                                                    //수정했을때 모달창에서 로드되야하는데 안됨.. 물어보기
                                                    location.reload();
                                                }, error:function(){
                                                    
                                                }		
                                            })
                                        })
                                    })
                                </script>

                                <div id="basic">
                                    <table>
                                        <tr>
                                            <th>이름</th>
                                            <td id="empName"></td>
                                        </tr>
                                        <tr>
                                            <th>사원번호</th>
                                            <td id="empNo"></td>
                                        </tr>
                                        <tr>
                                            <th>이메일</th>
                                            <td><input type="email" class="form-control" id="email" name="email" value=""></td>
                                        </tr>
                                    </table>
                                </div>  
                            </div>
                            <br>
                            <div class="detail-info">
                                <h6>상세 정보</h6>
                                <hr>
                                <table id="detail">
                                    <tr>
                                        <th>부서</th>
                                        <td>
                                            <select name="deptCode" id="dept">
                                                <option value="0">부서없음</option>
                                            </select>
                                        </td>
                                        <th><td></td></th>
                                        <th>팀</th>
                                        <td>
                                            <select name="teamCode" id="team">
                                                <option value="0">팀없음</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>직급</th>
                                        <td>
                                            <select name="jobCode" id="job"></select>
                                        </td>
                                        <th><td></td></th>
                                        <th>
                                            <td></td>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th>성별</th>
                                        <td>
                                            <select name="gender" id="gender">
                                                <option value="">선택안함</option>
                                                <option id="female" value="F">여자</option>
                                                <option id="male" value="M">남자</option>
                                            </select>
                                        </td>
                                        <th><td></td></th>
                                        <th>생년월일</th>
                                        <td><input type="date" id="birth" name="birth" value=""></td>
                                    </tr>
                                    <tr>
                                        <th>입사일</th>
                                        <td><input type="date" id="enrollDate" name="enrollDate" value="" readonly></td>
                                        <th><td></td></th>
                                        <th>퇴사일</th>
                                        <td><input type="date" id="resignDate" name="resignDate" value=""></td>
                                    </tr>
                                    <tr>
                                        <th>전화번호</th>
                                        <td><input type="tel" id="phone" name="phone" value=""></td>
                                        <th><td></td></th>
                                        <th>내선번호</th>
                                        <td><input type="tel" id="empPhone" name="empPhone" value=""></td>
                                    </tr>
                                    <tr style="height: 5px;"></tr>
                                    <tr>
                                        <th style="vertical-align:top">담당업무</th>
                                        <td colspan="5">
                                            <textarea class="form-control" name="task" id="task" rows="4"></textarea>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br>
                            <div class="btns" align="center">
                                <button type="submit" class="btn btn-success btn-sm" style="width: 80px;">수정하기</button>&nbsp;&nbsp;
                                <button type="button" onclick="location.href='employeeList.ad?cpage=${ pi.currentPage }'" class="btn btn-outline-success btn-sm" style="width: 80px;" data-bs-dismiss="modal">취소하기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            </div>
        </div>

        <script>
            // 상세 조회 모달
            let profileUrl = "";
            function viewDetail(empNo) {
                $.ajax({
                    url:"selectEmployee.ad",
                    data:{empNo:empNo},
                    success: function(map){
                        $('#empNo').text(map.e.empNo);
                        $("input[name=empNo]").val(map.e.empNo);
                        $('#empName').text(map.e.empName);
                        $('#email').val(map.e.email);

                        for(let d=0; d<map.deptList.length; d++){
                            $("#dept").append(
                                '<option id="dept' + map.deptList[d].deptCode + '" value="'+ map.deptList[d].deptCode +'">'+ map.deptList[d].deptName +'</option>'
                            )
                            if(map.deptList[d].deptCode == map.e.deptCode){
                                $('#dept' + map.deptList[d].deptCode).attr('selected', true);
                            }
                        }

                        for(let t=0; t<map.teamList.length; t++){
                            $("#team").append(
                                '<option id="team' + map.teamList[t].teamCode + '" value="'+ map.teamList[t].teamCode +'">'+ map.teamList[t].teamName +'</option>'
                            )
                            if(map.teamList[t].teamCode == map.e.teamCode){
                                $('#team' + map.teamList[t].teamCode).attr('selected', true);
                            }
                        }
                        
                        for(let j=0; j<map.jobList.length; j++){
                            $("#job").append(
                                '<option id="job' + map.jobList[j].jobCode + '" value="'+ map.jobList[j].jobCode +'">'+ map.jobList[j].jobName +'</option>'
                            )
                            if(map.jobList[j].jobCode == map.e.jobCode){
                                $('#job' + map.jobList[j].jobCode).attr('selected', true);
                            }
                        }

                        $("select[name='gender'] option[value='"+ map.e.gender +"']").attr("selected", true);
                        $('#birth').val(map.e.birth);

                        $('#phone').val(map.e.phone);
                        $('#empPhone').val(map.e.empPhone);
                        $('#enrollDate').val(map.e.enrollDate);
                        $('#resignDate').val(map.e.resignDate);

                        $('#task').text(map.e.task);

                        if(map.e.profileUrl != null){
                            $('#profileImg').attr('src', map.e.profileUrl);
                        }else{
                            $('#profileImg').attr('src', 'resources/images/common/profileDefault3.png');
                        }
                        $('#profileImg').attr('onclick', '$("#profileImgFile").click()');
                        
                        profileUrl = map.e.profileUrl;

                    }, error: function(){
                        console.log("사원상세조회 ajax 통신실패")
                    }, complete: function(){
                        console.log("사원상세조회 ajax 통신완료")
                    }
                })


                
		    }

        </script>
        
       
	

</body>
</html>