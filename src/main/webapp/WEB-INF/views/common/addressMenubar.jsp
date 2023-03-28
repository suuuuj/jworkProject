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
    <!-- sweetalert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <style>
        /*sweetalert css*/
        .swal-button{
            background-color: rgb(172, 222, 172);
            font-size: 12px;
            text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
        }
        .swal-button:hover{
            background-color: rgb(206, 236, 206);
            font-size: 12px;
            text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
        }
        .swal-title { font-size: 20px;}

        .outer *{
            font-family: 'Nanum Gothic', sans-serif;
        }
        #addressHeader tr{height: 60px;}
        
        .outer{width: 1200px;}
        .content{
            width: 960px;
            /* padding: 20px; */
            padding: 0px;
        }
        
        .space{height: 15px;}
        .totalOuter{
            width:1200px;
            background-color: #fff;

        }

        .subMenubar{
            position: relative; float: left; box-sizing: border-box ;
            width:230px; height:100%;
            background-color: rgb(255, 255, 255);
            border-right: 1px rgba(46, 170, 46, 0.219) solid;   
        }
        #line{
            width: 10px; height: 1000px;
            background-color: rgb(217, 255, 227);
            border-left: 2px solid; border-right: 2px solid;
        }
        .content{
            width:960px; height:1000px;
            box-sizing: border-box ; float: left;
        }
        .outer>div{float: left;}
        
        * {padding: 0;margin: 0;box-sizing: border-box;}
   
        /* .common{
            width: 60px; height: 1000px;
            background-color: rgba(46, 170, 46, 0.219);
        } */
        .addressMenu{
            width: 230px;
            height: 1000px;
        }
        /* .subMenubar>div{
            float: left;
        }
        .subMenubarArea{
           margin-left: 8px; margin-right: 8px;     
        } */
        .menu{
           margin-top: 10px;
        }     
        .menuIcon{
            margin-right: 10px;
            width: 40px;
        }
        /* .menu-wrap{
           margin-left: 50px; display:none;
        } */
        .menuDetail a{
           margin-top:5px; padding:3px;
           text-decoration: none; color: black;
        }
        .menuDetail a:hover{
           text-decoration: none;
           color: black; background-color: rgb(130, 180, 130);
           cursor:pointer;
        }
        .subTitle{
            margin:40px 30px 15px 30px;
            font-size: 16px; font-weight: 600;
        }
        .enrollBtn{
            margin:15px 30px 15px 30px;
            font-size: 14px;
        }
        .addAddressBox{
            border: 0px;
            background-color: rgba(255, 255, 255, 0);
        }
        .oneAddressBox {
            font-size: 14px;
            width: 146px;
        }
        .oneAddressBox button{
            border: 0; background-color: white;
        }

        .allGroupName{
            width: 120px; font-size: 14px;
            margin-left: 40px; margin-bottom: 10px;
        }
        .addressGroupName {
            width: 120px; 
            margin-left: 40px; float: left;  
            overflow: hidden; text-overflow: ellipsis; white-space: nowrap; 
        }
        #dropdownMenu{
            float: right; margin-left: 30px;
        }
        .editAddressBox button{
            border: 0;
            background-color: white;
        }
        .hover {
            width: 230px;
            display: flex; margin-bottom: 10px;
        }
        #important {
            float: left; margin-top: 15px;
        }

        /*조직도*/
        #chart ul {
            margin-bottom: 12px;
        }
        .deptGroup {
            padding-left: 40px;
            list-style: none;
            font-size: 14px;
        }
        .deptGroup div:hover {
            cursor:pointer;
        }
        .deptGroup ul{
            list-style: none;
            padding-left: 40px;
            display: none; 
        }
        .deptGroup li {
            margin-bottom: -5px;
        }
        .teamGroup button{
            border: 0; 
            background-color: #ffffff00;
        }

        /*주소록 그룹 수정*/
        #modifyModal, #addModal {
            margin: 30px;
        }
        .modalTitle {
            text-align: center;
            margin-bottom: 15px;
            font-size: 18px; font-weight: 600;
        }
        #modifyModal input[type="text"], #addModal input[type="text"] {
            width: 180px; height: 30px;
            border-radius: 5px; border: 1px solid gainsboro;
            padding: 5px;
            font-size: 14px;
        }
        .modalSubTitle {
            font-size: 14px;
            padding-top: 10px; padding-left: 10px;
            height: 70px;
        }

        /*연락처 추가 모달*/
        .modal-dialog {
            width: 400px;
        }
        .addPerson {
            padding: 15px; font-size: 15px;
        }
        .addPerson th {
            width: 100px; height: 35px;
            font-weight: 500;
        }
        .addPerson input, .addPerson select {
            width: 200px; height: 35px; padding: 5px; font-size: 14px;
            margin: 5px;
            border-radius: 5px; border: 1px solid gainsboro;
        }
        .addPerson input[type=checkbox] { display:none; }
        .addPerson input[type=checkbox] + label { 
            display: inline-block; 
            cursor: pointer; 
            padding-left: 22px; margin-left: 5px;
            background: url('resources/images/common/star.png') left/15px no-repeat; 
        }
        .addPerson input[type=checkbox]:checked + label { 
            background-image: url('resources/images/common/fullstar.png'); 
        }

    </style>
