<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

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
	href="../../../assets/css/bootstrap.css" />

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap"
	rel="stylesheet">

<!-- font awesome style -->
<link href="../../../assets/css/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="../../../assets/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="../../../assets/css/responsive.css" rel="stylesheet" />
</head>

<body class="sub_page">
<body class="sub_page">


	<div class="hero_area">
		<!-- header section strats -->
		<header class="header_section">
			<div class="container-fluid">
				<nav class="navbar navbar-expand-lg custom_nav-container ">
					<a class="navbar-brand" href="/home"> <span> Skyrim </span>
					</a>

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class=""> </span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav  ">
							<li class="nav-item"><a class="nav-link" href="/home">Home
									<span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item  active"><a class="nav-link"
								href="/home/abouts"> About</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/home/product">Products</a></li>
							<li class="nav-item"><a class="nav-link"
								href="testimonial.html">Testimonial</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/home/contact">Contact Us</a></li>
						</ul>
						<div class="user_optio_box">
							<a href="/home/Login"> <i class="fa fa-user"
								aria-hidden="true"></i>
							</a> <a href="/shopping-cart/views"> <i
								class="fa fa-shopping-cart" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</nav>
			</div>
		</header>
		<!-- end header section -->
	</div>

	<%-- <section class="bg-light">
		<div class="container pb-5">
			<br> <br>
			<c:forEach var="pd" items="${singleList}">
				<div class="box">
					<div class="box-content">
						<div class="img-box">
							<a href="/home/productsingle/views/${pd.id}"><img
								src="/uploads/${pd.image}" alt=""></a>
						</div>
						<div class="detail-box">
							<div class="text">
								<br>
								<h5>
									<span>Tên Sản Phẩm: ${pd.name}</span>
								</h5>
								<h5>
									<span>Giá: </span> ${pd.price} VNĐ <br> <span>Ngày:
									</span> ${pd.createDate} <br>
								</h5>
							</div>
						</div>
					</div>
					<div class="btn-box">
						<a href="/shopping-cart/add/${pd.id}"> Add To Cart </a>
					</div>
			</c:forEach>
		</div>
	</section> --%>


	<!-- Open Contenteeee -->
	<section class="bg-light">
		<c:forEach var="pd" items="${singleList}">
			<div class="container pb-5">
				<div class="row">
					<div class="col-lg-5 mt-5">
						<div class="card mb-3">
							<a href="/home/productsingle/views/${pd.id}"><img
								src="/uploads/${pd.image}" alt=""></a>
						</div>
						<div class="row">
							<!--Start Carousel Wrapper-->
							<div id="multi-item-example"
								class="col-10 carousel slide carousel-multi-item"
								data-bs-ride="carousel">
								<!--Start Slides-->
								<div class="carousel-inner product-links-wap" role="listbox">
									<!--Second slide-->
									<div class="carousel-item">
										<div class="row">
											<div class="col-4">
												<a href="#"> <img class="card-img img-fluid"
													src="assets/img/product_single_04.jpg"
													alt="Product Image 4">
												</a>
											</div>
											<div class="col-4">
												<a href="#"> <img class="card-img img-fluid"
													src="assets/img/product_single_05.jpg"
													alt="Product Image 5">
												</a>
											</div>
											<div class="col-4">
												<a href="#"> <img class="card-img img-fluid"
													src="assets/img/product_single_06.jpg"
													alt="Product Image 6">
												</a>
											</div>
										</div>
									</div>
									<!--/.Second slide-->

									<!--Third slide-->
									<div class="carousel-item">
										<div class="row">
											<div class="col-4">
												<a href="#"> <img class="card-img img-fluid"
													src="assets/img/product_single_07.jpg"
													alt="Product Image 7">
												</a>
											</div>
											<div class="col-4">
												<a href="#"> <img class="card-img img-fluid"
													src="assets/img/product_single_08.jpg"
													alt="Product Image 8">
												</a>
											</div>
											<div class="col-4">
												<a href="#"> <img class="card-img img-fluid"
													src="assets/img/product_single_09.jpg"
													alt="Product Image 9">
												</a>
											</div>
										</div>
									</div>
									<!--/.Third slide-->
								</div>
								<!--End Slides-->
							</div>
							<!--End Carousel Wrapper-->
						</div>
					</div>
					<!-- col end -->
					<div class="col-lg-7 mt-5">
						<div class="card">
							<div class="card-body">
								<h1 class="h2">${pd.name}</h1>
								<p class="h3 py-2">Giá: ${pd.price} VNĐ</p>
								<p class="py-2">
									<i class="fa fa-star text-warning"></i> <i
										class="fa fa-star text-warning"></i> <i
										class="fa fa-star text-warning"></i> <i
										class="fa fa-star text-warning"></i> <i
										class="fa fa-star text-secondary"></i> <span
										class="list-inline-item text-dark">Rating 4.8 | 36
										Comments</span>
								</p>
								<ul class="list-inline">
									<li class="list-inline-item">
										<h6>Date:</h6>
									</li>
									<li class="list-inline-item">
										<p class="text-muted">
											<strong>${pd.createDate}</strong>
										</p>
									</li>
								</ul>
								<div class="row pb-3">
									<div class="col d-grid">
										<button type="submit" class="btn btn-success btn-lg"
											name="submit" value="addtocard">
											<a href="/shopping-cart/add/${pd.id}" style="color: white;"> Add To Cart </a>
										</button>
									</div>
								</div>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</section>
	<!-- Close Content -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

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
	<script type="text/javascript"
		src="../../assets/js/jquery-3.4.1.min.js"></script>
	<!-- popper js -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous">
		
	</script>
	<!-- bootstrap js -->
	<script type="text/javascript" src="../../assets/js/bootstrap.js"></script>
	<!-- custom js -->
	<script type="text/javascript" src="../../assets/js/custom.js"></script>
	<!-- Google Map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
		
	</script>
</body>
</html>