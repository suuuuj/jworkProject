<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
   
    .outer{
        width: 960px;
    }
    #pagingArea{width:fit-content;margin:auto; margin-right: 520px; }

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="outer">
        <h2>회의실 예약 이력 조회</h2>
        <hr><br>
        <div>
            <div>
                <button type="button" class="btn btn-sm btn-secondary">예약상세조회</button>
            </div>
            <br>
            <div>
                <table border="1">
                    <tr>
                        <td>회의실</td>
                        <td>오전9시</td>
                        <td>오전10시</td>
                        <td>오전11시</td>
                        <td>오후12시</td>
                        <td>오후1시</td>
                        <td>오후2시</td>
                    </tr>
                    <tr>
                        <td>1회의실</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>2회의실</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>3회의실</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>4회의실</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>5회의실</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">예약이력상세조회</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body"  align="center">
                <div>
                    <select name="">
                        <option value="">1회의실</option>
                        <option value="">1회의실</option> 
                        <option value="">1회의실</option> 
                    </select>
                    기간별조회 : <input type="date"> - <input type="date">
                </div>
                <div align="center">
                    <table border="1">
                        <tr>
                            <th>회의실</th>
                            <th>회의명</th>
                            <th>예약자</th>
                            <th>인원</th>
                            <th>사용일정</th>
                            <th>예약상태</th>
                        </tr>
                        <tr>
                            <td>1회의실</td>
                            <td>회의다!!</td>
                            <td>김민수1021</td>
                            <td>8</td>
                            <td>2022-02-01 09:00~11:00</td>
                            <td>예약완료</td>
        
                        </tr>
                        <tr>
                            <td>1회의실</td>
                            <td>회의다!!</td>
                            <td>김민수1021</td>
                            <td>8</td>
                            <td>2022-02-01 09:00~11:00</td>
                            <td>예약완료</td>
        
                        </tr>
                        <tr>
                            <td>1회의실</td>
                            <td>회의다!!</td>
                            <td>김민수1021</td>
                            <td>8</td>
                            <td>2022-02-01 09:00~11:00</td>
                            <td>예약완료</td>
        
                        </tr>
                    </table>

                </div>
                <div id="pagingArea">
                    <ul class="pagination">
                        <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">1</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">2</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">3</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1 }">></a></li> 
                    </ul>
                </div>
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
            </div>
    
        </div>
        </div>
    </div>
    
    
  
</body>
</html>