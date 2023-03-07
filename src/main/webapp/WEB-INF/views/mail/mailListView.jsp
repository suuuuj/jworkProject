<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mailListView</title>
<style>
        
        .contents{
            width: 900px;
        }
        .line{
            border : 1px solid lightgray
        }
        .space{
            height: 15px;
        }
        .mailContents{
            height: 600px;
        }
        .content-title{
            font-size: 1.3em;
            width: 200px;
            font-weight: bold;
        }
        .notRead, .mailBox{
            color: black;
        }
        .notRead, .mailBox:hover{
            cursor: pointer;
            color: black;
        }
        .mailContents tr{
            height: 40px;
            border: 0.5px solid lightgray;
        }
        .mailContents tr:hover{
            background: lightgray;
            cursor: pointer;
        }
        .mailContents td{
        	padding-left:10px;
        }
        #pagingArea{
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>
			<br><br>

            <span class="content-title">&nbsp;&nbsp;&nbsp;받은 메일함&nbsp;&nbsp;</span> <a class="notRead" href="#">0</a>&nbsp;/&nbsp;<a class="mailBox" href="#">230</a> 
            <div class="line"></div>
            <div class="space"></div>
            <input type="checkbox"> &nbsp;&nbsp;
            <button id="readBtn" class="btn btn-outline-secondary btn-sm">읽음</button>&nbsp;
            <button id="deleteBtn" class="btn btn-outline-secondary btn-sm">삭제</button>&nbsp;
            <button id="moveBtn" class="btn btn-outline-secondary btn-sm">이동</button>&nbsp;
            <button id="deliveryBtn" class="btn btn-outline-secondary btn-sm">전달</button>&nbsp;

            <div class="space"></div>
            <div class="mailContents">
                <table>
                    <tr>
                        <td width="30px"><input type="checkbox"></td>
                        <td width="30px" class="star">☆</td>
                        <td width="30px">&#x2709;&#xFE0F;</td>
                        <td width="100px">보낸사람</td>
                        <td width="600px">안녕하세요 제목입니다.</td>
                        <td width="150px">2023.01.12 14:29</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td class="star">★</td>
                        <td>&#x2709;&#xFE0F;</td>
                        <td>보낸사람</td>
                        <td>[안내] 죽전사옥 데이터센터 장비 정기점검</td>
                        <td>2023.01.12 14:29</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td class="star">★</td>
                        <td>&#x2709;&#xFE0F;</td>
                        <td>보낸사람</td>
                        <td>[안내] 죽전사옥 데이터센터 장비 정기점검</td>
                        <td>2023.01.12 14:29</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td class="star">★</td>
                        <td>&#x2709;&#xFE0F;</td>
                        <td>보낸사람</td>
                        <td>[안내] 죽전사옥 데이터센터 장비 정기점검</td>
                        <td>2023.01.12 14:29</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td class="star">★</td>
                        <td>&#x2709;&#xFE0F;</td>
                        <td>보낸사람</td>
                        <td>[안내] 죽전사옥 데이터센터 장비 정기점검</td>
                        <td>2023.01.12 14:29</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td class="star">★</td>
                        <td>&#x2709;&#xFE0F;</td>
                        <td>보낸사람</td>
                        <td>[안내] 죽전사옥 데이터센터 장비 정기점검</td>
                        <td>2023.01.12 14:29</td>
                    </tr>


                </table>
            </div>
            <!-- 페이징바 -->
            
            <div id="pagingArea"> 
                <ul class="pagination">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>
           
		</div>

    </div>  

</div>
	
	
</body>
</html>