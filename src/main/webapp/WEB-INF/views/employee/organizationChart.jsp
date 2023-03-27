<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <title>Organization Chart Plugin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/orgchart/3.1.1/css/jquery.orgchart.min.css">
    <style>
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
        padding: 1px;
        box-sizing: border-box;
      }

      /*Now the CSS*/
* {margin: 0; padding: 0;}

.chart ul {
	padding-top: 20px; position: relative;
	
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

.chart li {
	float: left; text-align: center;
	list-style-type: none;
	position: relative;
	padding: 20px 5px 0 5px;
	
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

/*We will use ::before and ::after to draw the connectors*/

.chart li::before, .chart li::after{
	content: '';
	position: absolute; top: 0; right: 50%;
	border-top: 1px solid #ccc;
	width: 50%; height: 20px;
}
.chart li::after{
	right: auto; left: 50%;
	border-left: 1px solid #ccc;
}

/*We need to remove left-right connectors from elements without 
any siblings*/
.chart li:only-child::after, .chart li:only-child::before {
	display: none;
}

/*Remove space from the top of single children*/
.chart li:only-child{ padding-top: 0;}

/*Remove left connector from first child and 
right connector from last child*/
.chart li:first-child::before, .chart li:last-child::after{
	border: 0 none;
}
/*Adding back the vertical connector to the last nodes*/
.chart li:last-child::before{
	border-right: 1px solid #ccc;
	border-radius: 0 5px 0 0;
	-webkit-border-radius: 0 5px 0 0;
	-moz-border-radius: 0 5px 0 0;
}
.chart li:first-child::after{
	border-radius: 5px 0 0 0;
	-webkit-border-radius: 5px 0 0 0;
	-moz-border-radius: 5px 0 0 0;
}

/*Time to add downward connectors from parents*/
.chart ul ul::before{
	content: '';
	position: absolute; top: 0; left: 50%;
	border-left: 1px solid #ccc;
	width: 0; height: 20px;
}

./*Now the CSS*/
* {margin: 0; padding: 0;}

.chart ul {
	padding-top: 20px; position: relative;
	
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

.chart li {
	float: left; text-align: center;
	list-style-type: none;
	position: relative;
	padding: 20px 5px 0 5px;
	
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

/*We will use ::before and ::after to draw the connectors*/

.chart li::before, .chart li::after{
	content: '';
	position: absolute; top: 0; right: 50%;
	border-top: 1px solid #ccc;
	width: 50%; height: 20px;
}
.chart li::after{
	right: auto; left: 50%;
	border-left: 1px solid #ccc;
}

/*We need to remove left-right connectors from elements without 
any siblings*/
.chart li:only-child::after, .chart li:only-child::before {
	display: none;
}

/*Remove space from the top of single children*/
.chart li:only-child{ padding-top: 0;}

/*Remove left connector from first child and 
right connector from last child*/
.chart li:first-child::before, .chart li:last-child::after{
	border: 0 none;
}
/*Adding back the vertical connector to the last nodes*/
.chart li:last-child::before{
	border-right: 1px solid #ccc;
	border-radius: 0 5px 0 0;
	-webkit-border-radius: 0 5px 0 0;
	-moz-border-radius: 0 5px 0 0;
}
.chart li:first-child::after{
	border-radius: 5px 0 0 0;
	-webkit-border-radius: 5px 0 0 0;
	-moz-border-radius: 5px 0 0 0;
}

/*Time to add downward connectors from parents*/
.chart ul ul::before{
	content: '';
	position: absolute; top: 0; left: 50%;
	border-left: 1px solid #ccc;
	width: 0; height: 20px;
}

.chart li a{
	border: 1px solid #ccc;
	padding: 5px 10px;
	text-decoration: none;
	color: #666;
	font-family: arial, verdana, tahoma;
	font-size: 16px;
	display: inline-block;
	
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

/*Time for some hover effects*/
/*We will apply the hover effect the the lineage of the element also*/
.chart li a:hover, .chart li a:hover+ul li a {
	background: #cdebcd; color: #000; border: 1px solid #97b494;
}
/*Connector styles on hover*/
.chart li a:hover+ul li::after, 
.chart li a:hover+ul li::before, 
.chart li a:hover+ul::before, 
.chart li a:hover+ul ul::before{
	border-color:  #acc7ac;
}





  </style>
 

  </head>

  <body>
    <jsp:include page = "../common/menubar.jsp" />
    
    <br>
    <div class="mailOuter">
      <div class="chart">
        
      </div>

      <script>
        $(function(){
          $.ajax({
            url: "employeeChart.emp",
            success: function(deptList){
              console.log(deptList);
              let chart = "";
              for(let i=0; i<deptList.length; i++){
                //console.log(deptList[i]);
                if(deptList[i].deptName == "사장"){
                    chart += '<ul><li><a href="#">' + deptList[i].deptName + '</a><ul>';
                } else{
                  chart += '<li><a href="#">' + deptList[i].deptName + '</a>';
                  if(deptList[i].teamList.length != 1){
                    chart += "<ul>"
                    for(let j=0; j<deptList[i].teamList.length; j++){
                      if(deptList[i].teamList[j].teamName != "임원"){
                        chart += '<li><a href="#">' + deptList[i].teamList[j].teamName + '</a></li>';
                      }
                    }
                    chart+= "</ul>";
                  }
                }
                chart += '</li>';
              }
              chart += "</ul></li></ul>";
              $(".chart").html(chart);
                

            }, error: function(){
                console.log("조직도 조회용 ajax 통신 실패");
            }
          })
        })

      </script>
    </div>
  </div>

  </div>  

</div>
  </body>

</html>