<%@ page import="com.shadat.admin.model.Product" %><%--
  Created by IntelliJ IDEA.
  User: shadat
  Date: 4/18/18
  Time: 2:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page buffer="8192kb" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="navbar.jsp" %>
<head>
    <style>

        .plus-minus-input {
            -webkit-align-items: center;
            -ms-flex-align: center;
            align-items: center;
        }

        .plus-minus-input .input-group-field {
            text-align: center;
            margin-left: 0.5rem;
            margin-right: 0.5rem;
            padding: 1rem;
        }

        .plus-minus-input .input-group-field::-webkit-inner-spin-button,
        .plus-minus-input .input-group-field ::-webkit-outer-spin-button {
            -webkit-appearance: none;
            appearance: none;
        }

        .plus-minus-input .input-group-button .circle {
            border-radius: 50%;
            padding: 0.25em 0.8em;
        }


    </style>
    <script type="text/javascript" src="../js/quantity-controller.js"></script>

</head>

<body>
<%--<% out.println("<p>bufferSize: " + out.getBufferSize() + " remaining: " + out.getRemaining() + " used: " + (out.getBufferSize() - out.getRemaining()) + " autoFlush: " + out.isAutoFlush() + "</p><br>"); %>--%>
<div id="content">
    <div class="container">

        <div class="col-md-12" id="add-success-msg">
            <div>
                <div class="alert alert-success alert-dismissible fade in">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Added!</strong> Items are added to cart. <a href="/cart">Checkout?</a>
                </div>
            </div>

        </div>

        <%
            Product product = (Product) request.getAttribute("product");
        %>
        <div class="col-md-3">
            <!-- *** MENUS AND FILTERS ***
_________________________________________________________ -->


            <div class="panel panel-default sidebar-menu">

                <div class="panel-heading">
                    <h3 class="panel-title">Product Details</h3>
                </div>

                <div class="panel-body">
                    <%--<p><%= product.getDescription().substring(0, 50)%></p>--%>
                    <p style="display: none" id="product-id"><%= product.getId()%></p>
                    <p class="goToDescription"><a href="#details" class="scroll-to">Read More</a>
                    </p>


                </div>
            </div>


            <div class="panel panel-default sidebar-menu">

                <div class="panel-heading">
                    <h3 class="panel-title">Stock</h3>
                </div>

                <div class="panel-body">
                    <b id="stock-amount"><%=product.getStock()%>
                    </b> Items letf in our stock. Hurry Up!!
                </div>
            </div>

            <!-- *** MENUS AND FILTERS END *** -->
        </div>

        <div class="col-md-9">

            <div class="row" id="productMain">
                <div class="col-sm-6">
                    <div id="mainImage">
                        <img src="img/detailbig1.jpg" alt="" class="img-responsive">
                    </div>

                    <div class="ribbon sale">
                        <div class="theribbon">SALE</div>
                        <div class="ribbon-background"></div>
                    </div>
                    <!-- /.ribbon -->

                    <div class="ribbon new">
                        <div class="theribbon">NEW</div>
                        <div class="ribbon-background"></div>
                    </div>
                    <!-- /.ribbon -->

                </div>
                <div class="col-sm-6">
                    <div class="box">
                        <h1 class="text-center"><%= product.getTitle()%>
                        </h1>
                        <%
                            double reducedPrice = 0;
                            if (product.getDiscount() > 0) {
                                reducedPrice = product.getPrice() - (product.getDiscount() / 100 * product.getPrice());
                        %>
                        <p class="price">
                            <del><%= product.getPrice()%>
                            </del>
                        </p>

                        <b>
                            <p class="price"><%= reducedPrice %>
                            </p>
                        </b>

                        <%
                        } else {

                        %>

                        <p class="price">
                            <%= product.getPrice()%>
                        </p>
                        <%
                            }
                        %>



                        <div class="alert alert-danger" style="margin-bottom:-30px;" id="stock-out-alert" >
                            <strong>Sorry!</strong> We have no more item left in our stock
                        </div>


                        <div id="quantity-pannel" class="price">

                            <button type="button" class="btn btn-default" id="quantity-minus">
                                <span class="glyphicon glyphicon-minus"></span>
                            </button>

                            <span id="quantity-value"> 0 </span>

                            <button type="button" class="btn btn-default" id="quantity-plus">
                                <span class="glyphicon glyphicon-plus"></span>
                            </button>

                        </div>
                        <br>




                        <p class="text-center buttons">
                            <button id="add-to-cart-button" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add to
                                cart</button>
                        </p>


                    </div>

                    <div class="row" id="thumbs">
                        <div class="col-xs-4">
                            <a href="img/detailbig1.jpg" class="thumb">
                                <img src="img/detailsquare.jpg" alt="" class="img-responsive">
                            </a>
                        </div>
                        <div class="col-xs-4">
                            <a href="img/detailbig2.jpg" class="thumb">
                                <img src="img/detailsquare2.jpg" alt="" class="img-responsive">
                            </a>
                        </div>
                        <div class="col-xs-4">
                            <a href="img/detailbig3.jpg" class="thumb">
                                <img src="img/detailsquare3.jpg" alt="" class="img-responsive">
                            </a>
                        </div>
                    </div>
                </div>

            </div>


            <div class="box" id="details">
                <p>
                <h4>Product details</h4>
                <p>
                    <%= product.getDescription()%>
                </p>
                <hr>

            </div>


        </div>
        <!-- /.col-md-9 -->
    </div>
    <!-- /.container -->
</div>
<!-- /#content -->



<%@ include file="footer.jsp" %>

<%@ include file="copyright.jsp" %>


</div>

</body>
</html>
