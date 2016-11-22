
<!DOCTYPE html>
<html>
    <!-- navbar -->
    <div id="navbar">
        <ul>
            <li> <h1 id="title">Wolfiebook</h1>
                <%if(session.getAttribute("username") != null) { %>
                    <p>Logged in as <%=session.getAttribute("username")%></p>
                <% }
                %></li>
            <div id="headerButtons">
            <li><a href="../index.xhtml">Home</a></li>

            <li><a  href="logout.jsp">Logout</a></li>
            </div>
        </ul>
    </div>
</html>
