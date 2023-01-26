<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@include file="header.jsp"%>
<div class="container m-auto" style="width: 25rem;">
	<div class="card row shadow">
		<div class="card-body">
			<h3 class="card-title text-center">Registration</h3>
			<f:form modelAttribute="user" action="add" method="post">
				<div class="form-group">
					<f:label path="profile.firstName">first name</f:label>
					<f:input path="profile.firstName" class="form-control" />
				</div>
				<div class="form-group">
					<f:label path="profile.lastName">last name</f:label>
					<f:input path="profile.lastName" class="form-control" />
				</div>
				<div class="form-group">
					<f:label path="profile.country">country</f:label>
					<f:input path="profile.country" class="form-control" />
				</div>
				<div class="form-group">
					<f:label path="profile.skill">skill</f:label>
					<f:input path="profile.skill" class="form-control" />
				</div>
				<div class="form-group">
					<f:label path="email">Email</f:label>
					<f:input path="email" class="form-control" type="email"/>
				</div>
				<div class="form-group">
					<f:label path="password">password</f:label>
					<f:input path="password" class="form-control" type="password"/>
				</div>
				<br>
				<div class="form-group mt-2 ">
					<input type="submit" value="submit" class="btn btn-primary col-12 ">
				</div>
			</f:form>
		</div>
	</div>
</div>
<%@include file="footer.jsp"%>