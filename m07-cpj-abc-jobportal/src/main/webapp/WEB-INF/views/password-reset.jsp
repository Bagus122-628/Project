<%@include file="header.jsp"%>
<div class="container m-auto" style="width: 25rem;">
	<div class="card row shadow">
		<div class="card-body  ">
			<h3 class="card-title text-center">Confirmation email</h3>
			<form action="password-reset-check">
				<br>
				<div class="form-group col-12">
					<label for="email">email</label> <input name="email" id="email"
						class="form-control" />
				</div>
				<hr>
				<div class="form-group mt-2 ">
					<input type="submit" value="login" class="btn btn-primary col-12">
					<br>
				</div>
			</form>
		</div>
	</div>
</div>
<%@include file="footer.jsp"%>
