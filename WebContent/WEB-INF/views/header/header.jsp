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
<title>Insert title here</title>
<base href="${pageContext.servletContext.contextPath}/">
<style type="text/css">
.pic {
	object-fit: cover;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	border: 2px solid #FF4E00;
	align-items: center;
	justify-content: center;
}

*[id$=errors] {
	color: red;
	font-style: italic;
}

.btn {
	color: #828284;
}

.btn:hover {
	color: #FF4E00;
}
/* mini-cart */
.cart-thumb {
	border: 1px solid #ddd; /* Gray border */
	border-radius: 4px; /* Rounded border */
	margin-right: 20px;
	width: 150px; /* Set a small width */
}

.cart-thumb:hover {
	box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}

/* mini-cart */
.pro-thumb:hover {
	border-radius: 4px; /* Rounded border */
	box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}

/* CSS used here will be applied after bootstrap.css */
.badge-notify {
	color: white;
	background: red;
	position: relative;
	-moz-transform: translate(-100%, -100%); /* For Firefox */
	-ms-transform: translate(-100%, -100%); /* for IE */
	-webkit-transform: translate(-100%, -100%);
	/* For Safari, Chrome, iOS */
	-o-transform: translate(-100%, -100%);
	position: relative; /* For Opera */
}
.image-categories{
	width:100px;
}
.image-icon {
	position: relative;
}
.image-icon .imgage {
	display: block;
}

.image-icon .icon {
	position: absolute;
	top: 0;
	right: 0;
}
</style>
<link href="css/mini-cart.css" rel='stylesheet' type='text/css'
	media="all" />
