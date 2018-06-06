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
                        String updatedDeliveryCharge = "";
                        if (session.getAttribute("updateDeliveryCharge") != null && (boolean) session.getAttribute("updateDeliveryCharge"))
                        {
                            updatedDeliveryCharge = (String) session.getAttribute("updateDeliveryChargeValue");
                            session.removeAttribute("updateDeliveryCharge");
                            session.removeAttribute("updateDeliveryChargeValue");

                    %>

                    <div class="sufee-alert alert with-close alert-success alert-dismissible fade show">
                        <span class="badge badge-pill badge-success">Success</span>
                        Delivery charge is successfully updated to <b><%= updatedDeliveryCharge%></b>
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
                            <strong class="card-title">Delivery Charge</strong>
                        </div>
                        <div class="card-body">

                            <%
                                Database database = new Database();
                                String deliveryCharge = database.getDeliveryCharge();
                            %>

                            <center>
                                <h1 style="border:  2px solid green;border-radius:  50%;width: 300px;height: 300px;text-align:  center;vertical-align: middle;display:
                                block;line-height: 300px;font-size:  128px;"><%=deliveryCharge+"/-"%></h1>
                            </center>



                        </div>
                    </div>
                </div>
                <a class="fab" href="edit-delivery-charge" style="color: white"> <img src="images/edit_icon.png"> </a>
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
