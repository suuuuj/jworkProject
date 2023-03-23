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

<!-- 조직도 트리 -->
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<link rel="stylesheet" type="text/css" href="resources/css/treeview/jquery.treeview.css"/>


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
    #selectApproval td{
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
    #selectApprovalLine th, #selectApprovalLine td{
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
        margin: auto;
        
             
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

    .deptName{
        padding-left: 15px;
        font-size: small;
    }
    .empName{
        padding-left: 20px;
        display:none;
        list-style: none;
        font-size: small;
    }
    #tree{
            font-size: 14px;
        }
    
   .emp:hover{
       cursor: pointer;
   }

   .click {
        font-weight:bolder;
        color: green;
    }
   
   
  
   .employeeChart{
  	   border: 1px solid black;
       border-radius: 5%;
       width: 300px;
       padding:5px;
       text-align: left;
       height: 300px;
       width: 300px;
       overflow: auto;
   }
   
   .employeeChart::-webkit-scrollbar {
        width: 5px; /*스크롤바의 너비*/
    }
    
  #selectAppLineTB tbody{
  	font-size: small;
  }

 
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
       
        <h4><b>결재 문서 작성</b></h4>
    
        <br>
        
         <script>
         	//임시저장 
         	function saveBtn(){
         		$("#approvalForm").attr("action","saveApp.app").submit();
         	}
         
         </script>

        <form action="" method="post" align="center" enctype="multipart/form-data" id="approvalForm">
        	<input type="hidden" name="empNo" value="${ loginUser.empNo }">
        	
            <table id="selectApproval" border="1">
                <tr>
                    <th width="140px">문서종류</th>
                    <td width="180px">
                        <select name="docType" id="appForm">
                            <option value="0">기안서</option>
                            <option value="1">품의서</option>
                            <option value="2">사직서</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>기 안 자</th>
                    <td>
                        ${ loginUser.empName }
                    </td>
                </tr>
                <tr>
                    <th>기 안 일</th>
                    <td>
                        
                    </td>
                </tr>

            </table>
            <table  id="selectApprovalLine" border="1">
                <tr >
                    <th width="90px" rowspan="3"style="text-align:center; background:rgb(237, 237, 237);">
                        <button type="button" class="btn" data-toggle="modal" data-target="#myModal" id="chart">
                            결재
                        </button>
                    </th>
                    <td height="25px" width="90px">${ loginUser.jobName }</td>
                    <td width="90px"></td>
                    <td width="90px"></td>
                    <td width="90px"></td>
                </tr>
                <tr>
                    <td height="70px"><img class="signLogo" src="resources/images/common/check.png"/></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td height="25px">${ loginUser.empName }</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
            <p id="appMsg">* 순서대로 결재가 진행됩니다.</p>
            
            <script>
                $(function(){
                    $(".quit").hide();
                    $(".request").hide();
                    $("#appForm").change(function(){
                        var appForm = $("#appForm option:selected").val();

                        if(appForm == 2){
                            $(".quit").show();
                            $(".up").hide();
                            $(".request").hide();
                        }else if(appForm == 0){
                            $(".up").show();
                            $(".quit").hide();
                            $(".request").hide();
                        }else if(appForm == 1){
                            $(".request").show();
                            $(".quit").hide();
                            $(".up").hide();
                        }
                    })
                })
            
            
            </script>
            
            <div class="approvalContent quit" align="center">
                <br>
                <h3><b>사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서</b></h3>
                <br>
                <table border="1" id="resignationAddForm">
                    <tr>
                        <th id="appThead">입사년도</th>
                        <td id="indate">${ loginUser.enrollDate }</td>
                        <th id="appThead">퇴사 예정일</th>
                        <td id="indate"><input type="date" name="resignDate" id=""></td>
                    </tr>
                </table>
                <br>
            </div>

            <div class="approvalContent request" align="center">
                <br>
                <h3><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;의&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서</b></h3>
                <br>
            </div>

            <div class="approvalContent up" align="center">
                <br>
                <h3><b>기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;안&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서</b></h3>
                <br>
            </div>

           

            <div class="approvalContent" align="center">
                <table border="1" width="759px">
                    <tr>
                        <th id="appThead" >제목</th>
                        <td ><input type="text" style="width:624px" name="docTitle" id="docTitle"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea id="summernote" name="docContent"></textarea>
                            
                        </td>
                    </tr>
                    <tr>
                        <th id="appThead">첨부파일</th>
                        <td ><input type="file" id="upfile" name="upfile" style="width:624px"></td>
                    </tr>
                    
                </table>
                
                
               <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
               <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
               <script>
              		$(document).ready(function() {
                         $('#summernote').summernote({
	                          placeholder: '내용을 입력하세요.',
	                          minHeight: 300,
	                          maxHeight: null,
	                          lang : 'ko-KR',
	                          toolbar: [
									// 글꼴 설정
									[ 'fontname', [ 'fontname' ] ],
									// 글자 크기 설정
									[ 'fontsize', [ 'fontsize' ] ],
									// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
									['style',[ 'bold', 'italic',
											   'underline',
											   'strikethrough',
											   'clear' ] ],
									// 글자색
									[ 'color', [ 'forecolor', 'color' ] ],
									// 표만들기
									[ 'table', [ 'table' ] ],
									// 글머리 기호, 번호매기기, 문단정렬
									[ 'para',
											[ 'ul', 'ol', 'paragraph' ] ],
									// 줄간격
									[ 'height', [ 'height' ] ],
									// 그림첨부, 링크만들기, 동영상첨부
									// ['insert',['picture','link','video']],
									// 코드보기, 확대해서보기, 도움말
									['view',[ 'codeview', 'fullscreen','help' ] ] ],
									// 추가한 글꼴
									fontNames : ['Arial', 'Arial Black',
												 'Comic Sans MS', 'Courier New',
												 '맑은 고딕', '궁서', '굴림체', '굴림', '돋음체','바탕체' ],
									// 추가한 폰트사이즈
									fontSizes : [ '8', '9', '10', '11', '12','14', '16', '18', 
									              '20', '22', '24','28', '30', '36', '50', '72' ]
                          	  	})
                          });
                </script>
                
                <br>
            </div> <!--end of approvalContent -->

            <div id="buttonarea"  align="left">
                <button type="submit" class="btn btn-success" onclick="insertBtn();">결재</button>
            </div>

            <div id="buttonarea"  align="right">
                <button type="button" class="btn btn-light" onclick="saveBtn();">임시저장</button>
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
                            
                            <div class="employeeChart">
                                 <ul id="tree" class="filetree treeview-famfamfam ">
            
                        
                                                
                                          
                                  </ul>
                                  <input type="hidden" id="appEmpNo" value="">
                                            
                           </div>

                       
                       <!-- ajax로 트리 불러오기 --> 
                        <script src="resources/js/treeview/jquery.cookie.js" type="text/javascript"></script>
           				<script src="resources/js/treeview/jquery.treeview.js" type="text/javascript"></script>
					   <script>
			                $(document).ready(function(){
			                    
			                    
			                    $(document).on("click", "#chart", function(){
			
			                        $.ajax({
			                            url: "employeeChart.emp",
			                            success: function(deptList){
			                                //console.log(deptList);
			                                let chart = "";
			                                for(let i=0; i<deptList.length; i++){
			                                    //console.log(deptList[i]);
			                                    if(deptList[i].deptName == "사장"){
			                                        chart += "<li><span class='emp' empNo='" + deptList[i].teamList[0].empList[0].empNo  +"' empName='" + deptList[i].teamList[0].empList[0].empName + "'>" 
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
			                                                    chart += '<ul><li><span class="emp" empNo="' + deptList[i].teamList[j].empList[k].empNo +  '" empName="' + deptList[i].teamList[j].empList[k].empName + '">'
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

                                
                                //사원 선택시
                                $(document).on("click",".emp",function(){
                                   
                                    const empNo= $(this).attr("empNo");
                    
                                    //console.log(empNo);
                                    
                                    $("#appEmpNo").val(empNo);

                                    // 현재 클릭된 엘리먼트의 색상을 변경하고, #appEmpNo 엘리먼트의 값을 설정합니다.
                                    $(this).css("color", "green").css("font-weight", "bolder");
                                   
                                    // 이전에 클릭된 엘리먼트의 색상을 원래대로 되돌립니다.
                                    $(".emp").css("color", "").css("font-weight", "normal");
  
                                })

			                });

                            $(document).on("click","#addSigner",function(){
                                $.ajax({
                                    url:"addSigner.app",
                                    data:{empNo:$("#appEmpNo").val()},
                                    success: function(list){
                                    	//console.log(list)
                                    	
                                    	let value=""
                                    	
                                    	value += "<tr>"
	                							 + "<th>" + list.deptName + "</th>"
	                						 	 + "<th>" + list.empName + "</th>"
	                							 + "<th>" + list.jobName + "</th>"
                						     + "</tr>";
                						     
                                    	$("#selectAppLineTB tbody").append(value);
                                    	
                                    	
                                    }, error:function(){
                        				console.log("결재자 추가 ajax 통신실패");
                        			}
                                })
                            })


                            
			            </script>
                       
                      

                        <div class="approvalLine-button">
                            <br>
                            <br>
                            <br>
                            <button type="button" class="btn btn-outline-secondary" id="addSigner">결재&gt;</button>
                            <br><br>
                            <button type="button" class="btn btn-outline-secondary">&lt;제외</button>
                            <br><br>
                            <button type="button" class="btn btn-outline-secondary">참조&gt;</button>
                        </div>

                       

                        <div class="approvalLine-area" >
                            <div class="selectAppLine">
                                <table id="selectAppLineTB" border="1">
                                    <h6 style="text-align: center;"><b>결재자</b></h6>
                                    <thead >
                                        <tr>
                                            <th>부서</th>
                                            <th>이름</th>
                                            <th>직급</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       
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

