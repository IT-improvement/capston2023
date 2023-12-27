<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>코딩포차</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f8f9fa;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.main-content {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 600px;
	overflow: hidden;
	margin: auto; /* 가운데 정렬을 위해 추가 */
}

.form-message, .user-message {
	padding: 40px;
	box-sizing: border-box;
}

.splash-description {
	font-size: 24px;
	font-weight: bold;
	color: #2cc185;
	display: block;
	text-align: center;
	margin: 0 0 20px;
}

.form-group {
	margin-bottom: 20px;
}

input[type="text"], input[type="password"], input[type="button"], input[type="submit"]
	{
	width: calc(100% - 20px);
	padding: 10px;
	border: 1px solid #ced4da;
	border-radius: 5px;
	margin-top: 5px;
	box-sizing: border-box;
	display: inline-block;
}

input[type="button"], input[type="submit"] {
	cursor: pointer;
	background-color: #2cc185;
	color: #fff;
	transition: background-color 0.3s ease;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #0056b3;
}

.form-group select {
	width: calc(100% - 20px);
	padding: 10px;
	border: 1px solid #ced4da;
	border-radius: 5px;
	margin-top: 5px;
	box-sizing: border-box;
}

.conditions {
	color: #6c757d;
	margin-top: 20px;
	text-align: center;
}

.contact {
	margin-top: 20px;
	color: #6c757d;
	text-align: center;
}

.sign-up-submit {
	text-align: center;
}

