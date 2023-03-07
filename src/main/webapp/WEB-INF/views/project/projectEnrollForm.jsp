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
    .emp-area{
        float: left;
        width: 250px; height: 130px; border: 1px grey solid;
        overflow: auto;
    }
    .emp-area div{
        margin-left: 5px;
    }
    #projectEnrollForm th,td{
        
        padding: 20px;
    }
    #added-list{
      border:1px solid grey; width: 240px; height: 600px;
      float: left;
      margin-left:20px
    }
    #added-list div{
        margin-left: 5px;
        overflow: auto;
      
    }
    #emp-list,#add-btn, #dept-list{
        float: left;
      
    }
    #emp-list{
        margin-left:30px;
    }
    #dept-list div{
        font-size: 18px;
        margin-top: 10px;
        font-weight: 600;
    }
 
   #add-btn{
    line-height: 600px;
    margin-left: 30px;
   }
  
  
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <jsp:include page="../common/menubar.jsp"/>
    <div class="outer">
        <h2>프로젝트 등록</h2>
        <hr>
        <div>
            <form action="">
                <table id="projectEnrollForm">
                    <tr>
                        <th>프로젝트명</th>
                        <td><input type="text" nmae="title"></td>
                    </tr>
                    <tr>
                        <th>프로젝트 기간</th>
                        <td><input type="date"> - <input type="date"></td>
                        <th>진행상태</th>
                        <td>
                            <select name="" id="">
                                <option value="">정상</option>
                                <option value="">지연</option>
                                <option value="">매우지연</option>
                                <option value="">완료</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>프로젝트 책임자</th>
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
                            <button class="addEmp" class="btn" data-toggle="modal" data-target="#addEmp">+</button>
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
                           <button class="addEmp" class="btn" data-toggle="modal" data-target="#addEmp">+</button>
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
                           <button class="addEmp" class="btn" data-toggle="modal" data-target="#addEmp">+</button>
                        </td>
                    </tr>
                    <tr>
                        <th>프로젝트 내용</th>
                        <td>
                            <textarea name="" id="" cols="50" rows="10" style="resize: none;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td><input type="file"></td>
                    </tr>
                </table>
                <div align="center">
                    <button class="btn btn-sm btn-light" type="button">이전으로</button>
                    <button class="btn btn-sm btn-primary" type="submit" onclick="">등록하기</button>
                </div>
            </form>
            <br clear="both">
        </div>

    </div>
    <!-- 사원추가 모달 -->
    <div class="modal" id="addEmp">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">주소록</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <div id="add-emp-modal"  >
                    <div id="dept-list">
                        <div>총무팀</div>
                        <div>개발팀</div>
                        <div>인사팀</div>
                    </div>
                    <div id="emp-list"  >
                  
                        <table class="table" >
                          
                            <tr>
                                <th></th>
                                <th>사번</th>
                                <th>이름</th>
                                <th>부서</th>
                                <th>직급</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>231231</td>
                                <td>정여진</td>
                                <td>총무부</td>
                                <td>대리</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>231231</td>
                                <td>정여진</td>
                                <td>총무부</td>
                                <td>대리</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>231231</td>
                                <td>정여진</td>
                                <td>총무부</td>
                                <td>대리</td>
                            </tr>
                          
            
                        </table>
                       
                    </div>
                 
                    <button id="add-btn"class="btn btn-sm btn-secondary">></button>
                    
               
                  
                    <div id="added-list" >
                          
                        <div>21231정여진</div>                         
                        <div>12321정철수</div>
                        <div>21231정여진</div>                         
                        <div>12321정철수</div>
                        <div>21231정여진</div>                         
                        <div>12321정철수</div>
                      
                    </div>
                    <br clear="both">
                    <br><br>
                    <div id="pagingArea" style="margin-left: 240px;">
                        <ul class="pagination">
                            <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                            <li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">1</a></li>
                            <li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">2</a></li>
                            <li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">3</a></li>
                            <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1 }">></a></li> 
                        </ul>
                    </div>
               
                </div>
                
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="" class="btn btn-secondary">완료</button>
            </div>
    
        </div>
        </div>
    </div>
        

</body>
</html>