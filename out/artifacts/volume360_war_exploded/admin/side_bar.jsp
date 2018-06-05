<%--
  Created by IntelliJ IDEA.
  User: shadat
  Date: 4/15/18
  Time: 1:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Volume 360 Admin </title>
    <meta title="description" content="Volume 360 Admin ">
    <meta title="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="assets/css/normalize.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
    <link rel="stylesheet" href="assets/scss/style.css">
    <link href="assets/css/lib/vector-map/jqvmap.min.css" rel="stylesheet">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>


    <style>


        .fab {
            width: 70px;
            height: 70px;
            background-color: red;
            text-decoration: none;
            border-radius: 50%;
            box-shadow: 0 6px 10px 0 #666;
            transition: all 0.1s ease-in-out;

            font-size: 50px;
            color: white;
            text-align: center;
            line-height: 70px;

            position: fixed;
            right: 50px;
            bottom: 50px;
        }

        .fab:hover {
            box-shadow: 0 6px 14px 0 #666;
            transform: scale(1.05);
        }

    </style>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body>

<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">

        <div class="navbar-header">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu"
                    aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="./"><h4>Admin Panel</h4></a>
            <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
        </div>

        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="./"> <i class="menu-icon fa fa-dashboard"></i>Dashboard </a>
                </li>
                <h3 class="menu-title">Manage</h3><!-- /.menu-title -->

                <%--<li class="menu-item-has-children dropdown">--%>
                    <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"--%>
                       <%--aria-expanded="false"> <i class="menu-icon fa fa-laptop"></i>Components</a>--%>
                    <%--<ul class="sub-menu children dropdown-menu">--%>
                        <%--<li><i class="fa fa-puzzle-piece"></i><a href="ui-buttons.html">Buttons</a></li>--%>
                        <%--<li><i class="fa fa-id-badge"></i><a href="ui-badges.html">Badges</a></li>--%>
                        <%--<li><i class="fa fa-bars"></i><a href="ui-tabs.html">Tabs</a></li>--%>
                        <%--<li><i class="fa fa-share-square-o"></i><a href="ui-social-buttons.html">Social Buttons</a></li>--%>
                        <%--<li><i class="fa fa-id-card-o"></i><a href="ui-cards.html">Cards</a></li>--%>
                        <%--<li><i class="fa fa-exclamation-triangle"></i><a href="ui-alerts.html">Alerts</a></li>--%>
                        <%--<li><i class="fa fa-spinner"></i><a href="ui-progressbar.html">Progress Bars</a></li>--%>
                        <%--<li><i class="fa fa-fire"></i><a href="ui-modals.html">Modals</a></li>--%>
                        <%--<li><i class="fa fa-book"></i><a href="ui-switches.html">Switches</a></li>--%>
                        <%--<li><i class="fa fa-th"></i><a href="ui-grids.html">Grids</a></li>--%>
                        <%--<li><i class="fa fa-file-word-o"></i><a href="ui-typgraphy.html">Typography</a></li>--%>
                    <%--</ul>--%>
                <%--</li>--%>

                <%--<li class="menu-item-has-children dropdown">--%>
                    <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"--%>
                       <%--aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Tables</a>--%>
                    <%--<ul class="sub-menu children dropdown-menu">--%>
                        <%--<li><i class="fa fa-table"></i><a href="tables-basic.html">Basic Table</a></li>--%>
                        <%--<li><i class="fa fa-table"></i><a href="tables-data.html">Data Table</a></li>--%>
                    <%--</ul>--%>
                <%--</li>--%>


                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Products</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="menu-icon fa fa-th"></i><a href="veneer-sheet">Veneer Sheet</a></li>
                        <li><i class="menu-icon fa fa-th"></i><a href="#">Others</a></li>
                        <!--<li><i class="menu-icon fa fa-th"></i><a href="forms-advanced.html">Advanced Form</a></li>-->
                    </ul>
                </li>

                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Orders</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="menu-icon fa fa-th"></i><a href="pending-orders">Pending</a></li>
                        <li><i class="menu-icon fa fa-th"></i><a href="paid-orders">Paid</a></li>
                        <li><i class="menu-icon fa fa-th"></i><a href="shipped-orders">Shipped</a></li>
                        <li><i class="menu-icon fa fa-th"></i><a href="delivered-orders">Delivered</a></li>
                        <li><i class="menu-icon fa fa-th"></i><a href="cancelled-orders">Cancelled</a></li>
                        <!--<li><i class="menu-icon fa fa-th"></i><a href="forms-advanced.html">Advanced Form</a></li>-->
                    </ul>
                </li>


                <li class="menu-item ">
                    <a href="delivery-methods"> <i class="menu-icon fa fa-th"></i>Delivery Methods</a>
                </li>


                <li class="menu-item ">
                    <a href="payment-methods"> <i class="menu-icon fa fa-th"></i>Payment Method</a>
                </li>

                <li class="menu-item ">
                    <a href="customers"> <i class="menu-icon fa fa-th"></i>Customers</a>
                </li>

                <li class="menu-item ">
                    <a href="/admin-logout"> <i class="menu-icon fa fa-th"></i>Logout</a>
                </li>



                <%--<h3 class="menu-title">Icons</h3><!-- /.menu-title -->--%>

                <%--<li class="menu-item-has-children dropdown">--%>
                    <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"--%>
                       <%--aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>Icons</a>--%>
                    <%--<ul class="sub-menu children dropdown-menu">--%>
                        <%--<li><i class="menu-icon fa fa-fort-awesome"></i><a href="font-fontawesome.html">Font Awesome</a>--%>
                        <%--</li>--%>
                        <%--<li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">Themefy Icons</a></li>--%>
                    <%--</ul>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<a href="widgets.html"> <i class="menu-icon ti-email"></i>Widgets </a>--%>
                <%--</li>--%>
                <%--<li class="menu-item-has-children dropdown">--%>
                    <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"--%>
                       <%--aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Charts</a>--%>
                    <%--<ul class="sub-menu children dropdown-menu">--%>
                        <%--<li><i class="menu-icon fa fa-line-chart"></i><a href="charts-chartjs.html">Chart JS</a></li>--%>
                        <%--<li><i class="menu-icon fa fa-area-chart"></i><a href="charts-flot.html">Flot Chart</a></li>--%>
                        <%--<li><i class="menu-icon fa fa-pie-chart"></i><a href="charts-peity.html">Peity Chart</a></li>--%>
                    <%--</ul>--%>
                <%--</li>--%>

                <%--<li class="menu-item-has-children dropdown">--%>
                    <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"--%>
                       <%--aria-expanded="false"> <i class="menu-icon fa fa-area-chart"></i>Maps</a>--%>
                    <%--<ul class="sub-menu children dropdown-menu">--%>
                        <%--<li><i class="menu-icon fa fa-map-o"></i><a href="maps-gmap.html">Google Maps</a></li>--%>
                        <%--<li><i class="menu-icon fa fa-street-view"></i><a href="maps-vector.html">Vector Maps</a></li>--%>
                    <%--</ul>--%>
                <%--</li>--%>


                <%--<h3 class="menu-title">Extras</h3><!-- /.menu-title -->--%>
                <%--<li class="menu-item-has-children dropdown">--%>
                    <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"--%>
                       <%--aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>Pages</a>--%>
                    <%--<ul class="sub-menu children dropdown-menu">--%>
                        <%--<li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">Login</a></li>--%>
                        <%--<li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">Register</a></li>--%>
                        <%--<li><i class="menu-icon fa fa-paper-plane"></i><a href="pages-forget.html">Forget Pass</a></li>--%>
                    <%--</ul>--%>
                <%--</li>--%>

            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside><!-- /#left-panel -->


