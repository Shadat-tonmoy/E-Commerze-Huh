<%@ page import="com.shadat.main.model.OrderUserDetail" %><%--
  Created by IntelliJ IDEA.
  User: shadat
  Date: 6/5/18
  Time: 2:34 AM
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

    double total = 0;
    OrderUserDetail orderUserDetail = (OrderUserDetail) session.getAttribute("userDetail");
    String orderNumber = (String) session.getAttribute("orderNumber");
%>




<div id="content">
    <div class="container">

        <div class="col-md-9" id="basket">

            <div class="box">


                <div class="content">

                    <center>

                        <img class="image img-circle img-responsive img-thumbnail" width="150px" height="150px" src="img/success.png" alt="White Blouse Armani">
                        <h2>Congratulation!!! <%=orderUserDetail.getFirstName()+" "+orderUserDetail.getLastName()%></h2>
                        <h4>Your order has been successfully placed with Order Number </h4>
                        <h2><%=orderNumber%></h2>
                        <h4>We have sent an e-mail to <%=orderUserDetail.getEmail()%> We will also contact you within 24 houres at <%=orderUserDetail.getPhone()%></h4>

                    </center>

                </div>

            </div>


            <!-- /.box -->
        </div>
        <!-- /.col-md-9 -->

    </div>
    <!-- /.container -->


</div>
<%--end of content--%>





<%@ include file="footer.jsp" %>

<%@ include file="copyright.jsp" %>

</body>
</html>
