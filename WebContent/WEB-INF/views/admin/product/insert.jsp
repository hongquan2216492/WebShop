<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Mini Shop</title>
<base href="${pageContext.servletContext.contextPath}/">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Glance Design Dashboard Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">

	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<link href="css/discount-tag.css" rel='stylesheet' type='text/css' />
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />

<!-- Custom CSS -->
<link href="css/style-admin.css" rel='stylesheet' type='text/css' />

<!-- font-awesome icons CSS -->
<link href="css/all.css" rel="stylesheet">
<!-- //font-awesome icons CSS-->

<!-- side nav css file -->
<link href='css/SidebarNav.min.css' media='all' rel='stylesheet'
	type='text/css' />
<!-- //side nav css file -->

<!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>

<!--webfonts-->
<link
	href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,latin-ext"
	rel="stylesheet">
<!--//webfonts-->

<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->


</head>
<body class="cbp-spmenu-push">
	<div class="main-content">
		<jsp:include page="../left-sidebar-header.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="main-page"></div>
			<!-- content -->
			<div class="error">${msg}</div>
			<div class="success" style="">${message}</div>

			<form:form action="admin/product/insert.html"
				modelAttribute="product" enctype="multipart/form-data" method="post">
				<div class="form-group">
					<label>Loại sản phẩm: </label>
					<form:select path="category.cateId" class="form-control">
						<c:forEach var="c" items="${allCategories}">
							<option value="${c.cateId}">${c.cateName}</option>
						</c:forEach>
					</form:select>
				</div>

				<form:hidden path="id" />
				<form:hidden path="display" value="true" />
				<div class="form-group">
					<label>Hình sản phẩm: </label>
					<div>
						<img alt="${product.name}" src="${product.image}"
							class="cart-thumb">
					</div>
					<input type="file" name="photo" accept="image/*"
						value="/${product.image}" />
					<form:hidden path="image" value="images/product-image/default.jpg" />
				</div>

				<div class="form-group">
					<label>Tên sản phẩm: </label>
					<form:input path="name" class="form-control" maxlength="255" />
				</div>
				<div class="form-group">
					<label>Giá sản phẩm: </label>
					<form:input path="price" class="form-control" type="number" min="0"
						required="required" />
				</div>
				<div class="form-group">
					<label>Giảm giá: </label>
					<form:input path="discount" class="form-control"
						aria-describedby="discountHelp" type="number" min="0" max="1"
						step="0.01" required="required"
						oninvalid="this.setCustomValidity('Giảm giá không hợp lệ! (0 - 1)')"
						oninput="this.setCustomValidity('')" />
					<small id="discountHelp" class="form-text text-muted">25% =
						0.25,...</small>
				</div>
				<div class="form-group">
					<label>Mô tả: </label>
					<form:textarea path="description" class="form-control" rows="5"
						maxlength="2000" />
				</div>
				<div class="form-group">
					<label>Thông tin: </label>
					<form:textarea path="information" class="form-control" rows="5"
						maxlength="2000" />
				</div>

				<div>
					<form:button class="btn btn-primary" type="submit">Thêm</form:button>
				</div>

			</form:form>
			<div class="text-right">
				<a href="single/${product.id}.html" target="_blank"><i
					class="fas fa-eye"></i> Xem trước</a>
			</div>

			<!-- content -->
		</div>
	</div>


	<!--scrolling js-->
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!--//scrolling js-->

	<!-- side nav js -->
	<script src='js/SidebarNav.min.js' type='text/javascript'></script>
	<script>
		$('.sidebar-menu').SidebarNav()
	</script>
	<!-- //side nav js -->

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js">
		
	</script>
	<!-- //Bootstrap Core JavaScript -->

</body>
</html>