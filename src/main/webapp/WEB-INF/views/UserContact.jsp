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

<body class="sub_page">
<body class="sub_page">

	<div class="hero_area">
		<!-- header section strats -->
		<div class="container-fluid">
				<nav class="navbar navbar-expand-lg custom_nav-container ">
					<a class="navbar-brand" href="/home"> <span>
							Skyrim </span>
					</a>

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class=""> </span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav  ">
							<li class="nav-item"><a class="nav-link"
								href="/home">Home <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item"><a class="nav-link" href="/home/abouts">
									About</a></li>
							<li class="nav-item"><a class="nav-link" href="/home/product">Products</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								href="testimonial.html">Testimonial</a></li>
							<li class="nav-item active"><a class="nav-link" href="/home/contact">Contact
									Us</a></li>
						</ul>
						<div class="user_optio_box">
							<a href="/home/Login"> <i class="fa fa-user" aria-hidden="true"></i>
							</a> <a href="/shopping-cart/views"> <i class="fa fa-shopping-cart"
								aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</nav>
			</div>
		</header>
		<!-- end header section -->
	</div>
	<section class="contact_section layout_padding">
		<div class="container">
			<div class="heading_container">
				<h2>Contact Us</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form_container">
					<form:form action="/admin/contact/create" modelAttribute="CONTACT"
						method="post">

						<!-- Email input -->
						<div class="form-outline mb-4">
							<label class="form-label" for="form3Example3">Email</label>
							<form:input type="text" id="form3Example3" path="email"
								class="form-control form-control-lg"
								placeholder="Enter a valid Email" name="email" />

							<form:errors path="email" cssClass="error"></form:errors>
						</div>
						<div class="form-outline mb-4">
							<label class="form-label" for="form3Example3">Your Name</label>
							<form:input type="text" id="form3Example3" path="name"
								class="form-control form-control-lg"
								placeholder="Enter a valid Username" name="name" />


							<form:errors path="name" cssClass="error"></form:errors>
						</div>
						<div class="form-outline mb-4">
							<label class="form-label" for="form3Example3">Phone Number</label>
							<form:input type="text" id="form3Example3" path="phonenumber"
								class="form-control form-control-lg"
								placeholder="Enter a valid Username" name="phonenumber" />


							<form:errors path="phonenumber" cssClass="error"></form:errors>
						</div>
						<div class="form-outline mb-4">
							<label class="form-label" for="form3Example3">Message</label>
							<form:input type="text" id="form3Example3" path="Message"
								class="form-control form-control-lg"
								placeholder="Enter your message" name="Message" />


							<form:errors path="Message" cssClass="error"></form:errors>
						</div>

						<form:button type="submit" class="btn btn-primary"
							>Contact</form:button>
					</form:form>
					</div>
				</div>
				<div class="col-md-6 ">
					<div class="map_container">
						<div class="map">
							<div id="googleMap"></div>
						</div>
					</div>
				</div>
			</div>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
		
	</script>
</body>


</html>