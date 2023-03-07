<%@ page language="java" contentType=`"text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    .workTable{
        margin:auto;
        text-align: center;
        width:900px;
        border-top:1px solid rgb(234, 234, 234);
        border-bottom:1px solid rgb(234, 234, 234);
        border-left:1px solid rgb(234, 234, 234);
    }
    .workTable td{
        border-right: 1px solid rgb(234, 234, 234);
        height:30px;
    }
    .workTable>thead td{
        width:225px;
        padding-top: 15px;
        color:rgba(50, 50, 50);
        font-size: 15px;
    }
    .workTable>tbody td{
        padding-bottom: 15px;
        color:rgb(0, 172, 0);
        font-size: 25px;
        font-weight: 600;
    }
    .workSelect select{
        width:80px;
        height:30px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
    }
    .workSelect input[type=text]{
        width:150px;
        height:28px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
    }
    .workSelect button{
        width:60px;
        height:30px;
        border:none;
        background: rgb(0, 172, 0);
        color:white;
        font-weight: 900;
        border-radius: 5px;
    }
    .workSelect>div{
        display: inline-block;
    }
    .workList>table{
        margin-top:30px;
        width:100%;
        text-align: center;
        border-collapse: collapse;
        border-spacing: 0;
    }
    .workList td{
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
            <h1 style="color:rgb(50,50,50)">근무<h1> 
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
            <div style="width:408px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:67px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:436px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>

        <div class="work-area">

            <div class="workSelect">
                <div>
                    <select name="" id="yearBox"></select>
                    <select name="dept" id="">
                        <option value="">인사1팀</option>
                        <option value="">인사2팀</option>
                        <option value="">총무1팀</option>
                        <option value="">총무2팀</option>
                        <option value="">개발1팀</option>
                        <option value="">개발2팀</option>
                    </select>
                    <select name="" id="">
                        <option value="">사원</option>
                        <option value="">대리</option>
                        <option value="">과장</option>
                        <option value="">차장</option>
                        <option value="">부장</option>
                        <option value="">상무</option>
                    </select>
                </div>
            </div>

            <script>
                $(function(){
                    var date = new Date();
                    var selYear = date.getFullyear();

                    // 현재년도를 기준으로 호출
                    getYears(selYear);

                    // 현재년도를 select함
                    $("#yearBox").val(selYear);

                    // 바뀐년도를 기준으로 다시 option세팅함
                    $("#yearBox").change(function(){
                        var chgYear = $(this).val(chgYear);
                    });
                });

                function getYears(getY){

                    // 기존 option 삭제함
                    $("#yearBox option").remove();

                    var stY = Number(getY)-10;
                    var edY = Number(getY)

                    for(var y=stY; y<=edY; y++){
                        $("#yearBox").append("<option value='" + y + "'>" + y + "년" + "</option>");
                    }
                }
            </script>

            <br>

            <div class="workingTime">
                <table class="workTable">
                    <thead>
                        <tr >
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
                <table>
                    <tr style="color:rgb(51,51,51); font-size: 14px; font-weight: 600; background: rgb(234, 234, 234);">
                        <td width="120px;">사번</td>
                        <td width="120px;">소속</td>
                        <td width="120px;">직위</td>
                        <td width="120px;">이름</td>
                        <td width="215px;">누적근무시간</td>
                        <td width="215px;">일근무시간</td>
                    </tr>
                    <tr>
                        <td>4505301111</td>
                        <td>인사1팀</td>
                        <td>사원</td>
                        <td>김정만</td>
                        <td>220:08:53</td>
                        <td>08:05:47</td>
                    </tr>
                    <tr>
                        <td>4505301111</td>
                        <td>인사1팀</td>
                        <td>사원</td>
                        <td>김정만</td>
                        <td>220:08:53</td>
                        <td>08:05:47</td>
                    </tr>
                    <tr>
                        <td>4505301111</td>
                        <td>인사1팀</td>
                        <td>사원</td>
                        <td>김정만</td>
                        <td>220:08:53</td>
                        <td>08:05:47</td>
                    </tr>
                    <tr>
                        <td>4505301111</td>
                        <td>인사1팀</td>
                        <td>사원</td>
                        <td>김정만</td>
                        <td>220:08:53</td>
                        <td>08:05:47</td>
                    </tr>
                    <tr>
                        <td>4505301111</td>
                        <td>인사1팀</td>
                        <td>사원</td>
                        <td>김정만</td>
                        <td>220:08:53</td>
                        <td>08:05:47</td>
                    </tr>
                    <tr>
                        <td>4505301111</td>
                        <td>인사1팀</td>
                        <td>사원</td>
                        <td>김정만</td>
                        <td>220:08:53</td>
                        <td>08:05:47</td>
                    </tr>
                    <tr>
                        <td>4505301111</td>
                        <td>인사1팀</td>
                        <td>사원</td>
                        <td>김정만</td>
                        <td>220:08:53</td>
                        <td>08:05:47</td>
                    </tr>
                    <tr>
                        <td>4505301111</td>
                        <td>인사1팀</td>
                        <td>사원</td>
                        <td>김정만</td>
                        <td>220:08:53</td>
                        <td>08:05:47</td>
                    </tr>
                    <tr>
                        <td>4505301111</td>
                        <td>인사1팀</td>
                        <td>사원</td>
                        <td>김정만</td>
                        <td>220:08:53</td>
                        <td>08:05:47</td>
                    </tr>
                    <tr>
                        <td>4505301111</td>
                        <td>인사1팀</td>
                        <td>사원</td>
                        <td>김정만</td>
                        <td>220:08:53</td>
                        <td>08:05:47</td>
                    </tr>
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