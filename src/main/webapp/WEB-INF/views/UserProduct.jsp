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
		<div class="container-fluid">
			<nav class="navbar navbar-expand-lg custom_nav-container ">
				<a class="navbar-brand" href="index.html"> <span> SkyRim
				</span>
				</a>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class=""> </span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav  ">
						<li class="nav-item "><a class="nav-link" href="index.html">Home
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="about.html">
								About</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="product.html">Products</a></li>
						<li class="nav-item"><a class="nav-link"
							href="testimonial.html">Testimonial</a></li>
						<li class="nav-item"><a class="nav-link" href="contact.html">Contact
								Us</a></li>
					</ul>
					<div class="user_optio_box">
						<a href=""> <i class="fa fa-user" aria-hidden="true"></i>
						</a> <a href=""> <i class="fa fa-shopping-cart" aria-hidden="true"></i>
						</a>
					</div>
				</div>
			</nav>
		</div>
	</header>
	<!-- end header section -->









	<!-- about section -->


	<!-- end about section -->


	<!-- product section -->

	<section class="product_section ">
		<div class="container">
			<div class="product_heading">
				<h2>Sản Phẩm</h2>
			</div>
			<div class="product_container">
				<c:forEach var="p" items="${pageproduct.content}" varStatus="i">

					<div class="box">
						<div class="box-content">
							<div class="img-box">
								<img src="/uploads/${p.image}" alt="">
							</div>
							<div class="detail-box">
								<div class="text">
									<h6>${p.name}</h6>
									<h5>
										<span>Giá:</span> ${p.price} VNĐ
									</h5>
								</div>
								<div class="like">
									<h6>Like</h6>
									<div class="star_container">
										<i class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="btn-box">
							<a href="/shopping-cart/add/${p.id}"> Add To Cart </a>
						</div>
					</div>
				</c:forEach>
				<ul>
					<a
						href="/product/page?p=0${param.field!=''?'':'&field='+param.field}"
						class="btn btn-outline-primary">First</a>
					<a
						href="/product/page?p=${pageproduct.content.number==0?page.number:page.number-1}"
						class="btn btn-outline-primary">Previous</a>
					<a href="/product/page?p=${pageproduct.content.number+1}"
						class="btn btn-outline-primary"
						${page.number==page.totalPages?'disabled':''}>Next</a>
					<a href="/product/page?p=${pageproduct.content.totalPages-1}"
						class="btn btn-outline-primary">Last</a>
					<li>Số thực thể hiện tại:
						${pageproduct.content.numberOfElements}</li>
					<li>Trang số: ${pageproduct.content.number}</li>
					<li>Kích thước trang: ${pageproduct.content.size}</li>
					<li>Tổng số thực thể: ${pageproduct.content.totalElements}</li>
					<li>Tổng số trang: ${pageproduct.content.totalPages}</li>
				</ul>
			</div>
		</div>
	</section>

	<!-- end product section -->


	<!-- product section -->




	<!-- end product section -->


	<!-- product section -->



	<!-- end product section -->





	<!-- service section -->

	<section class="service_section">
		<%@ include file="../views/common/ServiceSection.jsp"%>
	</section>

	<!-- end service section -->

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