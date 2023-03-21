<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .content{
        margin: auto; 
        padding:4%;
    }
	.innerOuter{
        width: 900px;
        margin: 5%;
    }
    .allAdressList{
        margin-right: 20px;
    }
    /**/
    .favTitle {
        font-size: 16px;
        margin-top: 15px; margin-bottom: 15px;
        
    }
    /*표*/
    #list-area-in, #list-area-out{
        text-align: center;
        line-height: 25px;
        color: rgb(75, 75, 75);
        font-size: 14px;
    }
    /*사내주소록 모달*/
    #employeeModal, #personModal {
        margin: 15px;
    }
    .infoTitle {
        display: flex;
        align-items: center;
        margin: 0 15px;
        padding: 15px 0;
    }
    #left img {
        width:70px; height:70px; border:0.5px solid lightgray; border-radius: 50%;
    }
    #left{width: 90px;}
    #name{
        font-size: 25px !important;
        font-weight: bold;
    }
    #right img{
        width: 20px;
        margin-top: -7px;
    }
    .infoDetail {
        margin: 0 15px;
        padding: 15px 0;
    }
    .infoDetail th {
        width: 100px;
        height: 35px;
        font-weight: 500;
    }
    /*개인주소록 모달*/
    #selectPerson .infoDetail th {
        width: 85px; height: 40px;
        font-weight: 500; font-size: 15px;
    }
    .infoTitle input, .infoDetail input, .infoDetail select, .infoDetail textarea {
        border-radius: 5px; border: 1px solid rgb(241, 241, 241);
        padding: 5px;
        font-size: 14px;
    }
    .infoTitle input {
        width: 100px;
    }
    .infoDetail input, .infoDetail select {
        width: 200px; height: 35px;
    }
    .infoDetail textarea {
        resize: none; padding: 10px;
        width: 200px;
    }

    .pagination a {
        color: rgb(40, 40, 40); border: 0;
    }
    .pagination a:hover:not(.active) {background-color: rgb(238, 247, 227);}
    .page-link{
        font-size: 14px;
    }
