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



    <div class="content mt-3">
        <div class="animated fadeIn">
            <div class="row">

                <div class="col-md-12">

                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Data Table</strong>
                        </div>
                        <div class="card-body">
                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Detail Address</th>
                                    <th>Email</th>
                                    <th>Phone No</th>
                                    <th>User Id</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    Database database = new Database();
                                    List<OrderUserDetail> orderUserDetails = database.getOrderUsers();
                                    for (OrderUserDetail orderUserDetail : orderUserDetails) {
                                %>
                                <tr>

                                    <td>
                                        <%= orderUserDetail.getFirstName() %>
                                    </td>
                                    <td>
                                        <%= orderUserDetail.getLastName() %>
                                    </td>
                                    <td>
                                        <%= orderUserDetail.getDetailAddress() %>
                                    </td>
                                    <td>
                                        <%= orderUserDetail.getEmail() %>
                                    </td>
                                    <td>
                                        <%= orderUserDetail.getPhone() %>
                                    </td>
                                    <td>
                                        <%= orderUserDetail.getId() %>
                                    </td>
                                    <td>
                                        <%--<a href="images?<%= product.getId()%>" style="padding:8px; color: #16a085; ">Add Images</a>--%>


                                        <form method="POST" action="edit-veneer-sheet" style="display: inline-block;">
                                            <button type="submit" class="btn btn-outline-danger btn-sm" name="delete" value="<%= orderUserDetail.getId()%>">
                                                Delete
                                            </button>
                                        </form>
                                        <%--<a href="delete?<%= product.getId()%>" style="padding:8px; color: #e74c3c; ">Delete</a>--%>

                                    </td>

                                </tr>

                                <%
                                    }
                                %>


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
