<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mailListView</title>
<style>
        
        .mailOuter{
            padding-left: 30px;
            margin: auto;
            padding-top: 100px;
        }
        
        .btnArea{padding-left: 10px;}
        /*
        .mailContents{
            height: 500px;
        }
        */
        .message{
            color: green;
        }
        .subMessage{
            color:gray;
        }
        .btnArea{

        }

    </style>
</head>
<body>
	<jsp:include page="../common/sideMenubar.jsp"/>
	<jsp:include page="../common/mailMenubar.jsp"/>
        <br>
        <div class="mailOuter" align="center">
            <c:if test="${send eq 'Y'}">
                <h4 class="message">${message}</h4>
                <span class="subMessage">${subMessage}</span>
                <br><br>
                <div class="btn-area">
                    <a class="btn btn-outline-success btn-sm" href="">보낸 메일함</a>
                    <a class="btn btn-outline-success btn-sm" href="mailEnrollForm.ma">메일 쓰기</a>
                </div>
            </c:if>
            <c:if test="${send eq 'N'}">
                <h4 class="message">${message}</h4>
                <span class="subMessage">${subMessage}</span>
                <br><br>
                <div class="btn-area">
                    <a class="btn btn-outline-success btn-sm" href="list.ma?mailCategory=임시보관함">임시 저장함</a>
                    <a class="btn btn-outline-success btn-sm" href="mailEnrollForm.ma">메일 쓰기</a>
                </div>
            </c:if>
        </div>
	    </div>

    </div>  

</div>

</body>
</html>