<%@ page import="com.shadat.database.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shadat.admin.model.PaymentMethod" %>
<%@ page import="com.shadat.main.model.CartItem" %>
<%@ page import="com.shadat.admin.model.Product" %><%--
  Created by IntelliJ IDEA.
  User: shadat
  Date: 6/3/18
  Time: 12:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Database database = new Database();
    List<PaymentMethod> paymentMethods = database.getPaymentMethods();

    if (session == null)
        session = request.getSession(false);
    System.out.println(session.getAttributeNames().toString());
    int sessionPaymentMethodId = -1;
    if (session.getAttribute("paymentMethod") != null)
        sessionPaymentMethodId = (int) session.getAttribute("paymentMethod");

    double total = 0;

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
    }

%>
<div id="content">
    <div class="container">

        <div class="col-md-9" id="checkout">

            <div class="box">
                <form method="post" action="/checkout-final-review">
                    <h1>Checkout - Payment method</h1>
                    <ul class="nav nav-pills nav-justified">
                        <li><a href="/checkout-address"><i class="fa fa-map-marker"></i><br>Address</a>
                        </li>
                        <li><a href="/checkout-delivery-method"><i class="fa fa-truck"></i><br>Delivery Method</a>
                        </li>
                        <li class="active"><a href="#"><i class="fa fa-money"></i><br>Payment Method</a>
                        </li>
                        <li class="disabled"><a href="checkout4.html"><i class="fa fa-eye"></i><br>Order Review</a>
                        </li>
                    </ul>

                    <div class="content">
                        <div class="row">
                            <%
                                for (PaymentMethod paymentMethod : paymentMethods) {
                                    int paymentMethodId = paymentMethod.getId();
                                    String title = paymentMethod.getTitle();
                                    String mobileNo = paymentMethod.getMobileNo();
                            %>

                            <div class="col-sm-6">
                                <div class="box payment-method">

                                    <h4><%=title%>
                                    </h4>

                                    <p><%=mobileNo%>
                                    </p>

                                    <div class="box-footer text-center">

                                        <%
                                            if (sessionPaymentMethodId == paymentMethodId) {

                                        %>
                                        <input type="radio" checked="true" name="paymentMethod"
                                               value=<%=paymentMethodId%>>

                                        <%
                                        } else {
                                        %>
                                        <input type="radio" name="paymentMethod" value=<%=paymentMethodId%>>
                                        <%
                                            }

                                        %>
                                    </div>
                                </div>
                            </div>


                            <%
                                }

                            %>

                        </div>
                        <!-- /.row -->

                    </div>
                    <!-- /.content -->

                    <div class="box-footer">
                        <div class="pull-right">
                            <button type="submit" class="btn btn-primary">Continue to Order review<i
                                    class="fa fa-chevron-right"></i>
                            </button>
                        </div>
                    </div>
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


<%@ include file="footer.jsp" %>

<%@ include file="copyright.jsp" %>

</body>
</html>
