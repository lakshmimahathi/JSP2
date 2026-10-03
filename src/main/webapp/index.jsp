
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSPLAB2</title>
</head>

<body>

<h2>Employee Details</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>SALARY</th>
    </tr>

    <%
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        try {

            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to MySQL database
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/mahathi",
                    "root",
                    "Lucky@232627"
            );

            // Create statement
            st = con.createStatement();

            // Execute query
            rs = st.executeQuery("SELECT * FROM employee");

            // Display records
            while (rs.next()) {
    %>

    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getInt("salary") %></td>
    </tr>

    <%
            }

        } catch (Exception e) {

            out.println("<tr>");
            out.println("<td colspan='3'>Error: " + e.getMessage() + "</td>");
            out.println("</tr>");

        } finally {

            try {
                if (rs != null) rs.close();
            } catch (Exception e) {
            }

            try {
                if (st != null) st.close();
            } catch (Exception e) {
            }

            try {
                if (con != null) con.close();
            } catch (Exception e) {
            }
        }
    %>

</table>

</body>
</html>

