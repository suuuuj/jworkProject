<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">

<!-- 조직도 트리 -->
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<link rel="stylesheet" type="text/css" href="resources/css/treeview/jquery.treeview.css"/>
<style>
    .mailOuter{
        padding-left: 30px;
        margin: auto;
    }
	#mailHeader tr{height: 60px;}
	.content-title{
        font-size: 1.5em;
        width: 200px;
        font-weight: bolder;
    }
    #saveMailBtn{
        color: gray;
        font-weight: bold;
    }
    #saveMailBtn:hover{
        color: gray;
        cursor: pointer;
        font-weight: bold;
        text-decoration: underline;
    }
    .attachNotice{
        font-size: 0.8em;
        color: gray;
    }
    .fileArea{
        height: 100px;
        width: 850px;
        border: 0.5px solid gray;
        font-size: 0.8em;
        overflow: auto;
        
    }
    .nofile{
        margin: 5px;
        color: gray;
    }
    .enroll-form textarea{
        width:850px;
    }
    
    #receiver, #mailTitle{
        border:none;
    }
    .receiverInput, .titleInput{
        height: 40px;
        border-bottom: 1px solid rgb(193, 193, 193);
    }
    
    
    #receiver:focus, #mailTitle:focus{
        outline: none; /* outline 테두리 없애기 */
    }
    #receiver-list{
        margin-top: 0px;
        list-style-type : none;
        line-height: 30px;
        padding: 0px;
        display:inline-block;
        margin-bottom: 0px;
    }
    .receiver-li{
        display: inline-block;
        background-color: lightgray;
        color: black;
        border-radius: 1em;
        padding-left: 7px;
        padding-right: 7px;
        font-size: 13px;
    }
    .receiver-delete{
        display: inline-block;
        background-color: none;
        margin-right: 15px;
        font-size: 18px;
        box-sizing: border-box;
        line-height: 30px;
    }
    .receiver-delete:hover{cursor: pointer;}
    
    .file-block{
        margin: 5px;
        color: initial;
        display: flex;
    }
    .file-block span.name{
        padding-right: 10px;
        width: max-content;
        display: inline-flex;
    }
    .file-delete{
        display: inline-block;
        width: 18px;
        color: initial;
        font-size: 13px;
        justify-content: center;
        margin-right: 3px;
        cursor: pointer;
    }
    .file-delete:hover{cursor: pointer;}
    /*
    .file-delete{
        display: inline-block;
        background-color: none;
        margin-left: 5px;
        margin-right: 15px;
        font-size: 13px;
        box-sizing: border-box;
        line-height: 20px;
    }
    .file-delete:hover{cursor: pointer;}
    */
    form input::file-selector-button {
        display: none;
    }
    form .files{
        width: auto;
    }
    #tree{
        font-size: 12px;
    }

    .emp:hover{
        cursor: pointer;
    }
    .employeeChart{
        padding-left: 10px;
        height: 300px;
        width: 200px;
        overflow: auto;
    }

