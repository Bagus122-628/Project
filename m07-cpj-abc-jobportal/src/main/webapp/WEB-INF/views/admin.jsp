<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<body style="background-color: #e2e2e2">
	<%@include file="header.jsp"%>

	<div class="container mt-5">
		<h1 align="center" style="font-weight: bold;">admin</h1>
		<a href="userform" class="btn btn-info" style="font-weight: bold;">Add</a>
		<table class="table mt-5 table-info ">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">email</th>
					<th scope="col">first name</th>
					<th scope="col">last name</th>
					<th scope="col">country</th>
					<th scope="col">skill</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${list}">
					<tr>
						<th scope="row"><c:out value="${user.id}" /></th>
						<td>${user.email}</td>
						<td><c:out value="${user.profile.firstName}" /></td>
						<td><c:out value="${user.profile.lastName}" /></td>
						<td><c:out value="${user.profile.country}" /></td>
						<td><c:out value="${user.profile.skill}" /></td>
						<td><a href="edituserform/<c:out value="${user.id}"/>"
							class="btn btn-warning">Edit</a> <a
							href="deleteuser/<c:out value="${user.id}"/>"
							class="btn btn-danger">Delete</a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<%@include file="footer.jsp"%>