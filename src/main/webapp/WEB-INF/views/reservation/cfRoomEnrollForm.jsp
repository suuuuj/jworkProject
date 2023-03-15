<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}
    #cfRoom-enrollForm th{
        height: 120px;
    }
    .outer{
        width: 960px;
        margin:20px;
    }
    #equipment-area{display:inline;}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="outer" style="width:920px;">
        <h2>회의실 등록</h2>
        <hr><br>
        <div>
            <form action="insert.cfr" method="post" enctype="multipart/form-data" >
                <table id="cfRoom-enrollForm"  style="width:700px;">
                    <tr >
                        <th >회의실 이름</th>
                        <td>
                         <div class="col-7">
                       		 <input type="text" name="cfrName" required  class="form-control " >
                        </div>
                        
                        </td>
                    </tr>
                    <tr>
                        <th>회의실 대표 이미지</th>
                        <td>
                        	 <img id="firstImg" src="<c:out value='${CfRoom.firstImg}' default='resources/uploadFiles/addImg.png'/>"  width="150px" height="80px" onclick="$('#firstImgFile').click();">
                             <input type="file" id="firstImgFile" style="display:none;" required>
                        </td>
                    </tr>
                    <tr>
                        <th>수용인원</th>
                        <td>
                        	 <div class="col-3">
                        		<input type="number" name="capacity" required  class="form-control">
                       		</div>
                        </td>
                    </tr>
                    <tr>
                        <th>회의장비</th>
                        <td>
                          
                            TV&nbsp;<input type="checkbox" name="equipment" value="TV" >&nbsp;
                            빔프로젝터&nbsp;<input type="checkbox" name="equipment" value="빔프로젝터">&nbsp;
                            에어컨&nbsp;<input type="checkbox" name="equipment" value="에어컨">&nbsp;
                          <div id="equipment-area">
                          </div>
                    
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><button type="button" class="btn btn-sm btn-secondary"  data-toggle="modal" data-target="#addObject">+장비추가</button></td>
                    </tr>


                </table>
                <br><br>
                 <div class="btn-area">
	                <button type="submit" class="btn btn-sm btn-secondary">제출하기</button>
	                <button type="button" class="btn btn-sm btn-light" onclick="history.back();">이전으로</button>
            	</div>
            </form>
            <br><br>
            </div>
           <script>
				/* $(function(){
					
					$("#firstImgFile").change(function(){
						
						let formData= new FormData();
						
						let uploadFile = this.files[0]; 
						formData.append("uploadFile",uploadFile);
						formData.append("originalFile",'${CfRoom.firstImg}');
						
						
						
						
						$.ajax({
							url:"uploadFirstImg.cfr",
							data:formData, 
							processData:false,
							contentType:false,
							type:"POST",
							success:function(result){
								
								$("#firstImg").attr("src",result);
							},
							error:function(){
								console.log("업로드용 ajax통신 실패");
							}
						})
						
					});
				})
				 */
			</script>

            <!-- 장비추가 모달 -->
            <div class="modal" id="addObject">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">장비추가</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="add.eq" method="post">
                            장비명 : <input type="text" id="addEq">
								


                                <button type="button" class="btn btn-secondary btn-sm" onclick="addEmp();">추가하기</button>
                                <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">닫기</button>
                    
                        </form>
                    </div>
            
                </div>
            </div>
            


        </div>
        <br>
        <script>
        
        		
        		function addEmp(){
        			
        			$.ajax({
                		url:"add.eq",
                		data:{equipment:$("#addEq").val()},
                		success:function(result){
                			let value= result 
                			+"&nbsp;<input type='checkbox' name='equipment' value='"
                			+result+"'>&nbsp;&nbsp;";
                			
                			$("#equipment-area").append(value);
                			$("#addEq").val("");
                		},error:function(){
                			console.log("ajax 통신 실패");
                		}
                				
                	})
            	
        			
        		}
        	
        </script>
        


    </div>
</body>
</html>