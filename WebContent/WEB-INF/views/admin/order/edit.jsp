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


			<div id="insertItemForm">
				<form:form action="admin/order/edit/insertItem.html"
					modelAttribute="orderItem">
					<form:hidden path="id" />
					<form:hidden path="cart.id" />
					<%-- <form:hidden path="product" /> --%>
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Sản phẩm</th>
								<th>Số lượng</th>
								<th>Đơn giá</th>
								<th>Thành tiền</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><form:select path="product.id" class="form-control"
										required="required"
										oninvalid="this.setCustomValidity('Vui lòng chọn sản phẩm!')"
										onchange="setCustomValidity('')" id="productList">
										<option label="Thêm sản phẩm vào đơn hàng..." hidden />
										<c:forEach var="p" items="${allProducts}">
											<fmt:parseNumber var="var" integerOnly="true" type="number"
												value="${p.price - p.price * p.discount}" />
											<option value="${p.id}" label="${p.name}" data-price="${var}" />
										</c:forEach>
									</form:select></td>
								<td><form:input path="quantity" id="qty" value="1"
										type="number" min="1" /></td>
								<td><form:input path="unitPrice" id="uPrice" value=""
										type="number" min="0" /></td>
								<td><label id="tPrice"></label></td>
								<td><form:button type="submit" class="btn btn-primary"
										id="insertItemButton">
										<i class="fas fa-plus"></i>
									</form:button></td>
							</tr>

							<c:set var="total" value="${0}"></c:set>
							<c:forEach var="ci" items="${listOrderItem}">
								<c:set var="total" value="${total + ci.unitPrice * ci.quantity}"></c:set>
								<tr>
									<td><span> <a href="single/${ci.product.id}.html"><img
												src="${ci.product.image}" class="cart-thumb image"
												alt="${ci.product.name}" /></a> <a
											href="single/${ci.product.id}.html">${ci.product.name}</a>
									</span></td>
									<td>${ci.quantity}</td>
									<td><fmt:formatNumber value="${ci.unitPrice}"
											type="number" pattern="###,###" /> đ</td>
									<td><fmt:formatNumber
											value="${ci.unitPrice * ci.quantity}" type="number"
											pattern="###,###" /> đ</td>

									<td><a
										href="admin/order/edit/deleteItem/${ci.product.id}.html"
										class="btn btn-primary"><i class="fas fa-trash-alt"></i></a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</form:form>

				<div>
					<ul style="list-style: none;">
						<li>Tổng tiền hàng: <span><fmt:formatNumber
									value="${total}" type="number" pattern="###,###" /> đ</span></li>
						<li>Thuế VAT(10%) + PVC: <span><fmt:formatNumber
									value="${total * 0.12}" type="number" pattern="###,###" /> đ</span></li>
						<li>Tổng tiền phải trả: <span
							style="font-size: large; color: #FF4E00;"><fmt:formatNumber
									value="${total + total*0.12}" type="number" pattern="###,###" />
								đ</span></li>
						<li>Phương thức thanh toán: <label id="paymentLabel">${order.payment}</label></li>

					</ul>
				</div>
			</div>
			<hr>
			<h3>Thông tin người nhận</h3>
			<br>
			<form:form action="admin/order/edit/${id}.html" id="editForm"
				modelAttribute="order" method="post">

				<form:hidden path="id" />
				<form:hidden path="status" />
				<form:hidden path="user.id" />
				<form:hidden path="buyDate" />

				<div class="form-row">
					<div class="form-group col-md-4">
						<label>Tên người nhận: </label>
						<form:input path="name" value="${name}" class="form-control"
							maxlength="50" required="required" />
					</div>
					<div class="form-group col-md-4">
						<label>Số điện thoại: </label>
						<form:input path="phone" value="${phone}" type="tel"
							class="form-control" required="required"
							pattern="(03|05|07|08|09)+([0-9]{8})\b"
							oninvalid="this.setCustomValidity('Số điện thoại sai định dạng!')"
							oninput="this.setCustomValidity('')" />
					</div>
					<div class="form-group col-md-4">
						<label>Email: </label>
						<form:input path="email" value="${email}" class="form-control"
							type="email" required="required"
							pattern="^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$"
							oninvalid="this.setCustomValidity('Email sai định dạng!')"
							oninput="this.setCustomValidity('')" />

					</div>
				</div>
				<div class="form-row">

					<div class="form-group col-md-4">
						<label>Địa chỉ: </label>
						<form:input path="address" value="${address}" type="text"
							class="form-control" required="required" />
					</div>
					<div class="form-group col-md-4">
						<label>Phương thức thanh toán: </label>
						<form:select path="payment" class="form-control" id="paymentList">
							<option value="COD" label="COD (Thanh toán khi nhận hàng)"
								${order.payment == 'COD' ? 'selected' : ''} />
							<option value="VISA"
								label="VISA/Master Card (Thanh toán quốc tế)"
								${order.payment == 'VISA' ? 'selected' : ''} />
							<option value="IB" label="Internet Banking (Ngân hàng điện tử)"
								${order.payment == 'IB' ? 'selected' : ''} />
							<option value="PAYPAL" label="PAYPAL"
								${order.payment == 'PAYPAL' ? 'selected' : ''} />
						</form:select>
					</div>
					<div class="form-group col-md-4">
						<label>Ghi chú: </label>
						<form:input path="note" value="${note}" type="text"
							class="form-control" />
					</div>

				</div>
				<div class="text-right">
					<button class="btn btn-primary" type="submit" id="submitButton"
						onclick="return confirm('Bạn có chắc chắn sửa đơn hàng?')">Sửa</button>
				</div>
			</form:form>

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
	<!-- realtime price, payment -->
	<script type="text/javascript">
		var productList = document.getElementById("productList");
		var qty = document.getElementById("qty");
		var uPrice = document.getElementById("uPrice");
		var tPrice = document.getElementById("tPrice");

		productList.onchange = function(event) {
			uPrice.value = Math
					.ceil(event.target.options[event.target.selectedIndex].dataset.price);
			//uPrice.value = event.target.options[event.target.selectedIndex].dataset.price;
			tPrice.textContent = Math.ceil(
					parseInt(uPrice.value) * parseInt(qty.value)).toFixed(0)
					.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
					+ ' đ';
		};
		qty.oninput = function() {
			tPrice.textContent = Math.ceil(
					parseInt(uPrice.value) * parseInt(qty.value)).toFixed(0)
					.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
					+ ' đ';
		};
		uPrice.oninput = function() {
			tPrice.textContent = Math.ceil(
					parseInt(uPrice.value) * parseInt(qty.value)).toFixed(0)
					.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
					+ ' đ';
		};

		var paymentList = document.getElementById("paymentList");
		var paymentLabel = document.getElementById("paymentLabel");
		paymentList.onchange = function(event) {
			paymentLabel.textContent = event.target.options[event.target.selectedIndex].value;
		};
	</script>
	<!-- realtime price -->
	<!-- submit button outside form -->
	<!-- 	<script type="text/javascript">
		$(document).ready(function() {
			$("#submitButton").click(function() {				
				$("#editForm").submit();
			});
		});
	</script> -->
	<!-- submit button outside form -->

	<!-- confirm before close, switch tab -->
	<!-- <script>
		window.onbeforeunload = function(e) {
			return 'Dialog text here.';
		};
	</script> -->

	<!-- confirm before close, switch tab -->
	<!-- ajax -->
	<!-- <script type="text/javascript">
	
		$('#insertItemButton').click(
				function() {
				$.ajax({
					url : 'listOrderItem.html',
					type : 'GET',
					async : true,
					data : {},
					success : function(data) {
						//data shoud be rendered jsp with model from the controller  
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR + " : " + textStatus + " : " + errorThrown);
					}
				});
				});
	</script> -->
	<!-- ajax -->

</body>
</html>