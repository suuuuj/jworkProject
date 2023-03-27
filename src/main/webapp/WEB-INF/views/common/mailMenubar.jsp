<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> 
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    
    <style>
        /*
        div, input, p{
            border: 1px solid red;
        }
        
        #mailHeader tr{
            border-top: 0.1em solid blue;
            height: 60px;
        }
        */
        .outer *{
	 		font-family: 'Nanum Gothic', sans-serif;
	 	}
        #mailHeader tr{height: 60px;}
        
        .outer{
            width: 1200px;
        }
        
        .space{
            height: 15px;
        }
        .totalOuter{
            width:1200px;
            background-color: #fff;
   
        }
        .outer{width:1200px;}

        .subMenubar{
            position: relative;
            width:220px;
            height:100%;
            box-sizing: border-box ;
            float: left;
            background-color: rgb(255, 255, 255);
            border-right: 1px rgba(46, 170, 46, 0.219) solid;
            margin-left: 8px;
        }
        #line{
            width: 10px;
            background-color: rgb(217, 255, 227);
            height: 1000px;
            border-left: 2px solid;
            border-right: 2px solid;
        }

        .content{
            width:960px;
            height:1000px;
            box-sizing: border-box ;
            float: left;
        }
        .outer>div{
            float: left;
        }
        
        * {padding: 0;margin: 0;box-sizing: border-box;}
   
   
        .info-box{
            display: flex;
            align-items: center;
            margin: 0 15px;
            padding: 15px 0;
            
            border-bottom: 1px solid #5e5e5e;
        }
        .right .name{
            margin-bottom: 3px;
            font-size: 17px;
            font-weight: bold;
        }
        .common{
            width: 60px;
            height: 1000px;
            background-color: rgba(46, 170, 46, 0.219);
        
        }
        .mailMenu{
            width: 220px;
            height: 1000px;
        }
        .subMenubar>div{
            float: left;
        }
        .menu{
           margin-top: 10px;
        }
        .menuIcon{
            margin-right: 10px;
            width: 40px;
        }
        .menu-wrap{
           margin-left: 50px;
           display:none;
        }
        .menuDetail a{
           margin-top:5px;
           padding:3px;
           text-decoration: none;
           color: black;
        }
        .menuDetail a:hover{
           text-decoration: none;
           color: black;
           background-color: rgb(130, 180, 130);
           cursor:pointer;
        }
        .writeBtn{
            margin: 10px;
            margin-top: 40px;
        }
        .mainMailBox{margin: 10px;}
        .mainMailBox .btn-block{
            text-align: left;
        }
        .userMailBox{margin:10px}
        .addMailBox{
            float: right;
            font-size: 12px;
        }
        .oneMailBox .mailBoxBtn{
            float: right;
        }
        .oneMailBox .menuIcon{
            box-sizing: border-box;
            width: 20px;
        }
        .oneMailBox{margin-top: 6px;}
        .mailBoxName{
            width: 130px;
            border: none;
            padding-left: 5px;
        }
        .mailBoxNameBtn{
            width: 130px;
            height: 30px;
            border: none;
            padding-left: 5px;
            text-align: left;
        }
        .mailBoxName:focus{
            outline: 1px solid green;
            border-radius: 5px;
        }
        .active{
            color: green;
        }
    </style>
