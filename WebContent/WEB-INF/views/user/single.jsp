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
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css"
	media="all">
<link rel="stylesheet" href="css/owl.theme.css" type="text/css"
	media="all">
<link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
<link href="css/easy-responsive-tabs.css" rel='stylesheet'
	type='text/css' />
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
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
						<li><a href="index.html">Home</a> <i>|</i></li>
						<li>Single Page</li>
					</ul>
				</div>
			</div>
		</div>

	</div>
	<!--//banner -->
	<!--/shop-->
	<section class="banner-bottom-wthreelayouts py-lg-5 py-3">
		<div class="container">
			<div class="inner-sec-shop pt-lg-4 pt-3">
				<div class="row">
					<div class="col-lg-4 single-right-left ">
						<div class="grid images_3_of_2">
							<div class="flexslider1">

								<ul class="slides">
									<li data-thumb="${product.image}">

										<div class="thumb-image">


											<div class="image-icon">
												<img src="${product.image}" data-imagezoom="true"
													class="img-fluid image" alt="${product.name}">
												<c:if test="${product.discount > 0}">
													<span class="fa-stack fa-lg icon"> <i
														class="fa fa-tag fa-stack-2x"></i> <i
														class="fa fa-stack-1x fa-inverse">&nbsp;-<fmt:formatNumber
																value="${product.discount}" type="percent" /></i>
													</span>
												</c:if>

											</div>
										</div>
									</li>

								</ul>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<div class="col-lg-8 single-right-left simpleCart_shelfItem">
						<h2 style="color: #ff4e00;">${product.name}</h2>

						<p>
							<span class="item_price"><fmt:formatNumber
									value="${product.price - product.price*product.discount}"
									type="number" pattern="###,###" /> VNĐ</span>
							<c:if test="${product.discount > 0}">
								<del>
									<fmt:formatNumber value="${product.price}" type="number"
										pattern="###,###" />
									VNĐ
								</del>
							</c:if>

						</p>

						<div class="description">
							<h5>${product.description}</h5>
						</div>




						<c:choose>
							<c:when test="${userLogin != null}">
								<form:form action="cart/insert.html" modelAttribute="cartItem">
									<div class="color-quality">

										<h5>Số lượng :</h5>
										<div class="input-group plus-minus-input">

											<div class="input-group-button">
												<button type="button" class="btn btn-default btn-number"
													data-quantity="minus" data-field="quantity">
													<i class="fas fa-minus"></i>
												</button>
											</div>
											<div class="input-group-button">
												<form:input type="number" path="quantity"
													class="form-control" value="1" min="1" max="100" step="1"
													required="required"
													oninvalid="this.setCustomValidity('Số lượng không hợp lệ (1 <-> 100)!')"
													oninput="this.setCustomValidity('')" />
											</div>
											<div class="input-group-button">
												<button type="button" class="btn btn-default btn-number"
													data-quantity="plus" data-field="quantity">
													<i class="fas fa-plus"></i>
												</button>
											</div>
										</div>

									</div>

									<div class="occasion-cart">
										<div class="googles single-item singlepage">

											<form:input type="hidden" path="id" />
											<%-- <form:input type="hidden" path="quantity" value="1" /> --%>
											<form:input type="hidden" path="unitPrice"
												value="${product.price - product.price*product.discount}" />
											<form:input type="hidden" path="product.id"
												value="${product.id}" />
											<form:input type="hidden" path="cart.id" value="${cart.id}" />
											<form:button type="submit"
												class="googles-cart pgoogles-cart button button--rayen button--border-thick button--text-thick"
												data-text="Thêm vào giỏ hàng">Thêm vào giỏ hàng
									</form:button>

										</div>
									</div>
								</form:form>

							</c:when>
							<c:otherwise>

								<h5>Số lượng :</h5>
								<div class="input-group plus-minus-input">

									<div class="input-group-button">
										<button type="button" class="btn btn-default btn-number"
											data-quantity="minus" data-field="quantity">
											<i class="fas fa-minus"></i>
										</button>
									</div>
									<div class="input-group-button">
										<input type="number" name="quantity" class="form-control"
											value="1" min="1" max="100" step="1" required="required"
											oninvalid="this.setCustomValidity('Số lượng không hợp lệ (1 <-> 100)!')"
											oninput="this.setCustomValidity('')" />
									</div>
									<div class="input-group-button">
										<button type="button" class="btn btn-default btn-number"
											data-quantity="plus" data-field="quantity">
											<i class="fas fa-plus"></i>
										</button>
									</div>
								</div>

								<div class="color-quality"></div>

								<div class="occasion-cart">
									<div class="googles single-item singlepage">
										<button onclick="return showMessage()"
											class="googles-cart pgoogles-cart button button--rayen button--border-thick button--text-thick"
											data-text="Thêm vào giỏ hàng">Thêm vào giỏ hàng</button>
									</div>
								</div>
							</c:otherwise>
						</c:choose>

						<ul class="footer-social text-left mt-lg-4 mt-3">
							<li>Chia sẻ :</li>
							<li class="mx-2"><a href="#"> <span
									class="fab fa-facebook-f"></span>
							</a></li>
							<li class="mx-2"><a href="#"> <span
									class="fab fa-twitter"></span>
							</a></li>
							<li class="mx-2"><a href="#"> <span
									class="fab fa-google-plus-g"></span>
							</a></li>
							<li class="mx-2"><a href="#"> <span
									class="fab fa-linkedin-in"></span>
							</a></li>
							<li class="mx-2"><a href="#"> <span class="fas fa-rss"></span>
							</a></li>

						</ul>

					</div>
					<div class="clearfix"></div>
					<!--/tabs-->
					<div class="responsive_tabs">
						<div id="horizontalTab">
							<ul class="resp-tabs-list">
								<li>Mô tả sản phẩm</li>
								<li>Thông số kỹ thuật</li>
							</ul>
							<div class="resp-tabs-container">
								<!--/tab_one-->
								<div class="tab1">
									<div class="single_page">
										<h6>${product.name}</h6>
										<p class="para">${product.description}</p>
									</div>
								</div>
								<!--//tab_one-->
								<div class="tab2">
									<div class="single_page">
										<p class="para">${product.information}</p>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!--//tabs-->

				</div>
			</div>
		</div>
		<div class="container-fluid">
			<!--/slide-->
			<div class="slider-img mid-sec">
				<h3 class="tittle-w3layouts text-left my-lg-4 my-3">Sản phẩm
					tương tự</h3>
				<div class="mid-slider">
					<div class="owl-carousel owl-theme row">
						<c:forEach var="p" items="${similarPros}">
							<div class="item">

								<div class="gd-box-info text-center">
									<div class="product-men women_two bot-gd">
										<div class="product-googles-info slide-img googles">
											<div class="men-pro-item">
												<div class="men-thumb-item">
													<div class="image-icon">
														<a href="single/${p.id}.html"><img src="${p.image}"
															class="pro-thumb image" alt="${p.name}"></a>
														<c:if test="${p.discount > 0 && p.discount <= 1}">
															<span class="fa-stack fa-lg icon"> <i
																class="fa fa-tag fa-stack-2x"></i> <i
																class="fa fa-stack-1x fa-inverse">&nbsp;-<fmt:formatNumber
																		value="${p.discount}" type="percent" /></i>
															</span>
														</c:if>

													</div>
												</div>
												<div class="item-info-product">
													<div class="info-product-price">
														<div class="grid_meta">
															<div class="product_price">
																<h4>
																	<a href="single/${p.id}.html">${p.name}</a>
																</h4>
																<div class="grid-price mt-2">
																	<p style="text-decoration: line-through">
																		<fmt:formatNumber value="${p.price}" type="number"
																			pattern="###,###" />
																		VNĐ
																	</p>
																	<span class="money "><fmt:formatNumber
																			value="${p.price - p.price*p.discount}" type="number"
																			pattern="###,###" /> VNĐ</span>
																</div>
															</div>

														</div>
														<div class="googles single-item hvr-outline-out">
															<c:choose>
																<c:when test="${userLogin != null}">
																	<form:form action="cart/insert.html"
																		modelAttribute="cartItem">
																		<!-- <input type="hidden" name="page" value="index"/> -->
																		<form:input type="hidden" path="id" />
																		<form:input type="hidden" path="quantity" value="1" />
																		<form:input type="hidden" path="unitPrice"
																			value="${p.price - p.price*p.discount}" />
																		<form:input type="hidden" path="product.id"
																			value="${p.id}" />
																		<form:input type="hidden" path="cart.id"
																			value="${cart.id}" />
																		<form:button type="submit"
																			class="googles-cart pgoogles-cart">
																			<i class="fas fa-cart-plus"></i>
																		</form:button>
																	</form:form>
																</c:when>
																<c:otherwise>
																	<a href="signin.html"
																		onclick="return confirm('Đăng nhập để mua hàng?')"><button
																			class="googles-cart pgoogles-cart">
																			<i class="fas fa-cart-plus"></i>
																		</button></a>
																</c:otherwise>
															</c:choose>
														</div>
													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
			<!--//slider-->
		</div>
	</section>
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
	<!-- price range (top products) -->
	<script src="js/jquery-ui.js"></script>
	<script>
		//<![CDATA[ 
		$(window).load(
				function() {
					$("#slider-range").slider(
							{
								range : true,
								min : 0,
								max : 9000,
								values : [ 50, 6000 ],
								slide : function(event, ui) {
									$("#amount").val(
											"$" + ui.values[0] + " - $"
													+ ui.values[1]);
								}
							});
					$("#amount").val(
							"$" + $("#slider-range").slider("values", 0)
									+ " - $"
									+ $("#slider-range").slider("values", 1));

				}); //]]>
	</script>
	<!-- //price range (top products) -->

	<script src="js/owl.carousel.js"></script>
	<script>
		$(document).ready(function() {
			$('.owl-carousel').owlCarousel({
				loop : true,
				margin : 10,
				responsiveClass : true,
				responsive : {
					0 : {
						items : 1,
						nav : true
					},
					600 : {
						items : 2,
						nav : false
					},
					900 : {
						items : 3,
						nav : false
					},
					1000 : {
						items : 4,
						nav : true,
						loop : false,
						margin : 20
					}
				}
			})
		})
	</script>

	<!-- //end-smooth-scrolling -->

	<!-- single -->
	<script src="js/imagezoom.js"></script>
	<!-- single -->
	<!-- script for responsive tabs -->
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
	<!-- FlexSlider -->
	<script src="js/jquery.flexslider.js"></script>
	<script>
		// Can also be used with $(document).ready()
		$(window).load(function() {
			$('.flexslider1').flexslider({
				animation : "slide",
				controlNav : "thumbnails"
			});
		});
	</script>
	<!-- //FlexSlider-->

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

	<!-- quantity-textbox-with-minus-plus-buttons -->
	<script type="text/javascript">
		jQuery(document)
				.ready(
						function() {
							// This button will increment the value
							$('[data-quantity="plus"]')
									.click(
											function(e) {
												// Stop acting like a button
												e.preventDefault();
												// Get the field name
												fieldName = $(this).attr(
														'data-field');
												// Get its current value
												var currentVal = parseInt($(
														'input[name='
																+ fieldName
																+ ']').val());
												// If is not undefined
												if (!isNaN(currentVal)) {
													// Increment
													$(
															'input[name='
																	+ fieldName
																	+ ']').val(
															currentVal + 1);
												} else {
													// Otherwise put a 0 there
													$(
															'input[name='
																	+ fieldName
																	+ ']').val(
															0);
												}
											});
							// This button will decrement the value till 0
							$('[data-quantity="minus"]')
									.click(
											function(e) {
												// Stop acting like a button
												e.preventDefault();
												// Get the field name
												fieldName = $(this).attr(
														'data-field');
												// Get its current value
												var currentVal = parseInt($(
														'input[name='
																+ fieldName
																+ ']').val());
												// If it isn't undefined or its greater than 0
												if (!isNaN(currentVal)
														&& currentVal > 0) {
													// Decrement one
													$(
															'input[name='
																	+ fieldName
																	+ ']').val(
															currentVal - 1);
												} else {
													// Otherwise put a 0 there
													$(
															'input[name='
																	+ fieldName
																	+ ']').val(
															0);
												}
											});
						});
	</script>
	<!-- quantity-textbox-with-minus-plus-buttons -->
	<script type="text/javascript">
		function showMessage() {
			if (confirm('Đăng nhập để mua hàng?')) {
				window.location.href = "signin.html";
			}
		}
	</script>
</body>

</html>