<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->

<%@ include file="../views/common/tittle.jsp"%>

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/bootstrap.css" />

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap"
	rel="stylesheet">

<!-- font awesome style -->
<link href="../assets/css/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="../assets/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="../assets/css/responsive.css" rel="stylesheet" />

</head>

<body>



	<!-- header section strats -->
	<header class="header_section">
		<%@ include file="../views/common/header.jsp"%>
	</header>
	<!-- end header section -->




	<!-- service section -->



	<!-- end service section -->


	<!-- about section -->


	<!-- end about section -->


	<!-- product section -->
	<section class="contact_section layout_padding">
		<div class="container">
			<div class="heading_container">
				<h2>Your Cart</h2>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="map_container">
						<table class="table table-bordered">
							<thead>
								<tr>
									
									<th>Name</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Amount</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="item" items="${CART_ITEMS}">
									<form action="/shopping-cart/update" method="post">
										<input type="hidden" name="id" value="${item.productId}" />
										<tr>
											
											<td>${item.name }</td>
											<td>${item.price}</td>
											<td><input name="qty" value="${item.qty}"
												onblur="this.form.submit()" style="width: 50px;"></td>
											<td>${item.price*item.qty}</td>
											<td><a class="btn btn-primary btn-sm"
												href="/shopping-cart/del/${item.productId }">Remove</a></td>
										</tr>
									</form>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-md-4 ">
					<div class="form_container">
						<form action="">
							<div>
								<input type="text" placeholder="Your Name" />
							</div>
							<div>
								<input type="text" placeholder="Phone Number" />
							</div>
							<div>
								<input type="email" placeholder="Email" />
							</div>
							<div>
								<input type="text" class="message-box" placeholder="Address" />
							</div>
							<p>Tong Tien:${TOTAL}</p>
							<div class="btn_box">
								<button>SEND</button>
							</div>

						</form>
					</div>

				</div>
			</div>
		</div>
	</section>

	<!-- end contact section -->


	<!-- client section -->
	<section class="service_section">
		<%@ include file="../views/common/ServiceSection.jsp"%>
	</section>
	<!-- end client section -->


	<!-- info section -->
	<section class="info_section layout_padding2">
		<%@ include file="../views/common/InfoSection.jsp"%>
	</section>

	<!-- end info_section -->

	<!-- footer section -->
	<section class="footer_section">
		<%@ include file="../views/common/footer.jsp"%>
	</section>
	<!-- footer section -->

	<!-- jQery -->
	<script type="text/javascript" src="../assets/js/jquery-3.4.1.min.js"></script>
	<!-- popper js -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous">
		
	</script>
	<!-- bootstrap js -->
	<script type="text/javascript" src="../assets/js/bootstrap.js"></script>
	<!-- custom js -->
	<script type="text/javascript" src="../assets/js/custom.js"></script>
	<!-- Google Map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
		
	</script>
	<!-- End Google Map -->

</body>

</html>