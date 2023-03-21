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
	.innerOuter{
        width: 900px;
        margin: 5%;
    }
    .allAdressList{
        margin-right: 20px;
    }
    /**/
    #search-area{
        display: inline-flex;
    }
    #condition, #keyword {
        height: 30px;
        border-radius: 5px; border: 1px solid gainsboro;
        float: left; margin-right: 5px; padding: 5px;
        font-size: 14px;
    }
    #search-btn{
        position: absolute;
        left: 530px;
        border: 0px;
        background-color: rgba(255, 255, 255, 0);
    }
    /*표*/
    #list-area{
        text-align: center;
        line-height: 25px;
        color: rgb(75, 75, 75);
        font-size: 14px;
    }
    /*모달*/
    #employeeModal {
        margin: 15px;
    }
    .infoTitle {
        display: flex;
        align-items: center;
        margin: 0 15px;
        padding: 15px 0;
    }
    #left img {
        width:70px; height:70px; border:0.5px solid lightgray; border-radius: 50%;
    }
    #left{width: 90px;}
    #empName{
        font-size: 25px !important;
        font-weight: bold;
    }
    #right img{
        width: 20px;
        margin-top: -7px;
    }
    .infoDetail {
        margin: 0 15px;
        padding: 15px 0;
        font-size: 15px;
    }
    .infoDetail th {
        width: 100px;
        height: 35px;
        font-weight: 500;
    }

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
    <jsp:include page="../common/sideMenubar.jsp"/>
	<jsp:include page="../common/addressMenubar.jsp"/>

        <div class="innerOuter">
            <h4 style="display: inline-block;" style="float: left;" ><b>사내 주소록</b></h4>
            <br><br>

            <div class="allAdressList">
                <div id="search-area">
                    <form action="addressInSearch.emp" method="get">
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
                <table id="list-area" class="table table-sm">
                    
                    <thead>
                        <tr>
                            <th></th>
                            <th>사번</th>
                            <th>이름</th>
                            <th>부서</th>
                            <th>직위</th>
                            <th>이메일</th>
                            <th>휴대폰</th>
                            <th>내선번호</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="e" items="${ list }">
                            <tr>
                                <td>
                                    <c:choose>
                                        <c:when test="${ e.empFav eq 1 }">
                                            <img class="like listFullStar" src="resources/images/common/fullstar.png" alt="" width="15px">
                                            <input type="hidden" value="${ e.empNo }">
                                        </c:when>
                                        <c:otherwise>  
                                            <img class="like listStar" src="resources/images/common/star.png" alt="" width="15px">
                                            <input type="hidden" value="${ e.empNo }">
                                        </c:otherwise> 
                                    </c:choose>
                                </td>
                                <td>${ e.empNo }</td>
                                <td data-bs-toggle="modal" data-bs-target="#selectEmployee" onclick="viewDetail(${ e.empNo })">${ e.empName }</td>
                                <td>${ e.deptName } - ${ e.teamName }</td>
                                <td>${ e.jobName }</td>
                                <td>${ e.email }</td>
                                <td>${ e.phone }</td>
                                <td>${ e.empPhone }</td>
                            </tr>
                        </c:forEach>
                            
                    </tbody>
                </table>
        
                <br>
        
                <div id="paging-area" align="center">
                    <ul class="pagination justify-content-center">
                        <c:if test="${ pi.currentPage ne 1 }"> <!-- 내가보고있는페이지가 1이 아닐경우 -->
                            <li class="page-item" disabled><a href="addressIn.emp?cpage=${ pi.currentPage - 1 }"><</a></li>
                        </c:if>
                        
                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            <c:choose>
                                <c:when test="${ empty condition and empty keyword }"> <!-- 검색 전일 때 -->
                                    <li class="page-item"><a href="addressIn.emp?cpage=${ p }">${ p }</a></li>
                                </c:when>
                                <c:otherwise>	<!-- 검색 후 -->
                                    <li class="page-item"><a href="addressInSearch.emp?cpage=${ p }&condition=${ condition }&keyword=${ keyword }">${ p }</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        
                        <c:if test="${ pi.currentPage ne pi.maxPage }"><!-- 내가보고있는페이지가 마지막페이지가 아닐경우 -->
                            <li class="page-item"><a href="addressIn.emp?cpage=${ pi.currentPage + 1 }">></a></li>
                        </c:if>
                    </ul>
                </div>



            </div>

        </div>

        <!-- 주소록 조회 모달 -->
        <div class="modal fade" id="selectEmployee" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-body" id="employeeModal">             
                    <div class="infoTitle">
                        <div id="left"><img class="profileImg" id="profile" src="" /></div>
                        <div id="right">
                            <span id="empName"></span>&nbsp;
                            <span id="empFav"></span>
                        </div>
                    </div>
                    <div class="infoDetail">
                        <table>
                            <tr>
                                <th>사번</th>
                                <td id="empNo"></td>
                            </tr>
                            <tr>
                                <th>부서</th>
                                <td>
                                    <span id="deptName"></span> - <span id="teamName"></span>
                                </td>
                            </tr>
                            <tr>
                                <th>직급</th>
                                <td id="jobName"></td>
                            </tr>
                        </table>
                        <hr>
                        <table>
                            <tr>
                                <th>이메일</th>
                                <td id="email"></td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td id="phone"></td>
                            </tr>
                            <tr>
                                <th>내선번호</th>
                                <td id="empPhone"></td>
                            </tr>
                        </table>
                        <hr>
                        <table>
                            <tr>
                                <th>담당업무</th>
                                <td id="task"></td>
                            </tr>
                        </table>
                    </div>
                    <div align="center">
                        <button type="button" onclick="location.href='addressIn.emp?cpage=${ pi.currentPage }'" class="btn btn-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
            </div>
        </div>

        <script>
            // 상세 조회 모달
            function viewDetail(empNo) {
                $.ajax({
                    url:"selectAdressEmployee.emp",
                    data:{empNo:empNo},
                    success: function(e){
                        $('#empNo').text(e.empNo);
                        $('#empName').text(e.empName);
                        $('#deptName').text(e.deptName);
                        $('#teamName').text(e.teamName);
                        $('#jobName').text(e.jobName);
                        $('#email').text(e.email);
                        $('#phone').text(e.phone);
                        $('#empPhone').text(e.empPhone);
                        $('#task').text(e.task);
                        if(e.empFav == 1){
                            const star = '<img class="like listFullStar" src="resources/images/common/fullstar.png" alt="">'
                                        + '<input type="hidden" value="'+ e.empNo+ '">'
                            $('#empFav').html(star);
                        }else{
                            const star = '<img class="like listStar" src="resources/images/common/star.png" alt="">'
                                        + '<input type="hidden" value="' + e.empNo+ '">'
                            $('#empFav').html(star);
       
                        };
                        if(e.profileUrl != null){
                            $('#profile').attr('src', e.profileUrl)
                        }else{
                            $('#profile').attr('src', 'resources/images/common/profileDefault3.png')
                        }

                    }, error: function(){
                        console.log("사원상세조회 ajax 통신실패")
                    }, complete: function(){
                        console.log("사원상세조회 ajax 통신완료")
                    }
                })
		    }

            // 리스트 즐겨찾기
            $(document).on("click", ".like", function(){
                if($(this).hasClass("listStar")){
                    insertFavorite($(this).next().val());
                    $(this).attr("src", "resources/images/common/fullstar.png");
                    $(this).attr("class", "like listFullStar");
                }else{
                    deleteFavorite($(this).next().val());
                    $(this).attr("src", "resources/images/common/star.png");
                    $(this).attr("class", "like listStar");
                }
            })


            // 즐겨찾기
            function insertFavorite(empNo){
                $.ajax({
                    url:"insertAddressFav.emp",
                    data:{empNo:empNo},
                    success: function(result){
                        console.log("즐겨찾기 ajax 통신성공")
                    }, error: function(){
                        console.log("즐겨찾기 ajax 통신실패")
                    }
                })
            }

            // 즐겨찾기 해제
            function deleteFavorite(empNo){
                $.ajax({
                    url:"deleteAddressFav.emp",
                    data:{empNo:empNo},
                    success: function(result){
                        console.log("즐겨찾기 ajax 통신성공")
                    }, error: function(){
                        console.log("즐겨찾기 ajax 통신실패")
                    }
                })
            }

        </script>

	

</body>
</html>