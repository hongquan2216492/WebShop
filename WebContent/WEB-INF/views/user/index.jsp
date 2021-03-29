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
		<div class="banner">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<div class="carousel-caption text-center">
							<h3>
								Đồ uống kèm thức ăn nhanh <span>Siêu giảm giá mùa hè lên đến 50%</span>
							</h3>
							<a href="shop/1.html"
								class="btn btn-sm animated-button victoria-four">Mua ngay</a>
						</div>
					</div>
					<div class="carousel-item item2">
						<div class="carousel-caption text-center">
							<h3>
								Tiết kiệm thời gian<span>THA HỒ LÀM VIỆC</span>
							</h3>
							<a href="shop/1.html"
								class="btn btn-sm animated-button victoria-four">Mua ngay</a>

						</div>
					</div>
					<div class="carousel-item item3">
						<div class="carousel-caption text-center">
							<h3>
								Tha hồ lựa chọn<span>VUI & NGON NHẤT</span>
							</h3>
							<a href="shop/1.html"
								class="btn btn-sm animated-button victoria-four">Mua ngay</a>

						</div>
					</div>
					
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Trước</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Sau</span>
				</a>
			</div>
			<!--//banner -->
		</div>
	</div>
	<!--//banner-sec-->
	<section class="banner-bottom-wthreelayouts py-lg-5 py-3">
		<div class="container-fluid">
			<div class="inner-sec-shop px-lg-4 px-3">
				<h3 class="tittle-w3layouts my-lg-4 my-4">Sản phẩm mới</h3>
				<div class="row">

					<c:forEach end="7" var="p" items="${products}">
						<div class="col-md-3 product-men women_two">
							<div class="product-googles-info googles">
								<div class="men-pro-item">
									<div class="men-thumb-item">
										<a href="single/${p.id}.html"><img src="${p.image}"
											class="pro-thumb" alt="${p.name}"></a>

										<%-- <div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="single/${p.id}.html" class="link-product-add-cart">Xem
													nhanh</a>
											</div>
										</div> --%>
										<span class="product-new-top">Mới</span>
									</div>
									<div class="item-info-product">
										<div class="info-product-price">
											<div class="grid_meta">
												<div class="product_price">
													<h4>
														<a href="single/${p.id}.html">${p.name}</a>
													</h4>
													<div class="grid-price mt-2">
														<span class="money "><fmt:formatNumber
																value="${p.price}" type="number" pattern="###,###" />
															VNĐ</span>
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
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
				<!--//row-->
				<!--/meddle-->
				<div class="row">
					<div class="col-md-12 middle-slider my-4">
						<div class="middle-text-info ">

							<h3 class="tittle-w3layouts two text-center my-lg-4 mt-3"
								style="font-family: 'Pacifico', cursive;">Summer Flash sale</h3>
							<div class="simply-countdown-custom" id="simply-countdown-custom"></div>

						</div>
					</div>
				</div>
				<!--//meddle-->
				<!--/slide-->
				<h3 class="tittle-w3layouts my-lg-4 my-4">Sản phẩm giảm giá</h3>
				<div class="slider-img mid-sec">
					<!--//banner-sec-->
					<div class="mid-slider">
						<div class="owl-carousel owl-theme row">
							<c:forEach var="p" items="${products}">
								<c:if test="${p.discount > 0 && p.discount <= 1}">
									<div class="item">



										<div class="gd-box-info text-center">
											<div class="product-men women_two bot-gd">
												<div class="product-googles-info slide-img googles">
													<div class="men-pro-item">
														<div class="men-thumb-item">
															<div class="image-icon">
																<a href="single/${p.id}.html"><img src="${p.image}"
																	class="pro-thumb image" alt="${p.name}"></a> <span
																	class="fa-stack fa-lg icon"> <i
																	class="fa fa-tag fa-stack-2x"></i> <i
																	class="fa fa-stack-1x fa-inverse">&nbsp;-<fmt:formatNumber
																			value="${p.discount}" type="percent" /></i>
																</span>
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
								</c:if>
							</c:forEach>

						</div>
					</div>
				</div>
				<!-- /testimonials -->
