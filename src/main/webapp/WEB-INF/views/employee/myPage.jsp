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
    .myPage{
        border: 1px solid gainsboro;
        margin: 10px; padding: 20px;
        height: 660px; font-size: 14px;
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
        width: 150px; height: 40px;
        font-weight: 500;
        padding-left: 15px;
    }
    #detail th{
        width: 100px;
        height: 40px;
        font-weight: 500;
        padding-left: 15px;
    }
    #basic input {
        width: 300px; height: 30px; font-size: 14px;
    }
    #detail input {
        width: 180px; height: 30px; font-size: 14px;
    }
    #detail textarea {
        resize: none; font-size: 14px;
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
	

        <h4 style="display: inline-block;" style="float: left;" ><b>마이 페이지</b></h4>
        <br><br>

        <div class="myPage">
            <div class="profileImg-pwd">
                <div>
                    <img id="profileImg" src="<c:out value='${ loginUser.profileUrl }' default='resources/images/common/profileDefault3.png' />" onclick="$('#profileImgFile').click();">
                    <input type="file" id="profileImgFile" style="display:none;">
                </div>
                <br>
                <div align="center">
                    <h5>${ loginUser.empName }</h5>
                    <span>${ loginUser.deptName }</span>&nbsp;<span>${ loginUser.teamName }</span>&nbsp;<span>${ loginUser.jobName }</span>
                </div>
                <div align="center" style="padding-top: 300px;">
                    <button type="button" class="btn btn-outline-success btn-sm" data-bs-toggle="modal" data-bs-target="#updatePwdForm">비밀번호변경</button>
                </div>
            </div>
            
            
            <script>
                $(function(){
                    $("#profileImgFile").change(function(){
                        
                        let formData = new FormData();
                        
                        let uploadFile = this.files[0];
                        
                        formData.append("uploadFile", uploadFile);
                        formData.append("empNo", '${ loginUser.empNo }');
                        formData.append("originalFile", '${ loginUser.profileUrl}');
                    
                        $.ajax({
                            url:"uploadProfile.emp",
                            data:formData,
                            processData:false, 
                            contentType:false,
                            type:"POST",
                            success:function(){
                                location.reload();
                            }, error:function(){
                                
                            }		
                        })
                    
                    })
                })
            </script>
            
            
            <div class="profile-detail">
                <form action="update.emp" method="post">
                    <input type="hidden" name="empNo" value="${ loginUser.empNo }">
                    <div class="basic-info">
                        기본정보
                        <br><hr>
                        <table id="basic">
                            <tr>
                                <th>이름</th>
                                <td>${ loginUser.empName }</td>
                            </tr>
                            <tr>
                                <th>사원번호</th>
                                <td>${ loginUser.empNo }</td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input type="email" class="form-control" id="email" name="email" value="${ loginUser.email }"></td>
                            </tr>
                        </table>
                    </div>
                    <br>
                    <div class="detail-info">
                        상세정보
                        <br><hr>
                        <table id="detail">
                            <tr>
                                <th>부서</th>
                                <td>${ loginUser.deptName }&nbsp;&nbsp;${ loginUser.teamName }</td>
                                <th>입사일</th>
                                <td>${ loginUser.enrollDate }</td>
                            </tr>
                            <tr>
                                <th>직급</th>
                                <td>${ loginUser.jobName }</td>
                                <th>생년월일</th>
                                <td><input type="date" class="form-control" id="birth" name="birth" value="${ loginUser.birth }"></td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td><input type="tel" class="form-control" id="phone" name="phone" value="${ loginUser.phone }"></td>
                                <th>내선번호</th>
                                <td><input type="tel" class="form-control" id="empPhone" name="empPhone" value="${ loginUser.empPhone }"></td>
                            </tr>
                            <tr style="height: 5px;"></tr>
                            <tr>
                                <th style="vertical-align:top">담당업무</th>
                                <td colspan="3">
                                    <textarea class="form-control" name="task" id="task" rows="4">${ loginUser.task }</textarea>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <br><br>
                    <div class="btns">
                        <button type="submit" class="btn btn-success">저장하기</button>&nbsp;&nbsp;
                        <button type="reset" class="btn btn-outline-success">취소하기</button>
                    </div>
                </form>
            </div>
        </div>

        <br><br><br><br>
    

	<!-- 비밀번호 변경용 Modal -->
	<div class="modal" id="updatePwdForm">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
   
				<div class="modal-header">
					<h4 class="modal-title">비밀번호 변경</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
   
				<div class="modal-body" align="center">
					<form action="updatePwd.emp" method="post">
                        <input type="hidden" name="loginNo" value="${ loginUser.empNo }">
						<table>
							<tr>
								<td width="150px">현재 비밀번호</td>
								<td><input type="password" class="form-control" name="empPwd" required></td>
							</tr>
                            <tr style="height:5px"></tr>
							<tr>
								<td>변경할 비밀번호</td>
								<td><input type="password" class="form-control" name="updatePwd" required></td>
							</tr>                               
						</table>
						<br>
						<button type="submit" class="btn btn-sm btn-success" >비밀번호 변경</button>
					</form>
				</div>
   
			</div>
		</div>
	</div>

</body>
</html>