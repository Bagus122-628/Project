<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@include file="header.jsp"%>
<div class="container m-auto" style="width: 25rem;">
	<div class="card row shadow">
		<div class="card-body">
			<h5 class="card-title text-center"> upload thread</h5>
			<f:form modelAttribute="thread" action="addThread" method="post">
				<div class="form-group">
					<f:label path="title">title</f:label>
					<f:input path="title" class="form-control" />
				</div>
				<div class="form-group">
					<f:label path="description">description</f:label>
					<f:input path="description" class="form-control" />
				</div>
				<div class="form-group">
					<f:label path="content">content</f:label>
					<f:input path="content" class="form-control" />
				</div>
				<br>
				<div class="form-group mt-2 ">
					<input type="submit" value="update "
						class="btn btn-warning col-12">
				</div>
			</f:form>
		</div>
	</div>
</div>
<%@include file="footer.jsp"%>