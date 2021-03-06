<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<!-- Google Fonts-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Font Awesome-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

    <style>
        * {
            font-family: 'Noto Sans KR';
        }

        .content-wrap {
            width: 800px;
            margin: 0 auto;
            padding-top: 40px;
            padding-bottom: 80px;
            background-color: white;
            box-sizing: border-box;
        }

        .mypage-header {
            width: 60%;
            height: 100px;
            margin: 0 auto;
        }

        .mypage-header>p {
            margin: 0;
            padding: 0;
        }

        .mypage-title {
            font-size: 30px;
            font-weight: bolder;
            color: #f49b00;
        }

        .mypage-subtitle {
            color: dimgray;
        }

        .mypage-subtitle>span {
            font-weight: bolder;
            color: black;
        }

        /*--------------------------------*/

        .mypage-menu {
            width: 72%;
            overflow: hidden;
            margin: 0 auto;
            margin-top: 10px;
            margin-bottom: 60px;
        }

        .menu-img {
            width: 80px;
            height: 80px;
            text-align: center;
            float: left;
            margin-left: 33px;
        }

        #menu-img-a {
            text-decoration: none;
            color: black;
            font-size: 55px;
        }

        .menu-text {
            text-align: center;
            float: left;
            width: 65px;
            margin-top: 25px;
        }

        .num {
            color: #f49b00;
        }

        /*--------------------------------*/

        .mypage-table {
            margin: 0 auto;
            box-sizing: border-box;
        }
        
        .mypage-table>p {
            text-align: center;            
            padding-top: 50px;	
        }
        
        .mypage-table>p>a {
            text-decoration: none;
            color: #f49b00;
        }
        
        .mypage-table>p>a {
            text-decoration: none;
            color: #f49b00;
            font-weight: bolder;
        }

        /*표 첫번째 열*/
        .mypage-table>tbody>tr>td:first-child {
            width: 160px;
            height: 50px;
        }

        /*표 두번째 열*/
        .mypage-table>tbody>tr>td:last-child {
            width: 320px;
        }

        /*input 태그*/
        .mypage-input {
            width: 100%;
            height: 38px;
            outline: none;
            border: 1px solid #cccccc;
            border-radius: 5px;
            padding-left: 10px;
        }
        
        input[name='memberId'], input[name='memberName'], 
        input[name='memberRegDate'], input[name='memberPw'] {
        	background-color: #cccccc;
        }
        
        /*비밀번호 입력창 크기 변경*/
        input[name='memberPw'] {
        	width: 180px;
        }
        
        /*비밀번호 변경 버튼*/
        #changePw {
        	width: 125px;
            height: 38px;
            margin-left: 8px;
            border-radius: 5px;
            outline: none;
            border: none;
            background-color: #383a3f;
            color: white;
        }    
        
        .update-btn-td {
        	text-align: center;
            padding: 50px;
            padding-bottom: 80px;
        }

        /*수정하기 버튼*/
        input[type='submit'] {
            width: 220px;
            height: 50px;
            border-radius: 5px;
            outline: none;
            border: none;
            background-color: #383a3f;
            color: white;
            font-size: 1em;
        }

        .delete>a {
            text-decoration: none;
            color: black;
            font-weight: bolder;
        }

        .delete>a:hover {
            text-decoration: none;
            color: #f49b00;
            font-weight: bolder;
        }
        
        /*--------------------------------*/

        .data-table {
            margin: 0 auto;
            width: 750px;
            font-size: 14px;
        }

        .data-table>thead>tr>th {
            text-align: center;
        }

        .data-table>tbody>tr>td {
            text-align: center;
        }

        .data-table>thead>tr {
            background-color: #d3d3d3;
        }
        
        /*-----------------------------------*/
        
        #state {
            color: #f49b00;
        }
        
        #point>i {
        	color: #ffd56b;
    	}
    	
    	#link>a {
            color: #383a3f;
            text-decoration: underline;
        }
        
        #link>a:hover {
        	color: #383a3f;
            font-weight: bolder;
        }
        
        /*표 숨기기--------------------------*/
        .select {
        	display: none;
        }
        
        .btn-sm {
        	line-height: 1 !important;
        }
        
        .table td {
        	padding: .85rem !important;
        	vertical-align: middle !important;
        }
        
        .btn-dark:focus {
        	box-shadow: none !important;
        }
        
        .close:focus {
        	outline: none !important;
        }

    </style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
    <div class="content-wrap">
        <div class="mypage-header">
            <p class="mypage-title">MYPAGE</p>
            <p class="mypage-subtitle"><span>${m.memberName }</span>님 접속을 환영합니다.</p>
        </div>
        <div class="mypage-menu">
            <div class="menu-img">
                <a href="#" class="select-a" id="menu-img-a"><i class="far fa-calendar-alt icon"></i></a>
            </div>
            <div class="menu-text">
                <span>예약내역</span>
                <span class="num">(${cntRes })</span>
            </div>

            <div class="menu-img">
                <a href="#" class="select-a" id="menu-img-a"><i class="far fa-thumbs-up icon"></i></a>
            </div>
            <div class="menu-text">
                <span>후기내역</span>
                <span class="num">(${cntRev })</span>
            </div>

            <div class="menu-img">
                <a href="#" class="select-a" id="menu-img-a"><i class="fas fa-user-friends icon"></i></a>
            </div>
            <div class="menu-text">
                <span>거래내역</span>
                <span class="num">(${cntUsed })</span>
            </div>
        </div>

        <div class="mypage-table" id="info">
        	<!-- 비밀번호 변경 팝업창 -->
            <form name="changePw">
                <input type="hidden" name="memberNo" value="${m.memberNo }">
            </form>
            
            <form action="/updateMember.do" method="post">
            <input type="hidden" name="memberNo" id="memberNo" value="${m.memberNo }">
                <table class="mypage-table">
                    <tr>
                        <td>아이디</td>
                        <td>
                            <input type="text" name="memberId" id="memberId" class="mypage-input" value="${m.memberId }" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td>
                            <input type="password" name="memberPw" id="memberPw" class="mypage-input" value="" readonly>
                            <button type="button" id="changePw" onclick="change();">비밀번호 변경</button>
                        </td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td>
                            <input type="text" name="memberEmail" id="memberEmail" class="mypage-input" value="${m.memberEmail }">
                        	<span id="emailSpan"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td>
                            <input type="text" name="memberName" id="memberName" class="mypage-input" value="${m.memberName }" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>휴대폰</td>
                        <td>
                            <input type="text" name="memberPhone" id="memberPhone" class="mypage-input" value="${m.memberPhone }">
							<span id="phoneSpan"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>가입일</td>
                        <td>
                            <input type="text" name="memberRegDate" id="memberRegDate" class="mypage-input" value="${m.memberRegDate }" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;" class="update-btn-td">
                            <input type="submit" id="updateBtn" value="수정하기">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <span class="delete"><span>정말로 탈퇴하시겠어요?&nbsp;</span>
                            	<a href="javascript:void(0)" onclick="deleteMember(${m.memberNo })">회원탈퇴</a>
                            </span>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        
        <!-- 예약 내역 테이블 -->
        <div class="mypage-table select">
        <c:choose>
        	<c:when test="${empty listRes }"><!-- 예약내역이 없을 때 -->
        		<p>예약하신 내역이 없습니다.&nbsp;&nbsp;<a href="/campList.do?reqPage=1">지금 예약하러갈까요?</a></p>
        	</c:when>
        	
        	<c:otherwise><!-- 예약내역이 있을 때 -->
        		<table class="table table-bordered data-table">
            		<thead>
                		<tr>
                    		<th>캠핑장</th>
                        	<th>체크인 - 체크아웃</th>
                        	<th>금액</th>
                        	<th>상태</th>
                    	</tr>
                	</thead>
                	<tbody>
                		<c:forEach items="${listRes }" var="res">
                		<tr>
                    		<td id="link">
                    			<!-- <a href="/reserveUpdateFrm.do?reserveNo=${res.reserveNo}">${res.campName }</a> -->
                    			<span>${res.campName }&nbsp;</span>
								<button type="button" class="modalbtn btn btn-dark btn-sm"
										value="${res.reserveNo }" data-toggle="modal"
										data-target="#myModal" style="height: 28px; vertical-align: middel"
										onclick="reserveModal(${res.reserveNo},${res.campNo},${res.checkInDate })">확인</button>
                    		</td>
                        	<td>${res.checkInDate } - ${res.checkOutDate }</td>
                        	<td><fmt:formatNumber value="${res.reservePrice }" pattern="#,###" />원</td>
                        	<td id="state">${res.reserveStatus }</td>
                    	</tr>
                    	</c:forEach>
                	</tbody>
            	</table>
            </c:otherwise>
        </c:choose>
        </div>
        
        <!-- 후기 내역 테이블 -->
        <div class="mypage-table select">
        <c:choose>
        	<c:when test="${empty listRev }"><!-- 후기내역이 없을 때 -->
        		<p>작성하신 후기글이 없습니다.&nbsp;&nbsp;<a href="/reviewList.do?reqPage=1">지금 작성하러 갈까요?</a></p>
        	</c:when>
        	
        	<c:otherwise><!-- 후기내역이 있을 때 --> 
        		<table class="table table-bordered data-table">
            		<thead>
                		<tr>	
                    		<th>제목</th>
                        	<th>별점</th>
                        	<th>캠핑장</th>
                        	<th>작성일</th>
                    	</tr>
                	</thead>
                	<tbody>
                		<c:forEach items="${listRev }" var="rev">
                		<tr>
                    		<td id="link">
                    			<a href="/reviewView.do?reviewNo=${rev.reviewNo }&campNo=${rev.campNo }">
                    				${rev.reviewTitle }
                    			</a>
                    		</td>
                    		<td id="point">
                    		<c:forEach var="i" begin="0" end="4">
                				<c:choose>
                					<c:when test="${rev.reviewPoint  > i }">
                						<i class="fas fa-star"></i>
                					</c:when>
                					<c:otherwise>
                						<i class="far fa-star"></i>
                					</c:otherwise>
                				</c:choose>
                			</c:forEach>
                        	</td>
                        	<td>${rev.campName }</td>
                        	<td>${rev.reviewDate }</td>
                    	</tr>
                    	</c:forEach>
                	</tbody>
            	</table>
            </c:otherwise>
        </c:choose>    
        </div>
        
        <!-- 거래 내역 테이블 -->
        <div class="mypage-table select">
        <c:choose>
        	<c:when test="${empty listUsed }"><!-- 거래내역이 없을 때 -->
        		<p>작성하신 게시글이 없습니다.&nbsp;&nbsp;<a href="/usedPage.do?reqPage=1">지금 거래하러 갈까요?</a></p>
        	</c:when>
        	
        	<c:otherwise><!-- 거래내역이 있을 때 -->
        	        	        
        	<table class="table table-bordered data-table">
            	<thead>
                	<tr>
                    	<th>제목(상품명)</th>
                    	<th>카테고리</th>
                        <th>상품가격</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${listUsed }" var="used">
                	<tr>
                    	<td id="link">
                    		<a href="/usedDatail.do?usedNo=${used.usedNo }">${used.usedTitle }</a>
                    	</td>
                        <td>${used.category }</td>
                        <td>${used.usedPrice }원</td>
                        <td>${used.usedDate }</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            </c:otherwise>
         </c:choose>
        </div>
        
        <!-- 예약 확인 모달창 -->
        <div class="modal fade" id="myModal"
		style="z-index: 10000; padding: 0; margin: 0; top: 0; background-color: rgba(0, 0, 0, 0.5);">
			<div class="modal-dialog" style="top: 30%;">
				<div class="modal-content modal-dialog-centered" style="width:400px;">
					<form method="post" action="/searchOneReserve.do">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">예약 확인</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<!-- Modal body -->
						<input type="hidden" id="reserveNo" name="reserveNo" value=""> 
						<input type="hidden" id="campNo" name="campNo" value=""> 
						<input type="hidden" id="date" name="date" value="">
						<div class="modal-body">
							예약 암호 : <input type="text" id="modalPw" name="reservePw" required>
						</div>
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="submit" class="btn btn-dark">확인</button>
							<button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
               
    </div>
  
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
        $(function() {
            //입력양식 확인 check배열 생성
            var check = [true, true];
            
            //이메일 확인
            $("#memberEmail").change(function() {
                var reg = /^[a-z][a-z0-9_-]{3,12}@([a-z\d\.]+)\.([a-z]{2,6})$/;
                if (reg.test($(this).val())) {
                    check[0] = true;
                    $("#emailSpan").text("");
                    $("#memberEmail").css('border', '2px solid #1d0e0e');
                } else {
                    check[0] = false;
                    $("#emailSpan").text("입력예시) createacamp@email.com");
                    $("#emailSpan").css('color', 'red');
                    $("#memberEmail").css('border', '2px solid red');
                }
            });
            
            //휴대폰 확인
            $("#memberPhone").change(function() {
                var reg = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
                if (reg.test($(this).val())) {
                    check[1] = true;
                    $("#phoneSpan").text("");
                    $("#memberPhone").css('border', '2px solid #1d0e0e');
                } else {
                    check[1] = false;
                    $("#phoneSpan").text("입력예시) 010-1234-5678");
                    $("#phoneSpan").css('color', 'red');
                    $("#memberPhone").css('border', '2px solid red');
                }
            });
            
            //Submit 버튼
            $("#updateBtn").click(function(event) {
                var regChk = 0;
                for (var i = 0; i < check.length; i++) {
                    if (check[i] == true) {
                        regChk++;
                    }
                }
                
            	if (regChk < 2) {
                    alert("입력한 정보를 확인해주세요.");
                    event.preventDefault();
                } 
            });
        });
        
        //이미지 클릭시 관련 내역 표 생성
        $(".select-a").click(function() {
        	//인덱스 생성
        	var idx = $(".select-a").index(this);
        	//정보수정 테이블 숨기기
        	$("#info").hide();
        	//해당 되는 표 나타내기
        	$(".select").hide();
        	$(".select").eq(idx).show();
        });
        
    	//회원 탈퇴 버튼 클릭 했을 때
    	function deleteMember(memberNo) {
    		if(confirm("탈퇴 후에는 회원 정보를 복구할 수 없습니다. 정말 탈퇴하시겠어요?")) {
    			location.href="/deleteMember.do?memberNo="+memberNo;
    		}
    	}
    	
        //비밀번호 변경 팝업창
        function change() {
            var url = "/changePw.do"; //서블릿 url mapping 값
            var title = "changePw";
            var status = "left=400px, top=400px, width=520px, height=300px, menubar=no, status=no, scrollbars=yes";
            //비어있는 창 열어주기
            var popup = window.open("", title, status);
         	//숨겨둔 form name으로 가져오기
            var changePw = $("[name=changePw]");
            //popup창 - form태그 연결
            //target속성 : a태그에서  _blank로 하면 새창에서 열림
            changePw.attr("target", title);
            changePw.attr("action", url);
            changePw.submit();
        }
        
		//예약내역에서 확인버튼 클릭하면 모달창에 정보 넘겨주기
    	function reserveModal(reserveNo, campNo, date) {
			$("#reserveNo").val(reserveNo);
			$("#campNo").val(campNo);
			$("#date").val(date);		
    	}
		
    </script>

</body>
</html>