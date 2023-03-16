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
    .favTitle {
        font-size: 16px;
        margin-top: 15px; margin-bottom: 15px;
        
    }
    /*표*/
    #list-area-in, #list-area-out{
        text-align: center;
        line-height: 25px;
        color: rgb(75, 75, 75);
        font-size: 14px;
    }
    /*모달*/
    #employeeModal, #personModal {
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
        width: 100px;
        height: 35px;
        font-weight: 500;
    }
</style>
</head>
<body>
    <jsp:include page="../common/sideMenubar.jsp"/>
	<jsp:include page="../common/addressMenubar.jsp"/>

        <div class="innerOuter">
            <h4 style="display: inline-block;" style="float: left;" ><b>중요</b></h4>
            <br><br>

            <div class="allAdressList">
                <div class="favTitle">
                    사내 주소록
                </div>
                <table id="list-area-in" class="table table-sm">
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

                            <tr>
                                <td><img src="resources/images/common/star.png" alt="" width="15px"></td>
                                <td>41501</td>
                                <td data-bs-toggle="modal" data-bs-target="#selectEmployee">주강민</td>
                                <td>인사부 - </td>
                                <td>상무</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><img src="resources/images/common/fullstar.png" alt="" width="15px"></td>
                                <td>41501</td>
                                <td>주강민</td>
                                <td>인사부 - </td>
                                <td>상무</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            
                    </tbody>
                </table>

                <br><br>
                <div class="favTitle">
                    개인 주소록
                </div>
                <table id="list-area-out" class="table table-sm">
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

                            <tr>
                                <td><img src="resources/images/common/star.png" alt="" width="15px"></td>
                                <td>구디구디</td>
                                <td data-bs-toggle="modal" data-bs-target="#selectPerson">강백호</td>
                                <td>인사부</td>
                                <td>상무</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><img src="resources/images/common/fullstar.png" alt="" width="15px"></td>
                                <td>구디구디</td>
                                <td>서태웅</td>
                                <td>인사부</td>
                                <td>상무</td>
                                <td></td>
                                <td></td>
                            </tr>
                            
                    </tbody>
                </table>
        
                <br>
        
                <div id="paging-area" align="center">
                    <c:if test="${ pi.currentPage ne 1 }"> <!-- 내가보고있는페이지가 1이 아닐경우 -->
                        <a href="list.bo?cpage=${ pi.currentPage - 1 }">&lt;</a>
                    </c:if>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <c:choose>
                            <c:when test="${ empty condition and empty keyword }"> <!-- 검색 전일 때 -->
                                <a href="list.bo?cpage=${ p }">[${ p }]</a>
                            </c:when>
                            <c:otherwise>	<!-- 검색 후 -->
                                <a href="search.bo?cpage=${ p }&condition=${ condition }&keyword=${ keyword }">[${ p }]</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    
                    <c:if test="${ pi.currentPage ne pi.maxPage }"><!-- 내가보고있는페이지가 마지막페이지가 아닐경우 -->
                        <a href="list.bo?cpage=${ pi.currentPage + 1 }">&gt;</a>
                    </c:if>
                </div>



            </div>

        </div>


        <!-- 사내주소록 조회 모달 -->
        <div class="modal fade" id="selectEmployee" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-body" id="employeeModal">             
                    <div class="infoTitle">
                        <div id="left"><img class="profileImg" src="<c:out value='${ profileUrl }' default='resources/images/common/profileDefault3.png' />" /></a></div>
                        <div id="right">
                            <span id="name">주강민</span>&nbsp;
                            <span><img src="resources/images/common/star.png" alt=""></span>
                        </div>
                    </div>
                    <div class="infoDetail">
                        <table>
                            <tr>
                                <th>사번</th>
                                <td>41501</td>
                            </tr>
                            <tr>
                                <th>부서</th>
                                <td>인사부 - </td>
                            </tr>
                            <tr>
                                <th>직급</th>
                                <td>상무</td>
                            </tr>
                        </table>
                        <hr>
                        <table>
                            <tr>
                                <th>이메일</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>010-1111-2222</td>
                            </tr>
                            <tr>
                                <th>내선번호</th>
                                <td></td>
                            </tr>
                        </table>
                        <hr>
                        <table>
                            <tr>
                                <th>담당업무</th>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                    <div align="center">
                        <button type="button" class="btn btn-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
            </div>
        </div>

        <!-- 개인 주소록 조회 모달 -->
        <div class="modal fade" id="selectPerson" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-body" id="personModal">             
                    <div class="infoTitle">
                        <div id="right">
                            <span id="name">강백호</span>&nbsp;
                            <span><img src="resources/images/common/star.png" alt=""></span>
                        </div>
                    </div>
                    <div class="infoDetail">
                        <table>
                            <tr>
                                <th>회사</th>
                                <td>구디구디</td>
                            </tr>
                            <tr>
                                <th>부서</th>
                                <td>인사부</td>
                            </tr>
                            <tr>
                                <th>직급</th>
                                <td>상무</td>
                            </tr>
                        </table>
                        <hr>
                        <table>
                            <tr>
                                <th>이메일</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>010-1111-2222</td>
                            </tr>
                            <tr>
                                <th>회사전화</th>
                                <td></td>
                            </tr>
                        </table>
                        <hr>
                        <table>
                            <tr>
                                <th>메모</th>
                                <td>빨강머리</td>
                            </tr>
                        </table>
                    </div>
                    <div align="center">
                        <button type="button" class="btn btn-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
            </div>
        </div>

    

	

</body>
</html>