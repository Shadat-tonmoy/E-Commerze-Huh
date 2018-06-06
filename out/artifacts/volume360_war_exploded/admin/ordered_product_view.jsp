<%@ page import="com.shadat.main.model.OrderUserDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sun.org.apache.xpath.internal.operations.Or" %>
<%@ page import="com.shadat.database.Database" %>
<%@ page import="com.shadat.main.model.Cart" %>
<%@ page import="com.shadat.main.model.CartItem" %>
<%@ page import="com.shadat.admin.model.Product" %><%--
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
        Cart cart = database.getOrderedProductCart(id);
        List<CartItem> cartItems = cart.getCartItems();
        String deliveryCharge = database.getDeliveryCharge();
        int deliveryChargeValue = Integer.parseInt(deliveryCharge);
        double total = 0;


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
                                <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Description</th>
                                    <th>Quantity</th>
                                    <th>Unit price</th>
                                    <th>Discount</th>
                                    <th>Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%

                                    for (CartItem cartItem : cartItems) {
                                        int productId = Integer.parseInt(cartItem.getProductId());
                                        int productAmount = Integer.parseInt(cartItem.getAmount());
                                        Product product = database.getProduct(productId);
                                        String productTitle = product.getTitle();
                                        String productDescription = product.getDescription();
                                        double productPrice = product.getPrice();
                                        double productDiscountPercent = product.getDiscount();
                                        double productDiscount = productPrice * (productDiscountPercent / 100);
                                        double priceAfterDiscount = (productPrice - productDiscount) * productAmount;
                                        total += priceAfterDiscount;
                                %>

                                <tr>
                                    <td><a href="#"><%=productTitle%>
                                    </a></td>
                                    <td>
                                        <span><%=productDescription%></span>
                                    </td><td>
                                        <span><%=productAmount%></span>
                                    </td>
                                    <td><%=productPrice%>
                                    </td>
                                    <td><%=productDiscount%>
                                    </td>
                                    <td><%=priceAfterDiscount%>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th colspan="5">Total</th>
                                    <th colspan="2"><%=total%>
                                    </th>
                                </tr>
                                <tr>
                                    <th colspan="5">Delivery Charge</th>
                                    <th colspan="2"><%=deliveryChargeValue%>
                                    </th>
                                </tr>
                                <tr>
                                    <th colspan="5">Sub Total</th>
                                    <th colspan="2"><%=total+deliveryChargeValue%>
                                    </th>
                                </tr>
                                </tfoot>
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
