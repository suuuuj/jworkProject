<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        box-sizing: border-box;
    }
    .content{
        margin: auto; 
        padding:4%
    }
    .btnArea{
        width: 545px;
    }
    .inputSearch{
        width:170px;
        border-radius: 3px;
    }
    #appListTB{
        font-size: small;
        text-align: center;
    }
   .btnArea button, .searchArea button{
        font-size: 12px;
        height: 27px;
        margin-bottom: 6px;
    }
    .my.pagination.justify-content-end.pagination-sm>li>a{
        color: green;
   } 
</style>
</head>
<body>
 <jsp:include page="../common/menubar.jsp"/>
        <div>
            <h4 style="display: inline-block;" style="float: left;"><b>전체 문서 조회</b></h4>
            <div align="right">
                <button type="button" class="btn btn-outline-success" onclick="localhost.href='enrollForm.app'">내 결제 문서 작성</button>
            </div>
        </div>
        <br>
        <div class="btnNSerch">
            <table>
                <tr>
                    <td class="btnArea">
                        <button type="button" class="btn btn-success btn-sm mr-2">전체(<span class="num">20</span>)</button>
                        <button type="button" class="btn btn-secondary btn-sm mr-2">진행(<span class="num">5</span>)</button>
                        <button type="button" class="btn btn-secondary btn-sm mr-2">완료(<span class="num">5</span>)</button>
                        <button type="button" class="btn btn-secondary btn-sm mr-2">반려(<span class="num">2</span>)</button>
                    </td>
                    <td class="searchArea">
                        <select class="searchBox">
                            <option selected>결재종류</option>
                            <option value="">제목</option>
                        </select>
                        <input type="text" class="inputSearch">
                        <button type="button" class="btn btn-success btn-sm mr-2" onclick="">검색</button>
                    </td>
                </tr>
            </table>
        </div>
        <br>
        
        <table class="table table-hover" id="appListTB" >
            <colgroup>
                <col width="11%">
                <col width="11%">
                <col width="*">
                <col width="11%">
                <col width="11%">
                <col width="11%">
            </colgroup>
            <thead >
                <tr>
                    <th scope="col">기안일</th>
                    <th scope="col">결재종류</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">첨부파일</th>
                    <th scope="col">결재상태</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>2023-02-20</td>
                    <td>업무기안</td>
                    <td>기안서</td>
                    <td>김정만</td>
                    <td></td>
                    <td>진행중</td>
                 </tr>
                 <tr>
                    <td>2023-02-20</td>
                    <td>업무기안</td>
                    <td>기안서</td>
                    <td>김정만</td>
                    <td></td>
                    <td>진행중</td>
                 </tr>
                 <tr>
                    <td>2023-02-20</td>
                    <td>업무기안</td>
                    <td>기안서</td>
                    <td>김정만</td>
                    <td></td>
                    <td>진행중</td>
                 </tr>
                 <tr>
                    <td>2023-02-20</td>
                    <td>업무기안</td>
                    <td>기안서</td>
                    <td>김정만</td>
                    <td></td>
                    <td>진행중</td>
                 </tr>
              
          
            </tbody>
        </table>
        <br>
        <div id="pagingArea">
            <ul class="my pagination justify-content-end pagination-sm">
                <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
              </ul>
        </div>

    </div> <!-- end of outer-->
</div>
</div>
</div>
    
</body>
</html>