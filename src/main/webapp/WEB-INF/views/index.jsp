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

	<div class="hero_area">

		<!-- header section strats -->
		<header class="header_section">
			<%@ include file="../views/common/header.jsp"%>
		</header>
		<!-- end header section -->


		<!-- slider section -->
		<section class="slider_section ">
			<%@ include file="../views/common/sliderSection.jsp"%>
		</section>
		<!-- end slider section -->
	</div>


	<!-- service section -->

	<section class="service_section">
		<%@ include file="../views/common/ServiceSection.jsp"%>
	</section>

	<!-- end service section -->


	<!-- about section -->

	<section class="about_section layout_padding">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<div class="img_container">
						<div class="img-box b1">
							<img src="../assets/images/bo-4-tu-linh.png" alt="">
						</div>
						<div class="img-box b2">
							<img src="../assets/images/robusta-min.jpg" alt="">
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="detail-box">
						<h2>Skyrim Coffee Shop</h2>
						<p>Discover Skyrim at Dragonbrew Café! Immerse yourself in a
							rustic, candlelit ambiance while enjoying unique, Skyrim-inspired
							coffee and treats. Join our community with game nights and
							cosplay events. Coffee and adventure, all in one place!</p>
						<a href="/home/abouts"> Read More </a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end about section -->


	<!-- product section -->

	<section class="product_section ">
		<div class="container">
			<div class="product_heading">
				<h2>Arabica</h2>
			</div>
			<div class="product_container">
				<c:forEach var="p" items="${ProductArabica}" varStatus="i">
					<c:if test="${i.index<3}">
						<div class="box">
							<div class="box-content">
								<div class="img-box">
									<a href="/home/productDetail/views/${p.id}"><img src="/uploads/${p.image}" alt=""></a>
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
					</c:if>
				</c:forEach>

			</div>
		</div>
	</section>

	<!-- end product section -->
	<section class="product_section ">
		<div class="container">
			<div class="product_heading">
				<h2>Robusta</h2>
			</div>
			<div class="product_container">
				<c:forEach var="p" items="${ProductRobusta}" varStatus="i">
					<c:if test="${i.index<3}">
						<div class="box">
							<div class="box-content">
								<div class="img-box">
									<a href="/home/productDetail/views/${p.id}"><img src="/uploads/${p.image}" alt=""></a>
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
					</c:if>
				</c:forEach>

			</div>
		</div>
	</section>
	<section class="product_section ">
		<div class="container">
			<div class="product_heading">
				<h2>Moka</h2>
			</div>
			<div class="product_container">
				<c:forEach var="p" items="${ProductMoka}" varStatus="i">
					<c:if test="${i.index<3}">
						<div class="box">
							<div class="box-content">
								<div class="img-box">
										<a href="/home/productDetail/views/${p.id}"><img src="/uploads/${p.image}" alt=""></a>
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
					</c:if>
				</c:forEach>

			</div>
		</div>
	</section>
	<!-- product section -->




	<!-- end product section -->


	<!-- product section -->




	<!-- end product section -->

	<!-- contact section -->
	
	<!-- end contact section -->


	<!-- client section -->
	<section class="client_section layout_padding-bottom">
		<%@ include file="../views/common/Feddback.jsp"%>
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