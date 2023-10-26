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

</head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="../../../assets/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../../assets/dist/css/adminlte.min.css">
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- Navbar -->
		<%@ include file="../views/component/Navbar.jsp"%>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<%@ include file="../views/component/SlideBar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">Responsive Hover Table</h3>

							<div class="card-tools">
								<div class="input-group input-group-sm" style="width: 150px;">
									<input type="text" name="table_search"
										class="form-control float-right" placeholder="Search">

									<div class="input-group-append">
										<button type="submit" class="btn btn-default">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th>ID</th>
										<th>User</th>
										<th>PhoneNumber</th>
										<th>CreateDate</th>
										<th>Status</th>
										<th>Address</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${ODERS}">
										<form action="/admin/oder/update" method="post">
												<input type="hidden" name="id" value="${item.id}" />
											<tr>
												<td>${item.id}</td>
												<td>${item.account.username}</td>
												<td>${item.phonenumber}</td>
												<td>${item.createDate}</td>
												<td><select name="status" id="status" onblur="this.form.submit()">
														<option value="0" ${item.status==0?'selected':''}>Đang
															xử lí</option>
														<option value="1" ${item.status==1?'selected':''}>Đã
															Xữ lý</option>
														<option value="2" ${item.status==2?'selected':''}>Đang
															giao hàng</option>
														<option value="3" ${item.status==3?'selected':''}>Giao
															hàng thành công</option>
														<option value="4" ${item.status==4?'selected':''}>Hủy</option>
												</select></td>
												<td>${item.address}</td>
											</tr>
										</form>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
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
