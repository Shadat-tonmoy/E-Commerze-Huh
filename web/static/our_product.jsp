<%@ page import="com.shadat.admin.model.Product" %>
<%@ page import="com.shadat.database.Database" %>
<%@ page import="java.util.List" %>
<!-- *** HOT PRODUCT SLIDESHOW ***
_________________________________________________________ -->
<div id="hot">

    <div class="box">
        <div class="container">
            <div class="col-md-12">
                <h2>Our Products</h2>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="product-slider">
            <%
                List<Product> products = database.getProducts();
            %>

            <%
                for (Product product : products) {
            %>


            <div class="item">
                <div class="product">
                    <div class="flip-container">
                        <div class="flipper">
                            <div class="front">
                                <a href="/detail?ref=<%= product.getId()%>">
                                    <img src=<%="../img/veneer-sheets/"+product.getThumbnail()%> alt="" class="img-responsive">
                                </a>
                            </div>
                            <div class="back">
                                <a href="/detail?ref=<%= product.getId()%>">
                                    <img src=<%="../img/veneer-sheets/"+product.getThumbnail()%> alt="" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>

                    <a href="/detail?ref=<%= product.getId()%>%>" class="invisible">
                        <img src=<%="../img/veneer-sheets/"+product.getThumbnail()%>  alt="" class="img-responsive">
                    </a>

                    <div class="text">
                        <h3><a href="/detail?ref=<%= product.getId()%>" > <%= product.getTitle() %>
                        </a></h3>


                        <%
                            double reducedPrice = 0;
                            if (product.getDiscount() > 0) {
                                reducedPrice = product.getPrice() - (product.getDiscount() / 100 * product.getPrice());
                        %>
                        <p class="price">
                            <del><%= product.getPrice()%></del>
                        </p>

                        <b>
                            <p class="price"><%= reducedPrice %></p>
                        </b>

                        <%
                        } else {

                        %>

                        <p class="price">
                            <%= product.getPrice()%>
                        </p>
                        <p class="price"> </p>

                        <%
                            }
                        %>


                    </div>
                    <!-- /.text -->

                    <%
                        if (product.getDiscount() > 0) {

                    %>

                    <div class="ribbon sale">
                        <div class="theribbon">SALE</div>
                        <div class="ribbon-background"></div>
                    </div>

                    <%

                        }


                    %>
                    <!-- /.ribbon -->

                </div>
                <!-- /.product -->
            </div>


            <%
                }

            %>
                <!-- /.product -->
            </div>
            <!-- /.col-md-4 -->

        </div>
        <!-- /.product-slider -->
    </div>
    <!-- /.container -->

</div>
<!-- /#hot -->

<!-- *** HOT END *** -->