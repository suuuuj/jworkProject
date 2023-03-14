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
        #addMoveMailBoxInput{width: 150px; height: 30px;}
        
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
        #addMoveMailBoxInput{
        	border: 1px solid green;
        	border-radius: 5px;
        	padding-left: 5px;
        }
        #addMoveMailBoxInput:focus{
        	outline: 1px solid green;
        }
        
        .font-bold{
        	font-weight:bold;
        }
        #pagingArea{
            margin-top:50px;
        }
        .moveAddMailBox{
            width: 240px;
        }
        .moveButtonArea{
            margin-left: 90px;
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
                <!--
                <button type="button" id="moveBtn" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#move" disabled>이동</button>&nbsp;-->
                
                <!-- 메일함 이동 관련 구역 -->
                <span class="moveMailBox dropdown">
                    <button id="moveBtn" class="btn btn-outline-success btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" disabled>이동</button>
                        <ul class="dropdown-menu">
                            <div class="mailBoxOptions">
                                <li>
                                    <a class="dropdown-item moveMailType" href="#" value="R">받은메일함</a>
                                </li>
                                <li>
                                    <a class="dropdown-item moveMailType" href="#" value="S">보낸메일함</a>
                                </li>
                                <li>
                                    <a class="dropdown-item moveStatus" href="#" value="N">휴지통</a>
                                </li>
                                
                            </div>
                            <br>
                            <li>
                                <div class="moveAddMailBox dropdown-item-text">
                                    <input type="text" id="addMoveMailBoxInput">&nbsp;<button id="moveAddMailBox" class="btn btn-outline-success btn-sm">추가</button>
                                </div>
                            </li>
                            <br>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <div class="moveButtonArea">
                                    <input type="hidden" id="moveMailBoxNo" value="">
                                    <input type="hidden" id="moveMailType" value="">
                                    <input type="hidden" id="moveStatus" value="">
                                    <button id="move" class="btn btn-outline-success btn-sm">이동</button>
                                </div>
                            </li>
                        </ul>
                        
                </span>&nbsp;
                <button id="deliveryBtn" class="btn btn-outline-success btn-sm" disabled>전달</button>&nbsp;

                <script>
                    $(function(){
                        
                        moveMailBoxList();
                        const randomName = generateRandomString();
                        $("#addMoveMailBoxInput").val(randomName);

                        
                        // 이동 드롭다운에서 메일함 추가 버튼 클릭 시
                        $("#moveAddMailBox").click(function(){

                            const newMailBoxName = $("#addMoveMailBoxInput").val();

                            $.ajax({
                                url: "insertMailBox.ma",
                                data: {
                                    empNo: ${loginUser.empNo},
                                    mailBoxName: newMailBoxName
                                },
                                success: function(mailbox){
                                    if(mailbox != null){
                                        // db에 메일함 추가하였을 경우
                                        const mailBoxOption = '<li>'
                                                                + '<a class="dropdown-item moveMailBoxNo" href="#" value="' + mailbox.mailBoxNo + '">' + mailbox.mailBoxName + '</a>'
                                                            + '</li>'
                                                            
                                        
                                        $(".mailBoxOptions").append(mailBoxOption);
                                        
                                        // input 에 작성한값 지우고 새 랜덤폴더명 예시로 보여주기
                                        $("#addMoveMailBoxInput").val(generateRandomString());
                                        $(".oneMailBox").remove();
                            		    loadMailBox();		   
                                                    
                                    } else{
                                        // db에 메일함 추가되지 않았을 경우
                                        alert("알 수 없는 이유로 메일함을 추가할 수 없습니다. 다시 시도해주세요.");
                                        $(".mailBoxOptions").remove();
                                        moveMailBoxList();

                                            
                                    }
                                    
                                }, error: function(){
                                    console.log("메일함 추가용 ajax 통신 실패");
                                }
                            })

                        })

                        // 이동 메일함 리스트 클릭시 해당 메일함 번호 및 타입 추출
                        $(document).on("click", ".moveMailBoxNo", function(){
                            const $moveMailBoxNo = $(this).attr("value");
                            //console.log($moveMailBoxNo);
                            $("#moveMailBoxNo").val($moveMailBoxNo);
                            $("#moveMailType").val("");
                            $("#moveStatus").val("Y");
                        })

                        // 이동 메일함 리스트 클릭시 해당 메일함 번호 및 타입 추출
                        $(document).on("click", ".moveMailType", function(){
                            const $moveMailType = $(this).attr("value");
                            //console.log($moveMailBoxNo);
                            $("#moveMailBoxNo").val("0");
                            $("#moveMailType").val($moveMailType);
                            $("#moveStatus").val("Y");
                        })

                        // 이동 메일함 리스트 클릭시 해당 메일함 번호 및 타입 추출
                        $(document).on("click", ".moveStatus", function(){
                            const $moveStatus = $(this).attr("value");
                            //console.log($moveMailBoxNo);
                            $("#moveMailBoxNo").val("0");
                            $("#moveMailType").val("");
                            $("#moveStatus").val($moveStatus);
                        })

                        // 이동 드롭다운의 "이동" 버튼 클릭시
                        $("#move").click(function(){

                            const $mailBoxNo = $("#moveMailBoxNo").val();
                            const $mailType = $("#moveMailType").val();
                            const $mailStatus = $("#moveStatus").val();
                            if($mailBoxNo == "" && $mailType == "" && $mailStatus == ""){
                                alert("이동할 메일함을 선택해주세요.");
                            }else{
                                var checkedMailList = [];
                                $("input[name=mailNo]:checked").each(function(){
                                    checkedMailList.push($(this).val());
                                })
                                //const $checkedMails = $("input:checkbox[name=mailNo]:checked").val();
                                console.log(checkedMailList);

                                $.ajax({
                                    url:"moveMail.ma",
                                    data:{
                                        empNo: ${ loginUser.empNo },
                                        mailNoList: checkedMailList,
                                        mailBoxNo: $mailBoxNo,
                                        type: $mailType,
                                        status: $mailStatus
                                    },
                                    success: function(result){

                                        if(result == "success"){
                                            location.replace("list.ma");
                                        } else{
                                            alert("알 수 없는 오류로 실패했습니다. 다시 시도해주세요.");
                                        }

                                    }, error: function(){
                                        console.log("메일 이동 서비스용 ajax 통신 실패");
                                    }
                                })
                            }

                            
                        })



                    })

                    

                    // 이동 메일함 리스트 조회
                    function moveMailBoxList(){
                        $.ajax({
                            url: "mailBoxList.ma",
                            data:{ empNo:${ loginUser.empNo }},
                            success:function(mblist){
                                
                                let count = mblist.length;
                                let value= "";
                                
                                for(let i=0; i<count; i++){
                                    
                                    value += '<li>'
                                            +   '<a class="dropdown-item moveMailBoxNo" href="#" value="' + mblist[i].mailBoxNo + '">' + mblist[i].mailBoxName + '</a>'
                                           + '</li>'
                                }
                                
                                $(".mailBoxOptions").append(value);
                                
                            }, error: function(){
                                console.log("메일함 조회용 ajax 통신 실패");
                            }
                        })
                    }
                    

                </script>




                <!-- 메일 검색 공간 -->
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
                            $(".btnArea button").attr("disabled", false);
                        } else{
                            $(".btnArea button").attr("disabled", true);
                        }
                        if($checkbox.length == $checked.length){
                            $("#checkAll").prop("checked", true);
                        } else{
                            $("#checkAll").prop("checked", false);
                        }
                    })


                })

            </script>

            
			
            <div class="space"></div>
            <div class="mailContents">
                <table>
                	<c:forEach var="m" items="${ mList }">
	                    <tr class="${ m.read eq 'N' ? 'font-bold' : ''}" mail-no="${ m.mailNo }">
	                        <td width="30px"><input type="checkbox" name="mailNo" value="${ m.mailNo }"></td>
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