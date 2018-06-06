<%@ page import="com.shadat.main.model.OrderUserDetail" %>
<%@ page import="com.shadat.main.model.CartItem" %>
<%@ page import="com.shadat.admin.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shadat.database.Database" %><%--
  Created by IntelliJ IDEA.
  User: shadat
  Date: 6/3/18
  Time: 12:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <title>Check Out</title>
</head>
<body>
<%
    OrderUserDetail orderUserDetail = (OrderUserDetail) session.getAttribute("userDetail");
    String firstName = "", lastName = "", address = "", email = "", phone = "";
    if (orderUserDetail != null) {
        firstName = orderUserDetail.getFirstName();
        lastName = orderUserDetail.getLastName();
        address = orderUserDetail.getDetailAddress();
        email = orderUserDetail.getEmail();
        phone = orderUserDetail.getPhone();

    }

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
                <form method="post" action="/checkout-delivery-method">
                    <h1>Checkout</h1>
                    <ul class="nav nav-pills nav-justified">
                        <li class="active"><a href="#"><i class="fa fa-map-marker"></i><br>Address</a>
                        </li>
                        <li class="disabled"><a href="#"><i class="fa fa-truck"></i><br>Delivery Method</a>
                        </li>
                        <li class="disabled"><a href="#"><i class="fa fa-money"></i><br>Payment Method</a>
                        </li>
                        <li class="disabled"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                        </li>
                    </ul>

                    <div class="content">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="firstname">First Name</label> <span style="color: red">*</span>
                                    <input type="text" class="form-control" id="firstname" name="firstName" value=<%=firstName%> >
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="lastname">Last Name</label> <span style="color: red">*</span>
                                    <input type="text" class="form-control" id="lastname" name="lastName" value=<%=lastName%> >
                                </div>
                            </div>
                        </div>
                        <!-- /.row -->
                        <div class="row">

                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="detailAddress">Detail Address</label> <span style="color: red">*</span>
                                    <textarea type="text" class="form-control" id="detailAddress"
                                              name="detailAddress"><%=address%></textarea>
                                </div>
                            </div>
                        </div>
                        <!-- /.row -->

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="phone">Telephone</label> <span style="color: red">*</span>
                                    <input type="text" class="form-control" id="phone" name="phone" value=<%=phone%> >
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="email">Email</label> <span style="color: red">*</span>
                                    <input type="text" class="form-control" id="email" name="email" value=<%=email%> >
                                </div>
                            </div>

                        </div>
                        <!-- /.row -->
                    </div>

                    <div class="box-footer">
                        <div class="pull-right">
                            <button type="submit" class="btn btn-primary">Continue to Delivery Method<i
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


<%@ include file="footer.jsp" %>

<%@ include file="copyright.jsp" %>

</body>
</html>
