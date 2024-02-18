<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("loginpage.html");
    }
%>
<html>
    <head>
        <title>King Hotel</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="customer_handle.css">
    </head>
    <body>
        <nav>
            <div class="row">
                <img src="images/Logo.jpg" class="logo">
            </div>
        </nav>
        <section class="row1">
            <div class="container-fluid mt-3 ">
                <div class="mt-4 p-4 rounded">
                    <h1>Customer Handle</h1>
                </div>
        </section>

        <section class="p-4">
            <div>
                <table class="table">
                    <thead class="table-success">
                        <tr>
                            <th>Details:</th>
                            <th>
                                <!-- The Modal -->
                    <div class="modal mt-3" id="myModal">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Add Customer Details</h4>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form action="customer_handle_add_details.jsp" method="post">
                                        <div class="form-floating">
                                            <input type="text" name="Name" placeholder="Customer Name" required="" autocomplete="off" class="form-control">
                                            <label for="vt">Customer Name</label>
                                        </div>
                                        <div class="form-floating">
                                            <input type="text" name="Phone no" placeholder="Phone number" required="" autocomplete="off" class="form-control">
                                            <label for="vm">Phone Number</label>
                                        </div>
                                        <div class="form-floating">
                                            <input type="email" name="email" placeholder="Email" required="" autocomplete="off" class="form-control">
                                            <label for="vy">Email</label>
                                        </div>
                                        <div class="form-floating">
                                            <input  id="datepicker" name="Text" type="text" value="" placeholder="Arrival Date"  onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'mm/dd/yyyy';
                                                    }" required="" class="form-control">
                                            <label for="vp">Arrival Date</label>
                                        </div>
                                        <div class="form-floating">
                                            <input  id="datepicker1" name="Text1" type="text" value="" placeholder="Departure Date"  onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'mm/dd/yyyy';
                                                    }" required="" class="form-control">
                                            <label for="vp">Departure Date</label>
                                        </div>
                                        <div class="form-floating">
                                            <select class="form-control" name="guest_no" id="country" onchange="change_country(this.value)" class="frm-field required">
                                                <option value="">...</option>
                                                <option value="1">1</option>
                                                <option value="2">2 </option>         
                                                <option value="3">3</option>
                                                <option value="4">4 </option>
                                                <option value="5">5 </option>
                                                <option value="6">6 </option>
                                            </select>
                                            <label for="vp">Number Of Guest</label>
                                        </div>
                                        <div class="form-floating">
                                            <select class="form-control" name="room_type" id="country1" onchange="change_country(this.value)" class="frm-field required">
                                                <option value="">...</option>
                                                <option value="Royal Penthouse">Royal PentHouse</option>
                                                <option value="King Suite">King Suite</option>
                                                <option value="Queen Suite">Queen Suite</option>
                                            </select>
                                            <label for="vp">Room Type</label>
                                        </div>

                                        <div class="modal-footer">
                                            <input type="submit" value="ADD" class="btn btn-primary">
                                        </div>
                                    </form>
                                </div>
                                <!-- Modal footer -->
                            </div>
                        </div>
                    </div>
                    </th>
                    <th>
                    <div class="float-end">
                        <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#myModal">
                            Add Customer
                        </button>
                    </div>
                    </th>
                    </tr>
                    </thead>
                </table>
            </div>
        </section>
        <sql:setDataSource var="snapshot"
                   url="jdbc:mysql://db-kinghotel.cvuumgqqw687.ap-south-1.rds.amazonaws.com:3306/?user=root"
                   driver="com.mysql.jdbc.Driver"
                   user = "root" password = "shailu5988"/>
        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * FROM customer_details;
        </sql:query>
        <section class="p-4 pt-1">
            <div>
                <table class="table table-hover" id="dataTable">
                    <thead class="table-success">
                        <tr>
                            <th>ID</th>
                            <th>Customer Name</th>
                               <th>Phone Number</th>
                            <th>Email</th>
                            <th>Room Type</th>
                            <th>Number OF Guest</th>
                            <th>Departure Date</th>
                            <th>Arrival Date</th>
                            <th>Manage</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var = "row" items = "${result.rows}">
                            <tr>
                                <td> <c:out value = "${row.id}"/></td>
                                <td> <c:out value = "${row.customer_name}"/></td>
                                <td> <c:out value = "${row.phone_number}"/></td>
                                <td> <c:out value = "${row.email}"/></td>
                                <td> <c:out value = "${row.room_type}"/></td>
                                <td> <c:out value = "${row.number_of_guest}"/></td>
                                <td> <c:out value = "${row.departure_date}"/></td>
                                <td> <c:out value = "${row.arrival_date}"/></td>
                                <td class="d-flex">
                                    <div>
                                        <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#myModal1">
                                            update
                                        </button>
                                    </div>
                                    <!-- The Modal -->
                                    <div class="modal" id="myModal1">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Update Customer Details</h4>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>

                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <form action="customer_handle_update_details.jsp" method="post">
                                                        <input type="hidden" name="uid" value="${row.id}">
                                                        <div class="form-floating">
                                                            <input type="text" name="Name" placeholder="Customer Name" required="" autocomplete="off" class="form-control" value = "${row.customer_name}">
                                                            <label for="vt">Customer Name</label>
                                                        </div>
                                                        <div class="form-floating">
                                                            <input type="text" name="Phone no" placeholder="Phone number" required="" autocomplete="off" class="form-control" value = "${row.phone_number}">
                                                            <label for="vm">Phone Number</label>
                                                        </div>
                                                        <div class="form-floating">
                                                            <input type="email" name="email" placeholder="Email" required="" autocomplete="off" class="form-control" value = "${row.email}">
                                                            <label for="vy">Email</label>
                                                        </div>
                                                        <div class="form-floating">
                                                            <input  id="datepicker" name="Text" type="text" value="${row.arrival_date}" placeholder="Arrival Date"  onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'mm/dd/yyyy';
                                                    }" required="" class="form-control">
                                                            <label for="vp">Arrival Date</label>
                                                        </div>
                                                        <div class="form-floating">
                                                            <input  id="datepicker1" name="Text1" type="text" value="${row.departure_date}" placeholder="Departure Date"  onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'mm/dd/yyyy';
                                                    }" required="" class="form-control">
                                                            <label for="vp">Departure Date</label>
                                                        </div>
                                                        <div class="form-floating">
                                                            <select class="form-control" name="guest_no" id="country" onchange="change_country(this.value)" class="frm-field required">
                                                                <option value="">${row.number_of_guest}</option>
                                                                <option value="1">1</option>
                                                                <option value="2">2 </option>         
                                                                <option value="3">3</option>
                                                                <option value="4">4 </option>
                                                                <option value="5">5 </option>
                                                                <option value="6">6 </option>
                                                            </select>
                                                            <label for="vp">Number of Guest</label>
                                                        </div>
                                                        <div class="form-floating">
                                                            <select class="form-control" name="room_type" id="country1" onchange="change_country(this.value)" class="frm-field required">
                                                                <option value="">${row.room_type}</option>
                                                                <option value="Royal Penthouse">Royal PentHouse</option>
                                                                <option value="King Suite">King Suite</option>
                                                                <option value="Queen Suite">Queen Suite</option>
                                                            </select>
                                                                <label for="vp">Room Type</label>
                                                        </div>

                                                        <div class="modal-footer">
                                                            <input type="submit" value="Update" class="btn btn-primary">
                                                        </div>
                                                    </form>
                                                </div>
                                                <!-- Modal footer -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="float-end ms-2 mt-1">
                                        <form method="post" action="customer_handle_delete_details.jsp">
                                            <input type="hidden" name="cid" value="${row.id}">
                                            <button type="submit" class="btn-close"></button>
                                        </form></div></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
    </body>
</html>
