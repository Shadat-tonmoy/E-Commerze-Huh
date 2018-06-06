<%@ page import="com.shadat.main.model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shadat.admin.model.Product" %>
<%@ page import="com.shadat.database.Database" %>
<%@ page import="com.shadat.main.model.OrderUserDetail" %>
<%@ page import="com.shadat.admin.model.DeliveryMethod" %>
<%@ page import="com.shadat.admin.model.PaymentMethod" %><%--
  Created by IntelliJ IDEA.
  User: shadat
  Date: 6/4/18
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="navbar.jsp" %>
<%
    database.createConnection();
    double total = 0;
    OrderUserDetail orderUserDetail = (OrderUserDetail) session.getAttribute("userDetail");
    int deliveryMethodId = (int) session.getAttribute("deliveryMethod");
    int paymentMethodId = (int) session.getAttribute("paymentMethod");
    DeliveryMethod deliveryMethod = database.getDeliveryMethod(deliveryMethodId);
    PaymentMethod paymentMethod = database.getPaymentMethod(paymentMethodId);



%>

<html>
<head>
    <title>Title</title>
</head>
<body>


<div id="content">
    <div class="container">

        <div class="col-md-9" id="basket">

            <div class="box">

                <h1>Checkout - Review</h1>
                <ul class="nav nav-pills nav-justified">
                    <li><a href="/checkout-address"><i class="fa fa-map-marker"></i><br>Address</a>
                    </li>
                    <li><a href="/checkout-delivery-method"><i class="fa fa-truck"></i><br>Delivery Method</a>
                    </li>
                    <li><a href="/checkout-payment-method"><i class="fa fa-money"></i><br>Payment Method</a>
                    </li>
                    <li class="active"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                    </li>
                </ul>
                <%
                    if (totalItemInCart > 0) {

                %>
                <div class="content">
                    <h4 style="color: #d58512">Items</h4>
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
                                    System.out.println("ProductId"+productId);
                                    Product product = database.getProduct(productId);
                                    System.out.println(product.toString());
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

                    <h4 style="color: #d58512">Address</h4>

                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td><span>Name</span></td>
                                <td><%=orderUserDetail.getFirstName()+" "+orderUserDetail.getLastName()%></td>
                            </tr>

                            <tr>
                                <td><span>Address</span></td>
                                <td><%=orderUserDetail.getDetailAddress()%></td>
                            </tr>

                            <tr>
                                <td><span>Phone No</span></td>
                                <td><%=orderUserDetail.getPhone()%></td>
                            </tr>

                            <tr>
                                <td><span>Email</span></td>
                                <td><%=orderUserDetail.getEmail()%></td>
                            </tr>

                            </tbody>
                        </table>
                    </div>


                    <h4 style="color: #d58512">Delivery Method</h4>

                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td><%=deliveryMethod.getDeliveryMethodTitle()%></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>


                    <h4 style="color: #d58512">Payment Method</h4>

                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td><%=paymentMethod.getTitle()%></td>
                            </tr>
                            </tbody>
                        </table>
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


                <div class="box-footer">
                    <div class="pull-right">
                        <a type="submit" href="/order-place-success" class="btn btn-primary">Place an order<i class="fa fa-chevron-right"></i>
                        </a>
                    </div>
                </div>

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


<%@ include file="footer.jsp" %>

<%@ include file="copyright.jsp" %>

</body>
</html>
