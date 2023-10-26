<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

.error {
	color: red;
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
						<p class="lead fw-normal mb-0 me-3">Forgot Password</p>
					</div>

					<div class="divider d-flex align-items-center my-4">
						<p class="text-center fw-bold mx-3 mb-0">Or</p>
					</div>
					<form:form action="/account/SaveOrUpdate" modelAttribute="ACCOUNT"
						method="post">

						<!-- Email input -->
						<div class="form-outline mb-4">
							<c:if test="${not empty error_EmailAccount}">
								<div class="form-text text-danger" role="alert">
									${error_EmailAccount}</div>
							</c:if>
							<label class="form-label" for="form3Example3">Email</label>
							<form:input type="text" id="form3Example3" path="email"
								class="form-control form-control-lg"
								placeholder="Enter a valid Email" name="email" />
							<form:errors path="email" cssClass="error"></form:errors>
						</div>
						<div class="form-outline mb-4">
							<c:if test="${not empty error_forgotAccount}">
								<div class="form-text text-danger" role="alert">
									${error_forgotAccount}</div>
							</c:if>
							<label class="form-label" for="form3Example3">Username</label>
							<form:input type="text" id="form3Example3" path="username"
								class="form-control form-control-lg"
								placeholder="Enter a valid Username" name="username" />
							<form:errors path="username" cssClass="error"></form:errors>
						</div>
						<div class="form-outline mb-4">
							<label class="form-label" for="form3Example3">OTP Mail:</label>
							<div class="row">
								<div class="col-md-9">

									<input type="text" id="form3Example3"
										class="form-control form-control-lg"
										placeholder="Enter a valid OTP Mail" name="otp" />
								</div>
								<div class="col-md-3">
									<form:button type="submit" class="btn btn-primary btn-block"
										formaction="/forgotpassword/SendOTP">Send OTP</form:button>
								</div>
								<c:if test="${not empty error_SendMailOTP}">
									<p>${error_SendMailOTP}</p>
								</c:if>
								<c:if test="${not empty success_sendEmail}">
									<p>${success_sendEmail}</p>
								</c:if>
							</div>
						</div>
						<form:button type="submit" class="btn btn-primary"
							formaction="/forgotpassword/Forgot">Forgot Password</form:button>
					</form:form>
					<div class="text-center text-lg-start mt-4">
						<p class="small fw-bold mt-2 pt-1 mb-0">
							Don't have an account? <a href="/home/register"
								class="link-danger">Register</a>
						</p>
						<p class="small fw-bold mt-2 mb-0">
							You already have an account? <a href="/Login" class="link-danger">Login</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div
			class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
			<!-- Copyright -->
			<div class="text-white mb-3 mb-md-0">Copyright Â© 2020. All
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