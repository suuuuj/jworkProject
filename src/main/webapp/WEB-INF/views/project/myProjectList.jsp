<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}
   
    .outer{
        width: 960px;
    }
    #projectArea{width: 700px; background-color: rgb(225, 225, 225);grey; overflow: hidden; height: auto; float: left;} 
    #invitedList{width: 250px; margin-left: 10px; overflow: hidden; height: auto; background-color: rgb(225, 225, 225);float: left;}
    #projectArea>h5, #invitedList>h5{
        font-weight:800;
        padding: 20px;
    }
    #projectArea>div, #invitedList>div{
        padding: 20px;
    }
    .project{
        width: 230px; height: 130px; background-color: rgb(206, 228, 236);
        padding: 20px; margin:20px; border: 1px solid grey ;border-radius: 20px;
        display: inline-block;
    }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="outer">
        <h2>전체 프로젝트</h2>
        <hr><br>
        <div id="projectArea">
            <h5>참여중인 프로젝트</h5>
            <div class="project">
                프로젝트명 &nbsp;  <button class="btn btn-sm btn-secondary">설정</button><br>
                참여인원 (10)
            </div>
            
            <h5>종료된 프로젝트</h5>
            <div class="project">
                프로젝트명 &nbsp;  <button class="btn btn-sm btn-secondary">설정</button><br>
                참여인원 (10)
            </div>
        </div>
        
        <div id="invitedList">
            <h5>대기중인 초대</h5>
            <div align="center">
                프로젝트명 - 프로젝트생성자
                <button type="button" class="btn btn-sm btn-primary">승인</button>
                <button type="button"class="btn btn-sm btn-light">거절</button>
            </div>
            <div align="center">
                프로젝트명 - 프로젝트생성자
                <button type="button" class="btn btn-sm btn-primary">승인</button>
                <button type="button"class="btn btn-sm btn-light">거절</button>
            </div>
            
        </div>
 
    </div>
   
</body>
</html>