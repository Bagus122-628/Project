<%@include file="header.jsp"%>
<div class="container m-auto" style="width: 25rem;">
	<div class="card row shadow">
		<div class="card-body  ">
			<h3 class="card-title text-center">Reset Password</h3>
			<form action="password-change" method="post">
				<br>
				<div class="form-group">
					<label for="password">password</label> <input id="password"
						name="password" class="form-control" />
				</div>
				<div class="form-group">
					<label for="password1">confirm password</label> <input
						id="password1" name="password1" class="form-control" />
				</div>
				<hr>
				<div class="form-group mt-2 ">
					<input type="submit" value="verify" class="btn btn-primary col-12">
					<br>
				</div>
			</form>
		</div>
	</div>
</div>
<%@include file="footer.jsp"%>