<%--<script src="assets/js/vendor/jquery-2.1.4.min.js"></script>--%>
<%--<script src="assets/js/popper.min.js"></script>--%>
<%--<script src="assets/js/plugins.js"></script>--%>
<%--<script src="assets/js/main.js"></script>--%>





<%--<script src="assets/js/lib/data-table/datatables.min.js"></script>--%>
<%--<script src="assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>--%>
<%--<script src="assets/js/lib/data-table/dataTables.buttons.min.js"></script>--%>
<%--<script src="assets/js/lib/data-table/buttons.bootstrap.min.js"></script>--%>
<%--<script src="assets/js/lib/data-table/jszip.min.js"></script>--%>
<%--<script src="assets/js/lib/data-table/pdfmake.min.js"></script>--%>
<%--<script src="assets/js/lib/data-table/vfs_fonts.js"></script>--%>
<%--<script src="assets/js/lib/data-table/buttons.html5.min.js"></script>--%>
<%--<script src="assets/js/lib/data-table/buttons.print.min.js"></script>--%>
<%--<script src="assets/js/lib/data-table/buttons.colVis.min.js"></script>--%>
<%--<script src="assets/js/lib/data-table/datatables-init.js"></script>--%>


<%--<script type="text/javascript">--%>
    <%--$(document).ready(function () {--%>
        <%--$('#bootstrap-data-table-export').DataTable();--%>
    <%--});--%>
<%--</script>--%>

</body>
</html>