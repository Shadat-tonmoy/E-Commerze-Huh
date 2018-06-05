<%@ page import="com.shadat.admin.model.Product" %>
<%@ page import="com.shadat.admin.model.DeliveryMethod" %><%--
  Created by IntelliJ IDEA.
  User: shadat
  Date: 4/17/18
  Time: 2:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<body><!-- Left Panel -->
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

    <div class="content mt-3 align-self-center">
        <div class="animated fadeIn">
            <%
                DeliveryMethod deliveryMethod = (DeliveryMethod) request.getAttribute("deliveryMethod");

            %>


            <div class="row" style="margin-left: 25%; width:  100%; display: block;">

                <div class="col-lg-6 col-lg-offset-3">
                    <div class="card">
                        <div class="card-header">Edit Delivery Method</div>
                        <div class="card-body card-block">
                            <form action="edit-delivery-method" method="POST">

                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-vcard-o"></i></div>
                                        <input type = "text" name = "title" value="<%=deliveryMethod.getDeliveryMethodTitle()%>"  class="form-control" placeholder="Delivery Methodd Title" >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                        <input type="text" id="price" value="<%=deliveryMethod.getDeliveryTime()%>" title="Deliery Time" name="time" placeholder="1-2 Days"
                                               class="form-control">
                                    </div>
                                </div>

                                <input type="hidden" name="deliveryMethodId" value="<%= deliveryMethod.getId() %>" />

                                <div class="form-actions form-group">
                                    <input type="submit" value="Submit" class="btn btn-outline-success btn-lg btn-block" >
                                </div>
                            </form>


                        </div>
                    </div>
                </div>
            </div>

        </div>


    </div><!-- .animated -->
</div><!-- .content -->


</div><!-- /#right-panel -->

<!-- Right Panel -->

<script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/plugins.js"></script>
<script src="assets/js/main.js"></script>



</body>
</html>
