<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto; margin-right: 520px; }
     div{box-sizing: border-box;}
     #img-area{
      
        margin: 0 auto;
        overflow: hidden;
        padding-top:10px;
    }
    #img-area>article{
        float: left;
        margin-left: 10px;
        margin-bottom: 10px;

    }
    .detail-img{display: inline-block;}
    .outer{
        width: 960px;
    }
    figure {
  text-align: center;
    }
    .subImg{
        top:5px;
        right: 5px;
      
    }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <jsp:include page="../common/menubar.jsp"/>
    <div class="outer">
        <h2>회의실 관리</h2>
        <hr><br>
        <div>
            <div class="btn-area">
                <a class="btn btn-secondary" href="enrollForm.cfr">+회의실 등록</a>
                <button type="button" class="btn btn-secondary">회의실 예약 내역</button>
            </div>
            <br><br>
            <div id="img-area" style="position: relative;">
            
                <div class="detail-img" style="position: relative;">
                    <article>
                        <figure>
                            <img src="//bit.ly/2GrygUe" width="250px" height="150px">
                            <figcaption >1회의실</figcaption>
                        </figure>
                    </article>
                    <div style="position: absolute;" class="subImg">
                        <button type="button" onclick="">-</button>
                    </div>
                </div>
                <div class="detail-img" style="position: relative;">
                    <article>
                        <figure>
                            <img src="//bit.ly/2GrygUe" width="250px" height="150px">
                            <figcaption >1회의실</figcaption>
                        </figure>
                    </article>
                    <div style="position: absolute;" class="subImg">
                        <button type="button" onclick="">-</button>
                    </div>
                </div>
             
                <div class="detail-img" style="position: relative;">
                    <article>
                        <figure>
                            <img src="//bit.ly/2GrygUe" width="250px" height="150px">
                            <figcaption >1회의실</figcaption>
                        </figure>
                    </article>
                    <div style="position: absolute;" class="subImg">
                        <button type="button" onclick="">-</button>
                    </div>
                </div>
             
                <div class="detail-img" style="position: relative;">
                    <article>
                        <figure>
                            <img src="//bit.ly/2GrygUe" width="250px" height="150px">
                            <figcaption >1회의실</figcaption>
                        </figure>
                    </article>
                    <div style="position: absolute;" class="subImg">
                        <button type="button" onclick="">-</button>
                    </div>
                </div>
             
                <div class="detail-img" style="position: relative;">
                    <article>
                        <figure>
                            <img src="//bit.ly/2GrygUe" width="250px" height="150px">
                            <figcaption >1회의실</figcaption>
                        </figure>
                    </article>
                    <div style="position: absolute;" class="subImg">
                        <button type="button" onclick="">-</button>
                    </div>
                </div>
             
                <div class="detail-img" style="position: relative;">
                    <article>
                        <figure>
                            <img src="//bit.ly/2GrygUe" width="250px" height="150px">
                            <figcaption >1회의실</figcaption>
                        </figure>
                    </article>
                    <div style="position: absolute;" class="subImg">
                        <button type="button" onclick="">-</button>
                    </div>
                </div>
             
             
             
             

             
              
            </div>
        </div>
        <br>
        <div id="pagingArea">
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">1</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1 }">></a></li> 
            </ul>
        </div>
        <script>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
            Open modal
            </button>

        </script>
        <!-- The Modal -->
        <div class="modal" id="">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">회의실 조회</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="">
                        <table id="cfRoom-enrollForm">
                            <tr >
                                <th >회의실 이름</th>
                                <td><input type="text" name="" value=""></td>
                            </tr>
                            <tr>
                                <th>회의실 대표 이미지</th>
                                <td>
                                    <img src="" width="150px" height="100px" onclick="$('#firstImg').click();">
                                    <input type="file" id="firstImg" style="display:none;">
                                </td>
                            </tr>
                            <tr>
                                <th>회의실 상세 이미지</th>
                                <td>
                                    <img src="" width="150px" height="100px">
                                    <img src="" width="150px" height="100px">
                                    <img src="" width="150px" height="100px">
        
                                </td>
                            </tr>
                            <tr>
                                <th>수용인원</th>
                                <td><input type="number" name="" value=""></td>
                            </tr>
                            <tr>
                                <th>회의장비</th>
                                <td>
                                    TV&nbsp;<input type="checkbox">&nbsp;
                                    빔프로젝터&nbsp;<input type="checkbox">&nbsp;
                                    에어컨&nbsp;<input type="checkbox">&nbsp;
                                    커피포트&nbsp;<input type="checkbox">&nbsp;
                                    선풍기&nbsp;<input type="checkbox">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><button type="button" class="btn btn-sm btn-secondary">+장비추가</button></td>
                            </tr>
        
        
                        </table>
                    </form>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-sm btn-primary" >수정하기</button>
                    <button type="button" class="btn btn-sm btn-light" data-dismiss="modal" onclick="history.back();">이전으로</button>
                </div>
        
            </div>
            </div>
        </div>
        

    </div>
</body>
</html>