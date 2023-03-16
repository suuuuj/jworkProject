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
    #personModal {
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
    #name{
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
    }
    .infoDetail th {
        width: 85px; height: 40px;
        font-weight: 500; font-size: 15px;
    }
    .infoTitle input, .infoDetail input, .infoDetail select, .infoDetail textarea {
        border-radius: 5px; border: 1px solid rgb(241, 241, 241);
        padding: 5px;
        font-size: 14px;
    }
    .infoTitle input {
        width: 100px;
    }
    .infoDetail input, .infoDetail select {
        width: 200px; height: 35px;
    }
    .infoDetail textarea {
        resize: none; padding: 10px;
        width: 200px;
    }

</style>
</head>
<body>
    <jsp:include page="../common/sideMenubar.jsp"/>
	<jsp:include page="../common/addressMenubar.jsp"/>

        <div class="innerOuter">
            <h4 style="display: inline-block;" style="float: left;" ><b>개인 주소록</b></h4>
            <br><br>

            <div class="allAdressList">
                <div id="search-area">
                    <form action="" method="get">
                        <input type="hidden" name="cpage" value="1">
                        <select name="condition" id="condition" style="width: 100px;">
                            <option value="">이름</option>
                            <option value="">회사</option>
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
                            <th>이름</th>
                            <th>회사</th>
                            <th>부서</th>
                            <th>직위</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="o" items="#{ list }">
                            <tr>
                                <td>
                                    <c:choose>
                                        <c:when test="${ o.addoutFav eq 1 }">
                                            <img src="resources/images/common/fullstar.png" alt="" width="15px">
                                        </c:when>
                                        <c:otherwise>  
                                            <img src="resources/images/common/star.png" alt="" width="15px">
                                        </c:otherwise> 
                                    </c:choose>
                                </td>
                                <td data-bs-toggle="modal" data-bs-target="#selectPerson" onclick="viewDetail(${ o.addoutNo })">${ o.name }</td>
                                <td>${ o.bizName }</td>
                                <td>${ o.dept }</td>
                                <td>${ o.job }</td>
                                <td>${ o.email }</td>
                                <td>${ o.phone }</td>
                            </tr>
                        </c:forEach>
                            
                    </tbody>
                </table>
        
                <br>
        
                <div id="paging-area" align="center">
                    <c:if test="${ pi.currentPage ne 1 }"> <!-- 내가보고있는페이지가 1이 아닐경우 -->
                        <a href="addressOut.emp?cpage=${ pi.currentPage - 1 }">&lt;</a>
                    </c:if>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <c:choose>
                            <c:when test="${ empty condition and empty keyword }"> <!-- 검색 전일 때 -->
                                <a href="addressOut.emp?cpage=${ p }">[${ p }]</a>
                            </c:when>
                            <c:otherwise>	<!-- 검색 후 -->
                                <a href="search.bo?cpage=${ p }&condition=${ condition }&keyword=${ keyword }">[${ p }]</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    
                    <c:if test="${ pi.currentPage ne pi.maxPage }"><!-- 내가보고있는페이지가 마지막페이지가 아닐경우 -->
                        <a href="addressOut.emp?cpage=${ pi.currentPage + 1 }">&gt;</a>
                    </c:if>
                </div>



            </div>

        </div>

        <!-- 주소록 조회 모달 -->
        <div class="modal fade" id="selectPerson" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
            <div class="modal-content">
                <form action="updateAddressOut.emp" method="post">
                    <input type="hidden" name="addoutNo" value="">
                    <div class="modal-body" id="personModal">             
                        <div class="infoTitle">
                            <div id="right">
                                <span><input id="name" name="name" type="text" value="" placeholder=""></span>&nbsp;
                                <span id="addoutFav"><img src="resources/images/common/star.png" alt=""></span>
                            </div>
                        </div>
                        <div class="infoDetail">
                            <table>
                                <tr>
                                    <th>회사</th>
                                    <td><input id="bizName" name="bizName" type="text" value="" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th>부서</th>
                                    <td><input id="dept" name="dept" type="text" value="" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th>직급</th>
                                    <td><input id="job" name="job" type="text" value="" placeholder=""></td>
                                </tr>
                            </table>
                            <hr>
                            <table>
                                <tr>
                                    <th>이메일</th>
                                    <td><input id="email" name="email" type="text" value="" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th>전화번호</th>
                                    <td><input id="phone" name="phone" type="text" value="" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th>회사전화</th>
                                    <td><input id="bizPhone" name="bizPhone" type="text" value="" placeholder=""></td>
                                </tr>
                            </table>
                            <hr>
                            <table>
                                <tr>
                                    <th>그룹</th>
                                    <td>
                                        <select id="groupNo" name="groupNo" style="height: 30px;">
                                            <option value="1">선택안함</option>
                                            <option value="2">1</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr  style="vertical-align:top">
                                    <th>메모</th>
                                    <td><textarea id="memo" name="memo" ></textarea></td>
                                </tr>
                            </table>
                        </div>
                        <div align="center">
                            <button type="submit" class="btn btn-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">수정</button>&nbsp;
                            <button type="button" class="btn btn-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">삭제</button>&nbsp;
                            <button type="button" class="btn btn-outline-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </form>
            </div>
            </div>
        </div>

        <script>
            function viewDetail(addoutNo) {
                $.ajax({
                    url:"selectAdressOut.emp",
                    data:{addoutNo:addoutNo},
                    success: function(o){
                        $('#name').val(o.name);
                        $('#bizName').val(o.bizName);
                        $('#dept').val(o.dept);
                        $('#job').val(o.job);
                        $('#email').val(o.email);
                        $('#phone').val(o.phone);
                        $('#bizPhone').val(o.bizPhone);
                        $('#memo').val(o.memo);
                        // $('#groupName').text(o.groupName);
                        if(o.addoutFav == 1){
                            const star = '<img src="resources/images/common/fullstar.png" alt="">'
                            $('#addoutFav').html(star);
                        }else{
                            const star = '<img src="resources/images/common/star.png" alt="">'
                            $('#addoutFav').html(star);

                            //$('#empFav').attr('onclick', 'insertFavorite(empNo)');  
                        };
                        // 그룹은 아직 안했음!
                        if(o.groupNo == null){
                            $("#groupNo").val("1").prop("selected", true);
                        }else if(o.groupNo == "1"){
                            $("#groupNo").val("2").prop("selected", true);
                        };
                        $("input[name=addoutNo]").val(addoutNo);
                    }, error: function(){
                        console.log("사원상세조회 ajax 통신실패")
                    }
                })
		    }

        </script>

    

	

</body>
</html>