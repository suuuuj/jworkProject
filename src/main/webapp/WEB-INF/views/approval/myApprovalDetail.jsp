<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        text-align: center;
    }

    #returnFont{
    	color: red;
    	font-size: x-large
    }

    .appContent{
        text-align:center;
        font-size: small;
        border: 1px solid lightgray;
        width: 754px;
       
    }

    #appThead{
        background:rgb(237, 237, 237);
        width:129px;
        height: 27px;
    }

    #indate{
        width:248px;
    }

    #buttonarea{
    	display: inline-block;
    	width: 750px;
    }

    #inputReturnReason{
        width: 267px;
        height: 110px;
    }
</style>
</head>
<body>
	        <h4><b>내 결재 문서</b></h4>
        <br>
        <div class="approval-area" align="center">
            <br><br>
            <h2><b>사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서 </b></h2>
            <br>
            <table id="selectApproval" border="1">
                <tr>
                    <th style="width:140px">문서번호</th>
                    <td width="180px">품의2023-1</td>
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
                    <th width="90px" rowspan="3"style="text-align:center; background:rgb(237, 237, 237);">결재</th>
                    <td height="25px" width="90px">사원</td>
                    <td width="90px">사원</td>
                    <td width="90px">사원</td>
                    <td width="90px">사원</td>
                </tr>
                <tr>
                    <td height="70px"><img src="resources/img/check.jpg" alt="" /></td>
                    <td><img src="resources/img/check.jpg" alt="" /></td>
                    <td>
                        <a id="returnFont" data-toggle="tooltip" title="안됩니다. 회사 돈이 부족해요.">반려</a>
                    </td>
                    <td></td>
                </tr>
               
                <tr>
                    <td height="25px">김정만</td>
                    <td>김정만</td>
                    <td>김정만</td>
                    <td>김정만</td>
                </tr>
            </table>
            <script>
                $(document).ready(function(){
                  $('[data-toggle="tooltip"]').tooltip();   
                });
            </script>

           
            <table class="appContent" border="1">
                 <!--사직서 양식이면 년도표 나오게-->
                <tr>
                    <th id="appThead">입사년도</th>
                    <td id="indate">2021.11.11</td>
                    <th id="appThead">퇴사 예정일</th>
                    <td id="indate">2023.03.27</td>
                </tr>
                <tr>
                    <th id="appThead" >제목</th>
                    <td width="624px" colspan="3">제목들어가는 자리</td>
                </tr>
                <tr>
                    <th style="background-color:rgb(237, 237, 237); height: 380px;">내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <th id="appThead">첨부파일</th>
                    <td colspan="3" style="text-align: left;"><a href="">의자.jpg</a></td>
                </tr>

            </table>
            <br>
        
            <div id="buttonarea" align="left">
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal1">승인</button>
                <button type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal2">반려</button>
                
            </div>

             <!-- The Modal -->
            <div class="modal fade" id="myModal1">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                
                        <!-- Modal body -->
                        <div class="modal-body">
                            승인하시겠습니까?
                        </div>
                    
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">승인</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    
                    </div>
                </div>
            </div>

            <div class="modal fade" id="myModal2">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                
                        <!-- Modal body -->
                        <div class="modal-body">
                           반려하시겠습니까?
                           <br>
                           <textarea name="" id="inputReturnReason" style="resize:none" placeholder="반려 이유를 입력해주세요."></textarea>
                        </div>
                    
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger" data-dismiss="modal">반려</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    
                    </div>
                </div>
            </div>
                        




        </div> <!--end of approval-area-->

    </div><!--end of content-->
    </div>
    </div>
    </div>

</body>
</html>