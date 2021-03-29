<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Mini Shop</title>
<base href="${pageContext.servletContext.contextPath}/">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<meta name="keywords"
	content="Goggles a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<style type="text/css">
*[id$=errors], .error {
	color: red;
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
<link href="css/discount-tag.css" rel='stylesheet' type='text/css' />
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/login_overlay.css" rel='stylesheet' type='text/css' />
<link href="css/style6.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/shop.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/checkout.css">
<link href="css/easy-responsive-tabs.css" rel='stylesheet'
	type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/all.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Pacifico&display=swap&subset=vietnamese"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,400i,700,700i&display=swap&subset=vietnamese"
	rel="stylesheet">
</head>

<body>
	<div class="banner-top container-fluid" id="home">
		<!-- header -->
		<jsp:include page="../header/header.jsp"></jsp:include>
		<!-- banner -->
		<div class="banner_inner">
			<div class="services-breadcrumb">
				<div class="inner_breadcrumb">

					<!-- <ul class="short">
						<li><a href="index.html">Trang chủ</a> <i>|</i></li>
						<li>Thông tin đơn mua</li>
					</ul> -->
				</div>
			</div>

		</div>
		<!--//banner -->
	</div>
	<!--// header_top -->
	<!--checkout-->
	<section class="banner-bottom-wthreelayouts py-lg-5 py-3">
		<div class="responsive_tabs" style="margin: 30px;">
			<div id="horizontalTab">
				<ul class="resp-tabs-list">
					<!-- <li>Tất cả</li> -->
					<li>Chờ xác nhận</li>
					<li>Đang giao</li>
					<li>Đã giao</li>
					<li>Đã huỷ</li>
				</ul>
				<div class="resp-tabs-container">
					
					<div class="tab2">
						<div class="container" style="margin: unset; padding: unset;">
							<c:forEach var="o" items="${orders}">
								<c:if test="${o.status == 0}">
									<div class="wrapper_top_shop" style="width: 107%">
									
										<div class="row">
											<div class="col-6">
												<h4>Mã đơn hàng: ${o.id}</h4>
											</div>
											<div class="col-6 text-right">
												<h4 style="color: #CEA285;">Chờ xác nhận</h4>
											</div>
										</div>
										<hr>
										<!-- <div> -->
										<c:set var="total" value="${0}"></c:set>
										<c:forEach var="ci" items="${o.cartItems}">
											<c:set var="total"
												value="${total + ci.unitPrice * ci.quantity}"></c:set>

											<span> <a href="single/${ci.product.id}.html"><img
													src="${ci.product.image}" class="cart-thumb image"
													alt="${ci.product.name}" /></a> <a
												href="single/${ci.product.id}.html">${ci.product.name}</a>
											</span>
											<span style="float: right;"> ${ci.quantity} <i> x
											</i> <fmt:formatNumber value=" ${ci.unitPrice}" type="number"
													pattern="###,###" /> đ
											</span>

											<hr>
										</c:forEach>
										<!-- </div> -->

										<div class="checkout-left row">
											<div class="col-md-7 checkout-left-basket">
												<h4>Thông tin đơn hàng</h4>

												<ul>
													<li>Ngày đặt: <span>${o.buyDate}</span></li>
													<li>Tên người nhận: <span>${o.name}</span></li>
													<li>Số điện thoại: <span>${o.phone}</span></li>
													<%-- <li>Email: <span>${o.email}</span></li> --%>
													<li>Địa chỉ: <span>${o.address}</span></li>
												</ul>
											</div>

											<div class="col-md-5 checkout-left-basket">
												<h4>Thông tin thanh toán</h4>

												<ul>
													<li>Tổng tiền hàng: <span><fmt:formatNumber
																value="${total}" type="number" pattern="###,###" /> đ</span></li>
													<li>Thuế VAT(10%) + PVC: <span><fmt:formatNumber
																value="${total * 0.12}" type="number" pattern="###,###" />
															đ</span></li>
													<li>Tổng tiền phải trả: <span
														style="font-size: large; color: #FF4E00;"><fmt:formatNumber
																value="${total + total*0.12}" type="number"
																pattern="###,###" /> đ</span></li>
													<li>Phương thức thanh toán: <span>${o.payment}</span></li>

												</ul>
											</div>
										</div>

										<div class="text-right">
											<a href="order/cancel/${o.id}.html"
												class="btn btn-sm animated-button victoria-three">Huỷ
												đơn hàng</a>
										</div>

									</div>
									<br>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="tab3">
						<div class="container" style="margin: unset; padding: unset;">
							<c:forEach var="o" items="${orders}">
								<c:if test="${o.status == 1}">
									<div class="wrapper_top_shop" style="width: 107%">

										<div class="row">
											<div class="col-6">
												<h4>Mã đơn hàng: ${o.id}</h4>
											</div>
											<div class="col-6 text-right">
												<h4>Đang giao</h4>
											</div>
										</div>
										<hr>

										<!-- <div> -->
										<c:set var="total" value="${0}"></c:set>
										<c:forEach var="ci" items="${o.cartItems}">
											<c:set var="total"
												value="${total + ci.unitPrice * ci.quantity}"></c:set>

											<span> <a href="single/${ci.product.id}.html"><img
													src="${ci.product.image}" class="cart-thumb image"
													alt="${ci.product.name}" /></a> <a
												href="single/${ci.product.id}.html">${ci.product.name}</a>
											</span>
											<span style="float: right;"> ${ci.quantity} <i> x
											</i> <fmt:formatNumber value=" ${ci.unitPrice}" type="number"
													pattern="###,###" /> đ
											</span>

											<hr>
										</c:forEach>
										<!-- </div> -->

										<div class="checkout-left row">
											<div class="col-md-7 checkout-left-basket">
												<h4>Thông tin đơn hàng</h4>

												<ul>
													<li>Ngày đặt: <span>${o.buyDate}</span></li>
													<li>Tên người nhận: <span>${o.name}</span></li>
													<li>Số điện thoại: <span>${o.phone}</span></li>
													<%-- <li>Email: <span>${o.email}</span></li> --%>
													<li>Địa chỉ: <span>${o.address}</span></li>
												</ul>
											</div>

											<div class="col-md-5 checkout-left-basket">
												<h4>Thông tin thanh toán</h4>

												<ul>
													<li>Tổng tiền hàng: <span><fmt:formatNumber
																value="${total}" type="number" pattern="###,###" /> đ</span></li>
													<li>Thuế VAT(10%) + PVC: <span><fmt:formatNumber
																value="${total * 0.12}" type="number" pattern="###,###" />
															đ</span></li>
													<li>Tổng tiền phải trả: <span
														style="font-size: large; color: #FF4E00;"><fmt:formatNumber
																value="${total + total*0.12}" type="number"
																pattern="###,###" /> đ</span></li>
													<li>Phương thức thanh toán: <span>${o.payment}</span></li>

												</ul>
											</div>
										</div>

										<div class="text-right">
											<a href="order/received/${o.id}.html"
												class="btn btn-sm animated-button victoria-three">Đã
												nhận hàng</a>
										</div>

									</div>
									<br>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="tab4">
						<div class="container" style="margin: unset; padding: unset;">
							<c:forEach var="o" items="${orders}">
								<c:if test="${o.status == 2}">
									<div class="wrapper_top_shop" style="width: 107%">

										<div class="row">
											<div class="col-6">
												<h4>Mã đơn hàng: ${o.id}</h4>
											</div>
											<div class="col-6 text-right">
												<h4 style="color: green;">Đã giao</h4>
											</div>
										</div>
										<hr>

										<!-- <div> -->
										<c:set var="total" value="${0}"></c:set>
										<c:forEach var="ci" items="${o.cartItems}">
											<c:set var="total"
												value="${total + ci.unitPrice * ci.quantity}"></c:set>

											<span> <a href="single/${ci.product.id}.html"><img
													src="${ci.product.image}" class="cart-thumb image"
													alt="${ci.product.name}" /></a> <a
												href="single/${ci.product.id}.html">${ci.product.name}</a>
											</span>
											<span style="float: right;"> ${ci.quantity} <i> x
											</i> <fmt:formatNumber value=" ${ci.unitPrice}" type="number"
													pattern="###,###" /> đ
											</span>

											<hr>
										</c:forEach>
										<!-- </div> -->

										<div class="checkout-left row">
											<div class="col-md-7 checkout-left-basket">
												<h4>Thông tin đơn hàng</h4>

												<ul>
													<li>Ngày đặt: <span>${o.buyDate}</span></li>
													<li>Tên người nhận: <span>${o.name}</span></li>
													<li>Số điện thoại: <span>${o.phone}</span></li>
													<%-- <li>Email: <span>${o.email}</span></li> --%>
													<li>Địa chỉ: <span>${o.address}</span></li>
												</ul>
											</div>

											<div class="col-md-5 checkout-left-basket">
												<h4>Thông tin thanh toán</h4>

												<ul>
													<li>Tổng tiền hàng: <span><fmt:formatNumber
																value="${total}" type="number" pattern="###,###" /> đ</span></li>
													<li>Thuế VAT(10%) + PVC: <span><fmt:formatNumber
																value="${total * 0.12}" type="number" pattern="###,###" />
															đ</span></li>
													<li>Tổng tiền phải trả: <span
														style="font-size: large; color: #FF4E00;"><fmt:formatNumber
																value="${total + total*0.12}" type="number"
																pattern="###,###" /> đ</span></li>
													<li>Phương thức thanh toán: <span>${o.payment}</span></li>

												</ul>
											</div>
										</div>

									</div>
									<br>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="tab5">
						<div class="container" style="margin: unset; padding: unset;">
							<c:forEach var="o" items="${orders}">
								<c:if test="${o.status == 3}">
									<div class="wrapper_top_shop" style="width: 107%">

										<div class="row">
											<div class="col-6">
												<h4>Mã đơn hàng: ${o.id}</h4>
											</div>
											<div class="col-6 text-right">
												<h4 style="color: red;">Đã huỷ</h4>
											</div>
										</div>
										<hr>

										<!-- <div> -->
										<c:set var="total" value="${0}"></c:set>
										<c:forEach var="ci" items="${o.cartItems}">
											<c:set var="total"
												value="${total + ci.unitPrice * ci.quantity}"></c:set>

											<span> <a href="single/${ci.product.id}.html"><img
													src="${ci.product.image}" class="cart-thumb image"
													alt="${ci.product.name}" /></a> <a
												href="single/${ci.product.id}.html">${ci.product.name}</a>
											</span>
											<span style="float: right;"> ${ci.quantity} <i> x
											</i> <fmt:formatNumber value=" ${ci.unitPrice}" type="number"
													pattern="###,###" /> đ
											</span>

											<hr>
										</c:forEach>
										<!-- </div> -->

										<div class="checkout-left row">
											<div class="col-md-7 checkout-left-basket">
												<h4>Thông tin đơn hàng</h4>

												<ul>
													<li>Ngày đặt: <span>${o.buyDate}</span></li>
													<li>Tên người nhận: <span>${o.name}</span></li>
													<li>Số điện thoại: <span>${o.phone}</span></li>
													<%-- <li>Email: <span>${o.email}</span></li> --%>
													<li>Địa chỉ: <span>${o.address}</span></li>
												</ul>
											</div>

											<div class="col-md-5 checkout-left-basket">
												<h4>Thông tin thanh toán</h4>

												<ul>
													<li>Tổng tiền hàng: <span><fmt:formatNumber
																value="${total}" type="number" pattern="###,###" /> đ</span></li>
													<li>Thuế VAT(10%) + PVC: <span><fmt:formatNumber
																value="${total * 0.12}" type="number" pattern="###,###" />
															đ</span></li>
													<li>Tổng tiền phải trả: <span
														style="font-size: large; color: #FF4E00;"><fmt:formatNumber
																value="${total + total*0.12}" type="number"
																pattern="###,###" /> đ</span></li>
													<li>Phương thức thanh toán: <span>${o.payment}</span></li>

												</ul>
											</div>
										</div>

										<div class="text-right">
											<a href="order/repurchase/${o.id}.html"
												class="btn btn-sm animated-button victoria-four">Mua lại
												lần nữa</a>
										</div>

									</div>
									<br>
								</c:if>
							</c:forEach>
						</div>
					</div>

				</div>
			</div>
		</div>

	</section>
	<!--//checkout-->
	<!--footer -->
	<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- //footer -->
	<!--jQuery-->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- newsletter modal -->
	<!--search jQuery-->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<script src="js/classie-search.js"></script>
	<script src="js/demo1-search.js"></script>
	<!--//search jQuery-->
	<!-- cart-js -->
	<script src="js/minicart.js"></script>
	<script>
		googles.render();

		googles.cart.on('googles_checkout', function(evt) {
			var items, len, i;

			if (this.subtotal() > 0) {
				items = this.items();

				for (i = 0, len = items.length; i < len; i++) {
				}
			}
		});
	</script>
	<!-- //cart-js -->
	<script>
		$(document).ready(function() {
			$(".button-log a").click(function() {
				$(".overlay-login").fadeToggle(200);
				$(this).toggleClass('btn-open').toggleClass('btn-close');
			});
		});
		$('.overlay-close1').on(
				'click',
				function() {
					$(".overlay-login").fadeToggle(200);
					$(".button-log a").toggleClass('btn-open').toggleClass(
							'btn-close');
					open = false;
				});
	</script>
	<!-- carousel -->
	<!-- easy-responsive-tabs -->
	<script src="js/easy-responsive-tabs.js"></script>
	<script>
		$(document).ready(function() {
			$('#horizontalTab').easyResponsiveTabs({
				type : 'default', //Types: default, vertical, accordion           
				width : 'auto', //auto or any width like 600px
				fit : true, // 100% fit in a container
				closed : 'accordion', // Start closed if in accordion view
				activate : function(event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#tabInfo');
					var $name = $('span', $info);
					$name.text($tab.text());
					$info.show();
				}
			});
			$('#verticalTab').easyResponsiveTabs({
				type : 'vertical',
				width : 'auto',
				fit : true
			});
		});
	</script>
	<!--quantity-->
	<script>
		$('.value-plus')
				.on(
						'click',
						function() {
							var divUpd = $(this).parent().find('.value'), newVal = parseInt(
									divUpd.text(), 10) + 1;
							divUpd.text(newVal);
						});

		$('.value-minus')
				.on(
						'click',
						function() {
							var divUpd = $(this).parent().find('.value'), newVal = parseInt(
									divUpd.text(), 10) - 1;
							if (newVal >= 1)
								divUpd.text(newVal);
						});
	</script>
	<!--quantity-->
	<!--close-->
	<script>
		$(document).ready(function(c) {
			$('.close1').on('click', function(c) {
				$('.rem1').fadeOut('slow', function(c) {
					$('.rem1').remove();
				});
			});
		});
	</script>
	<script>
		$(document).ready(function(c) {
			$('.close2').on('click', function(c) {
				$('.rem2').fadeOut('slow', function(c) {
					$('.rem2').remove();
				});
			});
		});
	</script>
	<script>
		$(document).ready(function(c) {
			$('.close3').on('click', function(c) {
				$('.rem3').fadeOut('slow', function(c) {
					$('.rem3').remove();
				});
			});
		});
	</script>
	<!--//close-->

	<!-- dropdown nav -->
	<script>
		$(".dropdown").hover(function() {
			$('.dropdown-menu', this).stop().slideDown(100);
		}, function() {
			$('.dropdown-menu', this).stop().slideUp(100);
		});
	</script>
	<!-- //dropdown nav -->
	<script src="js/move-top.js"></script>
	<script src="js/easing.js"></script>
	<script>
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 900);
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			/*
									var defaults = {
										  containerID: 'toTop', // fading element id
										containerHoverID: 'toTopHover', // fading element hover id
										scrollSpeed: 1200,
										easingType: 'linear' 
									 };
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!--// end-smoth-scrolling -->


	<script src="js/bootstrap.js"></script>
	<!-- js file -->
</body>

</html>