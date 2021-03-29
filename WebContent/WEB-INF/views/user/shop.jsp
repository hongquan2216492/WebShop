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
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/all.css" rel="stylesheet">
<!-- <link href="//fonts.googleapis.com/css?family=Inconsolata:400,700" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800"
	    rel="stylesheet"> -->
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
	</div>
	<!-- banner -->
	<div class="banner_inner">
		<div class="services-breadcrumb">
			<div class="inner_breadcrumb">

				<!-- <ul class="short">
					<li><a href="index.html">Trang chủ</a> <i>|</i></li>
					<li>Sản phẩm</li>
				</ul> -->
			</div>
		</div>

	</div>
	<!--//banner -->
	<!--/shop-->
	<section class="banner-bottom-wthreelayouts py-lg-5 py-3">
		<div class="container-fluid">
			<div class="inner-sec-shop px-lg-4 px-3">
				<c:choose>
					<c:when test="${isCate == 1}">
						<div style="">
							<img alt="${category.cateName}" src="${category.cateImage}"
								width="100px">
							<h1 class="tittle-w3layouts my-lg-4 mt-3" style="color: #FF4E00;">
								${category.cateName}</h1>
						</div>


					</c:when>
					<c:otherwise>
						<h3 class="tittle-w3layouts my-lg-4 mt-3"></h3>
					</c:otherwise>
				</c:choose>


				<div class="row">
					<!-- product left -->
					<%-- <div class="side-bar col-lg-3">
						<div class="search-hotel">
							<h3 class="agileits-sear-head">Tìm kiếm...</h3>
							<form action="#" method="post">
								<input class="form-control" type="search" name="search"
									placeholder="Search here..." required="">
								<button class="btn1">
									<i class="fas fa-search"></i>
								</button>
								<div class="clearfix"></div>
							</form>
						</div>
						<!-- price range -->
						<div class="range">
							<h3 class="agileits-sear-head">Price range</h3>
							<ul class="dropdown-menu6">
								<li>

									<div id="slider-range"></div> <input type="text" id="amount"
									style="border: 0; color: #ffffff; font-weight: normal;" />
								</li>
							</ul>
						</div>
						<!-- //price range -->
						<!--preference -->
						<div class="left-side">
							<h3 class="agileits-sear-head">Deal Offer On</h3>
							<ul>
								<li><input type="checkbox" class="checked"> <span
									class="span">Backpack</span></li>
								<li><input type="checkbox" class="checked"> <span
									class="span">Phone Pocket</span></li>

							</ul>
						</div>
						<!-- // preference -->
						<!-- discounts -->
						<div class="left-side">
							<h3 class="agileits-sear-head">Discount</h3>
							<ul>
								<li><input type="checkbox" class="checked"> <span
									class="span">5% or More</span></li>
								<li><input type="checkbox" class="checked"> <span
									class="span">10% or More</span></li>
								<li><input type="checkbox" class="checked"> <span
									class="span">20% or More</span></li>
								<li><input type="checkbox" class="checked"> <span
									class="span">30% or More</span></li>
								<li><input type="checkbox" class="checked"> <span
									class="span">50% or More</span></li>
								<li><input type="checkbox" class="checked"> <span
									class="span">60% or More</span></li>
							</ul>
						</div>
						<!-- //discounts -->
						<!-- reviews -->
						<div class="customer-rev left-side">
							<h3 class="agileits-sear-head">Customer Review</h3>
							<ul>
								<li><a href="#"> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star"
										aria-hidden="true"></i> <span>5.0</span>
								</a></li>
								<li><a href="#"> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star-o"
										aria-hidden="true"></i> <span>4.0</span>
								</a></li>
								<li><a href="#"> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star-half-o"
										aria-hidden="true"></i> <i class="fa fa-star-o"
										aria-hidden="true"></i> <span>3.5</span>
								</a></li>
								<li><a href="#"> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star-o"
										aria-hidden="true"></i> <i class="fa fa-star-o"
										aria-hidden="true"></i> <span>3.0</span>
								</a></li>
								<li><a href="#"> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star"
										aria-hidden="true"></i> <i class="fa fa-star-half-o"
										aria-hidden="true"></i> <i class="fa fa-star-o"
										aria-hidden="true"></i> <i class="fa fa-star-o"
										aria-hidden="true"></i> <span>2.5</span>
								</a></li>
							</ul>
						</div>
						<!-- //reviews -->
						<!-- deals -->
						<div class="deal-leftmk left-side">
							<h3 class="agileits-sear-head">Special Deals</h3>
							<div class="special-sec1">
								<div class="img-deals">
									<img src="images/s1.jpg" alt="">
								</div>
								<div class="img-deal1">
									<h3>Farenheit (Grey)</h3>
									<a href="single/${p.id}.html">$575.00</a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="special-sec1">
								<div class="col-xs-4 img-deals">
									<img src="images/s2.jpg" alt="">
								</div>
								<div class="col-xs-8 img-deal1">
									<h3>Opium (Grey)</h3>
									<a href="single/${p.id}.html">$325.00</a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="special-sec1">
								<div class="col-xs-4 img-deals">
									<img src="images/m2.jpg" alt="">
								</div>
								<div class="col-xs-8 img-deal1">
									<h3>Azmani Round</h3>
									<a href="single/${p.id}.html">$725.00</a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="special-sec1">
								<div class="col-xs-4 img-deals">
									<img src="images/m4.jpg" alt="">
								</div>
								<div class="col-xs-8 img-deal1">
									<h3>Farenheit Oval</h3>
									<a href="single/${p.id}.html">$325.00</a>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<!-- //deals -->
					</div> --%>
					<!-- //product left -->
					<!--/product right-->
					<div class="left-ads-display col-lg">
						<div class="wrapper_top_shop">
							
							<c:if test="${listProduct.size() != 0}">
								<div class="text-center">
									<c:forEach var="i" begin="0" end="${totalPage-1}"
										varStatus="status">

										<c:if test="${status.index == 0 && currentPage > 1}">
											<c:choose>
												<c:when test="${isCate == 0}">
													<a href="shop/${currentPage-1}.html"
														class="btn btn-outline-primary">&laquo</a>
												</c:when>
												<c:otherwise>
													<a href="category/${cateId}/${currentPage-1}.html"
														class="btn btn-outline-primary">&laquo</a>
												</c:otherwise>
											</c:choose>
										</c:if>

										<c:choose>
											<c:when test="${isCate == 0}">
												<a  class="btn btn-outline-primary" href="shop/${i+1}.html"
													style="${status.index + 1 == currentPage ? 'background-color: #007bff;':''}">
													<span
													style="${status.index + 1 == currentPage ? 'color: white;':''}">
														${i+1}</span>
												</a>
											</c:when>
											<c:otherwise>
												<a class="btn btn-outline-primary"
													href="category/${cateId}/${i+1}.html"
													${status.index + 1 == currentPage ? 'style="background-color: #007bff;"':''}>
													<span
													${status.index + 1 == currentPage ? 'style="color: white;"':''}>
														${i+1}</span>
												</a>
											</c:otherwise>
										</c:choose>



										<c:if
											test="${status.index == totalPage-1 && currentPage <= totalPage-1}">
											<c:choose>
												<c:when test="${isCate == 0}">
													<a href="shop/${currentPage+1}.html"
														class="btn btn-outline-primary">&raquo;</a>
												</c:when>
												<c:otherwise>
													<a href="category/${cateId}/${currentPage+1}.html"
														class="btn btn-outline-primary">&raquo;</a>
												</c:otherwise>
											</c:choose>
										</c:if>

									</c:forEach>
								</div>

							</c:if>

							<br>

							<c:if test="${listProduct.size() == 0}">
								<div class="text-center">
									<h3>Không tìm thấy sản phẩm hợp lệ!</h3>
								</div>

							</c:if>

							<div class="row">

								<c:forEach var="p" items="${listProduct}">
									<div class="col-md-3 product-men women_two">
										<div class="product-googles-info googles">

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

													<!-- <span class="product-new-top">New</span> -->
												</div>
												<div class="item-info-product">
													<div class="info-product-price">
														<div class="grid_meta">
															<div class="product_price">
																<h4>
																	<a href="single/${p.id}.html">${p.name}</a>
																</h4>
																<c:choose>
																	<c:when test="${p.discount > 0 && p.discount <= 1}">
																		<div class="grid-price mt-2">
																			<p style="text-decoration: line-through">
																				<fmt:formatNumber value="${p.price}" type="number"
																					pattern="###,###" />
																				VNĐ
																			</p>
																			<span class="money "><fmt:formatNumber
																					value="${p.price - p.price*p.discount}"
																					type="number" pattern="###,###" /> VNĐ</span>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="grid-price mt-2">
																			<span class="money "><fmt:formatNumber
																					value="${p.price}" type="number" pattern="###,###" />
																				VNĐ</span>
																		</div>
																	</c:otherwise>
																</c:choose>
															</div>

														</div>

														<div class="googles single-item hvr-outline-out">

															<c:choose>
																<c:when test="${isCate == 0}">


																	<c:choose>
																		<c:when test="${userLogin != null}">
																			<form:form action="cart/insert.html"
																				modelAttribute="cartItem">
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

																</c:when>
																<c:otherwise>

																	<c:choose>
																		<c:when test="${userLogin != null}">
																			<form:form action="cart/insert.html"
																				modelAttribute="cartItem">
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

																</c:otherwise>
															</c:choose>



														</div>
													</div>
													<div class="clearfix"></div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<br>
							<%-- <c:if test="${listProduct.size() != 0}">
								<div class="text-center">
									<c:forEach var="i" begin="0" end="${totalPage-1}"
										varStatus="status">

										<c:if test="${status.index == 0 && currentPage > 1}">
											<c:choose>
												<c:when test="${isCate == 0}">
													<a href="shop/${currentPage-1}.html"
														class="btn btn-outline-primary">&laquo</a>
												</c:when>
												<c:otherwise>
													<a href="category/${cateId}/${currentPage-1}.html"
														class="btn btn-outline-primary">&laquo</a>
												</c:otherwise>
											</c:choose>
										</c:if>

										<c:choose>
											<c:when test="${isCate == 0}">
												<a class="btn btn-outline-primary" href="shop/${i+1}.html"
													${status.index + 1 == currentPage ? 'style="background-color: #007bff;"':''}>
													<span
													${status.index + 1 == currentPage ? 'style="color: white;"':''}>
														${i+1}</span>
												</a>
											</c:when>
											<c:otherwise>
												<a class="btn btn-outline-primary"
													href="category/${cateId}/${i+1}.html"
													${status.index + 1 == currentPage ? 'style="background-color: #007bff;"':''}>
													<span
													${status.index + 1 == currentPage ? 'style="color: white;"':''}>
														${i+1}</span>
												</a>
											</c:otherwise>
										</c:choose>



										<c:if
											test="${status.index == totalPage-1 && currentPage <= totalPage-1}">
											<c:choose>
												<c:when test="${isCate == 0}">
													<a href="shop/${currentPage+1}.html"
														class="btn btn-outline-primary">&raquo;</a>
												</c:when>
												<c:otherwise>
													<a href="category/${cateId}/${currentPage+1}.html"
														class="btn btn-outline-primary">&raquo;</a>
												</c:otherwise>
											</c:choose>
										</c:if>

									</c:forEach>
								</div>

							</c:if> --%>
						</div>
					</div>
					<!--//product right-->
				</div>
				<!-- <div class="slider-img mid-sec">
					<h3 class="tittle-w3layouts text-left my-lg-4 my-3">Sản phẩm
						nổi bật</h3>
				</div> -->
				<!-- <div class="row">
					<div class="col-md-6 shop_left">
						<img src="images/banner3.jpg" alt="">
							<h6>Những sản phẩm tuyệt vời</h6>
							<p>
								<a href="shop/1.html"
									class="btn btn-sm animated-button victoria-four">Mua sắm
									ngay</a>
							</p>
					</div>
					<div class="col-md-6 shop_right">
						<img src="images/banner4.jpg" alt="">
							<h6>Được lựa chọn nhiều nhất</h6>
					</div>

				</div> -->
				<!--/slide-->
				<div class="slider-img mid-sec">
					<h3 class="tittle-w3layouts text-left my-lg-4 my-3">Sản phẩm
						nổi bật</h3>
					<div class="mid-slider">
						<div class="owl-carousel owl-theme row">
							<c:forEach end="7" var="p" items="${recommendPros}">
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
																				value="${p.price - p.price*p.discount}"
																				type="number" pattern="###,###" /> VNĐ</span>
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