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
                                    <img src="../img/product1.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                            <div class="back">
                                <a href="/detail?ref=<%= product.getId()%>">
                                    <img src="../img/product1_2.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>

                    <a href="/detail?ref=<%= product.getId()%>%>" class="invisible">
                        <img src="../img/product1.jpg" alt="" class="img-responsive">
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


            <div class="item">
                <div class="product">
                    <div class="flip-container">
                        <div class="flipper">
                            <div class="front">
                                <a href="detail.html">
                                    <img src="../img/product2.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                            <div class="back">
                                <a href="detail.html">
                                    <img src="../img/product2_2.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                    <a href="detail.html" class="invisible">
                        <img src="../img/product2.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="text">
                        <h3><a href="detail.html">White Blouse Armani</a></h3>
                        <p class="price">
                            <del>$280</del>
                            $143.00
                        </p>
                    </div>
                    <!-- /.text -->

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

                    <div class="ribbon gift">
                        <div class="theribbon">GIFT</div>
                        <div class="ribbon-background"></div>
                    </div>
                    <!-- /.ribbon -->
                </div>
                <!-- /.product -->
            </div>

            <div class="item">
                <div class="product">
                    <div class="flip-container">
                        <div class="flipper">
                            <div class="front">
                                <a href="detail.html">
                                    <img src="../img/product3.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                            <div class="back">
                                <a href="detail.html">
                                    <img src="../img/product3_2.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                    <a href="detail.html" class="invisible">
                        <img src="../img/product3.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="text">
                        <h3><a href="detail.html">Black Blouse Versace</a></h3>
                        <p class="price">$143.00</p>
                    </div>
                    <!-- /.text -->
                </div>
                <!-- /.product -->
            </div>

            <div class="item">
                <div class="product">
                    <div class="flip-container">
                        <div class="flipper">
                            <div class="front">
                                <a href="detail.html">
                                    <img src="../img/product3.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                            <div class="back">
                                <a href="detail.html">
                                    <img src="../img/product3_2.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                    <a href="detail.html" class="invisible">
                        <img src="../img/product3.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="text">
                        <h3><a href="detail.html">Black Blouse Versace</a></h3>
                        <p class="price">$143.00</p>
                    </div>
                    <!-- /.text -->
                </div>
                <!-- /.product -->
            </div>

            <div class="item">
                <div class="product">
                    <div class="flip-container">
                        <div class="flipper">
                            <div class="front">
                                <a href="detail.html">
                                    <img src="../img/product2.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                            <div class="back">
                                <a href="detail.html">
                                    <img src="../img/product2_2.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                    <a href="detail.html" class="invisible">
                        <img src="../img/product2.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="text">
                        <h3><a href="detail.html">White Blouse Versace</a></h3>
                        <p class="price">$143.00</p>
                    </div>
                    <!-- /.text -->

                    <div class="ribbon new">
                        <div class="theribbon">NEW</div>
                        <div class="ribbon-background"></div>
                    </div>
                    <!-- /.ribbon -->
                </div>
                <!-- /.product -->
            </div>

            <div class="item">
                <div class="product">
                    <div class="flip-container">
                        <div class="flipper">
                            <div class="front">
                                <a href="detail.html">
                                    <img src="../img/product1.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                            <div class="back">
                                <a href="detail.html">
                                    <img src="../img/product1_2.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                    <a href="detail.html" class="invisible">
                        <img src="../img/product1.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="text">
                        <h3><a href="detail.html">Fur coat</a></h3>
                        <p class="price">$143.00</p>
                    </div>
                    <!-- /.text -->

                    <div class="ribbon gift">
                        <div class="theribbon">GIFT</div>
                        <div class="ribbon-background"></div>
                    </div>
                    <!-- /.ribbon -->

                </div>
                <!-- /.product -->
            </div>
            <!-- /.col-md-4 -->

            <div class="item">
                <div class="product">
                    <div class="flip-container">
                        <div class="flipper">
                            <div class="front">
                                <a href="detail.html">
                                    <img src="../img/product2.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                            <div class="back">
                                <a href="detail.html">
                                    <img src="../img/product2_2.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                    <a href="detail.html" class="invisible">
                        <img src="../img/product2.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="text">
                        <h3><a href="detail.html">White Blouse Armani</a></h3>
                        <p class="price">
                            <del>$280</del>
                            $143.00
                        </p>
                    </div>
                    <!-- /.text -->

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

                    <div class="ribbon gift">
                        <div class="theribbon">GIFT</div>
                        <div class="ribbon-background"></div>
                    </div>
                    <!-- /.ribbon -->
                </div>
                <!-- /.product -->
            </div>

            <div class="item">
                <div class="product">
                    <div class="flip-container">
                        <div class="flipper">
                            <div class="front">
                                <a href="detail.html">
                                    <img src="../img/product3.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                            <div class="back">
                                <a href="detail.html">
                                    <img src="../img/product3_2.jpg" alt="" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                    <a href="detail.html" class="invisible">
                        <img src="../img/product3.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="text">
                        <h3><a href="detail.html">Black Blouse Versace</a></h3>
                        <p class="price">$143.00</p>
                    </div>
                    <!-- /.text -->
                </div>
                <!-- /.product -->
            </div>

        </div>
        <!-- /.product-slider -->
    </div>
    <!-- /.container -->

</div>
<!-- /#hot -->

<!-- *** HOT END *** -->