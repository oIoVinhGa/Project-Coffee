<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
<!-- Basic -->
<meta charset="UTF-8" />
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
						<li class="nav-item active"><a class="nav-link"
							href="/user/index">Home <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/user/abouts">
								About</a></li>
						<li class="nav-item"><a class="nav-link" href="/user/product">Products</a></li>
						<li class="nav-item"><a class="nav-link"
							href="testimonial.html">Testimonial</a></li>
						<li class="nav-item"><a class="nav-link" href="/user/contact">Contact
								Us</a></li>
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

	<section style="background-color: #eee;">
		<div class="container py-5">
			<form:form action="/Login/Profile" method="post"
				modelAttribute="account" enctype="multipart/form-data">
				<div class="row">
					<div class="col-lg-4">
						<div class="card mb-4">
							<div class="card-body text-center">
								<input type="file" name="image" accept="image/png, image/jpeg"
									src="../uploads/${UserSession.photo}" alt="avatar"
									class="rounded-circle img-fluid" style="width: 150px;">
							</div>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="card mb-4">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Username</p>
									</div>
									<div class="col-sm-9">
										<form:input path="username" type="text"
											class="text-muted mb-0" name="username"
											style="border: none; outline: none; width: 100%;"
											readonly="true" />
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Full Name</p>
									</div>
									<div class="col-sm-9">
										<form:input path="fullname" type="text"
											class="text-muted mb-0" name="fullname"
											style="border: none; outline: none; width: 100%;" />
									</div>
								</div>
								<hr>

								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Password</p>
									</div>
									<div class="col-sm-9">
										<form:input path="password" type="password"
											class="text-muted mb-0" name="password"
											style="border: none; outline: none; width: 100%;"
											readonly="true" />
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Email</p>
									</div>
									<div class="col-sm-9">
										<form:input path="email" type="text" class="text-muted mb-0"
											name="email"
											style="border: none; outline: none; width: 100%;"
											readonly="true" />
									</div>
								</div>
							</div>
						</div>
						<div class="d-flex justify-content-end ">
							<button type="submit" class="btn btn-primary">SAVE</button>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</section>







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