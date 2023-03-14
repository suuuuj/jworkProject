<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 구글 글씨체 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
    <!-- Bootstrap 5버전 -->
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> 

    
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
        .totalOuter{
            width:1300px;
            background-color: #fff;
   
        }
        
        .outer{
            width: 1200px;
        }
        .content{
            width: 960px;
            padding: 20px;
        }
        .gradation{
        	height:10px;
        	background: linear-gradient(45deg, rgba(76, 209, 76, 0.219), rgb(74, 195, 74));
        }
        .space{
            height: 15px;
        }
        .totalOuter{
            width:1200px;
            background-color: #fff;
   
        }
        .outer{width:1200px;}
        .home{
            height:100px;
            width:1200px;
            box-sizing: border-box ;
            background: rgba(246, 246, 246, 0.712);
        }
        .line{
            height:1px;
            background: linear-gradient(45deg, rgb(2, 152, 52), rgb(3, 110, 63));
        }
        .logo{ width:200px; }
        .menubar{
            width:240px;
            height:1000px;
            box-sizing: border-box ;
            float: left;
            background-color: rgba(246, 246, 246, 0.712);
        }
        .content{
            width:960px;
            height:1000px;
            box-sizing: border-box ;
        }
        .outer>div{
            float: left;
        }
        
        * {padding: 0;margin: 0;box-sizing: border-box;}
   
   
        .header{
            display: flex;
            align-items: center;
            width: 1050px;
        }
        .header-right{
            height: 70px;
             display:flex;
            width: 100px;
            padding-top: 30px;
         }
         .headerIcon{
             width:40px;
             margin-right:10px;
         }
        .home>div{
           float:left;
        }
   
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
            background-color: /*#2db400*/ #0dc75b;

        }
        .mailMenu{
            width: 180px;
            height: 1000px;
        }
        .menubar>div{
            float: left;
        }
        .menubarArea{
           margin-left: 8px;
           margin-right: 8px;
           
        }
        .menu{
           margin-top: 10px;
        }
        
        .mainMenu:hover{
           cursor:pointer;
           border-radius: 0.5em;
           background-color: rgba(0, 172, 0, 0.219);
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
        .addMailBox{float: right;}
        .oneMailBox .mailBoxBtn{
            float: right;
        }
        .oneMailBox .menuIcon{
            box-sizing: border-box;
            width: 20px;
        }
        .oneMailBox{margin-top: 6px;}
        .mailBoxName{
            width: 100px;
            border: none;
            background-color: rgba(246, 246, 246, 0.712);
            padding-left: 5px;
        }
        .mailBoxName:focus{
            outline: 1px solid green;
            border-radius: 5px;
            background-color: rgba(246, 246, 246, 0.712);
        }
    </style>
</head>
<body>
	
    <div class="totalOuter">

        <div class="home">
            <div class="header">
                <div class="logo-box">
                    
                    <a href="#"><img class="logo" src="resources/images/common/jwork_logo.png" alt="" /></a>
                    
                </div>

            </div>
			<div class="header-right">
                	<a href="#"><img class="headerIcon" src="resources/images/common/mail.png" alt=""></a>
                	<a href="#"><img class="headerIcon" src="resources/profile_images/profile.png" alt=""></a>
            </div>
            
        </div>
        <div class="gradation"></div>
        <div class="outer">

            <div class="menubar">
                <div class="common">

                    <div class="menubarArea">
                        <br>
                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/profile_images/profile.png" /></div>
                        </div>
                        <div class="space"></div>
                        <div class="line"></div>
                        <div class="space"></div>

                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/home.png" /></div>
                        </div>

                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/schedule.png" /></div>
                        </div>

                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/chart.png" /></div>
                        </div>

                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/ess.png" /></div>
                        </div>

                        <div class="menu"  id="approval">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/vacation.png" /></div>
                        </div>
                        
                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/approval.png" /></div>
                        </div>

                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/mail.png" /></div>
                        </div>

                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/board.png" alt="" /></div>
                        </div>

                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/announce.png" alt="" /></div>
                        </div>
                    </div>
                </div>
                
                <div class="mailMenu">
                    <div class="writeBtn">
                        <button id="wrtieMail" class="btn btn-success btn-block" onclick="location.href='mailEnrollForm.ma'">메일 쓰기</button>
                    </div>
                    <div class="mainMailBox">
                        <div>
                            <a href="list.ma" id="receiveMailBox" class="btn btn-block">받은메일함</a>
                        </div>
                        <div>
                            <a href="#" class="btn btn-block">안읽은메일함</a>
                        </div>
                        <div>
                            <a href="#" class="btn btn-block">보낸메일함</a>
                        </div>
                        <div>
                            <a href="#" class="btn btn-block">임시보관함</a>
                        </div>
                        <div>
                            <a href="#" class="btn btn-block">중요메일함</a>
                        </div>
                        <div>
                            <a href="#" class="btn btn-block">휴지통</a>
                        </div>

                        <div class="line"></div>
                    </div>
                    <div class="userMailBox">
                        <span>메일함</span> <span class="addMailBox btn btn-sm">추가하기</span>
                        
                        
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
								
								value += '<div class="oneMailBox">'
										   + '<input type="hidden" value="' + mblist[i].mailBoxNo + '">'
										   + '<input type="text" class="mailBoxName" value="' + mblist[i].mailBoxName + '" readonly>'
										   + '<span class="mailBoxBtn">'
                                                + '<img class="menuIcon editMailBox" src="resources/images/mail/edit.png" />'
                                                + '<img class="menuIcon deleteMailBox" src="resources/images/mail/delete.png" />'
                                           + '</span>'
									   + '</div>'
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
                        $(this).parent().prev().attr("readonly", false);
                        $(this).parent().prev().select();
                    })

                    // 메일함 input box 에서 포커스 아웃될 때
                    $(document).on("focusout", ".mailBoxName", function(){
                        const $mailBoxName = $(this).val();
                        const $mailBoxNo = $(this).prev().val();
                        $.ajax({
                            url: "updateMailBox.ma",
                            data: {
								mailBoxNo: $mailBoxNo,
								mailBoxName: $mailBoxName
                            },
                            success: function(result){
                            	
                            	if(result == "success"){
                            		$(this).attr("readonly", true);
                                	$(this).attr("border", "none");
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
	                    			const mailBoxInput = '<div class="oneMailBox">'
														   + '<input type="hidden" value="' + mailbox.mailBoxNo + '">'
														   + '<input type="text" class="mailBoxName" value="' + mailbox.mailBoxName + '" readonly>'
														   + '<span class="mailBoxBtn">'
					                                            + '<img class="menuIcon editMailBox" src="resources/images/mail/edit.png" />'
					                                            + '<img class="menuIcon deleteMailBox" src="resources/images/mail/delete.png" />'
					                                       + '</span>'
													   + '</div>';
									
	                    			$(".userMailBox").append(mailBoxInput);
									
	                    			// db에 추가 후 바로 해당 메일함 이름 수정가능하게 설정
			                        const mailBoxArr = $(".mailBoxName");
			                        const newMailBox = mailBoxArr.eq(mailBoxArr.length - 1);
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
                    					location.replace("list.ma");
                    				} else{
                    					alert("알 수 없는 이유로 삭제할 수 없습니다. 다시 시도해주세요.");
                    				}
                    				
                    			}, error:function(){
                    				console.log("메일함 삭제용 ajax 통신 실패");
                    			}
                    		})
                    	}
                    	
                    })
                    
                    
                    
                    
                    
                    
                    
                })
                
                // 새 메일함 이름 랜덤 생성 함수
                function generateRandomString(num){
                	
                	const characters = ["뻐꾸기", "딱따구리", "직박구리", "뜸부기", "지빠귀", "제비", "고니", "오목눈이", "오리", "두루미"];
                	const charlength = characters.length;
                
                	return characters[Math.floor(Math.random() * charlength)];
                	
                }
                
                
            </script>

            <div class="content">
            
            

    
</body>
</html>