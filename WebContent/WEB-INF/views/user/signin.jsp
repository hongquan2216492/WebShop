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
		<a href="index.html" class="home"><i class="fas fa-arrow-left"></i> TRANG CHỦ</a>
	</div>
	<form:form action="signin.html" modelAttribute="user">
		<div class="text-center">
				<h3 style="color: #1abc9c; font-size: x-large;">Login</h3>
		</div>
		<div class="input">
			<form:errors path="username" />
			<form:input type="text" path="username"
				placeholder="Tên đăng nhập" required="required"
				pattern="([a-z]|[A-Z]|[0-9]){1,8}"
				oninvalid="this.setCustomValidity('Tên đăng nhập bao gồm 8 ký tự chữ, số!')"
				oninput="this.setCustomValidity('')"/>

		</div>
		<div class="input">
			<form:errors path="password" />
			<form:input type="password" path="password"
				placeholder="Mật khẩu" required="required"
				pattern="([a-z]|[A-Z]|[0-9]){1,8}"
				oninvalid="this.setCustomValidity('Mật khẩu bao gồm 8 ký tự chữ, số!')"
				oninput="this.setCustomValidity('')"/>
		</div>
		<div class="error">${msg}</div>
		<div class="btnn text-center">
			<button type="submit">Login</button>
		</div>
		<div class="text-center">
			<h3>Bạn chưa có tài khoản?</h3>
			<a href="signup.html" class="play-icon">Đăng ký ngay</a>
		</div>
	</form:form>

	<div class="clear"></div>
	<div class="copy">
		<p class="copy-right text-center">&copy; 2019</p>
	</div>
</body>
</html>