</head>
<body>
	<c:if test="${not empty alertMsg }">
		<script>
			//alertify.alert('${alertMsg}');
            swal('${alertMsg}', '', 'success');
		</script>
		<c:remove var="alertMsg" scope="session"/>	
	</c:if>
    <div class="totalOuter">

        <div class="outer">

            <div class="subMenubar">
                <!-- <div class="common">

                    <div class="menubarArea">
                        
                    </div>
                </div> -->
                
                <div class="addressMenu">
                    <div class="subTitle">
                        주소록
                    </div>
                    <div class="enrollBtn">
                        <button id="enrollAddress" class="btn btn-outline-success btn-block" data-bs-toggle="modal" data-bs-target="#addPerson">연락처 추가</button>
                    </div>

                    <div class="subTitle" onclick="location.href='addressIn.emp'">
                        조직도
                    </div>
                    <div id="chart">
                        <!--반복문-->


                    </div>

                    <div class="subTitle">
                        개인 주소록 &nbsp;&nbsp; 
                        <span><button type="button" class="addAddressBox" data-bs-toggle="modal" data-bs-target="#addGroup"><img src="resources/images/common/plus1.png" width="13px"></button></span>
                    </div>
                    <div class="addressBox">
                        
                        <div class="allGroupName" onclick="location.href='addressOut.emp'">개인 주소록</div>

                        <!--반복문 돌리기-->
                        <div class="oneAddressBox">    
                            
                        </div>

                    </div>

                    
                    <div class="subTitle" id="important">
                        <span><img src="resources/images/common/fullstar.png" alt="" width="16px" style="margin-right: 10px; margin-top: -5px;"></span>
                        <span onclick="location.href='addressFav.emp'">중요</span>
                    </div>
                </div>
                
                

                <!-- 연락처 추가 모달 -->
                <div class="modal fade" id="addPerson" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="insertAddressOut.emp">
                            <div class="modal-body" id="employeeModal">             
                                <div class="addPerson">
                                    <table>
                                        <tr>
                                            <th>이름 <span><input type="checkbox" id="checkStar" name="checkStar" value="1"><label for="checkStar">&nbsp;</label></span></th>
                                            <td><input type="text" name="name" value=""></td>
                                        </tr>
                                        <tr>
                                            <th>회사</th>
                                            <td><input type="text" name="bizName" value=""></td>
                                        </tr>
                                        <tr>
                                            <th>부서</th>
                                            <td><input type="text" name="dept" value=""></td>
                                        </tr>
                                        <tr>
                                            <th>직급</th>
                                            <td><input type="text" name="job" value=""></td>
                                        </tr>
                                        <tr>
                                            <th>이메일</th>
                                            <td><input type="text" name="email" value=""></td>
                                        </tr>
                                        <tr>
                                            <th>전화번호</th>
                                            <td><input type="text" name="phone" value=""></td>
                                        </tr>
                                        <tr>
                                            <th>회사전화</th>
                                            <td><input type="text" name="bizPhone" value=""></td>
                                        </tr>
                                        <tr>
                                            <th>메모</th>
                                            <td><input type="text" name="memo" value=""></td>
                                        </tr>
                                        <tr>
                                            <th>그룹</th>
                                            <td>
                                                <select name="group" name="group" id="group">
                                                    <option value="0">선택안함</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                    
                                </div>
                                <div align="center">
                                    <button type="submit" class="btn btn-success btn-sm" style="width: 70px;">추가</button>&nbsp;&nbsp;
                                    <button type="button" class="btn btn-outline-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">닫기</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    </div>
                </div>
                


            </div>
            
            <script>

                // 조직도 부서
                $(function(){
                    chartList();
                    groupList();
                    
                })

                // 조직도 조회       
                function chartList(){
                    $.ajax({
                        url:"addressInChart.emp",
                        success:function(slist){
                            //console.log(slist);
                            let value = "";
                            for(let i=0; i<slist.length; i++){
                                value +=  '<ul>'
                                            + '<li class="deptGroup"><div class="deptTitle" >'+ slist[i].deptName +'</div>';

                                                for(let j=0; j<slist[i].teamList.length; j++){
                                                    value += '<ul>'
                                                                + '<li class="teamGroup">'
                                                                    + '<form action="addressInSearch.emp">'
                                                                        + '<div><button type=submit >' + slist[i].teamList[j].teamName + '</button></div>'
                                                                        + '<input type="hidden" name="condition" value="teamName">'
                                                                        + '<input type="hidden" name="keyword" id="team'+i+j+'" value="' + slist[i].teamList[j].teamName + '">'
                                                                    + '</form>'
                                                                + '</li>'
                                                            + '</ul>'             
                                                }         
                                        value += '</li>'
                                            + '</ul>';
                            }
                            $('#chart').append(value);
                            $(".deptTitle").click(function(){
                                $(this).nextAll().slideToggle();
                            })


                        }, error: function(){
                            console.log("주소록 그룹 조회 ajax 통신 실패");
                        }
                    })
                }
                
                $('.teamGroup').children().children().click(function(){      
                    console.log('dd')
                })

                // 주소록 그룹 조회       
                function groupList(){
                    $.ajax({
                        url:"selectAddressGroup.emp",
                        success:function(glist){
                            
                            let value = "";

                            for(let i=0; i<glist.length; i++){
                                //console.log(glist[i].groupName);
                                value += '<div class="hover">'
                                            + '<form action="addressOutSearch.emp">'
                                                + '<div class="addressGroupName" ><button type=submit>' + glist[i].groupName + '</button></div>'
                                                + '<input type="hidden" name="condition" value="groupName"><input type="hidden" name="keyword" value="' + glist[i].groupName + '">' 
                                                + '<span class="editAddressBox dropdown dropend">'
                                                        + '<button class="" id="dropdownMenu" data-bs-toggle="dropdown" aria-expanded="false" style="display:none">'
                                                            + '<img src="resources/images/mail/edit.png" width="20px">'
                                                        + '</button>'
                                                        + '<ul class="dropdown-menu" aria-labelledby="dropdownMenu">'
                                                            + '<li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#modifyGroup" style="font-size:14px" onclick="updateGroup(' + glist[i].groupNo + ')">그룹 수정</a></li>'
                                                            + '<li><a class="dropdown-item" href="" style="font-size:14px" onclick="deleteGroup(' + glist[i].groupNo + ')">그룹 삭제</a></li>'
                                                        + '</ul>'
                                                + '</span>'
                                            + '</form>'
                                    + '</div>'
                                $("#group").append(
                                    '<option id="' + glist[i].groupNo + '1' +'" value="'+ glist[i].groupNo +'">'+ glist[i].groupName +'</option>'
                                )
    
                            }
                            $(".oneAddressBox").append(value);
                            $('.hover').mouseover(function(){
                                $(this).children().children().next().next().children("button").show();
                            });
                            $('.hover').mouseout(function(){
                                $(this).children().children().next().next().children("button").hide();
                            });

                        }, error: function(){
                            console.log("주소록 그룹 조회 ajax 통신 실패");
                        }
                    })
                }
                
                


            </script>

            <!-- 그룹수정 모달 -->
            <div class="modal fade" id="modifyGroup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-body" id="modifyModal">
                        <div class="modalTitle">주소록 그룹 수정</div>
                        <hr>
                        <form action="updateAddGroupName.emp">
                            <input type="hidden" name="groupNo" value="">
                            <div class="modalSubTitle">
                                내 주소록 이름 &nbsp;&nbsp;&nbsp;
                                <input id="groupName" name="groupName" type="text" value="">
                            </div>
                            <div align="center">
                                <button type="submit" class="btn btn-success btn-sm" style="width: 70px;">수정</button>&nbsp;&nbsp;
                                <button type="button" class="btn btn-outline-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">취소</button>
                            </div>
                        </form>
                    </div>
                </div>
                </div>
            </div>

            <!-- 그룹추가 모달 -->
            <div class="modal fade" id="addGroup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-body" id="addModal">

                        <div class="modalTitle">주소록 그룹 추가</div>
                        <hr>
                        <form action="insertAddressGroup.emp">
                            <div class="modalSubTitle">
                                내 주소록 이름 &nbsp;&nbsp;&nbsp;
                                <input type="text" name="groupName" value="">
                            </div>
                            <div align="center">
                                <button type="submit" class="btn btn-success btn-sm" style="width: 70px;">추가</button>&nbsp;&nbsp;
                                <button type="button" class="btn btn-outline-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">취소</button>
                            </div>
                        </form>
                    </div>
                </div>
                </div>
            </div>


            <div id="line"></div>
            <div class="content">

            
            <script>
                // 주소록 그룹 수정
                function updateGroup(groupNo) {
                    $.ajax({
                        url:"selectAddGroupName.emp",
                        data:{groupNo:groupNo},
                        success:function(g){
                            $('#groupName').val(g.groupName);
                            $("input[name=groupNo]").val(groupNo);
                        }, error: function(){
                            console.log("그룹수정 ajax 통신실패")
                        }
                    })
                }

                // 주소록 그룹 삭제
                function deleteGroup(groupNo) {
                    $.ajax({
                        url:"deleteAddressGroup.emp",
                        data:{groupNo:groupNo},
                        success:function(result){           
                            if(result == "success"){
                                //swal('삭제완', '', 'success');
                                alert("삭제완"); 
                                document.location.href = document.location.href;      
                            }
                            console.log(result);
                        }, error: function(){
                            console.log("그룹삭제 ajax 통신실패")
                        } 
                    })

                }

                

               

            </script>
    
</body>
</html>