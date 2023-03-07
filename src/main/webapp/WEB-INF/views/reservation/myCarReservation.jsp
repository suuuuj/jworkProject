<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <jsp:include page="../common/menubar.jsp"/>
    <div class="outer">
        <h2>나의 차량 예약내역</h2>
        <div align="right">
            <input type="date">- <input type="date">
        </div>
        <hr><br>
        <div>
            <div id="">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>신청차량명</th>
                            <th>신청일시</th>
                            <th>신청날짜</th>
                            <th>신청사유</th>
                            <th>신청상태</th>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td>소나타 2022허03</td>
                            <td>2023-02-24 09:00:01</td>
                            <td>2023-02-24 09:00~2023-02-24 14:00</td>
                            <td>지방 출장(부산)</td>
                            <td>
                                <button type="button" class="btn btn-sm btn-primary">승인완료</button>
                                <button type="button" class="btn btn-sm btn-warning">반려</button>
                                <button type="button" class="btn btn-sm btn-secondary">승인대기</button>
                            </td>
                        </tr>
                   </tbody>

                </table>

            </div>
        </div>
        <br>
        <div id="pagingArea">
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">1</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">2</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">3</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1 }">></a></li> 
            </ul>
        </div>

    <!-- Button to Open the Modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        Open modal
    </button>
    </div>
    <!-- 상세보기 모달 -->
    <div class="modal" id="detail-view">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">예약내역 상세조회</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <table>
                    <tr>
                        <th>신청일시</th>
                        <td>2022.02.02 10:10:00</td>
                    </tr>
                    <tr>
                        <th>담당자</th>
                        <td>총무부사번(인사부)</td>
                    </tr>
                    <tr>
                        <th>신청결과</th>
                        <td>
                            <button type="button" class="btn btn-sm btn-primary">승인완료</button>
                        </td>
                    </tr>
                    <tr>
                        <th>사유</th>
                        <td>
                            <textarea name="" id="" cols="30" rows="10">
                                사유~~
                            </textarea>
                        </td>
                    </tr>
                </table>
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">확인</button>
            </div>
    
        </div>
        </div>
    </div>
    
</body>
</html>