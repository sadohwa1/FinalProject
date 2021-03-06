<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>매출관리 페이지</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/admin/admin.css">
<script src="/js/admin/admin.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var f = new FontFace('jua', 'url(/css/admin/BMJUA_ttf.ttf)'); 
		var dps = [[]];
		var chart = new CanvasJS.Chart("chartContainer", {
			theme: "dark1", // "light1", "dark1", "dark2"
			animationEnabled: true,
			title: {
				fontFamily: "jua",
				text: "${year}년 ${campName} 매출"
			},
			axisX: {
				//글자 포맷
				//valueFormatString: "MMM"
				//valueFormatString: "string"		
				labelFontFamily: "jua",
				titleFontFamily: "jua",
				valueFormatString: "# 월"
			},
			axisY: {
				labelFontFamily: "jua",
				titleFontFamily: "jua",
				title: "y축 제목",
				includeZero: true,
				suffix: " 원"
			},
			toolTip: {
				fontFamily: "jua",
				content: "{x} : {y}"
			},
			//legend항목 넣어서 어떤색이 뭔지 표시할수도있음
			data: [{
				//차트의 종류
				type: "line",
				//x축 값의 형식
				//xValueType: "dateTime",
				//x축 값의 글자 포맷(hover시 보여주기)
				//xValueFormatString: "MMM",
				xValueFormatString: "# 월",
				//y축 값의 글자 포맷(hover시 보여주기)
				yValueFormatString: "#,##0 원",
				dataPoints: dps[0]
			}]
		});
		
		var xValue;
		var yValue;
		 
		<c:forEach items="${dataPointsList}" var="dataPoints" varStatus="loop">
		//datapoint->map
		//datapoints->dataPoints1
		//dataPointsList->list
			<c:forEach items="${dataPoints}" var="dataPoint">
				xValue = parseInt("${dataPoint.x}");
				yValue = parseFloat("${dataPoint.y}");
				dps[parseInt("${loop.index}")].push({
					x : xValue,
					y : yValue
				});
			</c:forEach>
		</c:forEach>
		chart.render();
	}

	function setValues(){		
		var campNo = $("#campNoVal option:selected").val();
		var year = $("#yearVal option:selected").html();
		location.href="/admin/salesAdmin.do?campNo="+campNo+"&year="+year;		
	}

</script>
<body>
    <div class="admin-wrap">
        <!--화면 좌측-->
        <jsp:include page="sideMenu.jsp"/>
        <!--화면 우측-->
        <div class="admin-content">
            <div class="real-content">
                <div class="members">
                	<select class="option" id="campNoVal">
                		<c:forEach items="${list }" var="data">
                			<option value="${data.campNo }">${data.campName}</option>
                		</c:forEach>
                	</select>
                	<!-- 이부분도 조회해서 조회된 년도만 뜨게 만들수 있음 -->
                	<select class="option" id="yearVal">
                		<option>2020</option>
                		<option>2021</option>
                	</select>
                	<button id="okBtn" onclick="setValues()">조회</button>
                    <p class="title">매출관련정보</p>
                    <div id="chartContainer" style="height: 65%; width: 100%;"></div>
					<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script> 
                </div>
            </div>
        </div>

    </div>
    <script>
	    $("#campNoVal option").each(function(){	
	        if($(this).html()=="${campName}"){
	        	$(this).attr("selected","selected"); // attr적용안될경우 prop으로
			}	
	    });
    	$("#yearVal").val('${year}').attr("selected","selected");
    </script>
</body>
</html>