</style>
</head>
<body>
	<jsp:include page="../common/sideMenubar.jsp"/>
	<jsp:include page="../common/mailMenubar.jsp"/>
	
	<br>
	<div class="mailOuter">
                <span class="content-title">메일 쓰기&nbsp;&nbsp;</span> <a id="saveMailBtn" href="list.ma?mailCategory=임시보관함">임시보관 메일 ${savedMailCount}개</a>
                <div class="line"></div>
                <div class="space"></div>
                
                <button id="send" type="button" class="btn btn-outline-secondary btn-sm" onclick="sendMail();">보내기</button>&nbsp;
                <button id="save" type="button" class="btn btn-outline-secondary btn-sm" onclick="saveMail();">임시저장</button>&nbsp;
                <button id="toMe" type="button" class="btn btn-outline-secondary btn-sm">내게쓰기</button>&nbsp;

                <script>
                    
                    // 메일 임시저장시 실행되는 함수
                    function saveMail(){
                        
                        $("#sendType").val('N');
                        $("#mailForm").submit();

                    }

                    // 보내기 클릭 시 실행되는 함수
                    function sendMail(){
                        // 만약 받는 사람이 없다면
                        if($("#receiver-list").children().length == 0){
                            alert("받는 사람을 지정해주세요");
                            return;
                        } 

                        // 제목이 없다면
                        if($("#mailTitle").val() == ""){
                            if(confirm("메일 제목이 없습니다. 이대로 전송하시겠습니까?")){
                                
                                //let formData = new FormData(document.getElementById("mailForm"));
                                //console.log(formData.get("senderNo"));

                                $("#mailForm").submit();


                            } else{
                                $("#mailTitle").focus();
                                return false;
                            }
                        }
                        
                        $("#mailForm").submit();

                    }
                    
                    function confirm(){
                        if(confirm("이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.")){
                            return true;
                        }
                    }





                </script>


                <div class="space"></div>
                
                <div id="mailHeader">
                    <form action="sendMail.ma" id="mailForm" method="post" class="enroll-form" enctype="multipart/form-data">
                        <input type="hidden" name="senderNo" value="${ loginUser.empNo }">
                        <input type="hidden" name="sender" value="${ loginUser.empName }">
                        <input type="hidden" id="sendType" name="send" value="Y">
                        <table>
                            <tr>
                                <td width="100px">받는 사람</td>
                                <td>
                                    <div class="receiverInput">
                                        <ul id="receiver-list">
                                            <c:if test="${ not empty reply }">
                                                <input type='hidden' name='receiverNo' value='${ reply.senderNo }'>
                                                <input type='hidden' name='receiver' value='${ reply.sender }'>
                                                <li class='receiver-li'>${ reply.sender }</li>
                                                <div class='receiver-delete'>&times;</div>
                                            </c:if>
                                        </ul>
                                        <input type="text" id="receiver" value="">
                                    </div>
                                </td>
                                <td width="60px">
                                    <button type="button" id="chart" class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside">주소록</button>
                                    <li class="dropdown-menu">
                                        <div class="employeeChart">
                                            <ul id="tree" class="filetree treeview-famfamfam">
            
                        
                                                
                                          
                                            </ul>
                                            
                                        </div>
                                        
                                    </li>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td colspan="2"><div class="titleInput"><input type="text" style="width:850px" id="mailTitle" name="mailTitle" value="${ reply.mailTitle }"></div></td>
                            </tr>
                            <tr>
                                <td>파일 첨부</td>
                                <td colspan="2">
                                    <button type="button" class="btn btn-outline-secondary btn-sm" id="fileInput" onclick="$('#upfile').click();">내PC</button>
                                    <span class="attachNotice">첨부파일은 최대 5개까지 가능합니다.</span>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="2">
                                    <div class="fileArea">
                                        <div class="nofile">첨부된 파일이 없습니다.</div>
                                        <input type="file" name="upfile" id="upfile" style="display:none; "  multiple="multiple"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td colspan="2" rowspan="2">
                                    <textarea name="mailContent" id="summernote">
                                        <c:if test="${ not empty reply }">
                                            <br><br><br><br>
                                            - - - - - Original Message - - - - - <br>
                                            <b>From : </b> ${ reply.sender } <br>
                                            <b>To : </b> ${ reply.receiver } <br>
                                            <b>Sent : </b> ${ reply.registerDate } <br>
                                            <b>Subject : </b> ${ reply.mailTitle } <br><br>
                                            ${ reply.mailContent }
                                        </c:if>
                                    </textarea>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </form>
                </div>


            
            <br><br><br><br>
        
            <script src="resources/js/treeview/jquery.cookie.js" type="text/javascript"></script>
            <script src="resources/js/treeview/jquery.treeview.js" type="text/javascript"></script>
        
            <script>
                $(document).ready(function(){
                    
                    // 주소록 버튼 클릭시
                    $(document).on("click", "#chart", function(){

                        $.ajax({
                            url: "employeeChart.emp",
                            success: function(deptList){
                                console.log(deptList);
                                let chart = "";
                                for(let i=0; i<deptList.length; i++){
                                    //console.log(deptList[i]);
                                    if(deptList[i].deptName == "사장"){
                                        chart += "<li><span class='emp' empNo='" + deptList[i].teamList[0].empList[0].empNo + "' empName='" + deptList[i].teamList[0].empList[0].empName + "'>" 
                                                                            + deptList[i].teamList[0].empList[0].jobName + '&nbsp;' + deptList[i].teamList[0].empList[0].empName + "</span></li>";
                                    } else{
                                        chart += '<li class="closed"><span class="folder">' + deptList[i].deptName + '</span>';
                                        for(let j=0; j<deptList[i].teamList.length; j++){
                                            if(deptList[i].teamList[j].teamName == "임원"){
                                                for (let k=0; k<deptList[i].teamList[j].empList.length; k++){
                                                    chart += '<ul><li><span class="emp" empNo="' + deptList[i].teamList[j].empList[k].empNo + '" empName="' + deptList[i].teamList[j].empList[k].empName + '">'
                                                            + deptList[i].teamList[j].empList[k].jobName + '&nbsp;' + deptList[i].teamList[j].empList[k].empName + '</span></li></ul>';
                                                }
                                            } else{
                                                chart += '<ul><li class="closed"><span class="folder">' + deptList[i].teamList[j].teamName + '</span>';
                                                for(let k=0; k<deptList[i].teamList[j].empList.length; k++){
                                                    chart += '<ul><li><span class="emp" empNo="' + deptList[i].teamList[j].empList[k].empNo + '" empName="' + deptList[i].teamList[j].empList[k].empName + '">'
                                                        + deptList[i].teamList[j].empList[k].jobName + '&nbsp;' + deptList[i].teamList[j].empList[k].empName + '</span></li></ul>';
                                                }
                                                chart+= '</li></ul>';

                                            }
                                            
                                        }
                                        chart += "</li>";
                                    }
                                    
                                }

                                $("#tree").html(chart);
                                $("#tree").treeview({});

                            }, error: function(){
                                console.log("조직도 조회용 ajax 통신 실패");
                            }

                        })

                    })


                    // 주소록에서 사원을 클릭할 때
                    $(document).on("click", ".emp", function(){

                        const empNo = $(this).attr("empNo");
                        const empName = $(this).attr("empName");
                        //console.log(empNo + empName);

                        if($("#receiver-list").children().length == 0){ 
                        // li 요소가 없을 때
                            $("#receiver-list").append($("<input type='hidden' name='receiverNo' value='" + empNo + "'><input type='hidden' name='receiver' value='" + empName + "'><li class='receiver-li'>" + empName + "</li><div class='receiver-delete'>&times;</div>"));
                            $("#receiver-list").css("width", "$('#receiver-list').children().eq(0).val().length + 30");
                        } else { 
                        // li 요소가 있을 때
                            for(let i=0; i<$("#receiver-list").children().length; i++){
                                if($("#receiver-list").children().eq(i).val() == empNo){
                                    alert("중복된 사람입니다.");
                                    return;
                                }
                            }
                            $("#receiver-list").append($("<input type='hidden' name='receiverNo' value='" + empNo + "'><input type='hidden' name='receiver' value='" + empName + "'><li class='receiver-li'>" + empName + "</li><div class='receiver-delete'>&times;</div>"));
                            
                        }

                    })
                    
                    
                });
            </script>


        <script>
            

            // 사번으로 사원 조회해서 메일 수신자 목록에 추가하기
            $("#receiver").keydown(function() { // 'input[type="text"]'
                if(event.keyCode == 13 || event.keyCode == 32) {
                    event.preventDefault();
                    let receiver = $(this).val();

                    if($(this).val() == ""){
                        alert("받는 사람을 지정해주세요");
                        return;
                    }

                    $.ajax({
                        url: "findEmployee.ma",
                        data:{empNo: receiver},
                        success: function(e){

                            //console.log(e);
                            if(e == null){
                                alert("일치하는 사원이 없습니다.")
                                $("#receiver").val("");
                                $("#receiver").focus();
                            } else{
                                if($("#receiver-list").children().length == 0){ // li 요소가 없을 때
                                    $("#receiver-list").append($("<input type='hidden' name='receiverNo' value='" + e.empNo + "'><input type='hidden' name='receiver' value='" + e.empName + "'><li class='receiver-li'>" + e.empName + "</li><div class='receiver-delete'>&times;</div>"));
                                    $("#receiver-list").css("width", "$('#receiver-list').children().eq(0).val().length + 30");
                                    $("#receiver").val("");
                                    $("#receiver").focus();
                                } else { // li 요소가 있을 때
                                    for(let i=0; i<$("#receiver-list").children().length; i++){
                                        if($("#receiver-list").children().eq(i).val() == e.empNo){
                                            alert("중복된 사람입니다.");
                                            $("#receiver").val("");
                                            $("#receiver").focus();
                                            return;
                                        }
                                    }
                                    $("#receiver-list").append($("<input type='hidden' name='receiverNo' value='" + e.empNo + "'><input type='hidden' name='receiver' value='" + e.empName + "'><li class='receiver-li'>" + e.empName + "</li><div class='receiver-delete'>&times;</div>"));
                                    $("#receiver").val("");
                                    $("#receiver").focus();
                                }
                            }

                        }, error:function(){
                            console.log("사원 조회용 ajax 통신 실패");
                        }
                    })
                    
                }
            });

            // X 버튼 눌러서 수신자 목록에서 제거
            $(document).on("click", ".receiver-delete", function(){
                $(this).prev().prev().prev().remove();
                $(this).prev().prev().remove();
                $(this).prev().remove();
                $(this).remove();
            })



        </script>
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
        <script>
            
            $(function() {
                $('#summernote').summernote({
                    height : 550, // 기본 길이
                    minHeight : 550,
                    maxHeight : 700, // 최대 길이
                    toolbar : 
                        [
                            // 글꼴 설정
                            [ 'fontname', [ 'fontname' ]],
                            // 글자 크기 설정
                            [ 'fontsize', [ 'fontsize' ]],
                            // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
                            ['style', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear' ]],
                            // 글자색
                            [ 'color', [ 'forecolor', 'color' ]],
                            // 표만들기
                            [ 'table', [ 'table' ] ],
                            // 글머리 기호, 번호매기기, 문단정렬
                            [ 'para', [ 'ul', 'ol', 'paragraph' ]],
                            // 줄간격
                            [ 'height', [ 'height' ] ],
                            // 그림첨부, 링크만들기, 동영상첨부
                            // ['insert',['picture','link','video']],
                            // 코드보기, 확대해서보기, 도움말
                            ['view', [ 'codeview', 'fullscreen', 'help' ]] 
                        ],
                    // 추가한 글꼴
                    fontNames : 
                        ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋음체', '바탕체'],
                    // 추가한 폰트사이즈
                    fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
                });
        
                
            });
            
        </script> 
        <script> 
            $(function(){
                let f = 0;
                $fileArea = $(".fileArea");

                $("#toMe").click(function(){
                    $("#receiver-list").html("");
                    $("#receiver-list").append($("<input type='hidden' name='receiver' value='${ loginUser.empName }'><li class='receiver-li'>${ loginUser.empName }</li><div class='receiver-delete toMeDelete'>&times;</div>"));
                    $("#receiver").val("");
                    $("#receiver").attr("readonly", true);
                    $("#chart").attr("disabled", true);
                })

                $(document).on("click", ".toMeDelete", function(){
                    $("#receiver").attr("readonly", false);
                    $("#chart").attr("disabled", false);
                })

                // 파일첨부
                const dt = new DataTransfer(); // 입력 파일 조작

                
                
                $("#upfile").on('change', function(e){

                    var maxFileCnt = 5; // 첨부파일 최대 개수
                    var attFileCnt = document.querySelectorAll('.file-block').length; // 기존 추가된 첨부파일 개수
                    var remainFileCnt = maxFileCnt - attFileCnt; // 추가로 첨부가능한 개수

                    

                    if(this.files.length > remainFileCnt){

                        alert("파일은 최대 " + maxFileCnt + "개까지만 첨부할 수 있습니다.");

                    } else{
                        for(var i = 0; i < this.files.length; i++){
                            $(".nofile").remove();
                            let fileBloc = $('<div class="file-block" />');
                            let fileName = $('<span class="name" />').text(this.files.item(i).name);
                            fileBloc.append('<span class="file-delete">x</span>').append(fileName);
                            $(".fileArea").append(fileBloc);
                        };
                        // DataTransfer 개체에 파일 추가
                        for (let file of this.files) {
                            dt.items.add(file);
                        }
                        // 추가 후 입력 파일의 파일 업데이트
                        this.files = dt.files;
                    }

                    
                });

                // 파일삭제 버튼 클릭시 실행되는 함수
                $(document).on("click", "span.file-delete", function(){
                    let name = $(this).next('span.name').text();
                    // 파일 이름 display되지 않게
                    $(this).parent().remove();
                    for(let i = 0; i < dt.items.length; i++){
                        // display 삭제된 파일 이름인 파일을 찾아서 파일 삭제
                        if(name === dt.items[i].getAsFile().name){
                            // DataTransfer 개체에서 파일 삭제
                            dt.items.remove(i);
                            continue;
                        }
                    }

                    var attFileCnt = $(".file-block").length;
                    // 첨부파일이 없을 때
                    if(attFileCnt == 0){
                        let noFile = $('<div class="nofile" />').text("첨부된 파일이 없습니다.");
                        $(".fileArea").append(noFile);
                    }

                    // 삭제 후 입력 파일 파일 업데이트
                    document.getElementById('upfile').files = dt.files;
                })

                // 답장시 제목에 RE : 붙이기
                if($("#mailTitle").val() != ""){
                    $("#mailTitle").val("RE:" + $("#mailTitle").val());
                }
                

            }) 
               
        </script>
    </div>
    </div>

    </div>  

</div>
    
    
	
</body>
</html>