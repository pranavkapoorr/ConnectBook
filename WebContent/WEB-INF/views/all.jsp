<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<c:if test="${!empty listContacts}">
	<table class="tg" align="center">
	<tr>
		<th width="80">Person ID</th>
		<th width="120">Contact Name</th>
		<th width="120">Contact Dob</th>
		<th width="120">Contact Gender</th>
                <th width="120">Contact address</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listContacts}" var="contact">
		<tr>
			<td>${contact.id}</td>
                        <td>${contact.name}</td>
                        <td>${contact.dob}</td>
			<td>${contact.gender}</td>
                        <td>${contact.username}</td>
         
			<td><a href="<c:url value='/edit/${contact.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/remove/${contact.id}' />" >X</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>