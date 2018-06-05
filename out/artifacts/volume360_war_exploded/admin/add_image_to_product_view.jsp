<%@ page import="com.shadat.main.model.OrderUserDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sun.org.apache.xpath.internal.operations.Or" %>
<%@ page import="com.shadat.database.Database" %>
<%@ page import="java.util.ArrayList" %><%--
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
                            <strong class="card-title">Available Images</strong>
                        </div>
                        <div class="card-body">
                            <form method="POST" action="add-veneer-sheet-image" class="form form-control">
                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Thumbnail</th>
                                    <th>Image Name</th>
                                    <th>Source</th>
                                    <th>Select</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    ArrayList<String> imageFiles = (ArrayList<String>) request.getAttribute("imageFiles");
                                    int productId = Integer.parseInt((String)request.getAttribute("productId"));
                                    for (String imageFile: imageFiles) {
                                        String imageFileSrc = imageFile.replace(" ","%20");
                                %>
                                <tr>

                                    <td>
                                        <img class="img img-thumbnail img-responsive img-circle" width="100px" height="100px" src=<%= "/img/veneer-sheets/"+imageFileSrc %> />
                                    </td>
                                    <td>
                                        <%= imageFile %>
                                    </td>
                                    <td>
                                        <%= imageFile %>
                                    </td>
                                    <td>
                                        <input name=<%="veneerSheetImage"+imageFile%> type="checkbox" class="form-control" value=<%=imageFileSrc%>/>
                                    </td>

                                </tr>

                                <%
                                    }
                                %>


                                </tbody>
                            </table>
                                <input type="submit" value="Submit" class="btn btn-lg btn-outline-secondary"/>
                                <input type="hidden" name="productId" value=<%=productId%> />
                            </form>
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
