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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<style type="text/css">
.error {
	color: red;
}
</style>
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
		<form:form action="/product/Create" modelAttribute="product"
			method="post" enctype="multipart/form-data">
			<form:input type="hidden" class="form-control" path="id"
				 />
			
			<div class="form-group">
				<label>Name:</label>
				<form:input type="text" class="form-control" path="name"
					placeholder="Enter Product Name" />
				<form:errors path="name" cssClass="error" />
			</div>
			<div class="form-group">
				<label>Price:</label>
				<form:input type="number" class="form-control" path="price"
					placeholder="Enter Product Price" />
				<form:errors path="price" cssClass="error" />
			</div>

			<div class="form-group">
				<label>Photo</label> <input type="file" class="form-control"
					name="image" accept="image/png, image/jpeg" />
				<p class="error">${ERROR_PHOTO}</p>
			</div>
			<div class="form-group">
				<label>Category : </label>
				<form:select path="category" class="form-control">
					<form:options items="${categories}" itemValue="id" itemLabel="name" />
				</form:select>
			</div>
			<div class="form-group">
				<label>Status</label>
				<div class="radio">
					<!--value = 1 => Nam| 0 =>Nu -->
					<label class="checkbox-inline"> <form:checkbox
							path="avaiable" /> Acvaiable 
				</div>
			</div>
			<form:button type="submit" class="btn btn-primary"
				formaction="/admin/product/Create">Create</form:button>
			<form:button type="submit" class="btn btn-primary"
				formaction="/admin/product/page">Reset</form:button>
			<form:button type="submit" class="btn btn-primary"
				formaction="/admin/product/Create">Update</form:button>

		</form:form>


		<hr>
		<h3>SORTING BY: ${field}</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Image</th>
					<th><a href="?field=id">ID</a></th>
					<th><a href="?field=name">Name</a></th>
					<th><a href="?field=price">Price</a></th>
					<th><a href="?field=createDate">Date</a></th>
					<th>Avaible</th>
					<th>Category</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${page.content}">
					<tr>
						<td align="center"><img src="/uploads/${p.image}" width="40"
							height="40" /></td>
						<td>${p.id}</td>
						<td>${p.name}</td>
						<td>${p.price}</td>
						<th>${p.createDate}</th>
						<td>${p.avaiable?"NotEmpty":"IsEmpty"}</td>
						<td>${p.category.name}</td>
						<td><a href="/product/page?btnDel=&id=${p.id}"><i
								class="bi bi-trash text-danger"></i></a> <a
							href="/admin/product/edit/${p.id}"><i class="bi bi-pencil-fill"></i></a></td>

					</tr>
				</c:forEach>


			</tbody>
			
		</table>
		<ul>
		<a href="/admin/product/page?p=0${param.field!=''?'':'&field='+param.field}" class="btn btn-outline-primary">First</a>
		<a href="/admin/product/page?p=${page.number==0?page.number:page.number-1}${param.field!=''?'':'&field='+param.field}" class="btn btn-outline-primary" >Previous</a>
		<a href="/admin/product/page?p=${page.number+1}${param.field!=''?'':'&field='+param.field}" class="btn btn-outline-primary"${page.number==page.totalPages?'disabled':''}>Next</a>
		<a href="/admin/product/page?p=${page.totalPages-1}${param.field!=''?'':'&field='+param.field}" class="btn btn-outline-primary">Last</a>
			<li>Số thực thể hiện tại: ${page.numberOfElements}</li>
			<li>Trang số: ${page.number}</li>
			<li>Kích thước trang: ${page.size}</li>
			<li>Tổng số thực thể: ${page.totalElements}</li>
			<li>Tổng số trang: ${page.totalPages}</li>
		</ul>
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
