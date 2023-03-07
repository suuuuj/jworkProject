<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}
     figure {
  text-align: center;
    }
    #img-area{
        width: 800px;
        margin: 0 auto;
        overflow: hidden;
        padding-top:10px;
    }
    #img-area>article{
        float: left;
        margin-left: 10px;
        margin-bottom: 10px;

    }
    #detail-img{display: inline-block;}
    .outer{
        width: 960px;
    }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <jsp:include page="../common/menubar.jsp"/>
    <div class="outer">
        <h2>차량 관리</h2>
        <hr><br>
        <div class="outer">
            <div class="btn-area">
                <button type="button" class="btn  btn-secondary">+차량 등록</button>
                <button type="button" class="btn  btn-light">+예약 조회</button>
            </div>
            <br><br>
            <div id="img-area">
                <div id="detail-img">
                    <article>
                        <figure>
                            <img src="//bit.ly/2GrygUe" width="200px" height="140px">
                            <figcaption >소나타 2022허 23</figcaption>
                        </figure>
                    </article>
                </div>
                <div id="detail-img">
                    <article>
                        <figure>
                            <img src="//bit.ly/2GrygUe" width="200px" height="140px">
                            <figcaption >소나타 2022허 23</figcaption>
                        </figure>
                    </article>
                </div>
                <div id="detail-img">
                    <article>
                        <figure>
                            <img src="//bit.ly/2GrygUe" width="200px" height="140px">
                            <figcaption >소나타 2022허 23</figcaption>
                        </figure>
                    </article>
                </div>
                <div id="detail-img">
                    <article>
                        <figure>
                            <img src="//bit.ly/2GrygUe" width="200px" height="140px">
                            <figcaption >소나타 2022허 23</figcaption>
                        </figure>
                    </article>
                </div>
                <div id="detail-img">
                    <article>
                        <figure>
                            <img src="//bit.ly/2GrygUe" width="200px" height="140px">
                            <figcaption >소나타 2022허 23</figcaption>
                        </figure>
                    </article>
                </div>
                <div id="detail-img">
                    <article>
                        <figure>
                            <img src="//bit.ly/2GrygUe" width="200px" height="140px">
                            <figcaption >소나타 2022허 23</figcaption>
                        </figure>
                    </article>
                </div>
                <div id="detail-img">
                    <article>
                        <figure>
                            <img src="//bit.ly/2GrygUe" width="200px" height="140px">
                            <figcaption >소나타 2022허 23</figcaption>
                        </figure>
                    </article>
                </div>
                <div id="detail-img">
                    <article>
                        <figure>
                            <img src="//bit.ly/2GrygUe" width="200px" height="140px">
                            <figcaption >소나타 2022허 23</figcaption>
                        </figure>
                    </article>
                </div>
                
               
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


    </div>
    <script>
        //이미지 클릭시 차량 조회 / 수정 모달
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
            
        </button>


    </script>


    <!-- The Modal -->
    <div class="modal" id="carDetailView">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">차량 조회</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <form action="">
                    <table>
                        <tr>
                            <th>차량명</th>
                            <td><input type="text" name=""></td>
                        </tr>
                        <tr>
                            <th>차량 대표 이미지</th>
                            <td><img src="" alt=""></td>
                        </tr>
                        <tr>
                            <th>차량 종류</th>
                            <td><input type="text"  name=""></td>
                        </tr>
                        <tr> 
                            <th>기어 형식</th>
                            <td><input type="text"  name=""></td>
                        </tr>
                        <tr>
                            <th>현재 상태</th>
                            <td>
                                <input type="radio" name="">
                                <input type="radio" name="">
                            </td>
                        </tr>
                        <tr>
                            <th>차량 색상</th>
                            <td><input type="text"  name=""></td>
                        </tr>
                        <tr>
                            <th>제조사</th>
                            <td><input type="text"  name=""></td>
                        </tr>
                        <tr>
                            <th>연료 형식</th>
                            <td><input type="text"  name=""></td>
                        </tr>
                        <tr>
                            <th>차량 연식</th>
                            <td><input type="text"  name=""></td>
                        </tr>
                        <tr>
                            <th>비고</th>
                            <td>
                                <textarea name="" id="" cols="30" rows="10"></textarea>
                            </td>
                        </tr>


                    </table>
                  <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-sm btn-primary"  data-dismiss="modal">수정하기</button>
                        <button type="button" class="btn btn-sm btn-light" data-dismiss="modal" onclick="history.back();">이전으로</button>
                    </div>
            
        
                </form>
            </div>
    
        
        </div>
        </div>
    </div>
</body>
</html>