</style>
</head>
<body>
    <jsp:include page="../common/sideMenubar.jsp"/>
	<jsp:include page="../common/addressMenubar.jsp"/>

        <div class="innerOuter">
            <h4 style="display: inline-block;" style="float: left;" ><b>중요</b></h4>
            <br><br>

            <div class="allAdressList">
                <div class="favTitle">
                    사내 주소록
                </div>
                <table id="list-area-in" class="table table-sm">
                    <thead>
                        <tr>
                            <th></th>
                            <th>사번</th>
                            <th>이름</th>
                            <th>부서</th>
                            <th>직위</th>
                            <th>이메일</th>
                            <th>휴대폰</th>
                            <th>내선번호</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                <br>
                <div id="ipagingArea" align="center">
                    <ul class="pagination justify-content-center ipagination">
                    
                    </ul>
                </div>

                <br>
                <div class="favTitle">
                    개인 주소록
                </div>
                <table id="list-area-out" class="table table-sm">
                    <thead>
                        <tr>
                            <th></th>
                            <th>이름</th>
                            <th>회사</th>
                            <th>부서</th>
                            <th>직급</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                <br>
                <div id="opagingArea">
                    <ul class="pagination justify-content-center opagination">
                    
                    </ul>
                </div>
        
                <br>
        
            </div>

        </div>
    
        <script>
            $(function(){
                addressInList(1);
                addressOutList(1);
            })

            // 사내 주소록 리스트
            function addressInList(page){
                $.ajax({
                    url:"favAddressInList.emp",
                    type:"post",
	            	datatype:"json",
                    async: false,
                    data:{ipage : page},
                    success:function(imap){
                        let value = "";
                        for(let i=0; i<imap.iList.length; i++){
                            value += '<tr>'
                                        + '<td>'
                                            + '<img class="like listFullStar" src="resources/images/common/fullstar.png" alt="" width="15px" onclick="deleteFavIn('+ imap.iList[i].empNo+')">'
                                        + '</td>'
                                        + '<td>' + imap.iList[i].empNo + '</td>'
                                        + '<td data-bs-toggle="modal" data-bs-target="#selectEmployee" onclick="viewDetailIn(' + imap.iList[i].empNo + ');">' + imap.iList[i].empName + '</td>'
                                        + '<td>' + imap.iList[i].deptName + ' - ' + imap.iList[i].teamName + '</td>'
                                        + '<td>' + imap.iList[i].jobName + '</td>'
                                        + '<td>' + imap.iList[i].email + '</td>'
                                        + '<td id="empPhone">' + imap.iList[i].phone + '</td>'
                                        + '<td>' + imap.iList[i].empPhone + '</td>'
                                   + '</tr>';

                            $("#list-area-in tbody").html(value);
                            
    
                        }   

                        // 페이징바 만들때 해당 페이지숫자 클릭시 => addressInList(클릭한숫자);
                        let page = "";
                        if(imap.iPi.currentPage == 1){
                            page += "<li class='page-item' disabled><a class='page-link' href='#'><</a></li>"
                        }else{
                            page += "<li class='page-item'><a class='page-link' onclick='addressInList(" + (imap.iPi.currentPage-1) + ");'><</a></li>"
                        }
                        
                        for(var i=imap.iPi.startPage; i<=imap.iPi.endPage; i++){
                        
                            page += "<li class='page-item'><a class='page-link' onclick='addressInList(" + i + ");'>" + i + "</a></li>"
                        }
                        
                        if(imap.iPi.currentPage == imap.iPi.maxPage){
                            page += "<li class='page-item' disabled><a class='page-link' href='#'>></a></li>"
                        }else{
                            page += "<li class='page-item'><a class='page-link' onclick='addressInList(" + (imap.iPi.currentPage+1) + ");'>></a></li>"
                        }
                        
                        $(".ipagination").html(page);

                    }, error:function(){
                        console.log("즐겨찾기 사내 주소록 ajax 통신실패");
                    }
                })
            }

            // 개인 주소록 리스트
            function addressOutList(page){
                $.ajax({
                    url:"favAddressOutList.emp",
                    type:"POST",
	            	dataType:"json",
                    data:{ipage : page},
                    success:function(omap){
                        let value = "";
                        for(let i=0; i<omap.oList.length; i++){
                            value += '<tr>' 
                                        + '<td>'
                                            + '<img class="like listFullStar" src="resources/images/common/fullstar.png" alt="" width="15px" onclick="deleteFavOut('+ omap.oList[i].addoutNo +')">'
                                        + '</td>'
                                        + '<td data-bs-toggle="modal" data-bs-target="#selectPerson" onclick="viewDetailOut(' + omap.oList[i].addoutNo + ');">' + omap.oList[i].name + '</td>'
                                        + '<td>' + omap.oList[i].bizName + '</td>'
                                        + '<td>' + omap.oList[i].dept + '</td>'
                                        + '<td>' + omap.oList[i].job + '</td>'
                                        + '<td>' + omap.oList[i].email + '</td>'
                                        + '<td>' + omap.oList[i].phone + '</td>'
                                   + '</tr>';
                            $("#list-area-out tbody").html(value);
                        }   

                        // 페이징바 만들때 해당 페이지숫자 클릭시 => addressInList(클릭한숫자);
                        let page = "";
                        if(omap.oPi.currentPage == 1){
                            page += "<li class='page-item' disabled><a class='page-link' href='#'><</a></li>"
                        }else{
                            page += "<li class='page-item'><a class='page-link' onclick='addressOutList(" + (omap.oPi.currentPage-1) + ");'><</a></li>"
                        }
                        
                        for(var o=omap.oPi.startPage; o<=omap.oPi.endPage; o++){
                        
                            page += "<li class='page-item'><a class='page-link' onclick='addressOutList(" + o + ");'>" + o + "</a></li>"
                        }
                        
                        if(omap.oPi.currentPage == omap.oPi.maxPage){
                            page += "<li class='page-item' disabled><a class='page-link' href='#'>></a></li>"
                        }else{
                            page += "<li class='page-item'><a class='page-link' onclick='addressOutList(" + (omap.oPi.currentPage+1) + ");'>></a></li>"
                        }
                        
                        $(".opagination").html(page);

                    }, error:function(){
                        console.log("즐겨찾기 사내 주소록 ajax 통신실패");
                    }
                })
            }

        </script>

        <!-- 사내 주소록 상세 조회 모달 -->
        <div class="modal fade" id="selectEmployee" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-body" id="employeeModal">             
                    <div class="infoTitle">
                        <div id="left"><img class="profileImg" id="profile" src="" /></div>
                        <div id="right">
                            <span id="empName"></span>&nbsp;
                            <span id="empFav"></span>
                        </div>
                    </div>
                    <div class="infoDetail">
                        <table>
                            <tr>
                                <th>사번</th>
                                <td id="empNo"></td>
                            </tr>
                            <tr>
                                <th>부서</th>
                                <td>
                                    <span id="deptName"></span> - <span id="teamName"></span>
                                </td>
                            </tr>
                            <tr>
                                <th>직급</th>
                                <td id="jobName"></td>
                            </tr>
                        </table>
                        <hr>
                        <table>
                            <tr>
                                <th>이메일</th>
                                <td id="email"></td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td id="phone"></td>
                            </tr>
                            <tr>
                                <th>내선번호</th>
                                <td id="empPhone"></td>
                            </tr>
                        </table>
                        <hr>
                        <table>
                            <tr>
                                <th>담당업무</th>
                                <td id="task"></td>
                            </tr>
                        </table>
                    </div>
                    <div align="center">
                        <button type="button" class="btn btn-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
            </div>
        </div>

        <script>
            // 사내 주소록 상세 조회 모달
            function viewDetailIn(empNo) {
                $.ajax({
                    url:"selectAdressEmployee.emp",
                    data:{empNo:empNo},
                    success: function(e){
                        $('#empNo').text(e.empNo);
                        $('#empName').text(e.empName);
                        $('#deptName').text(e.deptName);
                        $('#teamName').text(e.teamName);
                        $('#jobName').text(e.jobName);
                        $('#email').text(e.email);
                        $('#phone').text(e.phone);
                        $('#empPhone').text(e.empPhone);
                        $('#task').text(e.task);
                        if(e.empFav == 1){
                            const star = '<img class="like listFullStar" src="resources/images/common/fullstar.png" alt="">'
                                        + '<input type="hidden" value="'+ e.empNo+ '">'
                            $('#empFav').html(star);
                        }else{
                            const star = '<img class="like listStar" src="resources/images/common/star.png" alt="">'
                                        + '<input type="hidden" value="' + e.empNo+ '">'
                            $('#empFav').html(star);
       
                        };
                        if(e.profileUrl != null){
                            $('#profile').attr('src', e.profileUrl)
                        }else{
                            $('#profile').attr('src', 'resources/images/common/profileDefault3.png')
                        }

                    }, error: function(){
                        console.log("사원상세조회 ajax 통신실패")
                    }, complete: function(){
                        console.log("사원상세조회 ajax 통신완료")
                    }
                })
		    }

            // 사내 주소록 즐겨찾기 해제
            function deleteFavIn(empNo){
                $.ajax({
                    url:"deleteAddressFav.emp",
                    data:{empNo:empNo},
                    success: function(result){
                        console.log("즐겨찾기 ajax 통신성공");
                        document.location.href = document.location.href;
                    }, error: function(){
                        console.log("즐겨찾기 ajax 통신실패");
                    }
                })
            }

        </script>

        <!-- 개인 주소록 상세 조회 수정 모달 -->
        <div class="modal fade" id="selectPerson" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
            <div class="modal-content">
                <form action="updateAddressOut.emp" method="post">
                    <input type="hidden" name="addoutNo" value="">
                    <div class="modal-body" id="personModal">             
                        <div class="infoTitle">
                            <div id="right">
                                <span><input id="name" name="name" type="text" value="" placeholder=""></span>&nbsp;
                                <span id="addoutFav"><img src="resources/images/common/star.png" alt=""></span>
                            </div>
                        </div>
                        <div class="infoDetail">
                            <table>
                                <tr>
                                    <th>회사</th>
                                    <td><input id="bizName" name="bizName" type="text" value="" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th>부서</th>
                                    <td><input id="dept" name="dept" type="text" value="" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th>직급</th>
                                    <td><input id="job" name="job" type="text" value="" placeholder=""></td>
                                </tr>
                            </table>
                            <hr>
                            <table>
                                <tr>
                                    <th>이메일</th>
                                    <td><input id="outEmail" name="email" type="text" value="" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th>전화번호</th>
                                    <td><input id="outPhone" name="phone" type="text" value="" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th>회사전화</th>
                                    <td><input id="bizPhone" name="bizPhone" type="text" value="" placeholder=""></td>
                                </tr>
                            </table>
                            <hr>
                            <table>
                                <tr>
                                    <th>그룹</th>
                                    <td>
                                        <select id="groupNo" name="groupNo" style="height: 30px;">
                                            <option value="0">선택안함</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr  style="vertical-align:top">
                                    <th>메모</th>
                                    <td><textarea id="memo" name="memo" ></textarea></td>
                                </tr>
                            </table>
                        </div>
                        <div align="center">
                            <button type="submit" class="btn btn-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">수정</button>&nbsp;
                            <button type="button" class="btn btn-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">삭제</button>&nbsp;
                            <button type="button" onclick="location.href='addressFav.emp'" class="btn btn-outline-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </form>
            </div>
            </div>
        </div>

        <script>
            // 개인 주소록 상세 조회 모달
            function viewDetailOut(addoutNo) {
                $.ajax({
                    url:"selectAdressOut.emp",
                    data:{addoutNo:addoutNo},
                    success: function(o){
                        $('#name').val(o.out.name);
                        $('#bizName').val(o.out.bizName);
                        $('#dept').val(o.out.dept);
                        $('#job').val(o.out.job);
                        $('#outEmail').val(o.out.email);
                        $('#outPhone').val(o.out.phone);
                        $('#bizPhone').val(o.out.bizPhone);
                        $('#memo').val(o.out.memo);
                        if(o.out.addoutFav == 1){
                            const star = '<img class="like listFullStar" src="resources/images/common/fullstar.png" alt="">'
                                        + '<input type="hidden" value="'+ o.out.addoutNo + '">'
                            $('#addoutFav').html(star);
                        }else{
                            const star = '<img class="like listStar" src="resources/images/common/star.png" alt="">'
                                        + '<input type="hidden" value="' + o.out.addoutNo + '">'
                            $('#addoutFav').html(star);
                        };
                        
                        for(let i=0; i<o.glist.length; i++){
                            $("#groupNo").append(
                                '<option id="' + o.glist[i].groupNo + '" value="'+ o.glist[i].groupNo +'">'+ o.glist[i].groupName +'</option>'
                            )
                            if(o.glist[i].groupNo==o.out.groupNo){
                                $('#' + o.glist[i].groupNo).attr('selected', true);
                            }
                        }


                        $("input[name=addoutNo]").val(addoutNo);
                    }, error: function(){
                        console.log("사원상세조회 ajax 통신실패")
                    }
                })
		    }
            
            // 개인주소록 리스트 즐겨찾기 해제
            function deleteFavOut(addoutNo){
                $.ajax({
                    url:"deleteAddressOutFav.emp",
                    data:{addoutNo:addoutNo},
                    success: function(result){
                        console.log("즐겨찾기 ajax 통신성공");
                        document.location.href = document.location.href;
                    }, error: function(){
                        console.log("즐겨찾기 ajax 통신실패");
                    }
                })
            }

        </script>


        


</body>
</html>