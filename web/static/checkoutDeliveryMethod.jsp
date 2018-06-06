<%@ page import="com.shadat.database.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shadat.admin.model.DeliveryMethod" %>
<%@ page import="com.shadat.main.model.CartItem" %>
<%@ page import="com.shadat.admin.model.Product" %><%--
  Created by IntelliJ IDEA.
  User: shadat
  Date: 6/3/18
  Time: 12:43 PM
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
    List<DeliveryMethod> deliveryMethods = database.getDeliveryMethods();
    if(session==null)
        session=request.getSession(false);
    System.out.println(session.getAttributeNames().toString());
    int sessionDeliveryMethodId = -1;
    if(session.getAttribute("deliveryMethod")!=null)
        sessionDeliveryMethodId  = (int) session.getAttribute("deliveryMethod");
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
                <form method="post" action="/checkout-payment-method">
                    <h1>Checkout - Delivery method</h1>
                    <ul class="nav nav-pills nav-justified">
                        <li><a href="/checkout-address"><i class="fa fa-map-marker"></i><br>Address</a>
                        </li>
                        <li class="active"><a href="#"><i class="fa fa-truck"></i><br>Delivery Method</a>
                        </li>
                        <li class="disabled"><a href="#"><i class="fa fa-money"></i><br>Payment Method</a>
                        </li>
                        <li class="disabled"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                        </li>
                    </ul>

                    <div class="content">
                        <div class="row">

                            <%
                                for(DeliveryMethod deliveryMethod:deliveryMethods)
                                {
                                    int deliveryMethodId = deliveryMethod.getId();
                                    String deliveryMethodTitle = deliveryMethod.getDeliveryMethodTitle();
                                    String deliveryTime = deliveryMethod.getDeliveryTime();

                            %>

                            <div class="col-sm-6">
                                <div class="box shipping-method">

                                    <h4><%=deliveryMethodTitle%></h4>

                                    <p><span style="color: #0c5460">Estimated Delivery Time : </span> <%=deliveryTime%></p>

                                    <div class="box-footer text-center">
                                        <%
                                            if(sessionDeliveryMethodId == deliveryMethodId)
                                            {

                                        %>
                                                <input type="radio" checked="true" name="deliveryMethod" value=<%=deliveryMethodId%> >

                                        <%
                                            }
                                            else
                                            {
                                        %>
                                                <input type="radio" name="deliveryMethod" value=<%=deliveryMethodId%> >
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
                            <button type="submit" class="btn btn-primary">Continue to Payment Method<i class="fa fa-chevron-right"></i>
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
                        <%
                            String deliveryCharge = database.getDeliveryCharge();
                            int deliveryChargeValue = Integer.parseInt(deliveryCharge);
                        %>
                        <tr>
                            <td>Shipping and handling</td>
                            <th><%=deliveryCharge%></th>
                        </tr>
                        <tr class="total">
                            <td>Total</td>
                            <th><%=total + deliveryChargeValue%>
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

<%@ include file="../static/footer.jsp" %>

<%@ include file="../static/copyright.jsp" %>

</body>
</html>
