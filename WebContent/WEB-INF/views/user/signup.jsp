<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mini Shop</title>
<base href="${pageContext.servletContext.contextPath}/">
<style type="text/css">
/* body {
    background-image: url("images/backgroud.jpg");
    background-size: cover;
    background-repeat: no-repeat;
} */
.home {
	font-size: large;
	font-weight: bold;
	color: #828284;
}

.home:hover {
	color: #FF4E00;
}

::placeholder {
	opacity: 0.5;
}

*[id$=errors], .error {
	color: red;
	font-style: italic;
}

.success {
	color: green;
	font-style: italic;
}
</style>
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<link href="css/log.css" rel='stylesheet' type='text/css'
	media="all" />

</head>
<!-- This snippet uses Font Awesome 5 Free as a dependency. You can download it at fontawesome.io! -->


<body>
<br>
	<div class="text-center">
		<a href="index.html" class="home"><i class="fas fa-arrow-left"></i>
			TRANG CHỦ</a>
	</div>
<div class="error">${msg}</div>
<div class="success">${message}</div>
	<form:form action="signup.html" modelAttribute="user">
		<form:hidden path="id" />
		<%-- <form:hidden path="phone" />
		<form:hidden path="address" /> --%>
		<form:hidden path="roleId" value="0" />

		<div class="text-center">
				<h3 style="color: #1abc9c; font-size: x-large;">Sign Up</h3>
		</div>
		<div class="input">
			<form:errors path="username" />
			<form:input type="text" path="username"
				placeholder="Tên đăng nhập" required="required"								
				pattern="([a-z]|[A-Z]|[0-9]){1,8}"
				oninvalid="this.setCustomValidity('Tên tài khoản bao gồm 8 ký tự chữ, số!')"
				oninput="this.setCustomValidity('')" />
		</div>
		<div class="input">
			<form:errors path="password" />
			<form:input type="password" path="password"
				placeholder="Mật khẩu" required="required"								
				pattern="([a-z]|[A-Z]|[0-9]){1,8}"
				oninvalid="this.setCustomValidity('Mật khẩu bao gồm 8 ký tự chữ, số!')"
				oninput="this.setCustomValidity('')" />
		</div>

		<div class="input">
			<form:errors path="name" />
			<form:input type="text" path="name" placeholder="Họ và tên"
				required="required"			
				oninput="this.setCustomValidity('')" />
		</div>
		<div class="input">
			<form:errors path="email" />
			<form:input type="email" path="email" placeholder="Email"
				required="required"								
				pattern="^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$"
				oninvalid="this.setCustomValidity('Email sai định dạng!')"
				oninput="this.setCustomValidity('')" />
		</div>
		<div class="input">
			<form:errors path="phone" />
			<form:input type="text" path="phone" placeholder="Số điện thoại"
				required="required"								
				pattern="(03|05|07|08|09)+([0-9]{8})\b"
				oninvalid="this.setCustomValidity('Số điện thoại sai định dạng!')"
				oninput="this.setCustomValidity('')" />
		</div>
		<div class="input">
			<form:errors path="address" />
			<form:input type="text" path="address" placeholder="Địa chỉ"
				required="required"
				oninvalid="this.setCustomValidity('Địa chỉ không hợp lệ!')"
				oninput="this.setCustomValidity('')" />
		</div>

	<div class="btnn text-center">
		<button type="submit">Sign Up</button>
	</div>
	<div class="text-center">
		<h3>
			Bạn đã có tài khoản?
		</h3>
		<a href="signin.html" class="play-icon">Đăng nhập ngay</a>
	</div>
	<br>
</form:form>

	<div class="copy">
		<p class="copy-right text-center ">&copy; 2019</p>
	</div>
	<!--js working-->
	<script src='js/jquery-2.2.3.min.js'></script>
	<!--//js working-->
	<!-- <script>
		var password = document.getElementById("password"), confirm_password = document
				.getElementById("confirm_password");

		function validatePassword() {
			if (password.value != confirm_password.value) {
				confirm_password.setCustomValidity("Passwords Don't Match");
			} else {
				confirm_password.setCustomValidity('');
			}
		}

		password.onchange = validatePassword;
		confirm_password.onkeyup = validatePassword;
	</script>
	//scripts -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- //pop-up-box -->
	<script>
		$(document).ready(function() {
			$('.popup-with-zoom-anim').magnificPopup({
				type : 'inline',
				fixedContentPos : false,
				fixedBgPos : true,
				overflowY : 'auto',
				closeBtnInside : true,
				preloader : false,
				midClick : true,
				removalDelay : 300,
				mainClass : 'my-mfp-zoom-in'
			});

		});
	</script>
	<!-- //pop-up-box -->
</body>
</html>