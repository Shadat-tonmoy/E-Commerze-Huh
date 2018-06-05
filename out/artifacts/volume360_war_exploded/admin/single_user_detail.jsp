<%@ page import="com.shadat.main.model.OrderUserDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sun.org.apache.xpath.internal.operations.Or" %>
<%@ page import="com.shadat.database.Database" %><%--
  Created by IntelliJ IDEA.
  User: shadat
  Date: 6/5/18
  Time: 11:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<!-- Left Panel -->
<%@ include file="side_bar.jsp" %>
<!-- Left Panel -->

<div id="right-panel" class="right-panel">

    <!-- Header-->
    <!-- Header-->
    <header id="header" class="header">

        <div class="header-menu">

            <div class="col-sm-7">
                <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                <div class="col-sm-4">
                    <div class="page-header float-left">
                        <div class="page-title">
                            <h1>Dashboard</h1>
                        </div>
                    </div>
                </div>
            </div>

    </header><!-- /header -->
    <!-- Header-->

    <%
        String id = request.getParameter("id");
        Database database = new Database();
        OrderUserDetail orderUserDetail = database.getOrderUser(Integer.parseInt(id));
        String firstName = orderUserDetail.getFirstName();
        String lastName = orderUserDetail.getLastName();
        String detailAddress = orderUserDetail.getDetailAddress();
        String email = orderUserDetail.getEmail();
        String phone = orderUserDetail.getPhone();

    %>



    <div class="content mt-3">
        <div class="animated fadeIn">
            <div class="row">

                <div class="col-md-12">

                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">User Detail</strong>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-bordered">
                                <tbody>
                                <tr>
                                    <td>First Name</td>
                                    <td><%=firstName%></td>
                                </tr>
                                <tr>
                                    <td>Last Name</td>
                                    <td><%=lastName%></td>
                                </tr>
                                <tr>
                                    <td>Detail Address</td>
                                    <td><%=detailAddress%></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><%=email%></td>
                                </tr>
                                <tr>
                                    <td>Phone No</td>
                                    <td><%=phone%></td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div><!-- .animated -->
    </div><!-- .content -->


</div><!-- /#right-panel -->

<!-- Right Panel -->


<script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/plugins.js"></script>
<script src="assets/js/main.js"></script>


<script src="assets/js/lib/data-table/datatables.min.js"></script>
<script src="assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
<script src="assets/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
<script src="assets/js/lib/data-table/jszip.min.js"></script>
<script src="assets/js/lib/data-table/pdfmake.min.js"></script>
<script src="assets/js/lib/data-table/vfs_fonts.js"></script>
<script src="assets/js/lib/data-table/buttons.html5.min.js"></script>
<script src="assets/js/lib/data-table/buttons.print.min.js"></script>
<script src="assets/js/lib/data-table/buttons.colVis.min.js"></script>
<script src="assets/js/lib/data-table/datatables-init.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#bootstrap-data-table-export').DataTable();
    });
</script>


</body>
</html>
