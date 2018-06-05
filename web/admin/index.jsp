<%@ page import="com.shadat.database.Database" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>

</head>
<body>


<%
    Database adminDatabase = new Database();
    int totalStock = adminDatabase .getTotalStock();
    int totalCategory = adminDatabase.getTotalCategory();
    int totalPendingOrder = adminDatabase.getTotalOrderOf("Pending");
    int totalSuccessfullOrder = adminDatabase.getTotalOrderOf("Delivered");
    int totalCancelledOrder = adminDatabase.getTotalOrderOf("Cancelled");
    int totalCustomer = adminDatabase.getTotalCustomer();

%>

    <!-- Left Panel -->
    <%@ include file="side_bar.jsp" %>
    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
                    <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>Dashboard</h1>
                            </div>
                        </div>
                    </div>
                </div>

        </header><!-- /header -->
        <!-- Header-->

        <div class="content mt-3">

            <div class="col-sm-12">
                <div class="alert  alert-success alert-dismissible fade show" role="alert">
                  <span class="badge badge-pill badge-success">Welcome</span> You are now logged in as an admin.
                </div>
            </div>


           <div class="col-sm-6 col-lg-3">
                <div class="card text-white bg-flat-color-1">
                    <div class="card-body pb-0">

                        <h4 class="mb-0">
                            <span class="count"><%=totalStock%></span>
                        </h4>
                        <p class="text-light">Products in stock</p>

                        <div class="chart-wrapper px-0" style="height:70px;" height="70">
                            <canvas id="widgetChart1"></canvas>
                        </div>

                    </div>

                </div>
            </div>
            <!--/.col-->

            <div class="col-sm-6 col-lg-3">
                <div class="card text-white bg-flat-color-2">
                    <div class="card-body pb-0">

                        <h4 class="mb-0">
                            <span class="count"><%=totalSuccessfullOrder%></span>
                        </h4>
                        <p class="text-light">Successful Orders</p>

                        <div class="chart-wrapper px-0" style="height:70px;" height="70">
                            <canvas id="widgetChart2"></canvas>
                        </div>

                    </div>
                </div>
            </div>
            <!--/.col-->

            <div class="col-sm-6 col-lg-3">
                <div class="card text-white bg-flat-color-3">
                    <div class="card-body pb-0">
                        <h4 class="mb-0">
                            <span class="count"><%=totalPendingOrder%></span>
                        </h4>
                        <p class="text-light">Pending Orders</p>

                    </div>

                        <div class="chart-wrapper px-0" style="height:70px;" height="70">
                            <canvas id="widgetChart3"></canvas>
                        </div>
                </div>
            </div>
            <!--/.col-->

            <div class="col-sm-6 col-lg-3">
                <div class="card text-white bg-flat-color-4">
                    <div class="card-body pb-0">
                        <h4 class="mb-0">
                            <span class="count"><%=totalCancelledOrder%></span>
                        </h4>
                        <p class="text-light">Failed  Orders</p>

                        <div class="chart-wrapper px-3" style="height:70px;" height="70">
                            <canvas id="widgetChart4"></canvas>
                        </div>

                    </div>
                </div>
            </div>
            <!--/.col-->


            <%--<div class="col-xl-6">--%>
                <%--<div class="card">--%>
                    <%--<div class="card-body">--%>
                        <%--<div class="row">--%>
                            <%--<div class="col-sm-4">--%>
                                <%--<h4 class="card-title mb-0">Traffic</h4>--%>
                                <%--<div class="small text-muted">October 2017</div>--%>
                            <%--</div>--%>
                            <%--<!--/.col-->--%>
                            <%--<div class="col-sm-8 hidden-sm-down">--%>
                                <%--<button type="button" class="btn btn-primary float-right bg-flat-color-1"><i class="fa fa-cloud-download"></i></button>--%>
                                <%--<div class="btn-toolbar float-right" role="toolbar" aria-label="Toolbar with button groups">--%>
                                    <%--<div class="btn-group mr-3" data-toggle="buttons" aria-label="First group">--%>
                                        <%--<label class="btn btn-outline-secondary">--%>
                                            <%--<input type="radio" title="options" id="option1"> Day--%>
                                        <%--</label>--%>
                                        <%--<label class="btn btn-outline-secondary active">--%>
                                            <%--<input type="radio" title="options" id="option2" checked=""> Month--%>
                                        <%--</label>--%>
                                        <%--<label class="btn btn-outline-secondary">--%>
                                            <%--<input type="radio" title="options" id="option3"> Year--%>
                                        <%--</label>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div><!--/.col-->--%>


                        <%--</div><!--/.row-->--%>
                        <%--<div class="chart-wrapper mt-4" >--%>
                            <%--<canvas id="trafficChart" style="height:200px;" height="200"></canvas>--%>
                        <%--</div>--%>

                    <%--</div>--%>
                    <%--<div class="card-footer">--%>
                        <%--<ul>--%>
                            <%--<li>--%>
                                <%--<div class="text-muted">Visits</div>--%>
                                <%--<strong>29.703 Users (40%)</strong>--%>
                                <%--<div class="progress progress-xs mt-2" style="height: 5px;">--%>
                                    <%--<div class="progress-bar bg-success" role="progressbar" style="width: 40%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>--%>
                                <%--</div>--%>
                            <%--</li>--%>
                            <%--<li class="hidden-sm-down">--%>
                                <%--<div class="text-muted">Unique</div>--%>
                                <%--<strong>24.093 Users (20%)</strong>--%>
                                <%--<div class="progress progress-xs mt-2" style="height: 5px;">--%>
                                    <%--<div class="progress-bar bg-info" role="progressbar" style="width: 20%;" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>--%>
                                <%--</div>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<div class="text-muted">Pageviews</div>--%>
                                <%--<strong>78.706 Views (60%)</strong>--%>
                                <%--<div class="progress progress-xs mt-2" style="height: 5px;">--%>
                                    <%--<div class="progress-bar bg-warning" role="progressbar" style="width: 60%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>--%>
                                <%--</div>--%>
                            <%--</li>--%>
                            <%--<li class="hidden-sm-down">--%>
                                <%--<div class="text-muted">New Users</div>--%>
                                <%--<strong>22.123 Users (80%)</strong>--%>
                                <%--<div class="progress progress-xs mt-2" style="height: 5px;">--%>
                                    <%--<div class="progress-bar bg-danger" role="progressbar" style="width: 80%;" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>--%>
                                <%--</div>--%>
                            <%--</li>--%>
                            <%--<li class="hidden-sm-down">--%>
                                <%--<div class="text-muted">Bounce Rate</div>--%>
                                <%--<strong>40.15%</strong>--%>
                                <%--<div class="progress progress-xs mt-2" style="height: 5px;">--%>
                                    <%--<div class="progress-bar" role="progressbar" style="width: 40%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>--%>
                                <%--</div>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>

           <%--<div class="col-xl-3 col-lg-6">--%>
                <%--<section class="card">--%>
                    <%--<div class="twt-feed blue-bg">--%>
                        <%--<div class="corner-ribon black-ribon">--%>
                            <%--<i class="fa fa-twitter"></i>--%>
                        <%--</div>--%>
                        <%--<div class="fa fa-twitter wtt-mark"></div>--%>

                        <%--<div class="media">--%>
                            <%--<a href="#">--%>
                                <%--<img class="align-self-center rounded-circle mr-3" style="width:85px; height:85px;" alt="" src="images/admin.jpg">--%>
                            <%--</a>--%>
                            <%--<div class="media-body">--%>
                                <%--<h2 class="text-white display-6">Jim Doe</h2>--%>
                                <%--<p class="text-light">Project Manager</p>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="weather-category twt-category">--%>
                        <%--<ul>--%>
                            <%--<li class="active">--%>
                                <%--<h5>750</h5>--%>
                                <%--Tweets--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<h5>865</h5>--%>
                                <%--Following--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<h5>3645</h5>--%>
                                <%--Followers--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>
                    <%--<div class="twt-write col-sm-12">--%>
                        <%--<textarea placeholder="Write your Tweet and Enter" rows="1" class="form-control t-text-area"></textarea>--%>
                    <%--</div>--%>
                    <%--<footer class="twt-footer">--%>
                        <%--<a href="#"><i class="fa fa-camera"></i></a>--%>
                        <%--<a href="#"><i class="fa fa-map-marker"></i></a>--%>
                        <%--New Castle, UK--%>
                        <%--<span class="pull-right">--%>
                            <%--32--%>
                        <%--</span>--%>
                    <%--</footer>--%>
                <%--</section>--%>
            <%--</div>--%>


            <div class="col-xl-3 col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-money text-success border-success"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-text">Total Sold</div>
                                <div class="stat-digit"><%=totalSuccessfullOrder%></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-xl-3 col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-user text-primary border-primary"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-text">Total Customers</div>
                                <div class="stat-digit"><%=totalCustomer%></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-layout-grid2 text-warning border-warning"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-text">Total Catagories</div>
                                <div class="stat-digit"><%=totalCategory%></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div> <!-- .content -->
    </div><!-- /#right-panel -->

    <!-- Right Panel -->

    <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>


    <%--<script src="assets/js/lib/chart-js/Chart.bundle.js"></script>--%>
    <%--<script src="assets/js/dashboard.js"></script>--%>
    <%--<script src="assets/js/widgets.js"></script>--%>
    <%--<script src="assets/js/lib/vector-map/jquery.vmap.js"></script>--%>
    <%--<script src="assets/js/lib/vector-map/jquery.vmap.min.js"></script>--%>
    <%--<script src="assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>--%>
    <%--<script src="assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>--%>
    <%--<script>--%>
        <%--( function ( $ ) {--%>
            <%--"use strict";--%>

            <%--jQuery( '#vmap' ).vectorMap( {--%>
                <%--map: 'world_en',--%>
                <%--backgroundColor: null,--%>
                <%--color: '#ffffff',--%>
                <%--hoverOpacity: 0.7,--%>
                <%--selectedColor: '#1de9b6',--%>
                <%--enableZoom: true,--%>
                <%--showTooltip: true,--%>
                <%--values: sample_data,--%>
                <%--scaleColors: [ '#1de9b6', '#03a9f5' ],--%>
                <%--normalizeFunction: 'polynomial'--%>
            <%--} );--%>
        <%--} )( jQuery );--%>
    <%--</script>--%>

</body>
</html>
