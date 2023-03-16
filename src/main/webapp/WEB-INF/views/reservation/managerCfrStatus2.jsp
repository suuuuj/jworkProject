<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.4/index.global.min.js"></script>
<script src='fullcalendar-scheduler/dist/index.global.js'></script>
<script>
var calendar = new FullCalendar.Calendar(calendarEl, {
  initialView: 'resourceDayGridDay',
  resources: [
    // your list of resources
  ]
});
</script>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	<div class="content">
        <div class="innerOuter">

            <div id='calendar'></div>

        </div>
    </div>



</body>
</html>