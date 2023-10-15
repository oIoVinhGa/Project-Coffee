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

</head><link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="../../assets/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../assets/dist/css/adminlte.min.css">
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

				<form:form action="/category/create" modelAttribute="item"
					method="post">
					<div class="form-group">
						<label for="formGroupExampleInput">Category Id:</label>
						<form:input path="id" type="text" class="form-control"
							id="formGroupExampleInput" placeholder="Category Id?" />
					</div>

					<div class="form-group">
						<label for="formGroupExampleInput2">Category Name:</label>
						<form:input path="name" type="text" class="form-control"
							id="formGroupExampleInput2" placeholder="Category Name?" />
					</div>
					<hr>
					<button class="btn btn-secondary" formaction="/category/create"
						type="submit">Create</button>
					<button class="btn btn-success" formaction="/category/update"
						type="submit">Update</button>
					<button class="btn btn-primary" formaction="/category/index"
						type="submit">Reset</button>
				</form:form>

				<hr>

				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${items}">
							<tr>
								<td>${p.id}</td>
								<td>${p.name}</td>
								<td><a href="/category/delete?id=${p.id}"><i
										class="bi bi-trash text-danger"></i></a> <a
									href="/category/edit/${p.id}"><i
										class="bi bi-pencil-fill"></i></a></td>

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
	<script src="../../assets/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../assets/dist/js/adminlte.min.js"></script>
</body>
</html>
