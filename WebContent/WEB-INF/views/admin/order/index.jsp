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

			<div>
				<a href="admin/order/insert.html" class="btn btn-primary"><i
					class="fas fa-plus"></i> Thêm đơn hàng mới</a>
			</div>
			<c:if test="${listOrder.size() != 0}">
				<div class="text-center">
					<c:forEach var="i" begin="0" end="${totalPage-1}"
						varStatus="status">

						<c:if test="${status.index == 0 && currentPage > 1}">
							<a href="admin/order/${currentPage-1}.html"
								class="btn btn-outline-primary">&laquo</a>
						</c:if>

						<a class="btn btn-outline-primary" href="admin/order/${i+1}.html"
							${status.index + 1 == currentPage ? 'style="background-color: #007bff;"':''}>
							<span
							${status.index + 1 == currentPage ? 'style="color: white;"':''}>
								${i+1}</span>
						</a>

						<c:if
							test="${status.index == totalPage-1 && currentPage <= totalPage-1}">
							<a href="admin/order/${currentPage+1}.html"
								class="btn btn-outline-primary">&raquo;</a>
						</c:if>

					</c:forEach>
				</div>

			</c:if>

			<br>

			<%-- <c:if test="${listProduct.size() == 0}">
				<div class="text-center">
					<h3>Không tìm thấy sản phẩm hợp lệ!</h3>
				</div>

			</c:if> --%>

			<!-- <iframe style="width: 100%;" src="admin/user/1.html"></iframe> -->

			<table class="table-striped table-bordered" style="width: 100%;">

				<tr>
					<th>Ngày đặt<i class="fas fa-sort btn"></i></th>
					<th>Mã đơn hàng<i class="fas fa-sort btn"></i></th>
					<th>Thông tin đặt hàng<i class="fas fa-sort btn"></i></th>
					<th>Tổng tiền phải trả<i class="fas fa-sort btn"></i></th>
					<th>Thanh toán<i class="fas fa-sort btn"></i></th>
					<th>Trạng thái<i class="fas fa-sort btn"></i></th>
					<th>Chức năng</th>
				</tr>


				<c:forEach var="o" items="${listOrder}">

					<tr>
						<td>${o.buyDate}</td>
						<td>${o.id}</td>
						<td>
							<div>${o.name}</div>
							<div>${o.phone}</div>
							<div>${o.address}</div>
						</td>
						<td><c:set var="total" value="${0}"></c:set> <c:forEach
								var="ci" items="${o.cartItems}">
								<c:set var="total" value="${total + ci.unitPrice * ci.quantity}"></c:set>
							</c:forEach> <fmt:formatNumber value=" ${total + total*0.12}" type="number"
								pattern="###,###" /> đ</td>
						<td>${o.payment}</td>
						<td><c:if test="${o.status == 0}">
								<p style="color: #CEA285;">Chờ xác nhận</p>
							</c:if> <c:if test="${o.status == 1}">
								<p>Đang giao...</p>
							</c:if> <c:if test="${o.status == 2}">
								<p style="color: green;">Đã giao</p>
							</c:if> <c:if test="${o.status == 3}">
								<p style="color: red;">Đã huỷ</p>
							</c:if></td>

						<td><button class="btn btn-primary" title="Chi tiết đơn hàng"
								data-toggle="modal" data-target="#orderDetail${o.id}">
								<i class="fas fa-info-circle"></i>
							</button> 
							<%-- <a class="btn btn-primary ${o.status == 0 ? '' : 'disabled'}"
							href="admin/order/edit/${o.id}.html" title="Sửa đơn hàng"> <i
								class="fas fa-edit"></i>
						</a> --%></td>
					</tr>



					<!-- Modal -->
					<div class="modal fade" id="orderDetail${o.id}" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalCenterTitle"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg"
							role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLongTitle">Chi
										tiết đơn hàng</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col-md-6">
											<label>Mã đơn hàng: ${o.id}</label>
										</div>
										<div class="col-md-6 text-right">
											<c:if test="${o.status == 0}">
												<label style="color: #CEA285;">Chờ xác nhận</label>
											</c:if>
											<c:if test="${o.status == 1}">
												<label>Đang giao...</label>
											</c:if>
											<c:if test="${o.status == 2}">
												<label style="color: green;">Đã giao</label>
											</c:if>
											<c:if test="${o.status == 3}">
												<label style="color: red;">Đã huỷ</label>
											</c:if>
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
										<span style="float: right;"> ${ci.quantity} <i> x </i>
											<fmt:formatNumber value=" ${ci.unitPrice}" type="number"
												pattern="###,###" /> đ
										</span>

										<hr>
									</c:forEach>
									<!-- </div> -->

									<div class="row">
										<div class="col-md-7">
											<h4>Thông tin đơn hàng</h4>

											<ul style="list-style: none;">
												<li>Ngày đặt: <span>${o.buyDate}</span></li>
												<li>Tên người nhận: <span>${o.name}</span></li>
												<li>Số điện thoại: <span>${o.phone}</span></li>
												<li>Email: <span>${o.email}</span></li>
												<li>Địa chỉ: <span>${o.address}</span></li>
												<li>Ghi chú: <span>${o.note}</span></li>
											</ul>
										</div>

										<div class="col-md-5">
											<h4>Thông tin thanh toán</h4>

											<ul style="list-style: none;">
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
								<div class="modal-footer">

									<c:if test="${o.status == 0}">
										<a class="btn btn-primary"
											href="admin/order/submit/${o.id}.html">Xác nhận đơn hàng</a>
										<a class="btn btn-primary"
											href="admin/order/cancel/${o.id}.html">Huỷ đơn hàng</a>
									</c:if>
									<c:if test="${o.status == 1}">
										<a class="btn btn-primary"
											href="admin/order/delivered/${o.id}.html">Đã giao hàng</a>
									</c:if>

								</div>
							</div>
						</div>
					</div>

					<%-- <div id="orderDetail${o.id}" class="floating"
						style="display: none;">
						<div class="text-right">
							<i onclick="showOrderDetail('orderDetail${o.id}')"
								style="opacity: 0.5; cursor: pointer; position: absolute; top: 10px;"
								class="far fa-times-circle fa-lg"></i>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Mã đơn hàng: ${o.id}</label>
							</div>
							<div class="col-md-6 text-right">
								<c:if test="${o.status == 0}">
									<label style="color: #CEA285;">Chờ xác nhận</label>
								</c:if>
								<c:if test="${o.status == 1}">
									<label>Đang giao...</label>
								</c:if>
								<c:if test="${o.status == 2}">
									<label style="color: green;">Đã giao</label>
								</c:if>
								<c:if test="${o.status == 3}">
									<label style="color: red;">Đã huỷ</label>
								</c:if>
							</div>
						</div>
						<hr>
						<!-- <div> -->
						<c:set var="total" value="${0}"></c:set>
						<c:forEach var="ci" items="${o.cartItems}">
							<c:set var="total" value="${total + ci.unitPrice * ci.quantity}"></c:set>

							<span> <a href="single/${ci.product.id}.html"><img
									src="${ci.product.image}" class="cart-thumb image"
									alt="${ci.product.name}" /></a> <a
								href="single/${ci.product.id}.html">${ci.product.name}</a>
							</span>
							<span style="float: right;"> ${ci.quantity} <i> x </i> <fmt:formatNumber
									value=" ${ci.unitPrice}" type="number" pattern="###,###" /> đ
							</span>

							<hr>
						</c:forEach>
						<!-- </div> -->

						<div class="row">
							<div class="col-md-7">
								<h4>Thông tin đơn hàng</h4>

								<ul style="list-style: none;">
									<li>Ngày đặt: <span>${o.buyDate}</span></li>
									<li>Tên người nhận: <span>${o.name}</span></li>
									<li>Số điện thoại: <span>${o.phone}</span></li>
									<li>Email: <span>${o.email}</span></li>
									<li>Địa chỉ: <span>${o.address}</span></li>
								</ul>
							</div>

							<div class="col-md-5">
								<h4>Thông tin thanh toán</h4>

								<ul style="list-style: none;">
									<li>Tổng tiền hàng: <span><fmt:formatNumber
												value=" ${total}" type="number" pattern="###,###" /> đ</span></li>
									<li>Thuế VAT(10%) + PVC: <span><fmt:formatNumber
												value=" ${total * 0.12}" type="number" pattern="###,###" />
											đ</span></li>
									<li>Tổng tiền phải trả: <span
										style="font-size: large; color: #FF4E00;"><fmt:formatNumber
												value=" ${total + total*0.12}" type="number"
												pattern="###,###" /> đ</span></li>
									<li>Phương thức thanh toán: <span>${o.payment}</span></li>

								</ul>
							</div>
						</div>

						<div class="text-right">
							<c:if test="${o.status == 0}">
								<a class="btn btn-primary"
									href="admin/order/submit/${o.id}.html">Xác nhận đơn hàng</a>
								<a class="btn btn-primary"
									href="admin/order/cancel/${o.id}.html">Huỷ đơn hàng</a>
							</c:if>
							<c:if test="${o.status == 1}">
								<a class="btn btn-primary"
									href="admin/order/delivered/${o.id}.html">Đã giao hàng</a>
							</c:if>
						</div>
					</div>
 --%>
				</c:forEach>

				<tfoot>
					<tr>
						<th>Ngày đặt<i class="fas fa-sort btn"></i></th>
						<th>Mã đơn hàng<i class="fas fa-sort btn"></i></th>
						<th>Thông tin đặt hàng<i class="fas fa-sort btn"></i></th>
						<th>Tổng tiền phải trả<i class="fas fa-sort btn"></i></th>
						<th>Thanh toán<i class="fas fa-sort btn"></i></th>
						<th>Trạng thái<i class="fas fa-sort btn"></i></th>
						<th>Chức năng</th>
					</tr>
				</tfoot>
			</table>
			<br>
			<c:if test="${listOrder.size() != 0}">
				<div class="text-center">
					<c:forEach var="i" begin="0" end="${totalPage-1}"
						varStatus="status">

						<c:if test="${status.index == 0 && currentPage > 1}">
							<a href="admin/order/${currentPage-1}.html"
								class="btn btn-outline-primary">&laquo</a>
						</c:if>

						<a class="btn btn-outline-primary" href="admin/order/${i+1}.html"
							${status.index + 1 == currentPage ? 'style="background-color: #007bff;"':''}>
							<span
							${status.index + 1 == currentPage ? 'style="color: white;"':''}>
								${i+1}</span>
						</a>

						<c:if
							test="${status.index == totalPage-1 && currentPage <= totalPage-1}">
							<a href="admin/order/${currentPage+1}.html"
								class="btn btn-outline-primary">&raquo;</a>
						</c:if>

					</c:forEach>
				</div>

			</c:if>


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
	<!-- sort-table -->
	<script type="text/javascript">
	 const getCellValue = (tr, idx) => tr.children[idx].innerText || tr.children[idx].textContent;

	const comparer = (idx, asc) => (a, b) => ((v1, v2) => 
	    v1 !== '' && v2 !== '' && !isNaN(v1) && !isNaN(v2) ? v1 - v2 : v1.toString().localeCompare(v2)
	    )(getCellValue(asc ? a : b, idx), getCellValue(asc ? b : a, idx));

	// do the work...
	document.querySelectorAll('th').forEach(th => th.addEventListener('click', (() => {
	    const table = th.closest('table');
	    Array.from(table.querySelectorAll('tr:nth-child(n+2)'))
	        .sort(comparer(Array.from(th.parentNode.children).indexOf(th), this.asc = !this.asc))
	        .forEach(tr => table.appendChild(tr) );
	}))); 
	
	</script>
	<!-- sort-table -->
	<!-- orderDetail -->
	<script type="text/javascript">
	function showOrderDetail(id) {
		  var x = document.getElementById(id);
		  if (x.style.display === "none") {
		    x.style.display = "block";
		  } else {
		    x.style.display = "none";
		  }
		}
	</script>
	<!-- orderDetail -->
</body>
</html>