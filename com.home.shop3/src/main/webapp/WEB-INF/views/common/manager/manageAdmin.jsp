<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="${base}/manager/css/main.css">
</head>
<body onload="time()" class="app sidebar-mini rtl">
	<!-- Navbar-->
	<header class="app-header">
		<!-- Sidebar toggle button-->
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
			aria-label="Hide Sidebar"></a>
		<!-- Navbar Right Menu-->
		<ul class="app-nav">


			<!-- User Menu-->
			<li><a class="app-nav__item" href="${base }/home"><i
					class='bx bx-log-out bx-rotate-180'></i> </a></li>
		</ul>
	</header>
	<!-- Sidebar menu-->
	<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	<aside class="app-sidebar">
		<div class="app-sidebar__user">
			<!-- <img class="app-sidebar__user-avatar" src="/images/hay.jpg" width="50px" alt="User Image"> -->
			<div>
				<p class="app-sidebar__user-name">
					<b>${userLogined.name }</b>
				</p>
				<p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
			</div>
		</div>
		<hr>
		<ul class="app-menu">
			<li><a class="app-menu__item haha" href="phan-mem-ban-hang.html"><i
					class='app-menu__icon bx bx-cart-alt'></i> <span
					class="app-menu__label">POS Bán Hàng</span></a></li>
			<li><a class="app-menu__item " href="${base }/admin"><i
					class='app-menu__icon bx bx-tachometer'></i><span
					class="app-menu__label">Bảng điều khiển</span></a></li>
			<li><a class="app-menu__item " href="${base }/admin/employee"><i
					class='app-menu__icon bx bx-id-card'></i> <span
					class="app-menu__label">Quản lý nhân viên</span></a></li>
			<li><a class="app-menu__item active"
				href="${base }/admin/admin1"><i
					class='app-menu__icon bx bx-id-card'></i> <span
					class="app-menu__label">Quản lý Admin</span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/user"><i
					class='app-menu__icon bx bx-user-voice'></i><span
					class="app-menu__label">Quản lý khách hàng</span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/product"><i
					class='app-menu__icon bx bx-purchase-tag-alt'></i><span
					class="app-menu__label">Quản lý sản phẩm</span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/order"><i
					class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản
						lý đơn hàng</span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/intestine"><i
					class='app-menu__icon bx bx-run'></i><span class="app-menu__label">Quản
						lý nội bộ </span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/salary"><i
					class='app-menu__icon bx bx-dollar'></i><span
					class="app-menu__label">Bảng kê lương</span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/report"><i
					class='app-menu__icon bx bx-pie-chart-alt-2'></i><span
					class="app-menu__label">Báo cáo doanh thu</span></a></li>
			<li><a class="app-menu__item" href="/admin/contact"><i
					class='app-menu__icon bx bx-calendar-check'></i><span
					class="app-menu__label">Liên hệ Khách hàng </span></a></li>
			<li><a class="app-menu__item" href="#"><i
					class='app-menu__icon bx bx-cog'></i><span class="app-menu__label">Cài
						đặt hệ thống</span></a></li>
		</ul>
	</aside>
	<main class="app-content">
		<div class="app-title">
			<ul class="app-breadcrumb breadcrumb side">
				<li class="breadcrumb-item active"><a href="#"><b>Danh
							sách người dùng</b></a></li>
			</ul>
			<div id="clock"></div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div class="tile-body">

						<div class="row element-button">
							<div class="col-sm-2">

								<a class="btn btn-add btn-sm" href="${base }/admin/createAdminAccount"
									title="Thêm"><i class="fas fa-plus"></i> Tạo mới người dùng</a>
							</div>
							<div class="col-sm-2">
								<a class="btn btn-delete btn-sm nhap-tu-file" type="button"
									title="Nhập" onclick="myFunction(this)"><i
									class="fas fa-file-upload"></i> Tải từ file</a>
							</div>

							<div class="col-sm-2">
								<a class="btn btn-delete btn-sm print-file" type="button"
									title="In" onclick="myApp.printTable()"><i
									class="fas fa-print"></i> In dữ liệu</a>
							</div>
							<div class="col-sm-2">
								<a class="btn btn-delete btn-sm print-file js-textareacopybtn"
									type="button" title="Sao chép"><i class="fas fa-copy"></i>
									Sao chép</a>
							</div>

							<div class="col-sm-2">
								<a class="btn btn-excel btn-sm" href="" title="In"><i
									class="fas fa-file-excel"></i> Xuất Excel</a>
							</div>
							<div class="col-sm-2">
								<a class="btn btn-delete btn-sm pdf-file" type="button"
									title="In" onclick="myFunction(this)"><i
									class="fas fa-file-pdf"></i> Xuất PDF</a>
							</div>
							<div class="col-sm-2">
								<a class="btn btn-delete btn-sm" type="button" title="Xóa"
									onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
									Xóa tất cả </a>
							</div>
						</div>
						<table class="table table-hover table-bordered js-copytextarea"
							cellpadding="0" cellspacing="0" border="0" id="sampleTable">
							<thead>
								<tr>
									<th width="10"><input type="checkbox" id="all"></th>
									<th>ID người dùng</th>
									<th width="150">Họ và tên</th>
									<!-- <th width="20">Ảnh thẻ</th> -->
									<th width="300">Địa chỉ</th>
									<th>Ngày sinh</th>
									<th>Giới tính</th>
									<th>SĐT</th>
									<th>Tình trạng</th>
									<th width="100">Tính năng</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="user" items="${list }">
									<tr>
										<td width="10"><input type="checkbox" name="check2"
											value="2"></td>
										<td>${user.id }</td>
										<td>${user.name }</td>
										<!-- <td><img class="img-card-person" src="/img-anhthe/2.jpg"
											alt=""></td> -->
										<td>${user.shippingAddress }</td>
										<%-- <td>${user.dob }</td> --%>
										<td></td>
										<td>${user.gender }</td>
										<td>${user.phone }</td>
										<td><c:choose>
												<c:when test="${user.status }">Đang hoạt động</c:when>
												<c:otherwise>Bị khóa</c:otherwise>
											</c:choose></td>


										<td><c:if test="${isAdmin }">
												<button onclick="ChangeToUser(${user.id});"
													class="btn btn-primary btn-sm alert " type="button"
													title="sửa admin" id="show-emp" data-toggle="modal"
													data-target="#ModalUP">
													<i class="fas fa-edit"></i>sửa thành User
												</button>
											</c:if> <script type="text/javascript">
												function ChangeToUser(userId) {
													
													//with upload file
													// Get form
												    //var form = $('#fileUploadForm')[0];
												    //var data = new FormData(form);
													
													// javascript object.
													// data la du lieu ma day len action cua controller
													let data = {
														id:userId,
													};
													
													// $ === jQuery
													// json == javascript object
													jQuery.ajax({
														url : "/admin/user/management/changeToUser",
														type : "post",
														contentType : "application/json",
														data : JSON.stringify(data),
														
														
														dataType : "json", // kieu du lieu tra ve tu controller la json
														success : function(jsonResult) {
															
															alert("Chuc mung! da luu thanh cong dang ki "+jsonResult.statusCode + jsonResult.statusMessage);
															location.reload();
														},
														error : function(jqXhr, textStatus, errorMessage) { // error callback 
															alert("error");
														}
													});
												}
												</script> <c:if test="${isAdmin }">
												<button class="btn btn-primary btn-sm trash" type="button"
													title="Xóa" onclick="DeleteUser(${user.id})">
													<i class="fas fa-trash-alt"></i>Mở/Khóa tài khoản
												</button>
											</c:if> <a href="${base }/admin/user/management/${user.id}"
											class="btn btn-primary btn-sm edit" type="button" title="Sửa"
											id="show-emp" data-toggle="modal" data-target="#ModalUP">
												<i class="fas fa-edit"></i>Chi tiết
										</a></td>
										<script type="text/javascript">
												function ChangeToAdmin(userId) {
													
													//with upload file
													// Get form
												    //var form = $('#fileUploadForm')[0];
												    //var data = new FormData(form);
													
													// javascript object.
													// data la du lieu ma day len action cua controller
													let data = {
														id:userId,
													};
													
													// $ === jQuery
													// json == javascript object
													jQuery.ajax({
														url : "/admin/user/management/changeToAdmin",
														type : "post",
														contentType : "application/json",
														data : JSON.stringify(data),
														
														
														dataType : "json", // kieu du lieu tra ve tu controller la json
														success : function(jsonResult) {
															
															alert("Chuc mung! da luu thanh cong dang ki "+jsonResult.statusCode + jsonResult.statusMessage);
															location.reload();
														},
														error : function(jqXhr, textStatus, errorMessage) { // error callback 
															alert("error");
														}
													});
												}
												</script>
									</tr>
								</c:forEach>



							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!--
    MODAL
  -->
	<div class="modal fade" id="ModalUP" tabindex="-1" role="dialog"
		aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-body">
					<div class="row">
						<div class="form-group  col-md-12">
							<span class="thong-tin-thanh-toan">
								<h5>Chỉnh sửa thông tin nhân viên cơ bản</h5>
							</span>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label">ID người dùng</label> <input
								class="form-control" type="text" required value="#CD2187"
								disabled>
						</div>
						<div class="form-group col-md-6">
							<label class="control-label">Họ và tên</label> <input
								class="form-control" type="text" required
								value="${userLogined.name }">
						</div>
						<div class="form-group  col-md-6">
							<label class="control-label">Số điện thoại</label> <input
								class="form-control" type="number" required value="09267312388">
						</div>
						<div class="form-group col-md-6">
							<label class="control-label">Địa chỉ email</label> <input
								class="form-control" type="text" required
								value="truong.vd2000@gmail.com">
						</div>
						<div class="form-group col-md-6">
							<label class="control-label">Ngày sinh</label> <input
								class="form-control" type="date" value="15/03/2000">
						</div>
						<div class="form-group  col-md-6">
							<label for="exampleSelect1" class="control-label">Chức vụ</label>
							<select class="form-control" id="exampleSelect1">
								<option>Bán hàng</option>
								<option>Tư vấn</option>
								<option>Dịch vụ</option>
								<option>Thu Ngân</option>
								<option>Quản kho</option>
								<option>Bảo trì</option>
								<option>Kiểm hàng</option>
								<option>Bảo vệ</option>
								<option>Tạp vụ</option>
							</select>
						</div>
					</div>
					<BR> <a href="#"
						style="float: right; font-weight: 600; color: #ea0000;">Chỉnh
						sửa nâng cao</a> <BR> <BR>
					<button class="btn btn-save" type="button">Lưu lại</button>
					<a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
					<BR>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!--
    MODAL
  -->

	<!-- Essential javascripts for application to work-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="src/jquery.table2excel.js"></script>
	<script src="js/main.js"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script src="js/plugins/pace.min.js"></script>
	<!-- Page specific javascripts-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
	<!-- Data table plugin-->
	<script type="text/javascript"
		src="js/plugins/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="js/plugins/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript">$('#sampleTable').DataTable();</script>
	<script>
	function DeleteUser(userId) {
		
		//with upload file
		// Get form
	    //var form = $('#fileUploadForm')[0];
	    //var data = new FormData(form);
		
		// javascript object.
		// data la du lieu ma day len action cua controller
		let data = {
			id:userId,
		};
		
		// $ === jQuery
		// json == javascript object
		jQuery.ajax({
			url : "/admin/user/management/delete",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			
			
			dataType : "json", // kieu du lieu tra ve tu controller la json
			success : function(jsonResult) {
				
				alert("Chuc mung! da luu thanh cong dang ki "+jsonResult.statusCode + jsonResult.statusMessage);
				location.reload();
			},
			error : function(jqXhr, textStatus, errorMessage) { // error callback 
				alert("error");
			}
		});
	}
	
	
      function deleteRow(r) {
        var i = r.parentNode.parentNode.rowIndex;
        document.getElementById("myTable").deleteRow(i);
      }
      jQuery(function () {
        jQuery(".trash").click(function () {
          swal({
            title: "Cảnh báo",
           
            text: "Bạn có chắc chắn là muốn xóa nhân viên này?",
            buttons: ["Hủy bỏ", "Đồng ý"],
          })
            .then((willDelete) => {
              if (willDelete) {
                swal("Đã xóa thành công.!", {
                  
                });
              }
            });
        });
      });
      oTable = $('#sampleTable').dataTable();
      $('#all').click(function (e) {
        $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        e.stopImmediatePropagation();
      });
  
      //EXCEL
      // $(document).ready(function () {
      //   $('#').DataTable({
  
      //     dom: 'Bfrtip',
      //     "buttons": [
      //       'excel'
      //     ]
      //   });
      // });
  
  
      //Thời Gian
      function time() {
        var today = new Date();
        var weekday = new Array(7);
        weekday[0] = "Chủ Nhật";
        weekday[1] = "Thứ Hai";
        weekday[2] = "Thứ Ba";
        weekday[3] = "Thứ Tư";
        weekday[4] = "Thứ Năm";
        weekday[5] = "Thứ Sáu";
        weekday[6] = "Thứ Bảy";
        var day = weekday[today.getDay()];
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        nowTime = h + " giờ " + m + " phút " + s + " giây";
        if (dd < 10) {
          dd = '0' + dd
        }
        if (mm < 10) {
          mm = '0' + mm
        }
        today = day + ', ' + dd + '/' + mm + '/' + yyyy;
        tmp = '<span class="date"> ' + today + ' - ' + nowTime +
          '</span>';
        document.getElementById("clock").innerHTML = tmp;
        clocktime = setTimeout("time()", "1000", "Javascript");
  
        function checkTime(i) {
          if (i < 10) {
            i = "0" + i;
          }
          return i;
        }
      }
      //In dữ liệu
      var myApp = new function () {
        this.printTable = function () {
          var tab = document.getElementById('sampleTable');
          var win = window.open('', '', 'height=700,width=700');
          win.document.write(tab.outerHTML);
          win.document.close();
          win.print();
        }
      }
      //     //Sao chép dữ liệu
      //     var copyTextareaBtn = document.querySelector('.js-textareacopybtn');
  
      // copyTextareaBtn.addEventListener('click', function(event) {
      //   var copyTextarea = document.querySelector('.js-copytextarea');
      //   copyTextarea.focus();
      //   copyTextarea.select();
  
      //   try {
      //     var successful = document.execCommand('copy');
      //     var msg = successful ? 'successful' : 'unsuccessful';
      //     console.log('Copying text command was ' + msg);
      //   } catch (err) {
      //     console.log('Oops, unable to copy');
      //   }
      // });
  
  
      //Modal
      $("#show-emp").on("click", function () {
        $("#ModalUP").modal({ backdrop: false, keyboard: false })
      });
    </script>
</body>
</html>