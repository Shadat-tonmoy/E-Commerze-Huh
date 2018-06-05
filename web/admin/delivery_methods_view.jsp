<%@ page import="com.shadat.admin.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shadat.database.Database" %>
<%@ page import="com.shadat.admin.model.DeliveryMethod" %>
<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang=""> <!--<![endif]-->

<body>

<!-- Left Panel -->
<%@ include file="side_bar.jsp" %>
<!-- Left Panel -->

<!-- Right Panel -->

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

                    <%
                        String deliverMethodTitle = "";
                        if (session.getAttribute("newDeliveryMethod") != null && (boolean) session.getAttribute("newDeliveryMethod"))
                        {
                            deliverMethodTitle = (String) session.getAttribute("deliveryMethodTitle");
                            session.removeAttribute("newDeliveryMethod");
                            session.removeAttribute("deliveryMethodTitle");


                    %>

                    <div class="sufee-alert alert with-close alert-success alert-dismissible fade show">
                        <span class="badge badge-pill badge-success">Success</span>
                        <b><%= deliverMethodTitle %></b> is successfully added to records.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>


                    <%
                        }

                    %>



                    <%
                        String updatedDeliveryMethodTitle = "";
                        if (session.getAttribute("updateDeliveryMethod") != null && (boolean) session.getAttribute("updateDeliveryMethod"))
                        {
                            updatedDeliveryMethodTitle = (String) session.getAttribute("updateDDeliveryMethodTitle");
                            session.removeAttribute("updateDeliveryMethod");
                            session.removeAttribute("updateDDeliveryMethodTitle");


                    %>

                    <div class="sufee-alert alert with-close alert-success alert-dismissible fade show">
                        <span class="badge badge-pill badge-success">Success</span>
                        <b><%= updatedDeliveryMethodTitle %></b> is successfully updated from records.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>


                    <%
                        }

                    %>


                    <%
                        if (session.getAttribute("deletedDeliveryMethod") != null && (boolean) session.getAttribute("deletedDeliveryMethod")){
                            session.removeAttribute("deletedDeliveryMethod");


                    %>

                    <div class="sufee-alert alert with-close alert-success alert-dismissible fade show">
                        <span class="badge badge-pill badge-success">Success</span>
                        <b><%= "Delivery Method "%> </b> is successfully removed from records.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>


                    <%
                        }

                    %>

                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Data Table</strong>
                        </div>
                        <div class="card-body">
                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Delivery Method Name</th>
                                    <th>Delivery Time Period</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    Database database = new Database();
                                    List<DeliveryMethod> deliveryMethods = database.getDeliveryMethods();
                                    for (DeliveryMethod deliveryMethod : deliveryMethods) {
                                %>
                                <tr>

                                    <td>
                                        <%= deliveryMethod.getDeliveryMethodTitle() %>
                                    </td>
                                    <td>
                                        <%= deliveryMethod.getDeliveryTime() %>
                                    </td>
                                    <td>
                                        <%--<a href="images?<%= product.getId()%>" style="padding:8px; color: #16a085; ">Add Images</a>--%>


                                        <form method="POST" action="edit-delivery-methods" style="display: inline-block;">
                                            <button type="submit" class="btn btn-outline-info btn-sm" name="edit" value="<%= deliveryMethod.getId()%>">
                                                Edit
                                            </button>
                                        </form>

                                            <form method="POST" action="delete-delivery-method" style="display: inline-block;">
                                                <button type="submit" class="btn btn-outline-danger btn-sm" name="delete" value="<%= deliveryMethod.getId()%>">
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
                <a class="fab" href="add-delivery-methods" style="color: white"> + </a>
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
