<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../views/component/tittle.jsp"%>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="../../../assets/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../../assets/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- Navbar -->
		<%@ include file="../views/component/Navbar.jsp"%>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<%@ include file="../views/component/SlideBar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Catagory</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Starter Page</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
		<div class="container">
		<h2>Form Account</h2>
		<form:form action="/admin/account/Create" modelAttribute="ACCOUNT"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label>UserName</label>
				<form:input type="text" class="form-control" path="username"
					placeholder="Enter UserName" />
				<form:errors path="username" cssClass="error" />
			</div>
			<div class="form-group">
				<label>Password:</label>
				<form:input type="password" class="form-control" path="password"
					placeholder="Enter password" />
				<form:errors path="password" cssClass="error" />
			</div>
			<div class="form-group">
				<label>FullName</label>
				<form:input type="text" class="form-control" path="fullname"
					placeholder="Enter fullname" />
				<form:errors path="fullname" cssClass="error" />
			</div>
			<div class="form-group">
				<label>Email</label>
				<form:input type="text" class="form-control" path="email"
					placeholder="Enter email" />
				<form:errors path="email" cssClass="error" />
			</div>
			<div class="form-group">
				<label>Photo</label> <input type="file" class="form-control"
					name="image" accept="image/png, image/jpeg" />
				<p class="error">${ERROR_PHOTO}</p>
			</div>
			<div class="form-group">
				<label>Status</label>
				<div class="radio">
					<!--value = 1 => Nam| 0 =>Nu -->
					<label class="checkbox-inline"> <form:checkbox
							path="activated" />Activated
					</label> <label class="checkbox-inline"> <form:checkbox
							path="admin" />Admin
					</label>
				</div>
			</div>
			<form:button type="submit" class="btn btn-primary"
				formaction="/admin/account/Create">Create</form:button>
			<form:button type="submit" class="btn btn-primary"
				formaction="/admin/account/views">Reset</form:button>
			<form:button type="submit" class="btn btn-primary"
				formaction="/admin/account/Create">Update</form:button>

		</form:form>
		<hr>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Photo</th>
					<th>UserName</th>
					<th>Password</th>
					<th>FullName</th>
					<th>Email</th>
					<th>Activated</th>
					<th>Admin</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ACCOUNTS}" var="ac">
					<tr>
						<td align="center"><img src="/uploads/${ac.photo}" width="40"
							height="40" /></td>
						<td>${ac.username}</td>
						<td>${ac.password}</td>
						<td>${ac.fullname}</td>
						<td>${ac.email}</td>
						<td>${ac.activated?"online":"offline"}</td>
						<td>${ac.admin?"Admin":"User"}</td>
						<td><a class="btn btn-primary btn-sm"
							href="/admin/account/edit/${ac.username}">Edit</a>| <a
							class="btn btn-danger btn-sm"
							href="?btnDel=&username=${ac.username}">Del</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Control Sidebar -->
		<%@ include file="../views/component/ControlSidebar.jsp"%>
		<!-- /.control-sidebar -->

		<!-- Main Footer -->
		<%@ include file="../views/component/Footer.jsp"%>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- jQuery -->
	<script src="../../../assets/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../../assets/dist/js/adminlte.min.js"></script>
</body>
</html>
