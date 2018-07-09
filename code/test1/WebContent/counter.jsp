<%@ page import="com.count.Count"%>
<%
    String count = Count.readCount("D:/visitCount.txt");
    if (session.getAttribute("visit") == null) {
        session.setAttribute("visit", "y");
        session.setMaxInactiveInterval(60 * 60 * 24);
    
        int count1 = Integer.parseInt(count);
        count1 = count1 + 1;
        count = String.valueOf(count1).toString();
        Count.writeCount("D:/visitCount.txt", count);
    }
%>