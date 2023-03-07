<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}
    #cfRoom-enrollForm th{
        height: 120px;
    }
    .outer{
        width: 960px;
    }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="outer">
        <h2>회의실 등록</h2>
        <hr><br>
        <div>
            <form action="">
                <table id="cfRoom-enrollForm">
                    <tr >
                        <th >회의실 이름</th>
                        <td><input type="text" name="cfrName"></td>
                    </tr>
                    <tr>
                        <th>회의실 대표 이미지</th>
                        <td>
                            <img src="" width="150px" height="100px" onclick="$('#firstImg').click();">
                            <input type="file" id="firstImg" style="display:none;">
                        </td>
                    </tr>
                    <tr>
                        <th>회의실 상세 이미지</th>
                        <td>
                            <img src="" width="150px" height="100px"  onclick="$('#img_2').click();">
                            <input type="file" id="img_2" style="display:none;">
                            <img src="" width="150px" height="100px"  onclick="$('#img_3').click();">
                            <input type="file" id="img_3" style="display:none;">
                            <img src="" width="150px" height="100px"  onclick="$('#img_4').click();">
                            <input type="file" id="img_4" style="display:none;">

                        </td>
                    </tr>
                    <tr>
                        <th>수용인원</th>
                        <td><input type="number" name="capacity"></td>
                    </tr>
                    <tr>
                        <th>회의장비</th>
                        <td>
                            TV&nbsp;<input type="checkbox" name="equipment">&nbsp;
                            빔프로젝터&nbsp;<input type="checkbox" name="equipment">&nbsp;
                            에어컨&nbsp;<input type="checkbox" name="equipment">&nbsp;
                            커피포트&nbsp;<input type="checkbox" name="equipment">&nbsp;
                            선풍기&nbsp;<input type="checkbox" name="equipment">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><button type="button" class="btn btn-sm btn-secondary"  data-toggle="modal" data-target="#addObject">+장비추가</button></td>
                    </tr>


                </table>
            </form>
            <br><br>
            <div class="btn-area">
                <button type="submit" class="btn btn-sm btn-secondary">제출하기</button>
                <button type="button" class="btn btn-sm btn-light">이전으로</button>
            </div>

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
                        <form action="">
                            장비명 : <input type="text" name="equipment">



                            <div class="modal-footer">
                                <button type="submit">추가하기</button>
                                <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">닫기</button>
                            </div>
                    
                        </form>
                    </div>
            
                    <!-- Modal footer -->
                  
                </div>
                </div>
            </div>
            


        </div>
        <br>
        


    </div>
</body>
</html>