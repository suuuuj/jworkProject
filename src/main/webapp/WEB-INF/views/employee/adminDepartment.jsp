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
    
    #department, #team, #job {
        border: 1px solid gainsboro;
        margin: 10px; padding: 20px; float: left;
        height: 660px; width: 260px; font-size: 14px;
    }
    .subTitle{
        margin-top: 20px; text-align: center;
        font-size: 17px; color: rgb(243, 115, 83);
    }
    .underLine{
        text-decoration-line:underline; text-decoration-style: wavy; text-decoration-color:rgb(175, 172, 224); 
        text-align: center; display: block; margin-top: -15px; height: 50px;
    }
    table {
        text-align: center;
    }
    table tr{color: rgb(70, 70, 70);}
    #department img{
        display: none; position: absolute; left:500px;
    }
    #team img{
        display: none; position: absolute; left:780px;
    }
    #job img{
        display: none; position: absolute; left: 1060px;
    }

    /*추가 모달*/
    .modal-body {
        margin: 30px; font-size: 15px;
    }
    .modalTitle {
        text-align: center; margin-bottom: 15px;
        font-size: 18px; font-weight: 600;
    }
    .modalSubTitle {
        text-align: center; height: 50px; padding-right: 20px;
    }
    input[type=text], select {
        width: 250px; height: 30px; font-size: 14px;
        border-radius: 3px; border: 1px solid gainsboro;
        padding: 10px; float: right;
    }
    select { padding: 5px;}
    .btnArea {
        margin-left: 33%;
    }

    
    
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	

        <h4 style="display: inline-block;" style="float: left;" ><b>부서 관리</b></h4>
        <br><br>

 
        <div id="department">
            <div class="subTitle">부서 관리</div>
            <div class="underLine" data-bs-toggle="modal" data-bs-target="#addDept">　　　　　　</div>
            <table class="table" >               
                <tbody id="deptTable">

                </tbody>
            </table>

        </div>

        <div id="team">
            <div class="subTitle">팀 관리</div>
            <div class="underLine" data-bs-toggle="modal" data-bs-target="#addTeam">　　　　　　</div>
            <table class="table" id="">
                <tbody id="teamTable">
                    
                </tbody>
            </table>
        </div>

        <div id="job">
            <div class="subTitle">직급 관리</div>
            <div class="underLine" data-bs-toggle="modal" data-bs-target="#addJob">　　　　　　</div>
            <table class="table" id="">

                <tbody id="jobTable">
                    
                </tbody>
            </table>

        </div>


        <script>
            $(function(){
                deptList();
                teamList();
                jobList();
            })

            // 부서 조회
            function deptList(){
                $.ajax({
                    url:"selectDept.ad",
                    success:function(deptList){
                        let value = "";
                        for(let i=0; i<deptList.length; i++){
                            value += '<tr>'
                                        + '<td>'
                                            + '<span>' + deptList[i].deptName + '</span>'
                                            + '<img src="resources/images/employee/delete1.png" width="20px" onclick="deleteDept(' + deptList[i].deptCode + ')">'
                                        + '</td>'
                                   + '</tr>';
                            $("#dept").append(
                                '<option id="' + deptList[i].deptCode + '1' +'" value="'+ deptList[i].deptCode +'">'+ deptList[i].deptName +'</option>'
                            )

                        }
                        $("#deptTable").append(value);
                        $('table td').mouseover(function(){
                            $(this).children().next().show();
                        });
                        $('table td').mouseout(function(){
                            $(this).children().next().hide();
                        });        
                    }
                })
            }

            // 부서 삭제
            function deleteDept(deptCode){
                if(confirm("부서를 삭제하시겠습니까?")){
                    $.ajax({
                        url:"deleteDept.ad",
                        data:{deptCode:deptCode},
                        success:function(result){           
                            if(result == "success"){
                                //swal('삭제완', '', 'success');
                                alert("삭제완");
                                document.location.href = document.location.href;
                            }
                        }, error: function(){
                            console.log("그룹삭제 ajax 통신실패")
                        } 
                    })
                }
            }

            // 팀 조회
            function teamList(){
                $.ajax({
                    url:"selectTeam.ad",
                    success:function(teamList){
                        let value = "";
                        for(let i=0; i<teamList.length; i++){
                            value += '<tr>'
                                        + '<td>'
                                            + '<span>' + teamList[i].teamName + '</span>'
                                            + '<img src="resources/images/employee/delete1.png" width="20px" onclick="deleteTeam(' + teamList[i].teamCode + ')">'
                                        + '</td>'
                                   + '</tr>';

                        }
                        $("#teamTable").append(value);
                        $('table td').mouseover(function(){
                            $(this).children().next().show();
                        });
                        $('table td').mouseout(function(){
                            $(this).children().next().hide();
                        });        
                    }
                })
            }

            // 팀 삭제
            function deleteTeam(teamCode){
                if(confirm("팀을 삭제하시겠습니까?")){
                    $.ajax({
                        url:"deleteTeam.ad",
                        data:{teamCode:teamCode},
                        success:function(result){           
                            if(result == "success"){
                                //swal('삭제완', '', 'success');
                                alert("삭제완");
                                document.location.href = document.location.href;
                            }
                        }, error: function(){
                            console.log("그룹삭제 ajax 통신실패")
                        } 
                    })
                }
            }

            // 직급 조회
            function jobList(){
                $.ajax({
                    url:"selectJob.ad",
                    success:function(jobList){
                        let value = "";
                        for(let i=0; i<jobList.length; i++){
                            value += '<tr>'
                                        + '<td>'
                                            + '<span>' + jobList[i].jobName + '</span>'
                                            + '<img src="resources/images/employee/delete1.png" width="20px" onclick="deleteJob(' + jobList[i].jobCode + ')">'
                                        + '</td>'
                                   + '</tr>';

                        }
                        $("#jobTable").append(value);
                        $('table td').mouseover(function(){
                            $(this).children().next().show();
                        });
                        $('table td').mouseout(function(){
                            $(this).children().next().hide();
                        });        
                    }
                })
            }

            // 직급 삭제
            function deleteJob(jobCode){
                if(confirm("직급을 삭제하시겠습니까?")){
                    $.ajax({
                        url:"deleteJob.ad",
                        data:{jobCode:jobCode},
                        success:function(result){           
                            if(result == "success"){
                                //swal('삭제완', '', 'success');
                                alert("삭제완");
                                document.location.href = document.location.href;
                            }
                        }, error: function(){
                            console.log("그룹삭제 ajax 통신실패")
                        } 
                    })
                }
            }





        </script>
    
        <!-- 부서추가 모달 -->
        <div class="modal fade" id="addDept" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-body" id="addModal">
                    <div class="modalTitle">부서 추가</div>
                    <hr><br>
                    <div style="padding-right: 25px;">
                        <form action="insertDept.ad">
                            <div class="modalSubTitle">
                                부서명 &nbsp;&nbsp;&nbsp;
                                <input type="text" name="deptName" value="">
                            </div>
                            <br>
                            <div class="btnArea">
                                <button type="submit" class="btn btn-success btn-sm" style="width: 70px;">추가</button>&nbsp;&nbsp;
                                <button type="button" class="btn btn-outline-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">취소</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            </div>
        </div>

        <!-- 팀추가 모달 -->
        <div class="modal fade" id="addTeam" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-body" id="addModal">
                    <div class="modalTitle">팀 추가</div>
                    <hr><br>
                    <div style="padding-right: 25px;">
                        <form action="insertTeam.ad">
                            <div class="modalSubTitle">
                                <span width="50px">팀명</span> 
                                <input type="text" name="teamName" value="">
                            </div>
                            <div class="modalSubTitle">
                                <span>부서명</span>
                                <select name="deptCode" id="dept">
                                    
                                </select>
                            </div>
                            <br>
                            <div class="btnArea">
                                <button type="submit" class="btn btn-success btn-sm" style="width: 70px;">추가</button>&nbsp;&nbsp;
                                <button type="button" class="btn btn-outline-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">취소</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            </div>
        </div>

        <!-- 직급추가 모달 -->
        <div class="modal fade" id="addJob" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-body" id="addModal">
                    <div class="modalTitle">직급 추가</div>
                    <hr><br>
                    <div style="padding-right: 25px;">
                        <form action="insertJob.ad">
                            <div class="modalSubTitle">
                                직급명 &nbsp;&nbsp;&nbsp;
                                <input type="text" name="jobName" value="">
                            </div>
                            <br>
                            <div class="btnArea">
                                <button type="submit" class="btn btn-success btn-sm" style="width: 70px;">추가</button>&nbsp;&nbsp;
                                <button type="button" class="btn btn-outline-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">취소</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            </div>
        </div>
    

</body>
</html>