<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

<style>
        .section-size{
            width: 1000px;
            margin: 0 auto;
        }
        .section-mid-size{
        	width : 1100px;
           	display: flex;
   			flex-direction: row;
    		flex-wrap: wrap;
        }
        .bootcol{
            margin: 0;
            padding: 0;
        }
        .one{
            float: left;
        }
        .one>p{
            display: inline;
            margin: 0;
        }
        .two{
            float: left;
            margin-top: 8px;
            padding: 0;
        }
        .two>li{
            list-style-type: none;
            float: left;
            margin-left: 25px;
        }
        #ware-select{
            width: 150px;
        }
        .searchBtn{
            background-color: #1d0202;
            color: white;
            border: 0;
            border-radius: 3px;
            outline: 0;
            transition: background-color .5s;
            cursor: pointer;
            letter-spacing: 1px;
        }
        .searchBtn:hover{
            background-color:#fa9b00;
            color: #1d0202;
            
        }
 
        .prd-item{
            width: 300px;
            height: 360px;
            margin-bottom: 30px;
            margin-right: 50px;
            float: left;
            transition: background-color .5s;
        }
        .prd-item img{
            object-fit: cover;
            width: 298px;
            height: 300px;
            
        }
        .prd-item img:hover{
            border: 2px solid #fa9b00;
            width: 298px;
            height: 300px;
        }
        .items-navi {
        text-align: center;
        height: 250px;
    	}
    	.btn-outline-primary {
    	background-color: #1d0202 !important;
        color: white !important;
        border-color: white !important;
        transition: background-color .5s !important;
		}
		.btn-outline-primary:hover {
    	background-color: #fa9b00 !important;
        color: black !important;
        border-color: white !important;
		}
		#prd-item-click{
			text-decoration: none;
			color: #1d0202;

		}
    </style>
    
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <section class="section-size">
        <div class="used-one" style="height: 30px;" >
            <div class="col-md-9 one bootcol" style="padding: 0;">
                <p style="font-size: 20px; font-weight: 700;">중고거래</p>
                <p style="font-size: 14px;"> 정직한 중고거래를 실천합시다</p>
            </div>
            <ul class="col-md-3 two bootcol" style="font-size: 14px; padding: 0;">
                <li style="cursor: pointer; color: #252525;">최근순</li>
                <li style="color: #6d6c3f;"> | </li>
                <li style="cursor: pointer; color: #252525;">가격순</li>
                <li style="color: #6d6c3f;"> | </li>
                <li style="cursor: pointer; color: #252525;" id="nameson">이름순</li>
            </ul>
        </div>
        <hr style="border: 2px solid #1d0202; margin-top: 5px; margin-bottom: 8px;">
        <div class="used-two" style="height: 28px; margin-bottom:20px;">
            <div class="col-md-10 bootcol one" style=" padding: 0;">
            <select name="ware" id="ware-select" style="font-size: 10pt; height: 30px; vertical-align: middle;">
                <option value="" selected>직접선택</option>
                <option value="텐트/타프">텐트/타프</option>
                <option value="의자/테이블">의자/테이블</option>
                <option value="침낭/매트">침낭/매트</option>
                <option value="코펠/식기">코펠/식기</option>
                <option value="버너/난로">버너/난로</option>
                <option value="랜턴/후레쉬">랜턴/후레쉬</option>
                <option value="화로/바베큐용품">화로/바베큐용품</option>
                <option value="가방/케이스">가방/케이스</option>
                <option value="해먹/침대">해먹/침대</option>
                <option value="캠핑소품">캠핑소품</option>
                <option value="캠프차량용품">캠프차량용품</option>
            </select>
            <form action="/usedSearch.do?keyword" method="post" style="display: inline;">
            	<input type="hidden" name="reqPage" value="1" id="reqPage">
                <input type="text" name="search" placeholder="상품명 검색" style="height: 30px; font-size: 10pt; margin-left: 1px; padding: 0; vertical-align: middle;">
                <input type="submit" class="material-icons searchBtn" value="search" style="font-size: 16px; height: 30px; vertical-align: middle;">
            </form>
            </div>
            <div class="col-md-2 bootcol one" style="vertical-align: middle;  padding: 0;">
            	<c:if test="${sessionScope.m != null }">
               		<a href="/usedEnroll.do"><input type="button" value="물품등록" style="font-size: 16px; height: 30px; font-size: 14px; margin-left: 67px; width: 100px;" class="searchBtn"></a>
                </c:if>
            </div>
        </div>
    <section class="section-mid-size">
				<c:if test="${empty list }">
				<div style="height: 50px;"></div>
				<div class="section-size"  style="text-align:center;">
					<h4>검색 결과가 없습니다.</h4>
				</div>
            	</c:if>
        <c:forEach items="${list }" var="c">
        <div class="prd-item">
            <div style="height: 300px; width: 300px; border: 1px solid #e0e0e0;">
                <a href="/usedDatail.do?usedNo=${c.usedNo }">
                <img src="resources/upload/used/${c.file[0].filepath }">
                </a>
            </div>
            <div style="text-align: center; margin-top: 10px;"><a href="/usedDatail.do?usedNo=${c.usedNo }" id="prd-item-click">${c.usedTitle }</a></div>
            <div style="text-align: center; font-weight: 600; font-size: 14px;"><a href="/usedDatail.do?usedNo=${c.usedNo }" id="prd-item-click">${c.usedPrice } 원</a></div>
        </div>
        </c:forEach>
    </section>
    <section class="container" style="height: 100px; margin-top: 50px; display: block;">
        <div class="items-navi">
			<div class="btn-group">${pageNavi }</div>
		</div>
    </section>
</section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
   	<script>
   	$("#nameson").click(function(){	
   	var $divs = $(".prd-item");
   	$(function (){
   	  var OrderedDivs = $divs.sort(function (a, b) {
   	      return $(a).find("#prd-item-click").text() > $(b).find("#prd-item-click").text();
   	  });
   	  $(".prd-item").html(OrderedDivs);
   	});
   });
   	
   	/* 	$("#ware-select").change(function(){
   			var ware = $("#ware-select").val();
   			var reqPage = $("#reqPage").val();
   			console.log(ware);
   			$.ajax({
   				type:"GET", //전송 방법
   				url : "/selectSearch.do?select",
   				data : {ware : ware,
   						reqPage : reqPage
   					   },
   				datatype : "json"
   				success: 
   			});
   		}); */
   	</script>
</body>
</html>