<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<div class="py-4">
	<div class="container">
		<div class="row">
			<main class="col col-12">
				<div class="box shadow-sm rounded bg-white mb-3 osahan-chat">
					<h5 class="p-3 border-bottom mb-0">Messaging</h5>
					<div class="row m-0">
						<div class="border-right col-lg-5 col-xl-4 px-0">
							<div class="osahan-chat-left">
								<div
									class="position-relative icon-form-control p-3 border-bottom">
									<i class="feather-search position-absolute"></i> <input
										placeholder="Search messages" type="text" class="form-control">
								</div>
								<div class="osahan-chat-list">
									<c:forEach items="${list}" var="user">
										<a href="message?id=${user.id}"
											class="p-3 d-flex align-items-center border-bottom  overflow-hidden text-decoration-none">
											<div class="dropdown-list-image mr-3">
												<img class="rounded-circle" src="img/${user.profile.photoProfile }" alt="" width="48px">
											</div>
											<div class="font-weight-bold mr-1 overflow-hidden">
												<div class="text-truncate">${user.profile.firstName}
													${user.profile.lastName}</div>
												<div
													class="small text-truncate overflow-hidden text-black-50">
													<i class="feather-check text-primary"></i> Pellentesque
													semper ex diam,
												</div>
											</div>
										</a>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="col-lg-7 col-xl-8 px-0 d-flex flex-column">
							<div
								class="p-3 d-flex align-items-center  border-bottom osahan-post-header">
								<div class="font-weight-bold mr-1 overflow-hidden">
									<div class="text-truncate">name</div>
									<div class="small text-truncate overflow-hidden text-black-50">Askbootstap.com
										- Become a Product Manager with super power</div>
								</div>
							</div>
							<div
								class="osahan-chat-box p-3 border-top border-bottom bg-light "
								style="height: 55vh">
								<c:forEach items="${msg}" var="msg">
									<c:choose>
										<c:when test="${msg.fromUser.id == fromId }">
											<div class="d-flex flex-row align-items-center osahan-post-header">
												<div class="dropdown-list-image mr-3 mb-auto">
													<img class="rounded-circle"  src="img/${msg.fromUser.profile.photoProfile}" alt="" width="48px">
												</div>
												<div class="mr-1 me-5">
													<div class="text-truncate h6 mb-3">${msg.fromUser.profile.firstName}</div>
													<p>${msg.message}</p>
												</div>
												<span class="ml-auto mb-auto">
													<div class="text-right text-muted pt-1 small text-danger">${msg.sendOn }</div>
												</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="d-flex flex-row-reverse align-items-center osahan-post-header">
												<div class="dropdown-list-image mr-3 mb-auto ">
													<img class="rounded-circle" src="img/${msg.fromUser.profile.photoProfile}" alt="" width="48px">
												</div>
												<div class="mr-1 ms-5">
													<div class="text-truncate text-end h6 mb-3">${msg.fromUser.profile.firstName}</div>
													<p>${msg.message}</p>
												</div>
												<span class="ml-auto mb-auto">
													<div class="text-right text-muted pt-1 small">${msg.sendOn }</div>
												</span>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>

							</div>
							<div class="w-100 border-top align-self-end">
								<form class="job-search p-3" action="sendMessage" method="post">
									<div class="input-group input-group-sm">
										<input name="toUser.id" value="${fromId}">
										<input class="form-control" placeholder="write some message"
											name="message" />
										<div class="input-group-text">
											<button class="btn" type="submit">send</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
</div>

<%@include file="footer.jsp"%>