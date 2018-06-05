<%@ page import="com.shadat.database.Database" %>
<%@ page import="com.sun.org.apache.xpath.internal.operations.Or" %>
<%@ page import="com.shadat.main.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shadat.main.model.OrderUserDetail" %>
<%@ page import="java.util.Calendar" %><%--
  Created by IntelliJ IDEA.
  User: shadat
  Date: 6/5/18
  Time: 12:19 PM
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
                <div class="col-sm-12">
                    <div class="page-header float-left">
                        <div class="page-title">
                            <h1>Dashboard</h1>
                            <div id="order-status-msg" class="sufee-alert alert with-close alert-success alert-dismissible fade show">
                                <span class="badge badge-pill badge-success">Success</span>
                                Order Status Changed
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

    </header><!-- /header -->
    <!-- Header-->
    <%
        String [] orderStatus = {"Pending","Paid","Shipped","Delivered","Cancelled"};
    %>



    <div class="content mt-3">
        <div class="animated fadeIn">
            <div class="row">

                <div class="col-md-12">

                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Data Table</strong>
                        </div>
                        <div class="card-body">
                            <table id="pending-order-data-table" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Order Number</th>
                                    <th>Order Time</th>
                                    <th>Delivery Method</th>
                                    <th>Payment Method</th>
                                    <th>Order By</th>
                                    <th>Ordered Items</th>
                                    <th>Order Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    Database database = new Database();
                                    List<Order> pendingOrders = database.getPendingOrders("Cancelled");
                                    for (Order pendingOrder : pendingOrders) {
                                %>
                                <tr>

                                    <td>
                                        <%= pendingOrder.getOrderNumber() %>
                                    </td>
                                    <td>
                                        <%
                                            Calendar calendar = Calendar.getInstance();
                                            calendar.setTimeInMillis(pendingOrder.getOrderTime());

                                        %>
                                        <%= calendar.getTime().toString() %>
                                    </td>
                                    <td>
                                        <%= database.getDeliveryMethod(pendingOrder.getDeliveryMethodId()).getDeliveryMethodTitle() %>
                                    </td>
                                    <td>
                                        <%= database.getPaymentMethod(pendingOrder.getPaymentMethodId()).getTitle() %>
                                    </td>
                                    <td>
                                        <a type="button" class="btn btn-outline-info btn-md" href=<%= "user-detail?id="+pendingOrder.getOrderUserDetail().getId() %> > See User Detail</a>
                                    </td>
                                    <td>
                                        <a type="button" class="btn btn-outline-info btn-md" href=<%= "ordered-product?id="+pendingOrder.getOrderId()%>  >See Ordered Product</a>
                                    </td>
                                    <td>
                                        <select class="form-control order-status-options">
                                            <option value=<%= pendingOrder.getStatus()+","+pendingOrder.getOrderId()%>>
                                                <%= pendingOrder.getStatus() %>
                                            </option>
                                            <%
                                                for(String status : orderStatus)
                                                {
                                                    if(!status.equals(pendingOrder.getStatus()))
                                                    {
                                            %>
                                                        <option value=<%=status+","+pendingOrder.getOrderId()%> >
                                                            <%=status%>
                                                        </option>
                                            <%
                                                    }
                                                }

                                            %>

                                        </select>

                                    </td>
                                    <td>
                                        <%--<a href="images?<%= product.getId()%>" style="padding:8px; color: #16a085; ">Add Images</a>--%>


                                        <form method="POST" action="edit-veneer-sheet" style="display: inline-block;">
                                            <button type="submit" class="btn btn-outline-danger btn-sm" name="delete" value="<%= pendingOrder.getOrderId()%>">
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



        <!-- Modal -->
        <div style="overflow-x: hidden; width: 100%;" class="modal fade" id="orderDetailModal" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Order Detail</h4>
                    </div>
                    <div class="modal-body">
                        <p>Order Detail Goes Here</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
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

        $('#pending-order-data-table').DataTable();
        $("#order-status-msg").hide()

        $(".order-status-options").on('change',function () {
            p = this.value
            params = p.split(",")
            updatedValue = params[0]
            orderId = params[1]

            $.ajax({
                type:"POST",
                cache:false,
                async:true,
                url:"/admin/updateorderstatus",
                data : { id : orderId, updatedValue: updatedValue},
                success: function (result) {
                    console.log("ResultAjax "+result)
                    if(result == 1)
                    {
                        $("#order-status-msg").show()
                    }
                }
            });

        })

        })
</script>



</body>
</html>

