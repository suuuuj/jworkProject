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
        #addressHeader tr{height: 60px;}
        
        .outer{
            width: 1200px;
        }
        .content{
            width: 960px;
            /* padding: 20px; */
            padding: 0px;
        }
        
        .space{
            height: 15px;
        }
        .totalOuter{
            width:1200px;
            background-color: #fff;

        }

        .subMenubar{
            position: relative;
            width:230px;
            height:100%;
            box-sizing: border-box ;
            float: left;
            background-color: rgb(255, 255, 255);
            border-right: 1px rgba(46, 170, 46, 0.219) solid;
            
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
        .common{
            width: 60px;
            height: 1000px;
            background-color: rgba(46, 170, 46, 0.219);
  
        }
        .addressMenu{
            /* width: 180px; */
            height: 1000px;
        }
        .subMenubar>div{
            float: left;
        }
        .subMenubarArea{
           margin-left: 8px;
           margin-right: 8px;     
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
        .subTitle{
            margin: 15px;
            margin-top: 40px;
            font-size: 18px;
            font-weight: 0600;
        }
        .enrollBtn{
            margin: 15px;
        }
        .addressBox{margin: 10px;}
        .mainAddressBox .btn-block{
            text-align: left;
        }
        .myAddressBox{margin:10px}
        .addAddressBox{
            color: gray;
            font-size: 14px;
            padding: 10px;
        }
        .editAddressBox {
            float: right;
        }
        .editAddressBox button {
            border: 0px;   
        }
        .oneAddressBox{
            margin-top: 10px; 
            font-size: 14px;
        }
        .addressGroupName{
            width: 120px;
            border: none;
            padding-left: 30px;
        }
        .addressGroupName:focus{
            outline: 1px solid green;
            border-radius: 5px;
            background-color: rgba(246, 246, 246, 0.712);
        }

        /*조직도*/
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

        /*내 일정 수정*/
        #modifyModal, #addModal {
            margin: 30px;
        }
        .modalTitle {
            text-align: center;
            margin-bottom: 15px;
            font-size: 18px;
            font-weight: 600;
        }
        #modifyModal input[type="text"], #addModal input[type="text"] {
            width: 250px;
            height: 30px;
            border-radius: 3px;
            border: 1px solid gainsboro;
            padding: 10px;
        }
        #modifyModal input[type="radio"], #addModal input[type="radio"] {
            width: 1rem;
            height: 1rem;
            border-radius: 50%;
            border: 1px solid gainsboro;
            appearance: none;
            cursor: pointer;
            transition: background 0.2s;
        }
        #modifyModal input[type="radio"]:checked, #addModal input[type="radio"]:checked {
            box-shadow: 0 0 0 max(2px, 0.2em) rgb(244, 235, 235) !important;					/*ridge : 테두리가 튀어나온 것처럼 표시*/
        }
        #modifyModal input[type="radio"]:hover, #addModal input[type="radio"]:hover {
            box-shadow: 0 0 0 max(2px, 0.2em) rgb(244, 235, 235);
            cursor: pointer;
        }

        .modalSubTitle1, .modalSubTitle2 {
            font-size: 14px;
            padding-top: 10px;
            padding-left: 10px;
            height: 50px;
        }

        /*연락처 추가 모달*/
        .modal-dialog {
            width: 400px;
        }
        .addPerson {
            padding: 15px;
        }
        .addPerson th {
            width: 100px; height: 35px;
            font-weight: 500;
        }
        .addPerson input, .addPerson select {
            width: 200px; height: 35px;
            margin: 5px;
            border-radius: 5px; border: 1px solid gainsboro;
        }

    </style>
