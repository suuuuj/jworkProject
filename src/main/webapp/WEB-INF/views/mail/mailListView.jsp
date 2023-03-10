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
        
        .btnArea{padding-left: 10px;}
        /*
        .mailContents{
            height: 500px;
        }
        */
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
        input[type=radio]{
            display:none; margin: 10px;
        }
        #addMailBoxInput{width: 400px; height: 35px;}
        
        #search-area{
            width: 370px;
            float: right;
        }
        .mailContents tr{
            height: 40px;
            border: 0.5px solid rgb(241, 241, 241);
        }
        .mailContents tr:hover{
            background: rgb(241, 241, 241);
            cursor: pointer;
        }
        .mailContents td{
        	padding-left:10px;
        }
        .readIcon{width:20px;}
        #pagingArea{
            display: flex;
            justify-content: center;
        }
        .mailBoxOptions .btn-block{
        	text-align: left;
        }
        #addMailBoxInput{
        	border: 1px solid green;
        	border-radius: 5px;
        	padding-left: 5px;
        }
        #addMailBoxInput:focus{
        	outline: 1px solid green;
        }
        
        .font-bold{
        	font-weight:bold;
        }
        #pagingArea{
            margin-top:50px;
        }
    </style>
</head>
<body>
	
	<jsp:include page="../common/mailMenubar.jsp"/>
			<br>

            <span class="content-title">&nbsp;&nbsp;&nbsp;${ mailBox }&nbsp;&nbsp;</span> <a class="notRead" href="#">${ unReadCount }</a>&nbsp;/&nbsp;<a class="mailBox" href="#">${ listCount }</a> 
            <div class="line"></div>
            <div class="space"></div>
            <div class="btnArea">
                <input id="checkAll" type="checkbox"> &nbsp;&nbsp;
                <button id="readBtn" class="btn btn-outline-success btn-sm" disabled>읽음</button>&nbsp;
                <button id="deleteBtn" class="btn btn-outline-success btn-sm" disabled>삭제</button>&nbsp;
                <button type="button" id="moveBtn" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#move" disabled>이동</button>&nbsp;
                <button id="deliveryBtn" class="btn btn-outline-success btn-sm" disabled>전달</button>&nbsp;
                <div id="search-area">
                    <form action="" method="get">
                        <input type="hidden" name="cpage" value="1">
                        <select name="condition" id="condition">
                            <option value="all">선택</option>
                            <option value="sender">보낸사람</option>
                            <option value="receiver">받는사람</option>
                            <option value="titleAndContent">제목+내용</option>
                        </select>
                        <input type="text" name="keyword" id="keyword" value="${ keyword }">
                        <button type="submit" class="btn btn-success btn-sm">검색</button>
        
                    </form>
                </div>
            </div>
            <script>
                $(function(){

                    // 전채 선택 클릭 시 모든 메일 선택
                    $(document).on("click", "#checkAll", function(){
                        const checkBoxes = $(".mailContents input:checkbox");
                        if($("#checkAll").is(":checked") == true){
                            checkBoxes.prop("checked", true);
                        } else{
                            checkBoxes.prop("checked", false);
                        } 

                    })
                    
                    // 체크박스가 선택될때마다 확인 후 읽음, 삭제, 이동, 전달 버튼 활성화|비활성화 변경
                    // 선택지 하나라도 빼면 전체선택 해제 | 모두 선택시 전체선택
                    $(document).on("click", "input:checkbox", function(){
                        const $checkbox = $(".mailContents input[type=checkbox]");
                        const $checked = $(".mailContents input[type=checkbox]:checked");
                        if($checked.length > 0){
                            $(".btnArea>button").attr("disabled", false);
                        } else{
                            $(".btnArea>button").attr("disabled", true);
                        }
                        if($checkbox.length == $checked.length){
                            $("#checkAll").prop("checked", true);
                        } else{
                            $("#checkAll").prop("checked", false);
                        }
                    })




                })

            </script>

            <div class="modal" id="move">
                <div class="modal-dialog">
                  <div class="modal-content">
              
                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">Modal Heading</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
              
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="mailBoxOptions" data-toggle="buttons">
                            <label class="btn btn-outline-success btn-block">
                                <input type="radio" name="mailbox" id="" value="" checked> 받은메일함
                            </label>
                            <label class="btn btn-outline-success btn-block">
                                <input type="radio" name="mailbox" id="" value="" > 보낸메일함
                            </label>
                            <label class="btn btn-outline-success btn-block">
                                <input type="radio" name="mailbox" id="" value="" > 보관
                            </label>
                        </div>
                        <br>
                        
                    	<input type="text" id="addMailBoxInput"> <button id="modalAddMailBox" class="btn btn-outline-success">추가</button>
                    </div>
              
                    <!-- Modal footer -->
                    <div class="mfooter" align="center">
                    	<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-outline-success" id="moveMail">이동</button>
                    </div>
                    <br>
                  </div>
                </div>
            </div>
			<script>
				$(function(){
                    // 모달에서 메일함 추가 버튼 클릭시 ajax로 추가 후 view에 조회
					$("#modalAddMailBox").click(function(){
                        const addMailBoxInput = $("#addMailBoxInput").val();
						const newMailBox = "<label class='btn btn-outline-success btn-block'><input type='radio' name='mailbox' id='' value=''>" + addMailBoxInput + "</label>";

                        $(".mailBoxOptions").append(newMailBox);
                        $("#addMailBoxInput").val("");



					})
					
					
					
				})
				
			</script>

            <div class="space"></div>
            <div class="mailContents">
                <table>
                	<c:forEach var="m" items="${ mList }">
	                    <tr class="${ m.read eq 'N' ? 'font-bold' : ''}" mail-no="${ m.mailNo }">
	                        <td width="30px"><input type="checkbox"></td>
	                        <c:choose>
	                        	<c:when test="${ m.important eq 'Y' }">
	                        		<td width="30px" class="star">★</td>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td width="30px" class="star">☆</td>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${ m.read eq 'Y' }">
	                        		<!-- 읽은 메일 아이콘 수정하기!!!!!!!!!! -->
	                        		<td width="30px"><img class="readIcon" src="resources/images/mail/mail.png"></td>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td width="30px"><img class="readIcon" src="resources/images/mail/mail.png"></td>
	                        	</c:otherwise>
	                        </c:choose>
	                        <td width="100px">${ m.sender }</td>
	                        <td width="530px">${ m.mailTitle }</td>
	                        <td width="220px">${ m.registerDate }</td>
	                    </tr>
                    </c:forEach>
                </table>
            </div>
            
            
            <!-- 페이징바 -->
            <div id="pagingArea">
                <ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="list.ma?cpage=${ pi.currentPage - 1 }">Previous</a></li>
         				</c:when>
         				<c:otherwise>
         					<li class="page-item"><a class="page-link" href="list.ma?cpage=${ pi.currentPage - 1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<li class="page-item"><a class="page-link" href="list.ma?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="list.ma?cpage=${ pi.currentPage + 1 }">Next</a></li>
						</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.ma?cpage=${ pi.currentPage + 1 }">Next</a></li>                  
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>

            <script>
                $(function(){

                    

                })

            </script>
           
		</div>

    </div>  

</div>

</body>
</html>