<%@ page import="com.shadat.admin.model.Product" %>
<%@ page import="java.util.List" %>
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
                        String productTitle = "";
                        if (session.getAttribute("newProduct") != null && (boolean) session.getAttribute("newProduct"))
                        {
                            productTitle = (String) session.getAttribute("productTitle");
                            session.removeAttribute("newProduct");
                            session.removeAttribute("productTitle");


                    %>

                    <div class="sufee-alert alert with-close alert-success alert-dismissible fade show">
                        <span class="badge badge-pill badge-success">Success</span>
                        <b><%= productTitle %></b> is successfully added to records.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>


                    <%
                        }

                    %>



                    <%
                        String updatedProductTitle = "";
                        if (session.getAttribute("updateProduct") != null && (boolean) session.getAttribute("updateProduct"))
                        {
                            updatedProductTitle = (String) session.getAttribute("updatedProductTitle");
                            session.removeAttribute("updateProduct");
                            session.removeAttribute("updateProduct");


                    %>

                    <div class="sufee-alert alert with-close alert-success alert-dismissible fade show">
                        <span class="badge badge-pill badge-success">Success</span>
                        <b><%= productTitle %></b> is successfully updated from records.
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
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>In Stock</th>
                                    <th>Discount</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<Product> products = (List<Product>) request.getAttribute("products");
                                    for (Product product : products) {
                                %>
                                <tr>

                                    <td>
                                        <%= product.getTitle() %>
                                    </td>
                                    <td>
                                        <%= product.getDescription() %>
                                    </td>
                                    <td>
                                        <%= product.getPrice() %>
                                    </td>
                                    <td>
                                        <%= product.getStock() %>
                                    </td>
                                    <td>
                                        <%= product.getDiscount() %>
                                    </td>
                                    <td>
                                        <%--<a href="images?<%= product.getId()%>" style="padding:8px; color: #16a085; ">Add Images</a>--%>


                                        <form method="POST" action="add-veneer-sheet-images" style="display: inline-block;">
                                            <button type="submit" class="btn btn-outline-info btn-sm" name="addimage" value="<%= product.getId()%>">
                                                Add Images
                                            </button>
                                        </form>

                                        <form method="POST" action="edit-veneer-sheet" style="display: inline-block;">
                                            <button type="submit" class="btn btn-outline-success btn-sm" name="edit" value="<%= product.getId()%>">
                                                Edit
                                            </button>
                                        </form>

                                        <form method="POST" action="edit-veneer-sheet" style="display: inline-block;">
                                            <button type="submit" class="btn btn-outline-danger btn-sm" name="delete" value="<%= product.getId()%>">
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

                <a class="fab" href="add-veneer-sheet" style="color: white"> + </a>

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
