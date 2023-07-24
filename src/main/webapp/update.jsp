<!doctype html>
<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Update</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<div class="container-fluid p-0 m-0" >
		<%@include file="navbar.jsp"%>
	</div>
	<h1 class="m-5">Update note</h1>
	
	<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Note n = (Note) s.get(Note.class, noteId);
	%>
	
	<div class="m-5">
		<form action="UpdateNoteServlet" method="post">
			<div class="mb-3">
				<label for="title" class="form-label">Title
					</label> <input type="text" class="form-control"
					id="title" required name="title" value="<%=n.getTitle()%>">
					</div>
				
			<div class="mb-3">
				<label for="content" class="form-label">Note</label>
				<textarea class="form-control" id="content" rows="5" required name="content"><%=n.getContent() %></textarea>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary">Update note</button>
			</div>
			<input value="<%=noteId%>" type="hidden" name="noteId">
		</form>
	</div>
	
	<%s.close();%>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>