<%@ page import="com.shadat.admin.model.Product" %><%--
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
                Product product = (Product) request.getAttribute("product");

            %>


            <div class="row" style="margin-left: 25%; width:  100%; display: block;">

                <div class="col-lg-6 col-lg-offset-3">
                    <div class="card">
                        <div class="card-header">Add Veneer Sheet</div>
                        <div class="card-body card-block">
                            <form action="/edit" method="POST">

                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-vcard-o"></i></div>
                                        <input type = "text" name = "title" value="<%=product.getTitle()%>"  class="form-control" placeholder="Product Title" >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                        <input type="text" id="price" value="<%=product.getPrice()%>" title="Product Price" name="price" placeholder="Price"
                                               class="form-control">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-percent"></i></div>
                                        <input type="text" id="discount" value="<%=product.getDiscount()%>" name="discount" title="Discount" placeholder="Discount in percentage"
                                               class="form-control">
                                    </div>
                                </div>




                                <div class="form-group">
                                    <label for="description">Available/In Stock:</label>
                                    <label class="switch switch-text switch-primary switch-pill">
                                        <input type="checkbox" class="switch-input" title="Tap to change" checked="<% if (product.isAvailable()) out.print("true"); else out.print("false");%>" name="available">
                                        <span data-on="Yes" data-off="No" class="switch-label"></span>
                                        <span class="switch-handle"></span>
                                    </label>
                                </div>




                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-percent"></i></div>
                                        <input type="text" id="stock" name="stock" title="Discount" placeholder="Stock Remaining"
                                               value="<%= product.getStock()%>" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="description">Description:</label>
                                    <textarea class="form-control" rows="5"  id="description" name="description">
                                        <%=product.getDescription()%>
                                    </textarea>
                                </div>

                                <%--<div class="row form-group">--%>
                                <%--<div class="col col-md-3"><label for="file-input" class=" form-control-label">Images</label></div>--%>
                                <%--<br>--%>
                                <%--<div class="col-12 col-md-9"><input type="file" name="fname" multiple id="file-input" title="file-input" class="form-control-file"></div>--%>
                                <%--</div>--%>

                                <input type="hidden" name="productId" value="<%= product.getId() %>" />

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
