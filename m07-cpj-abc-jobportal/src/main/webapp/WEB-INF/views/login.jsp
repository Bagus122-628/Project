<%@include file="header.jsp"%>
<div class="container m-auto" style="width: 25rem;">
	<div class="card row shadow">
		<div class="card-body  ">
			<h3 class="card-title text-center">Login</h3>
			<f:form modelAttribute="user" action="check" method="post">
				<br>
					 
					
			
				<div class="form-group col-12">
					<f:label path="email">email <span class="text-danger">${msg}</span></f:label>
					<f:input path="email" type="email" class="form-control" />
				</div>
				<div class="form-group">
					<f:label path="password">password <span class="text-danger">${psw}</span></f:label>
					<f:input path="password" type="password" class="form-control" />
				</div>
				<hr>
				<div class="form-group mt-2 ">
					<input type="submit" value="login" class="btn btn-primary col-12">
					<br> <a href="password-reset">forget password?</a>
				</div>
			</f:form>
		</div>
	</div>
</div>
<%@include file="footer.jsp"%>
