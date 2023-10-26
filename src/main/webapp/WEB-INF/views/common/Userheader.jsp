<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<li class="nav-item active"><a class="nav-link" href="/user/index">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/user/abouts">
						About</a></li>
				<li class="nav-item"><a class="nav-link" href="/user/product">Products</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="testimonial.html">Testimonial</a></li>
				<li class="nav-item"><a class="nav-link" href="/user/contact">Contact
						Us</a></li>
			</ul>
			<div class="user_optio_box">
				<div class="dropdown show">
					<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Dropdown link </a>

					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="#">Profile</a> <a
							class="dropdown-item" href="#">Change Pass</a> <a
							class="dropdown-item" href="/Login/logout">Logout</a>
					</div>
				</div>
				
				</a> <a class="btn btn-secondary " href="/shopping-cart/views"> <i class="fa fa-shopping-cart"
					aria-hidden="true"></i>
				</a> </a>
			</div>
		</div>
	</nav>
</div>