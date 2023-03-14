<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- 부트스트랩 5버전 -->
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> 



<style>
	.innerOuter{
        /* border: 1px solid black; */
        margin: 20px;
    }
    .schDetail{
        border: 1px solid gainsboro;
        margin: 20px;
        padding: 30px;
        /* height: 700px; */
    }
    /*수정 삭제 버튼*/
    #schBtn-area{
        /* border: 1px solid blue; */
        display: inline-block;
        margin-left: 42%;
    }
    #schBtn-area button{
        margin: 3px;
    }



    /*왼쪽*/
    #search-area{
        display: inline-flex;
    }
    .form-select{
        float: left;
        width: 100px;
        margin-right: 20px;
    }
    .form-control{
        float: left;
        width: 200px;
    }
    #search-btn{
        position: absolute;
        left: 500px;
        border: 0px;
        background-color: rgba(255, 255, 255, 0);
    }
    /*오른쪽*/
    #enroll-area{
        float: right;
    }
    /*표*/
    #list-area{
        text-align: center;
        line-height: 30px;
        color: rgb(75, 75, 75);
    }
    #important{       
        font-weight: 600;
    }
    #imTitle{
        color:rgb(255, 69, 69);
    }




</style>
</head>
<body>
	<jsp:include page="../common/scheduleMenubar.jsp"/>
	<div class="content">
        <div class="innerOuter">
            <h2>공지사항</h2>
            <br>
            <div class="noticeList">
                <div id="search-area">
                    <form action="" method="get">
                        <input type="hidden" name="cpage" value="1">
                        <select name="askCondition" class="form-select form-select-sm">
                            <option value="">최신순</option>
                            <option value="">조회순</option>
                            <option value="">좋아요순</option>
                        </select>
                        <select name="searchCondition" class="form-select form-select-sm">
                            <option value="">제목</option>
                            <option value="">내용</option>
                            <option value="">제목/내용</option>
                        </select>  
                        <label>               
                        <input type="text" class="form-control form-control-sm" name="keyword" value="${ keyword }" style="margin-left:-15px;">
                        <button type="submit" id="search-btn"><img src="search.png" width="15px"></button>
                        </label> 
                    </form>
                </div>
                
                <script>
                    document.querySelector("#search-area option[value=${condition}]").selected = true;
                </script>

                <div id="enroll-area">
                    <div>
                        <!--총무부만 보이게-->
                        <button class="btn btn-outline-success btn-sm" onclick="location.href='enrollForm.bo'">등록</button>
                    </div>
                </div>

                <br><br>
                <table id="list-area" class="table">
                    <thead>
                        <tr>
                            <th></th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>조회</th>
                            <th>좋아요</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="n" items="${ list }">
                            <tr id="important">
                                <td><img src="siren.png" width="30px"></td>
                                <td id="imTitle">중요 공지사항 제목입니다</td>
                                <td>강백호</td>
                                <td>2023-03-05</td>
                                <td>45</td>
                                <td>3</td>
                            </tr>
                        </c:forEach>
                        <c:forEach var="n" items="${ list }">
                            <tr>
                                <td>1</td>
                                <td>공지사항 제목입니다</td>
                                <td>강백호</td>
                                <td>2023-03-05</td>
                                <td>45</td>
                                <td>3</td>
                            </tr>
                        </c:forEach>
                       
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
    </div>

    

    <script>

    $(function(){
        

        
    })
    


   </script>
</html>