</head>
<body>
	
    <div class="totalOuter">

        <div class="outer">

            <div class="subMenubar">
                <div class="common">

                    <div class="menubarArea">
                        
                    </div>
                </div>
                
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
                    <div>
                        <!--반복문-->
                        <ul>
                            <li class="deptGroup"><div class="deptTitle">인사부</div>
                                <ul>
                                    <li class="teamGroup">
                                        <div>인사1팀</div>
                                        <input type="hidden" name="teamTitle" value="">
                                    </li>
                                    <li class="teamGroup"><div>인사2팀</div></li>
                                </ul>
                            </li>
                        </ul>
                        <ul>
                            <li class="deptGroup"><div class="deptTitle">총무부</div>
                                <ul>
                                    <li class="teamGroup"><div>총무1팀</div></li>
                                    <li class="teamGroup"><div>총무2팀</div></li>
                                </ul>
                            </li>
                        </ul>

                    </div>

                    <div class="subTitle">
                        개인 주소록
                    </div>
                    <div class="addressBox">
                        <div class="oneAddressBox">
                            <div class="addressGroupName" onclick="location.href='addressOut.emp'">개인 주소록</div>
                        </div>
                        <div class="addAddressBox btn btn-sm" >+ 그룹 추가</div>
                    </div>

                    <div class="subTitle">
                        <span><img src="resources/images/common/fullstar.png" alt="" width="16px" style="margin-right: 10px; margin-top: -5px;"></span>
                        <span onclick="location.href='addressFav.emp'">중요</span>
                    </div>
                </div>
                
                

                <!-- 그룹수정 모달 -->
                <div class="modal fade" id="modifyGroup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog ">
                    <div class="modal-content">
                        <div class="modal-body" id="modifyModal">

                            <div class="modalTitle">캘린더 그룹 수정</div>
                            <hr>
                            <div class="modalSubTitle1">
                                내 캘린더 이름 &nbsp;&nbsp;&nbsp;
                                <input type="text" value="내 일정">
                            </div>
                            <div class="modalSubTitle2">
                                내 캘린더 색상 &nbsp;&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(255, 91, 91);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(255, 191, 122);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(255, 255, 125);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(39, 174, 96);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(160, 251, 239);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(112, 213, 241);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(84, 161, 220);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(193, 178, 249);" checked>&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(240, 182, 216);">&nbsp;&nbsp;
                            </div>
                            <div align="center">
                                <button type="submit" class="btn btn-success btn-sm" style="width: 70px;">수정</button>&nbsp;&nbsp;
                                <button type="button" class="btn btn-outline-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>

                <!-- 그룹추가 모달 -->
                <div class="modal fade" id="addGroup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog ">
                    <div class="modal-content">
                        <div class="modal-body" id="addModal">

                            <div class="modalTitle">캘린더 그룹 추가</div>
                            <hr>
                            <div class="modalSubTitle1">
                                내 캘린더 이름 &nbsp;&nbsp;&nbsp;
                                <input type="text">
                            </div>
                            <div class="modalSubTitle2">
                                내 캘린더 색상 &nbsp;&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(255, 91, 91);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(255, 191, 122);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(255, 255, 125);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(39, 174, 96);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(160, 251, 239);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(112, 213, 241);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(84, 161, 220);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(193, 178, 249);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(240, 182, 216);">&nbsp;&nbsp;
                            </div>
                            <div align="center">
                                <button type="submit" class="btn btn-success btn-sm" style="width: 70px;">추가</button>&nbsp;&nbsp;
                                <button type="button" class="btn btn-outline-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>


                <!-- 연락처 추가 모달 -->
                <div class="modal fade" id="addPerson" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body" id="employeeModal">             
                            <div class="addPerson">
                                <table>
                                    <tr>
                                        <th>이름 <span><img src="resources/images/common/star.png" alt="" width="15px" style="margin-left: 5px;"></span></th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>회사</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>부서</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>직위</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>전화번호</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>회사전화</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>메모</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>그룹</th>
                                        <td>
                                            <select name="" id="">
                                                <option value="">선택안함</option>
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
                    </div>
                    </div>
                </div>
                


            </div>
            
            <script>
                $(function(){
                    //그룹 수정 버튼 클릭 시
                    $(document).on("click", ".addressAddressBox", function(){
                        $(this).prev().attr("readonly", false);
                        $(this).prev().select();
                    })

                    //그룹 input box 에서 포커스 아웃될 때
                    $(document).on("focusout", ".addressGroupName", function(){
                        $(this).attr("readonly", true);
                        $(this).attr("border", "none");
                    })

                    //그룹 추가하기 클릭 시
                    $(".addAddressBox").on("click", function(){
                        const AddressBoxInput = "<div class='oneAddressBox'><input type='text' class='addressGroupName' value='새 메일함' readonly><span class='editAddressBox'><img class='menuIcon' src='resources/images/mail/edit.png'/></span>";
                        $(".myAddressBox").append(addressBoxInput);
                        const addressBoxArr = $(".addressGroupName");
                        const newAddressBox = addressBoxArr.eq(addressBoxArr.length - 1);
                        newAddressBox.next().click();
                    })
                

                })

                // 조직도 부서
                $(function(){
                    $(".deptTitle").click(function(){
                        $(this).next().slideToggle();
                    })  
                })
                

            </script>

            <div id="line"></div>
            <div class="content">
            
            

    
</body>
</html>