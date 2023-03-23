<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mailListView</title>
<style>
        
        .mailOuter{
            padding-left: 30px;
            margin: auto;
        }
        
        a{
            text-decoration: none !important;
        }
        .outer{
            width: 1200px;
        }
        .line{
            border : 1px solid lightgray
        }
        .line2{
            border: 0.5px solid rgb(240, 240, 240);
        }
        .space{
            height: 15px;
            width: 850px;
        }
        .content-title{
            font-size: 1.3em;
            width: 200px;
            font-weight: bold;
        }
        .prev, .mailBox{
            color: black;
        }
        .prev, .mailBox:hover{
            cursor: pointer;
            color: black;
        }
        #saveMailBtn{
            color: gray;

        }
        .fileArea{
            width: 900px;
            overflow: auto;
        }
        .yesfile{
            height: auto;
            width: 850px;
            border: 0.5px solid lightgray;
            font-size: 0.8em;
            border-radius: 0.4em;
        }
        .nofile{
            color: gray;
        }
        #summernote{
            width:800px;
        }
        .mailTitle{
            font-size: 1.3em;
            font-weight: bolder;
        }
        
        #receiver{
            border:none;
        }
        
        #receiver:focus{
            outline: none; /* outline 테두리 없애기 */
        }
        #receiver-list{
            margin-top: 0px;
            list-style-type : none;
            line-height: 30px;
            padding: 0px;
            display:inline-block;
            margin-bottom: 0px;
        }
        .sender{
            margin-top: 0px;
            list-style-type : none;
            line-height: 30px;
            padding: 0px;
            display:inline-block;
            margin-bottom: 0px;
        }
        .receiver-li, #sender{
            display: inline-block;
            background-color: lightgray;
            color: black;
            border-radius: 1em;
            padding-left: 7px;
            padding-right: 7px;
            font-size: 13px;
        }
        .receiveDate{font-size: 0.8em; color: gray;}
        .showFile{font-size: 13px;}
        .showFile:hover{cursor: pointer;}
        .yesfile{
            display:none;
        }
        .slideBTN{
            margin-right: 15px;
        }
        .file{
            margin-left: 5px;
        }
        .mailContent{
            font-size: 15px;
        }
        .mailIcon{width:20px;}
        #addMoveMailBoxInput{
        	border: 1px solid green;
        	border-radius: 5px;
        	padding-left: 5px;
            width: 150px; height: 30px;
        }
        #addMoveMailBoxInput:focus{
        	outline: 1px solid green;
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
	<jsp:include page="../common/sideMenubar.jsp"/>
	<jsp:include page="../common/mailMenubar.jsp"/>
        <br>
        <div class="mailOuter">
            <span class="content-title"><a class="prev" href="#">〈</a>&nbsp;&nbsp;&nbsp;${mailCategory}&nbsp;&nbsp;</span>
            <div class="line"></div>
            <div class="space"></div>
            
            <button id="reply" type="button" class="btn btn-outline-success btn-sm">답장</button>&nbsp;
            <button id="deliver" type="button" class="btn btn-outline-success btn-sm">전달</button>&nbsp;
            <c:choose>
                <c:when test="${mailCategory == '휴지통'}">
                    <button id="deleteEverBtn" class="btn btn-outline-success btn-sm">영구삭제</button>&nbsp;
                </c:when>
                <c:otherwise>
                    <button id="deleteBtn" class="btn btn-outline-success btn-sm" >삭제</button>&nbsp;
                </c:otherwise>
            </c:choose>
            <!-- 메일함 이동 관련 구역 -->
            <span class="moveMailBox dropdown">
                <button id="moveBtn" class="btn btn-outline-success btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside">이동</button>
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
                                <button id="move" class="btn btn-outline-success btn-sm" mailNo="${mi.mailNo}">이동</button>
                            </div>
                        </li>
                    </ul>
                    
            </span>&nbsp;

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
                        const $mailNo = ${mi.mailNo};
                        const $mailBoxNo = $("#moveMailBoxNo").val();
                        const $mailType = $("#moveMailType").val();
                        const $mailStatus = $("#moveStatus").val();
                        if($mailBoxNo == "" && $mailType == "" && $mailStatus == ""){
                            alert("이동할 메일함을 선택해주세요.");
                        }else{
                            var checkedMailList = [];
                            
                            checkedMailList.push($mailNo);
                            
                            //const $checkedMails = $("input:checkbox[name=mailNo]:checked").val();
                            //console.log(checkedMailList);

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
                                        location.replace("list.ma?mailCategory=${mailCategory}");
                                    } else{
                                        alert("알 수 없는 오류로 실패했습니다. 다시 시도해주세요.");
                                    }

                                }, error: function(){
                                    console.log("메일 이동 서비스용 ajax 통신 실패");
                                }
                            })
                        }

                        
                    })

                    // 삭제 버튼 클릭시
                    $("#deleteBtn").click(function(){
                        const $mailNo = ${mi.mailNo};
                        $("#moveMailBoxNo").val("0");
                        $("#moveMailType").val("");
                        $("#moveStatus").val("N");

                        var checkedMailList = [];
                        checkedMailList.push($mailNo);
                        $.ajax({
                            url:"moveMail.ma",
                            data:{
                                empNo: ${ loginUser.empNo },
                                mailNoList: checkedMailList,
                                mailBoxNo: $("#moveMailBoxNo").val(),
                                type: $("#moveMailType").val(),
                                status: $("#moveStatus").val()
                            },
                            success: function(result){

                                if(result == "success"){
                                    location.replace("list.ma?mailCategory=${mailCategory}");
                                } else{
                                    alert("알 수 없는 오류로 실패했습니다. 다시 시도해주세요.");
                                }

                            }, error: function(){
                                console.log("메일 삭제 서비스용 ajax 통신 실패");
                            }
                        })

                    })

                    // 영구 삭제 버튼 클릭시
                    $("#deleteEverBtn").click(function(){

                        if(confirm("메일을 영구삭제하시겠습니까?\n영구 삭제한 메일은 복구할 수 없습니다.")){
                            const $mailNo = ${mi.mailNo};
                            var checkedMailList = [];
                            checkedMailList.push($mailNo);
                            $.ajax({
                                url:"deleteMail.ma",
                                data:{
                                    empNo: ${ loginUser.empNo },
                                    mailNoList: checkedMailList
                                },
                                success: function(result){

                                    if(result == "success"){
                                        location.replace("list.ma?mailCategory=${mailCategory}");
                                    } else{
                                        alert("알 수 없는 오류로 실패했습니다. 다시 시도해주세요.");
                                    }

                                }, error: function(){
                                    console.log("메일 삭제 서비스용 ajax 통신 실패");
                                }
                            })
                        }

                    })


                    // 별 눌렀을 때
                    $(document).on("click", ".star", function(){

                        const $mailNo = ${ mi.mailNo };
                        // 업데이트할 중요값 원래 N => Y | Y => N
                        const $important = $(this).attr("important");
                        
                        $.ajax({
                            url: "important.ma",
                            data: {
                                empNo:${loginUser.empNo},
                                mailNo: $mailNo,
                                important: $important
                            },
                            success: function(result){
                                //console.log(result);
                            	if(result == "success"){
                                    
                            		if($important == 'N'){
                                        // 중요하지 않은 것으로 변경 시
                                        $("tr[mail-no=" + $mailNo + "]").children().children().eq(0).attr("important", "Y");
                                        $("tr[mail-no=" + $mailNo + "]").children().children().eq(0).html('<img class="mailIcon" src="resources/images/mail/normal.png">');
                                        
                            		} else{
                                        // 중요 메일로 변경 시
                                        $("tr[mail-no=" + $mailNo + "]").children().children().eq(0).attr("important", "N");
                                        $("tr[mail-no=" + $mailNo + "]").children().children().eq(0).html('<img class="mailIcon" src="resources/images/mail/important.png">');
                                        
                            		}
                            		
                            	} else{
                            		alert("알 수 없는 오류로 실패하였습니다. 다시 시도해주세요.");
                            	}
                            	
                            	
                            }, error: function(){
								
                            	console.log("메일 중요 서비스용 ajax 통신 실패");
                            	
                            }
                        })
                        

                    })

                    $("#reply").click(function(){
                        $("#postForm").attr("action", "reply.ma").submit();
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



            <div class="space"></div>
            <div class="line2"></div>
            <div class="space"></div>
            <div id="mailDetail">
                <table>
                    <tr mail-no="${ mi.mailNo }">
                        <td colspan="2" height="40px">
                            <c:choose>
	                        	<c:when test="${ mi.important eq 'Y' }">
	                        		<span class="star" important="N"><img class="mailIcon" src="resources/images/mail/important.png"></span>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<span class="star" important="Y"><img class="mailIcon" src="resources/images/mail/normal.png"></span>
	                        	</c:otherwise>
	                        </c:choose>
                            <span class="mailTitle">${ mi.mailTitle }</span>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px" class="head" height="40px">보낸 사람</td>
                        <td>
                            <div class="sender">
                                <span id="sender">
                                    ${ mi.sender }
                                </span>
                            </div>
                            
                        </td>
                    </tr>
                    <tr> 
                        <td class="head" height="40px">받는 사람</td>
                        <td>
                            <span>
                                <ul id="receiver-list">

                                </ul>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="receiveDate">${ mi.registerDate }</td>
                    </tr>
                    <tr>
                        <td colspan="2"><div class="line2"></div></td>
                    </tr>
                    <tr>
                        <td colspan="2"><div class="space"></div></td>
                    </tr>
                    <c:if test="${ mi.malist.size() gt 0 }">
                    <tr>
                        <td colspan="2" class="showFile"><span class="slideBTN">▼</span>첨부 <span>${ mi.malist.size() }개</span></td>
                        
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="fileArea">
                                <div class="yesfile">
                                    <c:forEach var="ma" items="${ mi.malist }">
                                        <div class="file"><a href="${ ma.changeName }" download="${ ma.originName }">${ ma.originName }</a></div>
                                    </c:forEach>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </c:if>
                    <tr>
                        <td colspan="2" rowspan="2">
                            <div class="space"></div>
                            <div class="mailContent">
                                
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                </table>

                <!-- 답장 혹은 전달시 보낼 값들이 담긴 form -->
                <form action="" mothod="post" id="postForm">
                    <input type="hidden" name="mailNo" value="${mi.mailNo}">
                    <input type="hidden" name="senderNo" value="${mi.senderNo}">
                    <input type="hidden" name="sender" value="${mi.sender}">
                    <input type="hidden" name="receiver" value="${mi.receiver}">
                    <input type="hidden" name="receiverNo" value="${mi.receiverNo}">
                    <input type="hidden" name="mailTitle" value="${mi.mailTitle}">
                    <input type="hidden" name="mailContent" value="${mi.mailContent}">
                    <input type="hidden" name="registerDate" value="${mi.registerDate}">
                </form>
            </div>
            <script>
                
                const sender = "${ mi.sender }";
                const mailContent = "${ mi.mailContent }";
                const receiverList = "${ mi.receiver }".split(",");
                let receiver = "";

                $("#sender").html(sender);
                $(".mailContent").html(mailContent);
                
                for(let i=0; i<receiverList.length - 1; i++){
                    receiver += "<li class='receiver-li'>" + receiverList[i] + "</li> , ";
                }
                receiver += "<li class='receiver-li'>" + receiverList[receiverList.length - 1] + "</li>";
                $("#receiver-list").html(receiver);

            </script>

        </div>
        <br><br><br><br>
    </div>
   
    <!-- include summernote css/js-->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    
    <script>
        /*
        $(function() {
            $('#summernote').summernote({
                height: 300,                 // set editor height
                minHeight: null,             // set minimum height of editor
                maxHeight: null,             // set maximum height of editor
                focus: true,                 // set focus to editable area after initializing summernote
                lang: "ko-KR"                // 한글 설정
            });
        });

        $(function() {
            $('#summernote').summernote();
        });
        */

        $(".showFile").click(function(){
            if($(".slideBTN").text() == "▼"){
                $(".slideBTN").text("▲");
            } else{
                $(".slideBTN").text("▼");
            }
            $(".yesfile").slideToggle();
        })
        
        
    </script>












        </div>
	    </div>

    </div>  

</div>

</body>
</html>