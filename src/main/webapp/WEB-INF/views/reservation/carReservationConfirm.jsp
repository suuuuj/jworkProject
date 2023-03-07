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
        <h2>차량 예약 승인 관리</h2>
        <hr><br>
        <div>
            <div class="select-area">
               <select name="" id="">
                    <option value="">미승인예약</option>
                    <option value="">전체예약</option>
               </select>
            </div>
            <br><br>
            <div id="">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>차량명</th>
                            <th>신청사원</th>
                            <th>신청일시</th>
                            <th>신청사유</th>
                            <th>신청상태</th>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td>소나타 2022허03</td>
                            <td>김철수</td>
                            <td>2023-02-24 09:00:01</td>
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
            <h4 class="modal-title">차량 예약 상세관리</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <table>
                    <tr>
                        <th>차량명</th>
                        <td>소나타12313</td>
                    </tr>
                    <tr>
                        <th>신청사원</th>
                        <td>정철수사번(인사부)</td>
                    </tr>
                    <tr>
                        <th>신청일시</th>
                        <td>2023-02-24 08:00~ 2023-02-24 14:00</td>
                    </tr>
                    <tr>
                        <th>신청사유</th>
                        <td>부장호출</td>
                    </tr>
                    <tr>
                        <th>반려사유</th>
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
            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-primary btn-sm" onclick="">승인</button>
            <button type="button" class="btn btn-danger btn-sm" onclick="">반려</button>
            </div>
    
        </div>
        </div>
    </div>
    
</body>
</html>