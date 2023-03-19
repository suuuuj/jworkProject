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

    </style>
</head>
<body>
	<jsp:include page="../common/sideMenubar.jsp"/>
	<jsp:include page="../common/mailMenubar.jsp"/>
        <br>
        <div class="mailOuter">
            <span class="content-title"><a class="prev" href="#">〈</a>&nbsp;&nbsp;&nbsp;받은 메일함&nbsp;&nbsp;</span> <a class="notRead" href="#">0</a>&nbsp;/&nbsp;<a class="mailBox" href="#">230</a> 
            <div class="line"></div>
            <div class="space"></div>
            
            <button id="reply" type="button" class="btn btn-outline-secondary btn-sm">답장</button>&nbsp;
            <button id="deliver" type="button" class="btn btn-outline-secondary btn-sm">전달</button>&nbsp;
            <button id="delete" type="button" class="btn btn-outline-secondary btn-sm">삭제</button>&nbsp;
            <button id="move" type="button" class="btn btn-outline-secondary btn-sm">이동</button>&nbsp;

            <div class="space"></div>
            <div class="line2"></div>
            <div class="space"></div>
            <div id="mailDetail">
                <table>
                    <tr>
                        <td colspan="2" height="40px">
                            <c:choose>
	                        	<c:when test="${ m.important eq 'Y' }">
	                        		<span class="star" important="N"><img class="mailIcon" src="resources/images/mail/important.png"></span>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<span class="star" important="Y"><img class="mailIcon" src="resources/images/mail/normal.png">
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
                                    ${ m.sender }
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