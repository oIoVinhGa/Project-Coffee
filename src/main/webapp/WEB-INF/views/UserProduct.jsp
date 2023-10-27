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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="../../assets/css/bootstrap.css" />

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap"
	rel="stylesheet">

<!-- font awesome style -->
<link href="../../assets/css/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="../../assets/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="../../assets/css/responsive.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>
.nav_sub ul li {
	list-style-type: none;
}

.product_btn {
	height: 54px;
}

.product_btn a {
	padding: 8px;
}
</style>

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
							<li class="nav-item"><a class="nav-link" href="/user/index">Home
									<span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item  "><a class="nav-link"
								href="/user/abouts"> About</a></li>
							<li class="nav-item active"><a class="nav-link"
								href="/user/product">Products</a></li>
							<li class="nav-item"><a class="nav-link"
								href="testimonial.html">Testimonial</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/user/contact">Contact Us</a></li>
						</ul>
							<div class="user_optio_box">
							<div class="dropdown show">
								<a class="btn btn-secondary dropdown-toggle" href="#"
									role="button" id="dropdownMenuLink" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">${UserSession.username}</a>

								<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									<a class="dropdown-item" href="#">Profile</a> <a
										class="dropdown-item" href="#">Change Pass</a> <a
										class="dropdown-item" href="/Login/logout">Logout</a>
								</div>
							</div>

							</a> <a class="btn btn-secondary " href="/shopping-cart/views"> <i
								class="fa fa-shopping-cart" aria-hidden="true"></i>
							</a> </a>
						</div>
					</div>
				</nav>
			</div>
		</header>
		<!-- end header section -->
	</div>

	<!-- product section -->
	<section class="product_section ">
		<div class="container">
			<div class="product_heading">
				<h2>Trang sản phẩm: ${pageproduct.number+1}</h2>
			</div>
			<div class="nav_container"
				style="display: flex; justify-content: center; align-items: center;">
				<div class="navsub_container"
					style="display: flex; justify-content: flex-start; width: 70%;">
					<div class="sortby" style="padding: 0px 10px">
						<label>Sort By:</label> <a href="/user/product/sortdesc"><i
							class="bi bi-arrow-down-short"></i> </a> <a
							href="/user/product/sortasc"><i class="bi bi-arrow-up-short"></i></a>
					</div>
					<form:select id="categorySelect" path="category"
						style="padding: 0px 10px">
						<form:option value="">Loại sản phẩm</form:option>
						<form:options items="${category}" />
					</form:select>
					<div class="dropdown" style="padding: 0px 10px">
						<button class="btn btn-secondary dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">Lọc giá</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item"
								href="/user/product/searchMinMax0_500">Giá 0 đến 500.000</a></li>
							<li><a class="dropdown-item"
								href="/user/product/searchMinMax500_1000">Giá 500.000 đến 1.000.000</a></li>
							<li><a class="dropdown-item"
								href="/user/product/searchMinMax1000_1500">Giá 1.000.000 đến 1.500.000</a></li>

						</ul>
					</div>
				</div>
				<form action="/user/product/search">
					<div class="input-group mb-3 p-3">
						<input name="search" type="text" class="form-control"
							placeholder="Search..	" aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary" type="submit"
							id="button-addon2">Search</button>
					</div>
				</form>
			</div>
			<div class="product_container pt-3" id="product">
				<c:forEach items="${pageproduct.content}" var="p">
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
				</c:forEach>
			</div>
	</section>


	<div class="product_btn" style="text-align: center;">
		<a href="/user/product?p=0${param.field!=''?'':'&field='+param.field}"><i
			class="bi bi-chevron-double-left"></i></a>
		<c:forEach begin="0" end="${pageproduct.totalPages-1}"
			var="pageNumber">
			<c:choose>
				<c:when test="${pageNumber == pageproduct.number}">
					<span>${pageNumber + 1}</span>
				</c:when>
				<c:otherwise>
					<a class="badge rounded-pill bg-primary"
						href="/user/product?p=${pageNumber}">${pageNumber + 1}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<a href="/user/product?p=${pageproduct.totalPages-1}"><i
			class="bi bi-chevron-double-right"></i></a>
	</div>

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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- popper js -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous">
		
	</script>
	<!-- bootstrap js -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<script type="text/javascript" src="../assets/js/bootstrap.js"></script>
	<!-- custom js -->
	<script type="text/javascript" src="../assets/js/custom.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
	<script id="product-template" type="text/x-handlebars-template">
					<div class="box">
						<div class="box-content">
							<div class="img-box">
								<img src="/uploads/{{image}}" alt="">
							</div>
							<div class="detail-box">
								<div class="text">
									<h6>${{name}}</h6>
									<h5>
										<span>Giá:</span> {{price}} VNĐ
									</h5>
								</div>
								<div class="like">
									<h6>Like</h6>
									<div class="star_container">
										<i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
											aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
											aria-hidden="true"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="btn-box">
							<a href="/shopping-cart/add/{{id}}"> Add To Cart </a>
						</div>
					</div>
					</script>

	<script>
		$('#categorySelect').change(
				function() {
					var selectedCategory = $(this).val(); // Lấy giá trị của option đã chọn
					var products = $("#product")
					products.empty();
					console.log(selectedCategory)
					$.ajax({
						url : '/user/product/load-products?category='
								+ selectedCategory,
						type : 'GET',
						data : {
							productSelected : selectedCategory,
						},
						success : function(data) {
							var source = $("#product-template").html();
							var template = Handlebars.compile(source);

							data.forEach(function(item) {
								var html = template(item);
								products.append(html);
							});
						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.log("Có lỗi xảy ra: " + textStatus,
									errorThrown);
						}
					});

				});
	</script>

</body>

</html>