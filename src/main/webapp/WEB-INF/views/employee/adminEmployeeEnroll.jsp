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
    .enroll-area{
        border: 1px solid gainsboro;
        margin: 10px; padding: 20px;
        height: 715px; font-size: 14px;
    }
    /*왼쪽프로필*/
    .profileImg-pwd{
        float: left; margin: 20px;
    }
    #profileImg{
		width:150px; height:150px;
        border:1px solid gainsboro; border-radius: 50%;
	}
    /*오른쪽프로필*/
    .profile-detail{
        float: left;
    }
    .basic-info, .detail-info{
        border: solid 1px gainsboro;
        margin: 10px; padding: 20px;
        width: 590px;
    }
    #basic th{
        width: 150px; height: 40px; padding-left: 15px;
        font-weight: 500;     
    }
    #detail th{
        height: 40px;
        font-weight: 500; padding-left: 14px; padding-right: 25px;
    }
    #basic input, #basic select, #detail input, #detail select {
        height: 30px;
        border: 1px solid gainsboro; border-radius: 5px; padding: 5px; margin-right: 20px;
    }
    #basic input, #basic select { width: 300px }
    #detail input, #detail select {
        width: 160px; 
    }
    #detail textarea {
        resize: none; width: 433px; font-size: 14px;
    }
    /*저장취소버튼*/
    .btns{
        padding-left: 150px;
    }

    #updatePwdForm input{
        width: 200px; height: 30px;
    }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	

        <h4 style="display: inline-block;" style="float: left;" ><b>사원 등록</b></h4>
        <br><br>

        <div class="enroll-area">
            <form action="insertEmployee.ad" method="post" enctype="multipart/form-data">
                <div class="profileImg-pwd">
                    <div>
                        <img id="profileImg" src="<c:out value='${ e.profileUrl }' default='resources/images/common/profileDefault3.png' />" onclick="$('#profileImgFile').click();">
                        <input type="file" name="upfile" id="profileImgFile" style="display:none;" value="">
                    </div>
                    <br>
                </div>

                <script>
                    $(function(){
                        $("#profileImgFile").on("change", function(event) {
                            var file = event.target.files[0];

                            var reader = new FileReader(); 
                            reader.onload = function(e) {
                                $("#profileImg").attr("src", e.target.result);
                            }
                            reader.readAsDataURL(file);
                        });           
                    })
                </script>
                
                <div class="profile-detail">
                    
                    <div class="basic-info">
                        <h6>기본 정보</h6>
                        <hr>
                        <table id="basic">
                            <tr>
                                <th>이름</th>
                                <td><input type="text" name="empName" required></td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td><input type="text" name="empPwd" required></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input type="text" class="form-control" id="email" name="email" value=""></td>
                            </tr>
                        </table>
                    </div>
                    <br>
                    <div class="detail-info">
                        <h6>상세 정보</h6>
                        <hr>
                        <table id="detail">
                            <tr>
                                <th>부서</th>
                                <td>
                                    <select name="deptCode" id="dept">
                                        <option value="0">부서없음</option>
                                    </select>
                                </td>
                                <th>팀</th>
                                <td>
                                    <select name="teamCode" id="team">
                                        <option value="0">팀없음</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>직급</th>
                                <td>
                                    <select name="jobCode" id="job"></select>
                                </td>
                                <th>
                                    <td></td>
                                </th>
                            </tr>
                            <tr>
                                <th>성별</th>
                                <td>
                                    <select name="gender" id="gender">
                                        <option value="">선택안함</option>
                                        <option id="female" value="F">여자</option>
                                        <option id="male" value="M">남자</option>
                                    </select>
                                </td>
                                <th>생년월일</th>
                                <td><input type="date" id="birth" name="birth" value=""></td>
                            </tr>
                            <tr>
                                <th>입사일</th>
                                <td><input type="date" id="enrollDate" name="enrollDate" value=""></td>
                                <script>
                                    document.getElementById('enrollDate').value = new Date().toISOString().substring(0, 10);;
                                </script>
                                <th>퇴사일</th>
                                <td><input type="date" id="resignDate" name="resignDate" value=""></td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td><input type="tel" id="phone" name="phone" value=""></td>
                                <th>내선번호</th>
                                <td><input type="tel" id="empPhone" name="empPhone" value=""></td>
                            </tr>
                            <tr style="height: 5px;"></tr>
                            <tr>
                                <th style="vertical-align:top">담당업무</th>
                                <td colspan="5">
                                    <textarea class="form-control" name="task" id="task" rows="4"></textarea>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <br><br>
                    <div class="btns">
                        <button type="submit" class="btn btn-success">저장하기</button>&nbsp;&nbsp;&nbsp;
                        <button type="reset" class="btn btn-outline-success" onclick="history.back();">취소하기</button>
                    </div>
            
                </div>
            </form>
        </div>

        <br><br><br><br>

        <script>
            // 부서조회
            $(function(){
                $.ajax({
                    url:"selectDept.ad",
                    success:function(deptList){
                        for(let d=0; d<deptList.length; d++){
                            $("#dept").append(
                                '<option id="dept' + deptList[d].deptCode + '" value="'+ deptList[d].deptCode +'">'+ deptList[d].deptName +'</option>'
                            )
                        }
                    }
                })
            })

            // 팀조회
            $(function(){
                $.ajax({
                    url:"selectTeam.ad",
                    success:function(teamList){
                        for(let t=0; t<teamList.length; t++){
                            $("#team").append(
                                '<option id="team' + teamList[t].teamCode + '" value="'+ teamList[t].teamCode +'">'+ teamList[t].teamName +'</option>'
                            )
                        }
                    }
                })
            })
            
            // 사원조회
            $(function(){
                $.ajax({
                    url:"selectJob.ad",
                    success:function(jobList){
                        for(let j=0; j<jobList.length; j++){
                            $("#job").append(
                                '<option id="job' + jobList[j].jobCode + '" value="'+ jobList[j].jobCode +'">'+ jobList[j].jobName +'</option>'
                            )
                        }
                    }
                })
            })
        </script>
    

	

</body>
</html>