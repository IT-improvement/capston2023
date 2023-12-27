<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Email Verification Pop-up</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Include jQuery -->
<style>
.key_ok, .key_already {
	display: none;
}
/* Add any additional styling for your pop-up window */
body {
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

#popupContainer {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 30px;
	text-align: center;
	width: 400px;
}

#popupContainer h1 {
	font-size: 24px;
	color: #333;
	margin-bottom: 20px;
}

#popupContainer p {
	font-size: 16px;
	color: #555;
	margin-bottom: 20px;
}

#popupContainer input {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 16px;
	margin-bottom: 20px;
}

#popupContainer button {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	border: none;
	border-radius: 4px;
	background-color: #2ecc71;
	color: #fff;
	cursor: pointer;
	font-size: 18px;
}

#popupContainer button:hover {
	background-color: #27ae60;
}
</style>
</head>
<body>
	<!-- Your pop-up content goes here -->
	<div id="popupContainer">
		<!-- Content of the pop-up window -->
		<h1>�̸��� ����</h1>
		<form action="${path}/" id="verificationForm">
			<input type="button" class="double_id" value="������ȣ ����"
				id="mail-Check-Btn" onclick="sendVerificationCode()"> <input
				class="form-control" name="verificationCode" type="text"
				placeholder="������ȣ" autocomplete="off" oninput="emailCertification()">
			<span class="key_ok">������ȣ�� ��ġ�մϴ�.</span> <span class="key_already">������ȣ��
				�ٽ� Ȯ�����ּ���.</span>
			<button type="submit" id="verificationButton" disabled>�����Ϸ�</button>
		</form>
	</div>

	<!-- JavaScript code to handle email verification -->
	<script>
        function sendVerificationCode() {
            var email = 'blackpin1927@gmail.com'; // Replace with the actual email
            $.ajax({
                type: 'GET',
                url: './mailCheck?email=' + email,
                success: function (data) {
                    console.log("data : " + data);
                    checkInput.attr('disabled', false);
                    code = data;
                    alert('������ȣ�� ���۵Ǿ����ϴ�.');
                },
                error: function (error) {
                    console.log("Error: " + error);
                }
            });
        }
        function emailCertification() {
		    var inputCode = $('input[name="verificationCode"]').val();
		    
		    if (inputCode !== "") {
		        if (inputCode === code) {
		            $('.key_ok').css("display", "inline-block");
		            $('.key_already').css("display", "none");
		            $('.key_ok').css("color","#3781E3");
		            
		        } else {
		            $('.key_ok').css("display", "none");
		            $('.key_already').css("display", "inline-block");
		            $('.key_already').css("color","red");
		            $('#verificationButton').prop('disabled', true);
		        }
		    } else {
		        $('.key_ok').css("display", "none");
		        $('.key_already').css("display", "none");
		        $('#verificationButton').prop('disabled', true);
		    }
		}
    </script>
</body>
</html>
