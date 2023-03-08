<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- include summernote css/js-->
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 

<style>
	 .content{
        margin: auto; 
        padding:4%
    }
	
    #selectApproval {
        font-size: small;
        text-align: center;
        width: 300px;
        display: inline-block;
        border: 1px solid lightgray;
    
    }
    #selectApproval th{
        background-color: rgb(237, 237, 237);
        height: 40px;
    }

    #selectApprovalLine{
        width: 450px;
        font-size: small;
        display: inline-block;
        border: 1px solid lightgray;
    }
    
    #appMsg {
        font-size: smaller;
        width: 800px;
        text-align: right;
    }

    #buttonarea{
        display: inline-block;
        width: 370px;
    }

    #appThead{
        text-align:center;
        background:rgb(237, 237, 237);
        width:130px;
        font-size: small;
    }
    #indate{
        width:249px;
        font-size: small;
        text-align:center;
    }
    #returnFont{
        color: red;
        font-size: x-large
    }

    .approvalLine-area{
        border: 1px solid black;
        border-radius: 5%;
        width: 300px;
        padding:15px;
        text-align: left;        
    }
    .approvalLine-button{
        width: 100px;
    }
    .modal-body div{
        float: left;
        height: 300px;
    }
    .modal-body{
        margin: auto;
    }
    
    #selectAppLineTB, #selectRefLineTB{
        margin: auto;
        text-align: center;
        width: 265px;
    }
    .signLogo{
        width: 42px;
    }
   
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
       
        <h4><b>결재 문서 작성</b></h4>
    
        <br>

        <form action="" method="post" align="center">
            <table id="selectApproval" border="1">
                <tr>
                    <th width="140px">문서종류</th>
                    <td width="180px">
                        <select name="appForm" id="appForm">
                            <option value="0">기안서</option>
                            <option value="1">품의서</option>
                            <option value="2">사직서</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>기 안 자</th>
                    <td>
                        김정만
                    </td>
                </tr>
                <tr>
                    <th>기 안 일</th>
                    <td>
                        2023.02.21
                    </td>
                </tr>

            </table>
            <table  id="selectApprovalLine" border="1">
                <tr >
                    <th width="90px" rowspan="3"style="text-align:center; background:rgb(237, 237, 237);">
                        <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                            결재
                        </button>
                    </th>
                    <td height="25px" width="90px">사원</td>
                    <td width="90px">사원</td>
                    <td width="90px">사원</td>
                    <td width="90px">사원</td>
                </tr>
                <tr>
                    <td height="70px"><img class="signLogo" src="resources/images/common/check.jpg" alt="" /></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td height="25px">김정만</td>
                    <td>김정만</td>
                    <td>김정만</td>
                    <td>김정만</td>
                </tr>
            </table>
            <p id="appMsg">* 순서대로 결재가 진행됩니다.</p>
            
            <div class="approvalContent" align="center">
                <br>
                <!--if문으로 양식에 따라 제목 바뀌도록 수정-->
                <h3><b>사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서</b></h3>
                <table border="1">
                    <tr>
                        <th id="appThead">입사년도</th>
                        <td id="indate">2021.11.11</td>
                        <th id="appThead">퇴사 예정일</th>
                        <td id="indate"><input type="date" name="" id=""></td>
                    </tr>
                </table>
                <table border="1" width="759px">
                    <tr>
                        <th id="appThead" >제목</th>
                        <td ><input type="text" style="width:624px"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea id="summernote" name="editordata"></textarea>
                            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
                            <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
                            <script>
                            	$(document).ready(function() {
                          	  		$('#summernote').summernote({
	                           	    	placeholder: '내용을 입력하세요.',
	                          	        minHeight: 300,
	                          	        maxHeight: null,
	                          	        lang : 'ko-KR'
                          	  		});
                          		});
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <th id="appThead">첨부파일</th>
                        <td ><input type="file" style="width:624px"></td>
                    </tr>
                    
                </table>
                <br>
            </div> <!--end of approvalContent -->

            <div id="buttonarea"  align="left">
                <button type="submit" class="btn btn-success" >결재</button>
            </div>

            <div id="buttonarea"  align="right">
                <button type="button" class="btn btn-light">임시저장</button>
            </div>

              <!-- The Modal -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-lg">
                <div class="modal-content">
                
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h5 class="modal-title"><b>결재선</b></h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="approvalLine-area" >
                            <ul style="padding:15px"> 인사팀
                                <li>유상무 상무</li>
                                <li>김지연 차장</li>
                                <li>박춘식 부장</li>
                            </ul>
                           
                          
                        </div>
                        <div class="approvalLine-button">
                            <br>
                            <br>
                            <br>
                            <button type="button" class="btn btn-outline-secondary">결재&gt;</button>
                            <br><br>
                            <button type="button" class="btn btn-outline-secondary">&lt;제외</button>
                            <br><br>
                            <button type="button" class="btn btn-outline-secondary">참조&gt;</button>
                        </div>
                        <div class="approvalLine-area">
                            <div class="selectAppLine">
                                <table id="selectAppLineTB" border="1">
                                    <h6 style="text-align: center;"><b>결재자</b></h6>
                                    <thead>
                                        <tr>
                                            <th>부서</th>
                                            <th>이름</th>
                                            <th>직급</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>총무팀</td>
                                            <td>홍길동</td>
                                            <td>대리</td>
                                        </tr>
                                        <tr>
                                            <td>총무팀</td>
                                            <td>김과장</td>
                                            <td>과장</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>
                                <table id="selectRefLineTB" border="1">
                                    <h6 style="text-align: center;"><b>참조자</b></h6>
                                    <thead>
                                        <tr>
                                            <th>부서</th>
                                            <th>이름</th>
                                            <th>직급</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>총무팀</td>
                                            <td>홍길동</td>
                                            <td>대리</td>
                                        </tr>
                                        <tr>
                                            <td>총무팀</td>
                                            <td>김과장</td>
                                            <td>과장</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        
                        </div>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                    <button type="button" class="btn btn-secondary">적용</button>
                    </div>
                    
                </div>
                </div>
            </div>

        </form>

    </div> <!-- end of content-->
    </div>
    </div>
    </div>

</body>
</html>