<!-- 				<div class="testimonials py-lg-4 py-3 mt-4">
					<div class="testimonials-inner py-lg-4 py-3">
						<h3 class="tittle-w3layouts text-center my-lg-4 my-4">Tesimonials</h3>
						<div id="carouselExampleControls" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner" role="listbox">
								<div class="carousel-item active">
									<div class="testimonials_grid text-center">
										<h3>
											MiniShop <span>Customer</span>
										</h3>
										<label>United States</label>
										<p>Maecenas interdum, metus vitae tincidunt porttitor,
											magna quam egestas sem, ac scelerisque nisl nibh vel lacus.
											Proin eget gravida odio. Donec ullamcorper est eu accumsan
											cursus.</p>
									</div>
								</div>
								<div class="carousel-item">
									<div class="testimonials_grid text-center">
										<h3>
											Mini Shop <span>Customer</span>
										</h3>
										<label>United States</label>
										<p>Maecenas interdum, metus vitae tincidunt porttitor,
											magna quam egestas sem, ac scelerisque nisl nibh vel lacus.
											Proin eget gravida odio. Donec ullamcorper est eu accumsan
											cursus.</p>
									</div>
								</div>
								<div class="carousel-item">
									<div class="testimonials_grid text-center">
										<h3>
											Mini Shop <span>Customer</span>
										</h3>
										<label>United States</label>
										<p>Maecenas interdum, metus vitae tincidunt porttitor,
											magna quam egestas sem, ac scelerisque nisl nibh vel lacus.
											Proin eget gravida odio. Donec ullamcorper est eu accumsan
											cursus.</p>
									</div>
								</div>
								<a class="carousel-control-prev test"
									href="#carouselExampleControls" role="button" data-slide="prev">
									<span class="fas fa-long-arrow-alt-left"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="carousel-control-next test"
									href="#carouselExampleControls" role="button" data-slide="next">
									<span class="fas fa-long-arrow-alt-right" aria-hidden="true"></span>
									<span class="sr-only">Next</span>

								</a>
							</div>
						</div>
					</div>
				</div> -->
				<!-- //testimonials -->
				<div class="row galsses-grids pt-lg-5 pt-3">
					<div class="col-lg-6 galsses-grid-left">
						<figure class="effect-lexi">
							<img src="images/banner4.jpg" alt="" class="img-fluid">
							<figcaption>
								<!-- <h3>
									Editor's <span>Pick</span>
								</h3> -->
								<p>Đơn giản tạo nên sự tuyệt vời.</p>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-6 galsses-grid-left">
						<figure class="effect-lexi">
							<img src="images/banner2.jpg" alt="" class="img-fluid">
							<figcaption>
								<!-- <h3>
									Editor's <span>Pick</span>
								</h3> -->
								<p>Đơn giản tạo nên sự tuyệt vời.</p>
							</figcaption>
						</figure>
					</div>
				</div>
				<!-- /grids -->
				<div class="bottom-sub-grid-content py-lg-5 py-3">
					<div class="row">
						<div class="col-lg-4 bottom-sub-grid text-center">
							<div class="bt-icon"></div>
							<span class="fas fa-hamburger"></span>
							<h4 class="sub-tittle-w3layouts my-lg-4 my-3">Nhiều loại thức ăn</h4>
							<p>Mang đến cho bạn những sản phẩm chất lượng nhất.</p>
							<p>
								<a href="shop/1.html"
									class="btn btn-sm animated-button victoria-four">Mua sắm
									ngay</a>
							</p>
						</div>
						<!-- /.col-lg-4 -->
						<div class="col-lg-4 bottom-sub-grid text-center">
							<div class="bt-icon"></div>
							<span class="fas fa-coffee"></span>
							<h4 class="sub-tittle-w3layouts my-lg-4 my-3">Nhiều loại đồ uống</h4>
							<p>Mang đến cho bạn những sản phẩm chất lượng nhất.</p>
							<p>
								<a href="shop/1.html"
									class="btn btn-sm animated-button victoria-four">Mua sắm
									ngay</a>

							</p>
						</div>
						<!-- /.col-lg-4 -->
						<div class="col-lg-4 bottom-sub-grid text-center">
							<div class="bt-icon">
								<span class="fas fa-shipping-fast"></span>
							</div>

							<h4 class="sub-tittle-w3layouts my-lg-4 my-3">Giao hàng
								nhanh</h4>
							<p>Thời gian giao hàng cực nhanh chỉ trong 2h.</p>
							<p>
								<a href="shop/1.html"
									class="btn btn-sm animated-button victoria-four">Mua sắm
									ngay</a>
							</p>
						</div>



						<!-- /.col-lg-4 -->
					</div>
				</div>
				<!-- //grids -->
				<!-- /clients-sec -->
				<div class="testimonials p-lg-5 p-3 mt-4">
					<div class="row last-section">
						<div class="col-lg-3 footer-top-w3layouts-grid-sec">
							<div class="mail-grid-icon text-center">
								<i class="fas fa-gift"></i>
							</div>
							<div class="mail-grid-text-info">
								<h3>Sản phẩm chất lượng</h3>
								<p>Chất lượng sản phẩm đảm bảo</p>
							</div>
						</div>
						<div class="col-lg-3 footer-top-w3layouts-grid-sec">
							<div class="mail-grid-icon text-center">
								<i class="fas fa-shield-alt"></i>
							</div>
							<div class="mail-grid-text-info">
								<h3>Quyền lợi khách hàng</h3>
								<p>Hoàn tiền nếu sản phẩm không hợp lệ</p>
							</div>
						</div>
						<div class="col-lg-3 footer-top-w3layouts-grid-sec">
							<div class="mail-grid-icon text-center">
								<i class="fas fa-dollar-sign"></i>
							</div>
							<div class="mail-grid-text-info">
								<h3>Thanh toán khi nhận hàng</h3>
								<p>Tiện lợi, đơn giản!</p>
							</div>
						</div>
						<div class="col-lg-3 footer-top-w3layouts-grid-sec">
							<div class="mail-grid-icon text-center">
								<i class="fas fa-truck"></i>
							</div>
							<div class="mail-grid-text-info">
								<h3>Giao hàng toàn quốc</h3>
								<p>Tới 64 tỉnh thành</p>
							</div>
						</div>
					</div>
				</div>
				<!-- //clients-sec -->
			</div>
		</div>
	</section>
	<!-- about -->
	<!--footer -->
	<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- //footer -->

	<!--jQuery-->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- newsletter modal -->
	<!-- Modal -->
	<!-- Modal -->
	<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center p-5 mx-auto mw-100">
					<h6>Join our newsletter and get</h6>
					<h3>50% Off for your first Pair of Eye wear</h3>
					<div class="login newsletter">
						<form action="#" method="post">
							<div class="form-group">
								<label class="mb-2">Email</label>
								<input type="email" class="form-control" id="exampleInputEmail2" aria-describedby="emailHelp" placeholder="" required="">
							</div>
							<button type="submit" class="btn btn-primary submit mb-4">Get 50% Off</button>
						</form>
						<p class="text-center">
							<a href="#">No thanks I want to pay full Price</a>
						</p>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script>
		$(document).ready(function () {
			$("#myModal").modal();
		});
	</script> -->
	<!-- // modal -->

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
	<!-- Count-down -->
	<script src="js/simplyCountdown.js"></script>
	<link href="css/simplyCountdown.css" rel='stylesheet' type='text/css' />
	<script>
		var d = new Date();
		simplyCountdown('simply-countdown-custom', {
			year : d.getFullYear(),
			month : d.getMonth() + 2,
			day : 25
		});
	</script>
	<!--// Count-down -->
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
	<script type="text/javascript">
		function showMessage() {
			if (confirm('Bạn cần đăng nhập để mua hàng?')) {
				$("<a href='signin.html'></a>").click();
				//window.location.href = "signin.html";
			}
		}
	</script>

</body>

</html>