<%@ page import="java.util.List" %>
<%@ page import="com.shadat.main.model.CartItem" %>
<%@ page import="com.shadat.database.Database" %>
<%@ page import="com.shadat.admin.model.Product" %><%--
  Created by IntelliJ IDEA.
  User: shadat
  Date: 4/24/18
  Time: 12:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%@ include file="navbar.jsp" %>
<%
    database.createConnection();
    double total = 0;

%>

<%--start of content--%>
<div id="content">
    <div class="container">

        <div class="col-md-9" id="basket">

            <div class="box">

                <form method="post" action="/checkout-address">

                    <h1>Shopping cart</h1>
                    <%
                        if (totalItemInCart > 0) {

                    %>
                    <p class="text-muted">You currently have <%= totalItemInCart %> item(s) in your cart.</p>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th colspan="2">Product</th>
                                <th>Quantity</th>
                                <th>Unit price</th>
                                <th>Discount</th>
                                <th colspan="2">Total</th>
                            </tr>
                            </thead>
                            <tbody>

                            <%

                                List<CartItem> cartItems = cart.getCartItems();
                                for (CartItem cartItem : cartItems) {
                                    int productId = Integer.parseInt(cartItem.getProductId());
                                    int productAmount = Integer.parseInt(cartItem.getAmount());
                                    Product product = database.getProduct(productId);
                                    String productTitle = product.getTitle();
                                    double productPrice = product.getPrice();
                                    double productDiscountPercent = product.getDiscount();
                                    double productDiscount = productPrice * (productDiscountPercent / 100);
                                    double priceAfterDiscount = (productPrice - productDiscount) * productAmount;
                                    total += priceAfterDiscount;
                            %>

                            <tr>
                                <td>
                                    <a href="#">
                                        <img src="img/detailsquare.jpg" alt="White Blouse Armani">
                                    </a>
                                </td>

                                <td><a href="#"><%=productTitle%>
                                </a></td>
                                <td>
                                    <span><%=productAmount%></span>
                                </td>
                                <td><%=productPrice%>
                                </td>
                                <td><%=productDiscount%>
                                </td>
                                <td><%=priceAfterDiscount%>
                                </td>
                                <td>
                                    <a href=<%="/deletecartitem?id="+productId %> > <i class="fa fa-trash-o"> </i> </a>
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
                            </tfoot>
                        </table>

                    </div>


                    <div class="box-footer">
                        <div class="pull-right">
                            <a href="/checkout-address" type="submit" class="btn btn-primary">Proceed to checkout <i
                                    class="fa fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>

                    <%
                    } else {

                    %>

                    <center>
                        <p class="text-muted">Cart is empty.</p>
                        <img src="img/emptycart.png" alt="White Blouse Armani">
                    </center>


                    <%
                        }
                    %>


                </form>

            </div>


            <!-- /.box -->
        </div>
        <!-- /.col-md-9 -->

        <div class="col-md-3">
            <div class="box" id="order-summary">
                <div class="box-header">
                    <h3>Order summary</h3>
                </div>
                <p class="text-muted">Shipping and additional costs are calculated based on the values you have
                    entered.</p>

                <div class="table-responsive">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td>Order subtotal</td>
                            <th><%=total%>
                            </th>
                        </tr>
                        <tr>
                            <td>Shipping and handling</td>
                            <th>50.00</th>
                        </tr>
                        <tr class="total">
                            <td>Total</td>
                            <th><%=total + 50%>
                            </th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- /.col-md-3 -->

    </div>
    <!-- /.container -->


</div>
<%--end of content--%>


<%@ include file="../static/footer.jsp" %>

<%@ include file="../static/copyright.jsp" %>

</body>
</html>
