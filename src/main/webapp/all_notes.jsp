<!doctype html>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.Note"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>All notes</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h1 class="m-5">All notes</h1>
	<%
	Session s = FactoryProvider.getFactory().openSession();
	Query q = s.createQuery("from Note");
	List<Note> note = q.list();
	for (Note n : note) {
	%>

	<div class="card m-5" >
		<img src="img/post-it.png" class="card-img-top m-3 mx-auto" alt="note_img" style='max-width:5rem '>
		<div class="card-body">
			<h5 class="card-title text-center"><%=n.getTitle() %></h5>
			<p class="card-text text-center"><%=n.getContent() %></p>
			<p class="card-text text-center text-info">Date: <%=n.getAddedDate().getDate()%>/<%=n.getAddedDate().getMonth()%>/<%=1900+n.getAddedDate().getYear()%></p>
			<p class="card-text text-center text-info">Time: <%=n.getAddedDate().getHours() %>:<%=n.getAddedDate().getMinutes() %></p>
			<div class="text-center">
				<a href="update.jsp?note_id=<%=n.getId()%>" class="btn btn-primary">Update</a>
			<a href="DeleteServlet?note_id=<%=n.getId()%>" class="btn btn-danger">Delete</a>
			</div>
		</div>
	</div>

	<%
	}
	s.close();
	%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>