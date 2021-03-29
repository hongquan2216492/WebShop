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

					<ul class="short">
						<li><a href="index.html">Trang chủ</a> <i>|</i></li>
						<li>Giỏ hàng</li>
					</ul>
				</div>
			</div>

		</div>
		<!--//banner -->
	</div>
	<!--// header_top -->
	<!--checkout-->
	<section class="banner-bottom-wthreelayouts py-lg-5 py-3">
		<div class="container">
			<c:choose>
				<c:when test="${totalItem == 0 }">
					<div class="text-center">
						<h3 class="tittle-w3layouts my-lg-4 mt-3 text-center">Giỏ
							hàng trống!</h3>
						<br> <a href="shop/1.html"
							class="btn btn-sm animated-button victoria-three">Mua sắm
							ngay</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="inner-sec-shop px-lg-4 px-3">
						<h3 class="tittle-w3layouts my-lg-4 mt-3">Giỏ hàng</h3>
						<form:form action="checkout.html" modelAttribute="cart">
							<div class="checkout-right">
								<h4>
									Giỏ hàng của bạn có: <span>${totalItem} Sản phẩm</span>
								</h4>
								<table class="timetable_sub">
									<thead>
										<tr>
											<th>STT</th>
											<th>Hình ảnh</th>
											<th>Số lượng</th>
											<th>Tên sản phẩm</th>
											<th>Đơn giá</th>
											<th>Thành tiền</th>
											<th>Xoá</th>
										</tr>
									</thead>
									<tbody>


										<c:forEach var="i" varStatus="status"
											items="${cart.cartItems}">
											<form:hidden path="cartItems[${status.index}].id" />
											<form:hidden path="cartItems[${status.index}].unitPrice" />
											<form:hidden path="cartItems[${status.index}].product.id" />
											<form:hidden path="cartItems[${status.index}].cart.id" />
											<tr class="rem1">
												<td class="invert">${status.index + 1}</td>
												<td class="invert-image">

													<div class="image-icon">
														<a href="single/${i.product.id}.html"> <img
															src="${i.product.image}" alt="${i.product.name}"
															class="pro-thumb image"></a>
														<c:if
															test="${i.product.discount > 0 && i.product.discount <= 1}">
															<span class="fa-stack fa-lg icon"> <i
																class="fa fa-tag fa-stack-2x"></i> <i
																class="fa fa-stack-1x fa-inverse">&nbsp;-<fmt:formatNumber
																		value="${i.product.discount}" type="percent" /></i>
															</span>
														</c:if>

													</div>
												</td>
												<td class="invert"><form:input type="number"
														path="cartItems[${status.index}].quantity"
														onchange="qtyChange('${i.id}',this); this.oldvalue = this.value;"
														id="qty${i.id}" onfocus="this.oldvalue = this.value;"
														value="${i.quantity}" min="1" max="100" step="1"
														required="required"
														oninvalid="this.setCustomValidity('Số lượng không hợp lệ (1 <-> 100)!')"
														oninput="this.setCustomValidity('')" /></td>
												<td class="invert">${i.product.name}</td>

												<td class="invert"><c:choose>

														<c:when
															test="${i.product.discount > 0 && i.product.discount <= 1}">

															<p style="text-decoration: line-through">
																<fmt:formatNumber value="${i.product.price}"
																	type="number" pattern="###,###" />
																đ
															</p>
															<span style="color: black;"> <input
																id="h_uPrice${i.id}" value="${i.unitPrice}" hidden /> <fmt:formatNumber
																	value="${i.unitPrice}" type="number" pattern="###,###" />
																đ
															</span>

														</c:when>
														<c:otherwise>
															<span style="color: black;"> <input
																id="h_uPrice${i.id}" value="${i.unitPrice}" hidden /> <fmt:formatNumber
																	value="${i.unitPrice}" type="number" pattern="###,###" />
																đ
															</span>
														</c:otherwise>
													</c:choose></td>
												<td class="invert"><span class="money"><label
														id="tPrice${i.id}"><fmt:formatNumber
																value="${i.unitPrice * i.quantity}" type="number"
																pattern="###,###" /> đ</label></span></td>
												<td class="invert"><a id="delete-item"
													href="cart/delete/${i.id}.html" role="button" class="btn"><i
														class="fas fa-trash-alt"></i></a></td>
											</tr>
										</c:forEach>
										<%-- </form:form> --%>
									</tbody>
								</table>
							</div>
							<div class="checkout-left row">
								<div class="col-md-6 checkout-left-basket">
									<h4>Chi tiết giỏ hàng</h4>

									<ul>
										<c:forEach var="i" varStatus="status"
											items="${cart.cartItems}">
											<li><label id="_qty${i.id}">${i.quantity}</label><i>
													x </i> ${i.product.name} <span> <label
													id="_tPrice${i.id}"><fmt:formatNumber
															value=" ${i.unitPrice * i.quantity}" type="number"
															pattern="###,###" /> đ</label> <%-- <fmt:formatNumber
														value=" ${i.unitPrice * i.quantity}" type="number"
														pattern="###,###" /> đ --%>

											</span></li>
										</c:forEach>
										<li>Thuế VAT(10%) + PVC : <span> <%-- <fmt:formatNumber
													value=" ${totalPrice * 0.12}" type="number"
													pattern="###,###" /> đ --%> <input id="h_ship"
												value="${totalPrice*0.12}" hidden /> <label id="_ship"><fmt:formatNumber
														value="${totalPrice*0.12}" type="number" pattern="###,###" />
													đ</label>
										</span>
										</li>
										<li>Tổng tiền : <span> <input id="h_total"
												value="${totalPrice}" hidden /> <label id="_total"><fmt:formatNumber
														value="${totalPrice + totalPrice*0.12}" type="number"
														pattern="###,###" /> VNĐ</label>
										</span>
										</li>
									</ul>
								</div>
								<div class="col-md-6 address_form">
									<h4>Thông tin đơn hàng</h4>
									<%-- <form:form action="checkout.html" method="post"
									modelAttribute="cart" class="creditly-card-form agileinfo_form"> --%>
									<section class="creditly-wrapper wrapper">
										<div class="information-wrapper">
											<div class="first-row form-group">
												<div class="controls">
													<%-- <form:hidden path="status" value="1" /> --%>
													<form:hidden path="id" />
													<form:hidden path="user.id" />
													<label class="control-label">Họ tên: </label>
													<form:input class="billing-address-name form-control"
														type="text" path="name" placeholder="Họ tên"
														required="required"
														oninvalid="this.setCustomValidity('Họ tên không hợp lệ!')"
														oninput="this.setCustomValidity('')" />
												</div>
												<div class="card_number_grids">
													<div class="card_number_grid_left">
														<div class="controls">
															<label class="control-label">Số điện thoại: </label>
															<form:errors path="phone" />
															<form:input class="form-control" type="text" path="phone"
																placeholder="Số điện thoại" required="required"
																pattern="(03|05|07|08|09)+([0-9]{8})\b"
																oninvalid="this.setCustomValidity('Số điện thoại không hợp lệ!')"
																oninput="this.setCustomValidity('')" />
														</div>
													</div>
													<div class="card_number_grid_right">
														<div class="controls">
															<label class="control-label">Email: </label>
															<form:input path="email" class="form-control"
																type="email" placeholder="Email" required="required"
																pattern="^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$"
																oninvalid="this.setCustomValidity('Email sai định dạng!')"
																oninput="this.setCustomValidity('')" />
														</div>
													</div>
													<div class="clear"></div>
												</div>
												<div class="controls">
													<label class="control-label">Địa chỉ: </label>
													<form:input path="address" class="form-control" type="text"
														placeholder="Địa chỉ" required="required"
														oninvalid="this.setCustomValidity('Địa chit không hợp lệ!')"
														oninput="this.setCustomValidity('')" />
												</div>
												<div class="controls">
													<label class="control-label">Ghi chú: </label>
													<form:input path="note" class="form-control" type="text"
														placeholder="Ghi chú" />

													<!-- <select
												class="form-control option-w3ls">
												<option>Office</option>
												<option>Home</option>
												<option>Commercial</option>

											</select> -->
												</div>
											</div>
											<form:button type="submit" class="submit check_out">Giao đến địa chỉ này</form:button>
										</div>
									</section>

								</div>

								<div class="clearfix"></div>

							</div>
						</form:form>

					</div>
				</c:otherwise>
			</c:choose>


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
	<script type="text/javascript">
		function qtyChange(id, oldQty) {
			var qty = document.getElementById("qty" + id);

			var h_uPrice = document.getElementById("h_uPrice" + id);
			var uPrice = document.getElementById("uPrice" + id);

			var tPrice = document.getElementById("tPrice" + id);
			var _qty = document.getElementById("_qty" + id);
			var _tPrice = document.getElementById("_tPrice" + id);

			var h_ship = document.getElementById("h_ship");
			var h_total = document.getElementById("h_total");

			var _ship = document.getElementById("_ship");
			var _total = document.getElementById("_total");

			var oldPrice = oldQty.oldvalue * h_uPrice.value;

			_tPrice.textContent = tPrice.textContent = Math.ceil(
					parseInt(h_uPrice.value) * parseInt(qty.value)).toFixed(0)
					.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
					+ ' đ';
			_qty.textContent = qty.value;
		
			h_total.value = h_total.value - oldPrice + h_uPrice.value
					* qty.value;
			h_ship.value = h_total.value * 0.12;

			_total.textContent = Math.ceil(
					parseInt(h_total.value) + parseInt(h_ship.value))
					.toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
					+ ' VNĐ';

			_ship.textContent = Math.ceil(h_ship.value).toFixed(0).replace(
					/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
					+ ' đ';
		}

	</script>
</body>

</html>