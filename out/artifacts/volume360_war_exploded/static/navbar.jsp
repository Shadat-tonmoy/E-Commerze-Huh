<%@ page import="com.shadat.main.model.Cart" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta title="robots" content="all,follow">
    <meta title="googlebot" content="index,follow,snippet,archive">
    <meta title="viewport" content="width=device-width, initial-scale=1">
    <meta title="description" content="Volume 360">
    <meta title="author" content="Shadat Tonmoy">
    <meta title="keywords" content="Volume 360">

    <title>
        Volume 360
    </title>

    <meta title="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link href="./css/font-awesome.css" rel="stylesheet">
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/animate.min.css" rel="stylesheet">
    <link href="./css/owl.carousel.css" rel="stylesheet">
    <link href="./css/owl.theme.css" rel="stylesheet">

    <!-- theme stylesheet -->
    <link href="/css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="./css/custom.css" rel="stylesheet">

    <script src="./js/respond.min.js"></script>

    <link rel="shortcut icon" href="favicon.png">

</head>

<body>


<!-- *** NAVBAR ***
_________________________________________________________ -->

<div class="navbar navbar-default yamm" role="navigation" id="navbar">
    <div class="container">
        <div class="navbar-header">

            <a class="navbar-brand home" href="/" data-animate-hover="bounce">
                <img class="img img-responsive" width="100px" height="50px" src="../img/logo.jpg">

            </a>
            <div class="navbar-buttons">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                    <span class="sr-only">Toggle navigation</span>
                    <i class="fa fa-align-justify"></i>
                </button>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
                    <span class="sr-only">Toggle search</span>
                    <i class="fa fa-search"></i>
                </button>
                <a class="btn btn-default navbar-toggle" href="/cart">
                    <i class="fa fa-shopping-cart"></i> <span id="cart_message" class="hidden-xs">Cart is empty</span>
                </a>
            </div>
        </div>
        <!--/.navbar-header -->

        <div class="navbar-collapse collapse" id="navigation">

            <ul class="nav navbar-nav navbar-left">
                <li class="active"><a href="/">Home</a>
                </li>
                <li class="dropdown yamm-fw">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Veneer Sheets
                        <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="yamm-content">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h5>Category 1</h5>
                                        <ul>
                                            <li><a href="category.html">Sub Category 1</a>
                                            </li>
                                            <li><a href="category.html">Sub Category 2</a>
                                            </li>
                                            <li><a href="category.html">Sub Category 3</a>
                                            </li>
                                            <li><a href="category.html">Sub Category 4</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-3">
                                        <h5>Category 2</h5>
                                        <ul>
                                            <li><a href="category.html">Sub Category 1</a>
                                            </li>
                                            <li><a href="category.html">Sub Category 2/a>
                                            </li>
                                            <li><a href="category.html">Sub Category 3</a>
                                            </li>
                                            <li><a href="category.html">Sub Category 4</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-3">
                                        <h5>Category 3</h5>
                                        <ul>
                                            <li><a href="category.html">Sub Category 1</a>
                                            </li>
                                            <li><a href="category.html">Sub Category 2</a>
                                            </li>
                                            <li><a href="category.html">Sub Category 3</a>
                                            </li>
                                            <li><a href="category.html">Sub Category 4</a>
                                            </li>
                                            <li><a href="category.html">Sub Category 5</a>
                                            </li>
                                            <li><a href="category.html">Sub Category 6</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-3">
                                        <h5>Featured</h5>
                                        <ul>
                                            <li><a href="category.html">Item 1</a>
                                            </li>
                                            <li><a href="category.html">Item 2</a>
                                            </li>
                                            <li><a href="category.html">Item 3</a>
                                            </li>
                                        </ul>
                                        <h5>Trending</h5>
                                        <ul>
                                            <li><a href="category.html">Item 1</a>
                                            </li>
                                            <li><a href="category.html">Item 2</a>
                                            </li>
                                            <li><a href="category.html">Item 3</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- /.yamm-content -->
                        </li>
                    </ul>
                </li>

                <li class=""><a href="#hot">Our Products</a>
                </li>

                <li class=""><a href="#our_works">Our Works</a>
                </li>

                <li class=""><a href="#about_us">About Us</a>
                </li>

                <!--<li class="dropdown yamm-fw">-->
                    <!--<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Ladies-->
                        <!--<b class="caret"></b></a>-->
                    <!--<ul class="dropdown-menu">-->
                        <!--<li>-->
                            <!--<div class="yamm-content">-->
                                <!--<div class="row">-->
                                    <!--<div class="col-sm-3">-->
                                        <!--<h5>Clothing</h5>-->
                                        <!--<ul>-->
                                            <!--<li><a href="category.html">T-shirts</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category.html">Shirts</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category.html">Pants</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category.html">Accessories</a>-->
                                            <!--</li>-->
                                        <!--</ul>-->
                                    <!--</div>-->
                                    <!--<div class="col-sm-3">-->
                                        <!--<h5>Shoes</h5>-->
                                        <!--<ul>-->
                                            <!--<li><a href="category.html">Trainers</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category.html">Sandals</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category.html">Hiking shoes</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category.html">Casual</a>-->
                                            <!--</li>-->
                                        <!--</ul>-->
                                    <!--</div>-->
                                    <!--<div class="col-sm-3">-->
                                        <!--<h5>Accessories</h5>-->
                                        <!--<ul>-->
                                            <!--<li><a href="category.html">Trainers</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category.html">Sandals</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category.html">Hiking shoes</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category.html">Casual</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category.html">Hiking shoes</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category.html">Casual</a>-->
                                            <!--</li>-->
                                        <!--</ul>-->
                                        <!--<h5>Looks and trends</h5>-->
                                        <!--<ul>-->
                                            <!--<li><a href="category.html">Trainers</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category.html">Sandals</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category.html">Hiking shoes</a>-->
                                            <!--</li>-->
                                        <!--</ul>-->
                                    <!--</div>-->
                                    <!--<div class="col-sm-3">-->
                                        <!--<div class="banner">-->
                                            <!--<a href="#">-->
                                                <!--<img src="img/banner.jpg" class="img img-responsive" alt="">-->
                                            <!--</a>-->
                                        <!--</div>-->
                                        <!--<div class="banner">-->
                                            <!--<a href="#">-->
                                                <!--<img src="img/banner2.jpg" class="img img-responsive" alt="">-->
                                            <!--</a>-->
                                        <!--</div>-->
                                    <!--</div>-->
                                <!--</div>-->
                            <!--</div>-->
                            <!--&lt;!&ndash; /.yamm-content &ndash;&gt;-->
                        <!--</li>-->
                    <!--</ul>-->
                <!--</li>-->

                <!--<li class="dropdown yamm-fw">-->
                    <!--<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Template-->
                        <!--<b class="caret"></b></a>-->
                    <!--<ul class="dropdown-menu">-->
                        <!--<li>-->
                            <!--<div class="yamm-content">-->
                                <!--<div class="row">-->
                                    <!--<div class="col-sm-3">-->
                                        <!--<h5>Shop</h5>-->
                                        <!--<ul>-->
                                            <!--<li><a href="index.jsp">Homepage</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category.html">Category - sidebar left</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category-right.html">Category - sidebar right</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="category-full.html">Category - full width</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="detail.html">Product detail</a>-->
                                            <!--</li>-->
                                        <!--</ul>-->
                                    <!--</div>-->
                                    <!--<div class="col-sm-3">-->
                                        <!--<h5>User</h5>-->
                                        <!--<ul>-->
                                            <!--<li><a href="register.html">Register / login</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="customer-orders.html">Orders history</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="customer-order.html">Order history detail</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="customer-wishlist.html">Wishlist</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="customer-account.html">Customer account / change password</a>-->
                                            <!--</li>-->
                                        <!--</ul>-->
                                    <!--</div>-->
                                    <!--<div class="col-sm-3">-->
                                        <!--<h5>Order process</h5>-->
                                        <!--<ul>-->
                                            <!--<li><a href="basket.html">Shopping cart</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="checkout1.html">CheckoutAddress - step 1</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="checkout2.html">CheckoutAddress - step 2</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="checkout3.html">CheckoutAddress - step 3</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="checkout4.html">CheckoutAddress - step 4</a>-->
                                            <!--</li>-->
                                        <!--</ul>-->
                                    <!--</div>-->
                                    <!--<div class="col-sm-3">-->
                                        <!--<h5>Pages and blog</h5>-->
                                        <!--<ul>-->
                                            <!--<li><a href="blog.html">Blog listing</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="post.html">Blog Post</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="faq.html">FAQ</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="text.html">Text page</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="text-right.html">Text page - right sidebar</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="404.html">404 page</a>-->
                                            <!--</li>-->
                                            <!--<li><a href="contact.html">Contact</a>-->
                                            <!--</li>-->
                                        <!--</ul>-->
                                    <!--</div>-->
                                <!--</div>-->
                            <!--</div>-->
                            <!--&lt;!&ndash; /.yamm-content &ndash;&gt;-->
                        <!--</li>-->
                    <!--</ul>-->
                <!--</li>-->
            <!--</ul>-->

        </div>
        <!--/.nav-collapse -->
        <div class="navbar-buttons">

            <div class="navbar-collapse collapse right" id="basket-overview">
                <a href="/cart" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span id="cart_msg"
                        class="hidden-sm">
                    <%
                        Cart cart = (Cart) session.getAttribute("cart");
                        int totalItemInCart = 0;
                        if(cart!=null)
                        {
                            totalItemInCart = cart.getCartItems().size();

                    %>
                    <%= totalItemInCart %> item(s) in cart
                    <%

                        }
                        else
                        {
                    %>
                      Cart is empty
                    <%
                        }
                    %>
                </span></a>
            </div>
            <!--/.nav-collapse -->

            <div class="navbar-collapse collapse right" id="search-not-mobile">
                <button type="button" class="btn navbar-btn btn-primary" data-toggle="collapse" data-target="#search">
                    <span class="sr-only">Toggle search</span>
                    <i class="fa fa-search"></i>
                </button>
            </div>

        </div>

        <div class="collapse clearfix" id="search">

            <form class="navbar-form" role="search">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-btn">

			<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>

		    </span>
                </div>
            </form>

        </div>
        <!--/.nav-collapse -->

    </div>
    <!-- /.container -->
</div>
<!-- /#navbar -->

<!-- *** NAVBAR END *** -->

<!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/modernizr.js"></script>
<script src="js/bootstrap-hover-dropdown.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/front.js"></script>

</body>
</html>