</head>
<body>
	
    <div class="totalOuter">

        <div class="outer">

            <div class="subMenubar">
                
                <div class="mailMenu">
                    <div class="writeBtn">
                        <button id="wrtieMail" class="btn btn-success btn-block" onclick="location.href='mailEnrollForm.ma'">메일 쓰기</button>
                    </div>
                    <div class="mainMailBox">
                        <div>
                            <a href="list.ma?mailCategory=받은메일함" id="receiveMailBox" class="btn btn-block">받은메일함</a>
                        </div>
                        <div>
                            <a href="list.ma?mailCategory=안읽은메일함" class="btn btn-block">안읽은메일함</a>
                        </div>
                        <div>
                            <a href="list.ma?mailCategory=보낸메일함" class="btn btn-block">보낸메일함</a>
                        </div>
                        <div>
                            <a href="list.ma?mailCategory=임시보관함" class="btn btn-block">임시보관함</a>
                        </div>
                        <div>
                            <a href="list.ma?mailCategory=중요" class="btn btn-block">중요메일함</a>
                        </div>
                        <div>
                            <a href="list.ma?mailCategory=휴지통" class="btn btn-block">휴지통</a>
                        </div>

                        <div class="line"></div>
                    </div>
                    <div class="userMailBox">
                        <span>메일함</span> <span class="addMailBox btn btn-sm">추가하기</span>
                        <br>
                        
                        
                    </div>

                    
                </div>

            </div>
            <script>
	            function loadMailBox(){
	                $.ajax({
	                    url: "mailBoxList.ma",
	                    data:{ empNo:${ loginUser.empNo }},
	                    success:function(mblist){
							
							let count = mblist.length;
							let value= "";
							
							for(let i=0; i<count; i++){
								
								value += '<div class="oneMailBox inputbox" hidden>'
										   + '<input type="hidden" value="' + mblist[i].mailBoxNo + '">'
										   + '<input type="text" class="mailBoxName" value="' + mblist[i].mailBoxName + '" readonly onkeyup="">'
										   + '<span class="mailBoxBtn">'
                                                + '<img class="menuIcon editMailBox" src="resources/images/mail/edit.png" />'
                                                + '<img class="menuIcon deleteMailBox" src="resources/images/mail/delete.png" />'
                                           + '</span>'
									   + '</div>'
                                       + '<div class="oneMailBox category">'
                                            + '<input type="hidden" value="' + mblist[i].mailBoxNo + '">'
                                            + '<button type="button" class="btn mailBoxNameBtn">' + mblist[i].mailBoxName + '</button>'
                                            + '<span class="mailBoxBtn">'
                                                + '<img class="menuIcon editMailBox" src="resources/images/mail/edit.png" />'
                                                + '<img class="menuIcon deleteMailBox" src="resources/images/mail/delete.png" />'
                                            + '</span>'
                                        + '</div>';

                                       
							}
							
							$(".userMailBox").append(value);
							
	                    }, error: function(){
	                        console.log("메일함 조회용 ajax 통신 실패");
	                    }
	                })
	            }
            
            	
                $(function(){
					
                	loadMailBox();
                	

                    // 메일함 수정 버튼 클릭 시
                    $(document).on("click", ".editMailBox", function(){
                        $(this).parent().parent().prev().attr("hidden", false);
                        $(this).parent().parent().attr("hidden", true);
                        $(this).parent().parent().prev().children().eq(1).attr("readonly", false);
                        $(this).parent().parent().prev().children().eq(1).select();
                        
                    })

                    // 메일함 input box 에서 포커스 아웃될 때
                    $(document).on("focusout", ".mailBoxName", function(){
                        const $mailBoxName = $(this).val();
                        const $mailBoxNo = $(this).prev().val();
                        $(this).parent().next().children().eq(1).text($mailBoxName);
                        $.ajax({
                            url: "updateMailBox.ma",
                            data: {
								mailBoxNo: $mailBoxNo,
								mailBoxName: $mailBoxName
                            },
                            success: function(result){
                            	
                            	if(result == "success"){
                                    $("input[value='" + $mailBoxNo + "']").eq(0).parent().attr("hidden", true);
                                    $("input[value='" + $mailBoxNo + "']").eq(1).parent().attr("hidden", false);
                                    $(this).parent().parent().next().attr("hidden", false);
                                    $(this).parent().parent().attr("hidden", true);
                                    /*
                            		$(this).attr("readonly", true);
                                	$(this).attr("border", "none");
                                    */
                                    $(".mailBoxOptions").remove();
                                    moveMailBoxList();
                            	} else {
                            		alert("알 수 없는 이유로 수정을 실패했습니다. 다시 시도해주세요.");
                            		$(".oneMailBox").remove();
                            		loadMailBox();
                            	}
                                
                            }, error: function(){
                            	console.log("메일함 수정용 ajax 통신 실패");
                            }
                        })
                    })

                    // 메일함 추가하기 클릭 시
                    $(".addMailBox").on("click", function(){
                   		// 랜덤으로 메일함 이름 생성
                    	const randomName = generateRandomString();
                    	
                    	$.ajax({
                    		url: "insertMailBox.ma",
                    		data: {
                    			empNo: ${loginUser.empNo},
                    			mailBoxName: randomName
                    		},
                    		success: function(mailbox){
                    			if(mailbox != null){
                    				// db에 메일함 추가하였을 경우
	                    			const mailBoxInput = '<div class="oneMailBox inputbox" hidden>'
														   + '<input type="hidden" value="' + mailbox.mailBoxNo + '">'
														   + '<input type="text" class="mailBoxName" value="' + mailbox.mailBoxName + '" readonly onkeyup="">'
														   + '<span class="mailBoxBtn">'
					                                            + '<img class="menuIcon editMailBox" src="resources/images/mail/edit.png" />'
					                                            + '<img class="menuIcon deleteMailBox" src="resources/images/mail/delete.png" />'
					                                       + '</span>'
													   + '</div>'
                                                       + '<div class="oneMailBox category">'
                                                            + '<input type="hidden" value="' + mailbox.mailBoxNo + '">'
                                                            + '<button type="button" class="btn mailBoxNameBtn">' + mailbox.mailBoxName + '</button>'
                                                            + '<span class="mailBoxBtn">'
                                                                + '<img class="menuIcon editMailBox" src="resources/images/mail/edit.png" />'
                                                                + '<img class="menuIcon deleteMailBox" src="resources/images/mail/delete.png" />'
                                                            + '</span>'
                                                        + '</div>';
            
									
	                    			$(".userMailBox").append(mailBoxInput);
									
	                    			// db에 추가 후 바로 해당 메일함 이름 수정가능하게 설정
			                        const mailBoxArr = $(".mailBoxNameBtn");
			                        const newMailBox = mailBoxArr.eq((mailBoxArr.length) - 1);
			                        newMailBox.next().children().eq(0).click();
                                    $(".mailBoxOptions").remove();
                                    moveMailBoxList();		   
				                    			
                    			} else{
                    				// db에 메일함 추가되지 않았을 경우
                    				alert("알 수 없는 이유로 메일함을 추가할 수 없습니다. 다시 시도해주세요.");
                    				$(".oneMailBox").remove();
                            		loadMailBox();
                    					
                    			}
                    			
                    		}, error: function(){
                    			console.log("메일함 추가용 ajax 통신 실패");
                    		}
                    	})
                    	
                    })
                    
                    // 메일함 삭제 버튼 클릭 시
                    $(document).on("click", ".deleteMailBox", function(){
                    	
                    	const mailBoxName = $(this).parent().prev().val();
                    	const mailBoxNo = $(this).parent().prev().prev().val();
                    	// 정말 삭제할 것인지 확인
                    	if(confirm("메일함을 삭제하시겠습니까?\n" + mailBoxName + "의 모든 메일은 휴지통으로 이동합니다.")){
                    		$.ajax({
                    			url: "deleteMailBox.ma",
                    			data:{mailBoxNo: mailBoxNo},
                    			success:function(result){
                    				if(result == "success"){
                    					location.replace("list.ma?mailCategory=받은메일함");
                    				} else{
                    					alert("알 수 없는 이유로 삭제할 수 없습니다. 다시 시도해주세요.");
                    				}
                    				
                    			}, error:function(){
                    				console.log("메일함 삭제용 ajax 통신 실패");
                    			}
                    		})
                    	}
                    	
                    })
                    
                    $(document).on("click", ".mailBoxNameBtn", function(){
                        const $mailBoxNo = $(this).prev().val();
                        const $mailBoxName = $(this).text();

                        location.href = "list.ma?mailCategory=사용자메일함&mailBoxNo=" + $mailBoxNo + "&mailBoxName=" + $mailBoxName;

                    })
                    
                })
                
                // 새 메일함 이름 랜덤 생성 함수
                function generateRandomString(num){
                	
                	const characters = ["뻐꾸기", "딱따구리", "직박구리", "뜸부기", "지빠귀", "제비", "고니", "오목눈이", "오리", "두루미"];
                	const charlength = characters.length;
                
                	return characters[Math.floor(Math.random() * charlength)];
                	
                }
                
                
            </script>
            <div id="line"></div>
            <div class="content">
            
            

    
</body>
</html>