.submit_button {
	display: inline-block;
	padding: 12px 20px;
	font-size: 16px;
	font-weight: bold;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.id_ok, .id_already, .key_ok, .key_already {
	display: none;
}
</style>
</head>

<body class="mai-splash-screen">
	<form action="${path}/createAccountConfirm" method="post"
		class="sign-up-form" id="userInfo" name="userInfo"
		onsubmit="return checkValue();">
		<div class="main-content container">
			<div class="splash-container row">
				<div class="col-md-6 form-message">
					<span class="splash-description mt-4 mb-4">회원가입</span>
					<div class="form-group">
						<input type="text" id="id" name="id" placeholder="아이디"
							oninput="checkId()"> <span class="id_blank">아이디를
							입력하세요</span> <span class="id_ok">사용 가능한 아이디입니다.</span> <span
							class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="userEmail1"
							id="userEmail1" placeholder="이메일"> <select
							class="form-control" name="userEmail2" id="userEmail2">
							<option>@naver.com</option>
							<option>@daum.net</option>
							<option>@gmail.com</option>
							<option>@hanmail.com</option>
							<option>@yahoo.co.kr</option>
						</select> <input type="button" class="double_id" value="인증번호 전송"
							id="mail-Check-Btn" onclick="sendVerificationCode()"> <input
							class="form-control" name="verificationCode" type="text"
							placeholder="인증번호" autocomplete="off" oninput="emailCertification()">
							<span class="key_blank">인증번호를 입력하세요.</span> <span class="key_ok">인증번호가 일치합니다.</span> <span
							class="key_already">인증번호를 다시 확인해주세요.</span>
					</div>
					<div class="form-group inline row">
						<div class="col-sm-6">
							<input class="form-control" name="pwd" type="password"
								placeholder="비밀번호">
						</div>
						<div class="col-sm-6">
							<input class="form-control" name="checkpwd" type="password"
								placeholder="비밀번호 확인">
						</div>
					</div>
					<div class="form-group">
						<input class="form-control" name="phoneNum" type="text"
							placeholder="핸드폰번호" autocomplete="off">
					</div>
					<div class="form-group">
						<input class="form-control" name="zipcode" id="zipcode"
							type="text" placeholder="우편번호" readonly> <input
							type="button" class="double_id" id="" name="" value="우편번호"
							onclick="openZipSearch()">
					</div>
					<div class="form-group">
						<input class="form-control" name="address_1" id="address-1"
							type="text" placeholder="주소" readonly>
					</div>
					<div class="form-group">
						<input class="form-control" name="address_2" id="address-2"
							type="text" placeholder="상세주소" autocomplete="off">
					</div>
					<div class="form-group">
						<select name="question" id="question" class="form-control">
							<option value="------선택하세요------">------선택하세요------</option>
							<option value="내가 아끼는 1순위는?">내가 아끼는 1순위는?</option>
							<option value="내가 졸업한 초등학교는?">내가 졸업한 초등학교는?</option>
						</select>
					</div>
					<div class="form-group">
						<input class="form-control" name="answer" id="answer" type="text"
							placeholder="답변" autocomplete="off">
					</div>
					<p class="contact mt-4">
						일행이 있으신가요?<a href="${path}/loginGo">로그인하러가기</a>
					</p>
					<div class="form-group sign-up-submit">
						<button type="submit" class="submit_button">회원가입</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<script src="${path}/resources/assets/lib/jquery/jquery.min.js"
		type="text/javascript"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		let checkingId = false;
		let isIdValid = false;
		let isKey = false;
		var code="";
		
		function sendVerificationCode() {
			var email = $('#userEmail1').val() + $('#userEmail2').val();
			var checkInput = $('.mail-check-input');
			$.ajax({
				type: 'GET',
				url: './mailCheck?email=' + email, /*url을 통해 데이터를 보낼 수 있도록 GET방식, url명을 "mailCheck"로 지정 */
				data: email,
				success: function(data) {
					console.log("data : " + data);
					checkInput.attr('disabled', false); /*데이터가 성공적으로 들어오면 인증번호 입력란이 활성화되도록*/
					code = data;
					alert('인증번호가 전송되었습니다.')
				},

			}
			);
		}
		
		function emailCertification() {
		    var inputCode = $('input[name="verificationCode"]').val();
		    
		    if (inputCode !== "") {
		        if (inputCode === code) {
		            $('.key_blank').css("display", "none");
		            $('.key_ok').css("display", "inline-block");
		            $('.key_already').css("display", "none");
		            $('.key_ok').css("color","#3781E3");
		            isKey = true;
		        } else {
		            $('.key_blank').css("display", "none");
		            $('.key_ok').css("display", "none");
		            $('.key_already').css("display", "inline-block");
		            $('.key_already').css("color","red");
		            isKey = false;

		        }
		    } else {
		        $('.key_blank').css("display", "inline-block");
		        $('.key_ok').css("display", "none");
		        $('.key_already').css("display", "none");
	            isKey = false;

		    }
		}

		function checkId() {
			if (checkingId) {
				return;
			}

			var id = $('#id').val();

			// 추가된 부분: 아이디를 입력하지 않았을 때
			if (id.length === 0) {
				$('.id_blank').css("display", "inline-block");
				$('.id_ok').css("display", "none");
				$('.id_already').css("display", "none");
				isIdValid = false; // 아이디가 유효하지 않음
				return;
			}

			checkingId = true;

			$.ajax({
				url : './idCheck',
				type : 'post',
				data : {
					id : id
				},
				success : function(cnt) {
					if (cnt == 0) {
						$('.id_blank').css("display", "none");
						$('.id_ok').css("display", "inline-block");
						$('.id_already').css("display", "none");
						isIdValid = true;
					} else {
						$('.id_blank').css("display", "none");
						$('.id_ok').css("display", "none");
						$('.id_already').css("display", "inline-block");
						isIdValid = false;
					}
				},
				error : function() {
					checkingId = false;
				},
				complete : function() {
					checkingId = false;
				}
			});
		}

		function openZipSearch() {
			new daum.Postcode({
				oncomplete : function(data) {
					document.getElementById('zipcode').value = data.zonecode;
					document.getElementById('address-1').value = data.address;
					document.getElementById('address-2').focus();
				}
			}).open();
		}

		function inputIdChk() {
			document.userInfo.idDuplication.value = "idUncheck";
		}

		function checkValue() {
		    var inputCode = $('input[name="verificationCode"]').val();
			var frm = document.forms['userInfo'];
			var id = frm.elements['id'].value;
			var pwd = frm.elements['pwd'].value;
			var checkpwd = frm.elements['checkpwd'].value;
			var phoneNum = frm.elements['phoneNum'].value;
			var email = frm.elements['userEmail1'].value;
			var zip_code = frm.elements['zipcode'].value;
			var address_1 = frm.elements['address_1'].value;
			var address_2 = frm.elements['address_2'].value;
			var question = frm.elements['question'].value;
			var answer = frm.elements['answer'].value;
			if (id.length == 0 || id == "") {
				alert("아이디를 입력하세요");
				frm.id.focus();
				return false;
			} else if (email.length == 0 || email == "") {
				alert("이메일을 입력하세요");
				frm.email.focus();
				return false;
			} else if (pwd.length == 0 || pwd == "") {
				alert("비밀번호를 입력하세요");
				frm.pwd.focus();
				return false;
			} else if (checkpwd.length == 0 || checkpwd == "") {
				alert("비밀번호 확인을 입력하세요");
				frm.checkpwd.focus();
				return false;
			} else if (pwd != checkpwd) {
				alert("비밀번호가 일치하지 않습니다");
				frm.checkpwd.focus();
				return false;
			} else if (phoneNum.length == 0 || phoneNum == "") {
				alert("헨드폰번호를 입력하세요");
				frm.phoneNum.focus();
				return false;
			} else if(inputCode !== code || inputCode == ""){
				alert("인증번호를 확인해주세요");
				return false;
			} else if (address_1.length == 0 || address_1 == "") {
				alert("주소를 입력하세요");
				frm.address_1.focus();
				return false;
			} else if (zip_code.length == 0 || zip_code == "") {
				alert("우편번호를 입력하세요");
				frm.zipcode.focus();
				return false;
			} else if (address_2.length == 0 || address_2 == "") {
				alert("상세주소를 입력하세요");
				frm.address_2.focus();
				return false;
			} else if (question == "------선택하세요------") {
				alert("질문을 선택하세요");
				frm.question.focus();
				return false;
			} else if (answer.length == 0 || answer == "") {
				alert("답변을 입력하세요");
				frm.answer.focus();
				return false;
			} else if (!isIdValid) {
				alert("아이디 중복 확인이 필요합니다. 유효한 아이디를 입력하세요.");
				return false;
			}else if (!isKey) {
				alert("인증번호를 확인해주세요.");
				return false;
			}

			return true;
		}
	</script>
</body>
</html>