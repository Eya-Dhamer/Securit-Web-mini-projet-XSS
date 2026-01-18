<%-- Redirection simple vers la servlet --%>
<%
    response.sendRedirect(request.getContextPath() + "/questions");
%>