<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style>
.divider:after, .divider:before {
	content: "";
	flex: 1;
	height: 1px;
	background: #eee;
}

.h-custom {
	height: calc(100% - 73px);
}

@media ( max-width : 450px) {
	.h-custom {
		height: 100%;
	}
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</head>
<body>
	<section class="vh-100">
		<div class="container-fluid h-custom">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-9 col-lg-6 col-xl-5">
					<img
						src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
						class="img-fluid" alt="Sample image">
				</div>


				<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
					<div
						class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
						<p class="lead fw-normal mb-0 me-3">Register Form</p>
					</div>

					<div class="divider d-flex align-items-center my-4">
						<p class="text-center fw-bold mx-3 mb-0">Or</p>
					</div>
					<form:form action="/account/SaveOrUpdate" modelAttribute="ACCOUNT"
						method="post">

						<!-- Email input -->
						<div class="form-outline mb-4">
							<form:input type="text" id="form3Example3" path="email"
								class="form-control form-control-lg"
								placeholder="Enter a valid Email" name="email" />
								<label
								class="form-label" for="form3Example3" >Email</label>

							<form:errors path="email" cssClass="error"></form:errors>
						</div>
						<div class="form-outline mb-4">
							<form:input type="text" id="form3Example3" path="email"
								class="form-control form-control-lg"
								placeholder="Enter a valid Username" name="username" />
								<label
								class="form-label" for="form3Example3" >Username</label>

							<form:errors path="email" cssClass="error"></form:errors>
						</div>
						<div class="form-outline mb-4">
							<form:input type="password" id="form3Example3" path="email"
								class="form-control form-control-lg"
								placeholder="Enter a valid password" name="password" />
								<label
								class="form-label" for="form3Example3" >Password</label>

							<form:errors path="email" cssClass="error"></form:errors>
						</div>

						<form:button type="submit" class="btn btn-primary">Submit</form:button>
						<form:button type="reset" class="btn btn-primary">Cancel</form:button>
						<a href="/account/views" class="btn btn-primary">Display
							Account</a>
					</form:form>
					<div class="text-center text-lg-start mt-4 pt-2">
						
						<p class="small fw-bold mt-2 pt-1 mb-0">
							You already have an account? <a href="#!" class="link-danger">Login</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div
			class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
			<!-- Copyright -->
			<div class="text-white mb-3 mb-md-0">Copyright © 2020. All
				rights reserved.</div>
			<!-- Copyright -->

			<!-- Right -->
			<div>
				<a href="#!" class="text-white me-4"> <i
					class="fab fa-facebook-f"></i>
				</a> <a href="#!" class="text-white me-4"> <i class="fab fa-twitter"></i>
				</a> <a href="#!" class="text-white me-4"> <i class="fab fa-google"></i>
				</a> <a href="#!" class="text-white"> <i class="fab fa-linkedin-in"></i>
				</a>
			</div>
			<!-- Right -->
		</div>
	</section>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>