<!-- <link href="css/bootstrap.css" rel='stylesheet' type='text/css' /> -->
</head>
<body>
	<header>
		<div class="row">
			<div class="col-md-3 top-info text-left mt-lg-4">
				<h6><i class="fas fa-phone"></i> Hỗ trợ</h6>
				<ul>					
					<c:forEach var="u" items="${users}">
						<c:if test="${u.roleId == 1}">
							<li class="number-phone mt-3">${u.phone} (${u.name})</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div class="col-md-6 logo-w3layouts text-center">
				<h1 class="logo-w3layouts">
					<a class="navbar-brand" href="index.html"> Mini Shop </a>
				</h1>
			</div>

			<div class="col-md-3 top-info-cart text-right mt-lg-4">
				<ul class="cart-inner-info">

					<c:choose>
						<c:when test="${userLogin == null}">
							<div>
								<a href="signin.html" role="button"><span class="btn"><i
										class="fas fa-sign-in-alt"></i> Đăng nhập</span></a> <a
									href="signup.html" role="button"><span class="btn"><i
										class="fas fa-user-plus"></i> Đăng ký</span></a>
							</div>
						</c:when>
						<c:otherwise>

							<li class="dropdown"><span class="btn"><%-- <img
									class="pic" alt="${userLogin.name}"> --%>
									Xin chào: ${userLogin.name}</span>
								<div class="dropdown-menu dropdown-menu-right text-center"
									style="width: 200px;">
									<c:if test="${userLogin.roleId == 1}">
										<a href="admin/${userLogin.id}.html" role="button"><span class="btn"
											style="padding: 8px 0px 0px 0px;">Quản lý trang web <i
												class="fas fa-user-shield"></i>
										</span></a>
										<div class="dropdown-divider"></div>
									</c:if>
									<%-- <c:choose>									
										<c:when test="${userLogin.lock == true}">
											<a href="signup.html" role="button"
												onclick="return alert('Tài khoản đã bị khoá!')"><span
												class="btn" style="padding: 8px 0px 0px 0px;">Thông
													tin tài khoản <i class="fas fa-user-cog"></i>
											</span></a>
										</c:when>
										<c:otherwise> --%>
											<a href="user/edit/${userLogin.id}.html" role="button"><span
												class="btn" style="padding: 8px 0px 0px 0px;">Thông
													tin tài khoản <i class="fas fa-user-cog"></i>
											</span></a>
										<%-- </c:otherwise>
									</c:choose> --%>

									<div class="dropdown-divider"></div>
									<a href="order.html"><span class="btn"
										style="padding: 0px 0px 0px 0px;">Thông tin đơn mua <i
											class="fas fa-file-invoice"></i></span></a>
									<div class="dropdown-divider"></div>
									<a href="signout.html"><span class="btn"
										style="padding: 0px 0px 8px 0px;">Đăng xuất <i
											class="fas fa-sign-out-alt"></i></span></a>
								</div></li>

							<div id="mini-cart-shop" style="display: inline;">
								<li class="dropdown"><a href="checkout.html" role="button"
									class="btn"> <i class="fas fa-shopping-cart fa-lg"></i> <span
										class="badge badge-notify">${totalItem}</span>
								</a>
									<ul class="dropdown-menu dropdown-menu-right"
										style="margin: 0; padding: 0; list-style: none;">
										<c:choose>
											<c:when test="${totalItem == 0}">
												<div class="text-center" style="margin: 20px;">
													<span style="font-size: large;">Giỏ hàng trống!</span>
												</div>
											</c:when>
											<c:otherwise>
												<li
													style="padding: 30px 30px 0px 30px; margin: unset; display: block;"><c:forEach
														var="i" items="${listCartItem}">

														<div style="display: inline-flex;">


															<div class="image-icon">
																<a href="single/${i.product.id}.html"><img
																	src="${i.product.image}" class="cart-thumb image"
																	alt="${i.product.name}" /></a>
																<c:if
																	test="${i.product.discount > 0 && i.product.discount <= 1}">
																	<span class="fa-stack fa-lg icon"> <i
																		class="fa fa-tag fa-stack-2x"></i> <i
																		class="fa fa-stack-1x fa-inverse">&nbsp;-<fmt:formatNumber
																				value="${i.product.discount}" type="percent" /></i>
																	</span>
																</c:if>
															</div>





															<div>
																<a id="delete-item" href="cart/delete/${i.id}.html"
																	role="button" class="btn" style="float: right;"><i
																	class="far fa-trash-alt"></i></a>

																<h6 style="width: 200px;">
																	<a href="single/${i.product.id}.html">${i.product.name}</a>
																</h6>

																<p>
																	${i.quantity} x <span><fmt:formatNumber
																			value=" ${i.unitPrice}" type="number"
																			pattern="###,###" /> đ</span>
																</p>

															</div>

														</div>
														<hr>

													</c:forEach></li>


												<div class="text-center" ><strong>Tạm
															tính: </strong><span class="money"><fmt:formatNumber value="${totalPrice}"
															type="number" pattern="###,###" /> VNĐ</span> 
															<br>
															<span class="btn">(Chưa bao gồm thuế và PVC!)</span>
															</div>
												<hr>
												<div
													class="text-center" style="padding-bottom: 20px;"><a
													href="checkout.html" class="btn btn-default btn-cart">Thanh
														toán</a></div>
											</c:otherwise>
										</c:choose>


									</ul></li>
							</div>

						</c:otherwise>
					</c:choose>


				</ul>


			</div>
		</div>


		<label class="top-log mx-auto"></label>
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light top-header mb-2">

			

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav nav-mega mx-auto">
					<c:choose>
						<c:when test="${baseURL == 'index'}">
							<li class="nav-item active"><a class="nav-link ml-lg-0"
								href="index.html">Trang chủ <span class="sr-only">(current)</span>
							</a></li>
							<!-- <li class="nav-item"><a class="nav-link" href="shop/1.html">Shop Now</a></li> -->
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="shop/1.html"
								id="navbarDropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Sản phẩm</a>
								<ul class="dropdown-menu mega-menu ">
									<li>
										<div class="row">
											<div class="col-md-4 media-list span4 text-left">
												<h5 class="tittle-w3layouts-sub">Top sản phẩm bán chạy</h5>
												<ul>
													<c:forEach begin="0" end="1" var="fp"
														items="${featurePros}">
														<li>
															<div class="image-icon">
																<a href="single/${fp.product.id}.html"> <img
																	style="margin: 20px;" class="pro-thumb image"
																	alt="${fp.product.name}" src="${fp.product.image}"
																	title="${fp.product.name}" /></a>
																<c:if
																	test="${fp.product.discount > 0 && fp.product.discount <= 1}">
																	<span class="fa-stack fa-lg icon"> <i
																		class="fa fa-tag fa-stack-2x "></i> <i
																		class="fa fa-stack-1x fa-inverse">&nbsp;-<fmt:formatNumber
																				value="${fp.product.discount}" type="percent" /></i>
																	</span>
																</c:if>

															</div>

														</li>
													</c:forEach>
												</ul>
											</div>
											<div class="col-md-4 media-list span4 text-left">
												<br>
												<ul>
													<c:forEach begin="2" end="3" var="fp"
														items="${featurePros}">
														<li>
															<div class="image-icon">
																<a href="single/${fp.product.id}.html"> <img
																	class="pro-thumb image" alt="${fp.product.name}"
																	src="${fp.product.image}" title="${fp.product.name}" /></a>
																<c:if
																	test="${fp.product.discount > 0 && fp.product.discount <= 1}">
																	<span class="fa-stack fa-lg icon"> <i
																		class="fa fa-tag fa-stack-2x "></i> <i
																		class="fa fa-stack-1x fa-inverse">&nbsp;-<fmt:formatNumber
																				value="${fp.product.discount}" type="percent" /></i>
																	</span>
																</c:if>

															</div>

														</li>
													</c:forEach>
												</ul>
											</div>
											<div class="col-md-4 media-list span4 text-left">
												<h5 class="tittle-w3layouts-sub">Danh mục sản phẩm</h5>
												<ul>
													<c:forEach var="c" items="${categories}">
														<li class="media-mini mt-3"><img src="${c.cateImage}"
															class="image-categories" /><a href="category/${c.cateId}/1.html">
																${c.cateName} </a></li>
													</c:forEach>
												</ul>
											</div>

										</div>
										<hr>
									</li>
								</ul></li>
							<%-- <li>
								<form:form class="form-inline my-2 my-lg-0">
									<form:input class="form-control mr-sm-2" type="search" path="search.html"
										placeholder="Nhập tên sản phẩm" aria-label="Search"/>
									<form:button class="btn"
										type="submit"><i class="fas fa-search"></i></form:button>
								</form:form>
							</li> --%>
							<!-- <li class="nav-item"><a class="nav-link" href="contact.html">Liên
							hệ</a></li> -->
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link ml-lg-0"
								href="index.html">Trang chủ <span class="sr-only">(current)</span>
							</a></li>
							<!-- <li class="nav-item"><a class="nav-link" href="about.html">Về
							chúng tôi</a></li> -->
							<li class="nav-item dropdown active"><a
								class="nav-link dropdown-toggle" href="shop/1.html"
								id="navbarDropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Sản phẩm</a>
								<ul class="dropdown-menu mega-menu ">
									<li>
										<div class="row">
											<div class="col-md-4 media-list span4 text-left">
												<h5 class="tittle-w3layouts-sub">Top sản phẩm bán chạy</h5>
												<ul>
													<c:forEach begin="0" end="1" var="fp"
														items="${featurePros}">
														<li>
															<div class="image-icon">
																<a href="single/${fp.product.id}.html"> <img
																	class="pro-thumb image" alt="${fp.product.name}"
																	src="${fp.product.image}" title="${fp.product.name}" /></a>
																<c:if
																	test="${fp.product.discount > 0 && fp.product.discount <= 1}">
																	<span class="fa-stack fa-lg icon"> <i
																		class="fa fa-tag fa-stack-2x "></i> <i
																		class="fa fa-stack-1x fa-inverse">&nbsp;-<fmt:formatNumber
																				value="${fp.product.discount}" type="percent" /></i>
																	</span>
																</c:if>

															</div>

														</li>
													</c:forEach>
												</ul>
											</div>
											<div class="col-md-4 media-list span4 text-left">
												<br>
												<ul>
													<c:forEach begin="2" end="3" var="fp"
														items="${featurePros}">
														<li>
															<div class="image-icon">
																<a href="single/${fp.product.id}.html"> <img
																	class="pro-thumb image" alt="${fp.product.name}"
																	src="${fp.product.image}" title="${fp.product.name}" /></a>
																<c:if
																	test="${fp.product.discount > 0 && fp.product.discount <= 1}">
																	<span class="fa-stack fa-lg icon"> <i
																		class="fa fa-tag fa-stack-2x "></i> <i
																		class="fa fa-stack-1x fa-inverse">&nbsp;-<fmt:formatNumber
																				value="${fp.product.discount}" type="percent" /></i>
																	</span>
																</c:if>

															</div>

														</li>
													</c:forEach>
													
												</ul>
											</div>
											<div class="col-md-4 media-list span4 text-left">
												<h5 class="tittle-w3layouts-sub">Danh mục sản phẩm</h5>
												<ul>
													<c:forEach var="c" items="${categories}">
														<li class="media-mini mt-3"><img src="${c.cateImage}"
															class="image-categories" /><a href="category/${c.cateId}/1.html">
																${c.cateName} </a></li>
													</c:forEach>
												</ul>
											</div>

										</div>
										<hr>
									</li>
								</ul></li>
							
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>


	</header>

	<!--jQuery-->
	<script src="js/jquery-2.2.3.min.js"></script>
	
</body>
</html>