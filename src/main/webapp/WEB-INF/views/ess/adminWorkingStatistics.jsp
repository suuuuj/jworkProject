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
    .timeTable{
        margin:auto;
        text-align: center;
        width:900px;
        border-top:1px solid rgb(234, 234, 234);
        border-bottom:1px solid rgb(234, 234, 234);
        border-left:1px solid rgb(234, 234, 234);
    }
    .timeTable td{
        border-right: 1px solid rgb(234, 234, 234);
        height:30px;
    }
    .timeTable>thead td{
        width:225px;
        padding-top: 15px;
        color:rgba(50, 50, 50);
        font-size: 15px;
    }
    .timeTable>tbody td{
        padding-bottom: 15px;
        color:rgb(0, 172, 0);
        font-size: 25px;
        font-weight: 600;
    }
    .workSelect select{
        width:100px;
        height:30px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
        font-size: 14px;
        color:rgb(50,50,50);
    }
    .workSelect input[type=text]{
        width:150px;
        height:28px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
    }
    .workSelect button{
        width:100px;
        height:30px;
        font-size: 14px;
        line-height: 5px;
        margin-bottom:3px;
    }
    .workSelect>div{
        display: inline-block;
    }
    .workTable{
        width:100%;
        text-align: center;
        margin-top:30px;
        border-collapse: collapse;
        border-spacing: 0;
        font-size: 14px;
        color:rgb(51,51,51);
    }
    .workTable td{
        width:182px;
        height:30px;
        color:rgb(50,50,50);
        border-bottom: 1px solid rgb(234, 234, 234);
    }
    .paging-area button{
        width:30px;
        height:30px;
        border:none;
        border-radius: 5px;
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
            <div style="width:433px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:67px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:400px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>

        <div class="work-area">

            <div class="workSelect">
                <select name="" id="yearBox" title="년도"></select>
                <select name="" id="deptBox" title="부서명">
                    <option value="">&nbsp;- 부서명 -</option>
                    <option value="">&nbsp;인사부</option>
                    <option value="">&nbsp;총무부</option>
                    <option value="">&nbsp;개발부</option>
                </select>
                <button type="button" class="btn btn-secondary">전사원통계</button>
                <!--
                <select name="" id="" title="직급명">
                    <option value="">사원</option>
                    <option value="">대리</option>
                    <option value="">과장</option>
                    <option value="">차장</option>
                    <option value="">부장</option>
                    <option value="">상무</option>
                </select>
                -->
            </div>

            <script>
                $(document).ready(function(){
                    setDateBox();
                });

                function setDateBox(){
                    var dt = new Date();
                    var currentYear = dt.getFullYear();

                    // 현재년도를 기준으로 호출
                    getYears(currentYear);

                    // 현재년도를 select함
                    $("#yearBox").val(currentYear);

                    // 바뀐년도를 기준으로 다시 option세팅함
                    $("#yearBox").change(function(){
                        var chgYear = $(this).val(chgYear);
                    })

                    // 올해 기준으로 -10년부터 올해까지 보여준다
                    for(var y=(currnetYear-10); y<=(currentYear); y++){
                        $("#yearBox").append("<option value='" + "y" + "'>" + "년" + "</option>");
                    }

                    function getYears(getY){

                        // 기존 option 삭제함
                        $("#yearBox option").remove();

                        var stY = Number(getY)-10;
                        var edY = Number(getY)

                        for(var y=stY; y<=edY; y++){
                            $("#yearBox").append("<option value='" + y + "'>" + y + "년" + "</option>");
                        }
                    }

                }
            </script>

            <!--
            <script>
                // 만약 부서가 새로 생성되면 생길때마다 option이 생성될수있는 for문을 만들고싶은데
                // 
                $(function(){
                    // for문으로 그냥 돌릴수있는가?
                    // for문으로하면 부서코드 시작과 끝을 어떻게 설정해야되지?
                    for(var d=${d.deptCode}; d<=${d.deptCode.length+1}){
                        $("#deptBox").append("<option value='" + d + "'>" + "${d.deptName}")
                    }

                    // 향상된for문으로 돌려야되는가? list에 부서코드에따른 부서이름만 담아와서?
                    for(d : list){
                        $("#deptBox").append("<option value='" + ${d.deptCode} + "'>" + ${d.deptName} + "</option>" );
                    }
                })
            </script>
            -->

            <br>

            <div class="workingTime">
                <table class="timeTable">
                    <thead>
                        <tr>
                            <td>이번주 누적</td>
                            <td>이번주 초과</td>
                            <td>이번주 잔여</td>
                            <td>이번달 누적</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>32시간 00분</td>
                            <td>3시간 23분</td>
                            <td>20시간 00분</td>
                            <td>86시간 36분</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="workList">
                <table class="workTable">
                    <thead>
                        <tr style="color:rgb(51,51,51); font-size: 14px; font-weight: 600; background: rgb(234, 234, 234);">
                            <td width="120px;">사번</td>
                            <td width="120px;">소속</td>
                            <td width="120px;">직위</td>
                            <td width="120px;">이름</td>
                            <td width="215px;">누적근무시간(주)</td>
                            <td width="215px;">누적근무시간(월)</td>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <!--
                        <c:forEach var="a" items="${list}">
                            <td>${a.empNo}</td>
                            <td>${a.team_name}</td>
                            <td>${a.jobName}</td>
                            <td>${a.empName}</td>
                            <td>${a.sumDateTime}</td>
                            <td>${a.sumMonthTime}</td>
                        </c:forEach>
                        -->
                        <tr>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>220:08:53</td>
                            <td>220:08:53</td>
                        </tr>
                        <tr>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>220:08:53</td>
                            <td>220:08:53</td>
                        </tr>
                        <tr>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>220:08:53</td>
                            <td>220:08:53</td>
                        </tr>
                        <tr>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>220:08:53</td>
                            <td>220:08:53</td>
                        </tr>
                        <tr>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>220:08:53</td>
                            <td>220:08:53</td>
                        </tr>
                        <tr>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>220:08:53</td>
                            <td>220:08:53</td>
                        </tr>
                        <tr>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>220:08:53</td>
                            <td>220:08:53</td>
                        </tr>
                        <tr>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>220:08:53</td>
                            <td>220:08:53</td>
                        </tr>
                        <tr>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>220:08:53</td>
                            <td>220:08:53</td>
                        </tr>
                        <tr>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>220:08:53</td>
                            <td>220:08:53</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            
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
</body>
</html>