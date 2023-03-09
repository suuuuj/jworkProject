<%@ page language="java" contentType=`"text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Modal -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
    /* outer영역 */
    .outer{
        width:960px;
        height:1000px;
        border:1px solid black;
    }

    /* 메뉴바 */
    .title{
        color:rgb(50,50,50);
        margin-left: 30px;
        margin-top:30px;
    }
    .selectBar{
        margin-left: 30px;
    }
    .selectBar>span{
        color:rgba(50, 50, 50, 0.79);
        font-size:15px;
        font-weight: 600;
    }
    .selectBar>div{
        margin-top:10px;
        height:3px;
        float: left;
    }
    /* content영역 */
    .work-area{
        margin-left:30px;
        margin-right: 30px;
        margin-top: 30px;
    }
    .workSelect{
        color:rgba(50, 50, 50);
        font-size: 15px;
        font-weight: 600;
    }
    .workSelect button{
        width:60px;
        height:30px;
        font-size: 12px;
        line-height:normal;
        margin-bottom: 5px;
    }
    .workSelect input[type=date]{
        width:100px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        color:rgb(50,50,50);
        border-radius: 5px;
    }
    .workSelect select{
        width:100px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        font-size: 14px;
        color:rgb(50,50,50);
    }
    .workTable{
        margin-top:30px;
        width:100%;
        border-top:1px solid rgb(234, 234, 234);
        text-align: center;
        font-size: 14px;
        color: rgb(50, 50, 50);
    }
    .workTable td{
        border-bottom: 1px solid rgb(234, 234, 234);
        color:rgb(50, 50, 50);
        height:30px;
    }
    .workTable>tbody>tr:hover{
        opacity: 0.7;
        cursor: pointer;
    }
    .paging-area button{
        width:30px;
        height:30px;
        border:none;
        border-radius: 5px;
    }
    /* modal영역 */
    .modal-content{
        height:600px;
        width:400px;
        font-size: 14px;
    }
    .modal-body input{
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        float:right;
        width:200px;
    }
    .modalS{
        display: inline-block;
        margin-bottom: 10px;
    }
    .modal-body textarea{
        resize: none;
        width:330px;
        height:130px;
        margin:auto;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }
    .textWrap{
        float:right;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600px;
        color:rgb(50,50,50);
    }
    .textWrap div{
        display: inline-block; 
    }
</style>
</head>
<body>
    <div class="outer">

        <div class="title">
            <h3 style="color:rgb(50,50,50); font-weight: 600;">근무<h3> 
        </div>
        <br>
        <div class="selectBar">
            <span>&nbsp;근태현황</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>근태이력</span> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>근태수정</span> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">근태조정</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">근태관리</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">근태통계</span>
            <br>
            <div style="width:83px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:67px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:741px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>

        <div class="work-area">

            <div class="workSelect">
                기간조회&nbsp;&nbsp;&nbsp;
                <input type="date" name="stDate" value="">
                <span style="font-size: 20px; color:rgb(170, 170, 170)">~</span>
                <input type="date" name="edDate">
                <button class="btn btn-success">검색</button>
                <br><br>
                근무상태&nbsp;&nbsp;&nbsp;
                <select name="" id="">
                    <option value="">&nbsp;전체</option>
                    <option value="">&nbsp;정상</option>
                    <option value="">&nbsp;지각</option>
                    <option value="">&nbsp;조퇴</option>
                    <option value="">&nbsp;결근</option>
                </select>
                
            </div>

            <div>
                <table class="workTable">
                    <thead>
                        <tr style="font-size: 15px; font-weight: 600; height:30px; background-color: rgba(0, 172, 0, 0.102);">
                            <td width="182px;">날짜</td>
                            <td width="182px;">근무상태</td>
                            <td width="182px;">출근시간</td>
                            <td width="182px;">퇴근시간</td>
                            <td width="182px;">총근무시간</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>0223.02.20</td>
                            <td>정상</td>
                            <td>08:55:03</td>
                            <td>18:03:55</td>
                            <td>08:09:00</td>
                        </tr>
                        <tr>
                            <td>0223.02.20</td>
                            <td>정상</td>
                            <td>08:55:03</td>
                            <td>18:03:55</td>
                            <td>08:09:00</td>
                        </tr>
                        <tr>
                            <td>0223.02.20</td>
                            <td>정상</td>
                            <td>08:55:03</td>
                            <td>18:03:55</td>
                            <td>08:09:00</td>
                        </tr>
                        <tr>
                            <td>0223.02.20</td>
                            <td>정상</td>
                            <td>08:55:03</td>
                            <td>18:03:55</td>
                            <td>08:09:00</td>
                        </tr>
                        <tr>
                            <td>0223.02.20</td>
                            <td>정상</td>
                            <td>08:55:03</td>
                            <td>18:03:55</td>
                            <td>08:09:00</td>
                        </tr>
                        <tr>
                            <td>0223.02.20</td>
                            <td>정상</td>
                            <td>08:55:03</td>
                            <td>18:03:55</td>
                            <td>08:09:00</td>
                        </tr>
                        <tr>
                            <td>0223.02.20</td>
                            <td>정상</td>
                            <td>08:55:03</td>
                            <td>18:03:55</td>
                            <td>08:09:00</td>
                        </tr>
                        <tr>
                            <td>0223.02.20</td>
                            <td>정상</td>
                            <td>08:55:03</td>
                            <td>18:03:55</td>
                            <td>08:09:00</td>
                        </tr>
                        <tr>
                            <td>0223.02.20</td>
                            <td>정상</td>
                            <td>08:55:03</td>
                            <td>18:03:55</td>
                            <td>08:09:00</td>
                        </tr>
                        <tr>
                            <td>0223.02.20</td>
                            <td>정상</td>
                            <td>08:55:03</td>
                            <td>18:03:55</td>
                            <td>08:09:00</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <script>
                $(function(){
                    $(".workTable>tbody>tr").click(function(){
                        $("#workModal").modal('show');
                    })
                })
            </script>

            <br><br>

            <div class="paging-area" style="text-align:center;">
                <button><</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>></button>
            </div>

        </div>

    </div>

    <!-- The Modal -->
    <div class="modal fade" id="workModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title" style="color:rgb(0,172,0)">출퇴근 시간변경</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button><br>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" style="width:360px; margin:auto;">
                    <span class="modalS">수정할 날짜</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;2023.03.20" style="float:right;" readonly><br>
                    <span class="modalS">지정 출근시간</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;09:20:53" readonly><br>
                    <span class="modalS">지정 퇴근시간</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;19:20:53" readonly><br>
                    <hr>
                    <span class="modalS">수정할 출근시간</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="time" name="" value="&nbsp;&nbsp;09:20:53"><br>
                    <span class="modalS">수정할 퇴근시간</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="time" name="" value="&nbsp;&nbsp;19:20:53"><br>
                    <hr>
                    <span>신청사유</span>
                    <br>
                    <div class="textWrap">
                        <div class="textCount">&nbsp;&nbsp;0자</div><div class="textTotal">/100자</div>
                    </div>
                    <textarea name="" id="textBox" maxlength="99" placeholder="신청사유를 입력하시오."></textarea>
                    
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            
            </div>
        </div>
    </div>

    <script>
        $(function(){
            $("#textBox").keyup(function(e){
                let content = $(this).val();

                if(content == 0 || content == ""){
                    $(".textCount").text('0자');
                }else{
                    $('.textCount').text(content.length + '자');
                }

                if(content.length > 100){
                    $(this).val($(this).val().substring(0, 100));

                    alert("글자수는 100자까지 입력 가능합니다.");
                };
            });
        })
    </script>


</body>
</html>