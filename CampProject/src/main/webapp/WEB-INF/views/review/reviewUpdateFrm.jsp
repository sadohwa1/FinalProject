<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑후기 | 수정하기</title>
<!-- Google Fonts-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- BOOTETRAP -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Font Awesome-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!-- ckeditor -->
<script type="text/javascript" src="../js/ckeditor/ckeditor.js" ></script>

    <style>
        * {
            font-family: 'Noto Sans KR';
            box-sizing: border-box;
        }

        .content-wrap {
            width: 1000px;
            margin: 0 auto;
        }

        .review-title {
            padding-top: 30px;
            padding-bottom: 20px;
            margin-bottom: 20px;
            border-bottom: 2px solid #383a3f;
        }
        
        .review-title-text {
        	font-weight: bolder;
        }

        .review-button {
            text-align: center;
            padding-top: 30px;
            padding-bottom: 30px;
        }

        #updateBtn {
            background-color: #f49b00;
            color: white;
            width: 100px;
        }

        input[name='memberId'] {
            width: 200px;
        }
        
        input[name='reserveNo'] {
            width: 200px;
            margin-right: 10px;
            display: inline-block;
        }
        
        #star {
        	color: #ffd56b;
        }
        
        /*------------------------------*/
            
        
        #required {
        	color: #f49b00;
        }
        
        #point-value {
        	color: dimgray;
        	font-size: 13px;
        }
        
        /*-------------------------------*/
        
        .form-control:focus {
			border-color: #ced4da !important;
        	outline: 0 none !important;
        	box-shadow: none !important;
        }
        
        .btn:focus {
        	outline: 0 none !important;
        	box-shadow: none !important;
        }
        
        .delFileDiv {
        	margin-top: 5px;
        	margin-bottom: 5px;
        }
        
	</style>
	
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div class="content-wrap">
        <div class="review-title">
            <h2 class="review-title-text">후기 수정하기</h2>
        </div>
        <div class="review-table">
            
            <form action="/updateReview.do" method="post" enctype="multipart/form-data" onsubmit="delFileTest()">
            	<input type="hidden" name="reviewNo" id="reviewNo" value="${rev.reviewNo }">
                <table class="table table-bordered">
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="reviewTitle" id="reviewTitle" value="${rev.reviewTitle }" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>
                        	<input type="text" name="memberId" value="${sessionScope.m.memberId }" class="form-control" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>예약번호</td>
                        <td>
                        	<input type="text" value="${rev.reserveNo }" name="reserveNo" id="reserveNo" class="form-control" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>별점</td>
                        <td>
                        	<input type="hidden" value="${rev.reviewPoint }" name="reviewPoint" id="reviewPoint" class="point">
							<c:forEach var="i" begin="0" end="4">
         						<c:choose>
									<c:when test="${rev.reviewPoint  > i }">
										<i class="fas fa-star point-mark" id=star></i>
									</c:when>
									<c:otherwise>
										<i class="far fa-star point-mark" id=star></i>
									</c:otherwise>
            					</c:choose>
          					</c:forEach>  
                        </td>
                    </tr>
                    <tr>
                        <td>첨부파일</td>
                        <td>
                        	<!-- 파일 삭제되면 delFileList에 fileNo 배열로 담기-->
                        	<input type="hidden" name="delFileList" class="delFileNo">
							<input type="hidden" id="status" name="status" value="stay">
							<c:choose>
								<c:when test="${!empty rev.fileList }"><!-- 첨부파일이 존재할 때 -->
									<input type="file" name="files" id="isFile" accept="image/*" multiple><br>
									<c:forEach items="${rev.fileList }" var="f">
										<div class="delFileDiv">
											<span class="delFileSpan">${f.filename }</span>
											<button type="button" id="fileDelBtn" class="btn btn-dark btn-sm delFileBtn" onclick="delFileListAdd('${f.filepath}')">삭제</button>
										</div>										
									</c:forEach>
								</c:when>
								
								<c:otherwise><!-- 첨부파일이 존재하지 않을 때 -->
									<input type="file" name="files" id="isFile" accept="image/*" multiple>
								</c:otherwise>
							</c:choose>			
                        </td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td>
                        	<textarea rows="20" cols="50" name="reviewContent" id="reviewContent" class="form-control">${rev.reviewContent }</textarea>
                        </td>
                    </tr>
                </table>
                <div class="review-button">
                    <button type="submit" class="btn" id="updateBtn">수정완료</button>
                </div>
            </form>
        </div>
    </div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
		$(function() {
	        //Submit 버튼
	        $("#updateBtn").click(function(event) {	        	
	        	var reviewTitle = $("#reviewTitle").val();
	        	var reviewContent = $("#reviewContent").val();
	        	var reviewContentCk = CKEDITOR.instances.reviewContent.getData();
        	
	        	if(reviewTitle == "" || reviewContentCk == "") {
	                alert("*는 필수 입력 항목입니다.");
	                event.preventDefault();
	        	} else {
		    		//이미지 파일만 등록가능하도록 유효성 검사
		    		var imgFile = $('#isFile').val();
		    		var fileForm = /(.*?)\.(jpg|JPG|jpeg|JPEG|png|PNG|gif|GIF|bmp|BMP)$/;
		    		
		    		if(imgFile != "") {
		    		    if(!imgFile.match(fileForm)) {
		    		    	alert("이미지 파일만 업로드 가능합니다.");
		    		    	event.preventDefault();
		    		    }
		    		}
	        	}
	        })
		 });
		
		//삭제된 파일 리스트를 담을 배열 생성
		var delList = new Array();
		
		//삭제 버튼을 클릭하면 만들어둔 배열에 file값 push
		function delFileListAdd(delFilepath) {
			delList.push(delFilepath);
			console.log(delList);
		}
		
		//숨겨둔 input-hidden에 값 넣기
		function delFileTest() {
			$("[name=delFileList]").val(delList.join("/"));		
		}
		
		$(".delFileBtn").click(function() {
			var idx = $(".delFileBtn").index(this);

			if (confirm('첨부파일을 삭제하시겠습니까?')) {
				$(".delFileSpan").eq(idx).hide();
				$(".delFileBtn").eq(idx).hide();
				$("#status").val('delete');
			};
		});
			
		//별 클릭하면 채워진 별 이미지로 변경하는 이벤트
		//한번만 클릭되고 다음부터는 안되는 문제가 있었음
		//-> $(document).on 페이지가 로드 될때 계속 새로운 클래스로 생성
		$(document).on("click", ".point-mark", function() {
			mark = $(".point-mark");
			idx = $(".point-mark").index(this);
			mark.removeClass("fas fa-star");
			mark.removeClass("far fa-star");
			mark.each(function(index, item) {
				if (index <= idx) {
					$(item).addClass("fas fa-star");
				} else {
					$(item).addClass("far fa-star");
				}
			});
			//input val에 숫자로 값 넣어주기
			$(".point").val((idx + 1));
			console.log($(".point").val());
		});
		
		//id가 reviewContent인 태그에 ckeditor를 적용시킴
		//이미지 업로드 불가
		CKEDITOR.replace('reviewContent', {
			height: 500
		});
			
	</script>

</body>
</html>