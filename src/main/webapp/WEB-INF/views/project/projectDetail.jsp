<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}
   
    .outer{
        width: 960px;
    }
    #projectForm th,td{
        
        padding: 20px;
    }
    figcaption{
        text-align: center;
    }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <jsp:include page="../common/menubar.jsp"/>
    <div class="outer">
        <h2>프로젝트 참여</h2>
        <hr>
        <div id="btn-area" align="right">
            <button class="btn btn-primary">수정하기</button>
        </div>
        <div>
            <table id="projectForm">
                <tr>
                    <th>프로젝트명</th>
                    <td>파이널프로젝트</td>
                </tr>
                <tr>
                    <th>프로젝트 기간</th>
                    <td>2022.02.01~2023.02.01</td>
                    <th>진행상태</th>
                    <td>
                      정상
                    </td>
                </tr>
                <tr>
                    <th>프로젝트 책임자</th>
                    <td>
                        <div class="emp-area">
                            <div>21231정여진</div>                         
                            <div>12321정철수</div>
                        </div>
                     
                      
                    </td>
                </tr>
            
                <tr>
                    <th>프로젝트 참여자</th>
                    <td>
                        <div class="emp-area">
                            <div>21231정여진</div>                         
                            <div>12321정철수</div>
                            <div>21231정여진</div>                         
                            <div>12321정철수</div>
                            <div>21231정여진</div>                         
                            <div>12321정철수</div>
                       </div>
                       &nbsp;
                     
                    </td>
                </tr>
                <tr>
                    <th>프로젝트 열람자</th>
                    <td>
                        <div class="emp-area">
                            <div>21231정여진</div>                         
                            <div>12321정철수</div>
                            <div>21231정여진</div>                         
                            <div>12321정철수</div>
                            <div>21231정여진</div>                         
                            <div>12321정철수</div>
                       </div>
                       &nbsp;
                    
                    </td>
                </tr>
                <tr>
                    <th>프로젝트 내용</th>
                    <td>
                        <div>
                            프로젝트 내용자리~~~~~~~
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><a download="" href="">ss.jsp</a></td>
                </tr>
            </table>
        </div>
        <hr>
        <table id="replyArea" class="table" align="center">
            <thead>
                <c:choose>
                    <c:when test="${empty loginUser}">
                        <tr>
                            <th colspan="2">
                                <textarea class="form-control"  cols="55" rows="2" style="resize:none; width:100%" readonly>로그인한 사용자만 이용가능한 서비스입니다. 로그인 후 이용바랍니다.</textarea>
                            </th>
                            <th style="vertical-align: middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <th colspan="2">
                                <textarea class="form-control"  id="content" cols="55" rows="2" style="resize:none; width:100%"></textarea>
                            </th>
                            <th style="vertical-align: middle"><button class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
                        </tr>
                    </c:otherwise>
                </c:choose>
                
                <tr>
                   <td colspan="3">댓글 (<span id="rcount"></span>) </td> 
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>
                        <div style="width: 120px;">
                            <article>
                                <figure>
                                    <img src="//bit.ly/2GrygUe" width="120px" height="100px">
                                    <figcaption>200111김철수</figcaption>
                                </figure>
                            </article>
                       </div>
                    </th>
                    <td>
                        <div style="width: 500px; height: 130px;">
                            댓글어쩌구쩌꿎구댓글어쩌구쩌꿎구댓글어쩌구쩌꿎구댓글어쩌구쩌꿎구댓글어쩌구쩌꿎구댓글어쩌구쩌꿎구댓글어쩌구쩌꿎구댓글어쩌구쩌꿎구
                        </div>
                    </td>
                    <td>
                        <div style=" height: 130px;">
                            2023-03-07<br>
                            20:00:00
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>
                        <div style="width: 120px;">
                            <article>
                                <figure>
                                    <img src="//bit.ly/2GrygUe" width="120px" height="100px">
                                    <figcaption>200111김철수</figcaption>
                                </figure>
                            </article>
                       </div>
                    </th>
                    <td>
                        <div style="width: 500px; height: 130px;">
                            댓글어쩌구쩌꿎구댓글어쩌구쩌꿎구댓글어쩌구쩌꿎구댓글어쩌구쩌꿎구댓글어쩌구쩌꿎구댓글어쩌구쩌꿎구댓글어쩌구쩌꿎구댓글어쩌구쩌꿎구
                        </div>
                    </td>
                    <td>
                        <div style=" height: 130px;">
                            2023-03-07<br>
                            20:00:00
                        </div>
                    </td>
                </tr>
               
       
            </tbody>
        </table>
        <div id="pagingArea">
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">1</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1 }">></a></li> 
            </ul>
        </div>
 
    </div>
</body>
</html>