<%@include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div class="p-4">
		<div class="container">
			<div class="row px-5 mx-5">
				<main
					class="col col-xl-6 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-12">
					<div
						class="box shadow-sm border rounded bg-white mb-3 osahan-share-post">
						<ul
							class="nav nav-pill nav-justified border-bottom osahan-line-tab"
							id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true"><i
									class="feather-edit"></i> Share an update</a></li>
							<li class="nav-item"><a class="nav-link" id="profile-tab"
								data-toggle="tab" href="#profile" role="tab"
								aria-controls="profile" aria-selected="false"><i
									class="feather-image"></i> Upload a photo</a></li>
							<li class="nav-item"><a class="nav-link" id="contact-tab"
								data-toggle="tab" href="#contact" role="tab"
								aria-controls="contact" aria-selected="false"><i
									class="feather-clipboard"></i> Write an article</a></li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="home" role="tabpanel"
								aria-labelledby="home-tab">
								<div class="p-3 d-flex align-items-center w-100" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="img/user.png" alt="" />
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="w-100">
										<textarea placeholder="Write your thoughts..."
											class="form-control border-0 p-0 shadow-none" rows="1"></textarea>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="profile" role="tabpanel"
								aria-labelledby="profile-tab">
								<div class="p-3 w-100">
									<textarea placeholder="Write your thoughts..."
										class="form-control border-0 p-0 shadow-none" rows="3"></textarea>
								</div>
							</div>
							<div class="tab-pane fade" id="contact" role="tabpanel"
								aria-labelledby="contact-tab">
								<div class="p-3 w-100">
									<textarea placeholder="Write an article..."
										class="form-control border-0 p-0 shadow-none" rows="3"></textarea>
								</div>
							</div>
						</div>
						<div class="border-top p-3 d-flex align-items-center">
							<div class="mr-auto">
								<a href="#" class="text-link small"><i
									class="feather-map-pin"></i> Add Location</a>
							</div>
							<div class="flex-shrink-1">
								<button type="button" class="btn btn-light btn-sm">Preview</button>
								<button type="button" class="btn btn-primary btn-sm">Post
									Status</button>
							</div>
						</div>
					</div>
					<c:forEach items="${thread}" var="thread">
					<div class="box shadow-sm border rounded bg-white mb-3 osahan-post">
						<div
							class="p-3 d-flex justify-content-between border-bottom osahan-post-header">
							<div class="d-flex">
								<img class="rounded-circle" src="img/user1.svg"
									width="48px" alt="" />
								<div class="status-indicator bg-success"></div>
								<div class="font-weight-bold">
									<div class="text-truncate">${thread.publisher.profile.firstName} ${thread.publisher.profile.lastName}</div>
									<div class="small text-gray-500">${thread.title }</div>
								</div>
							</div>
							<span class="ml-auto small">${thread.publishDate}</span>
						</div>
						<div class="p-3 border-bottom osahan-post-body">
							<p class="mb-0">
								${thread.description}
							</p>
						</div>
						<div class="p-3 border-bottom osahan-post-footer">
							<img alt="" src="img/${thread.content}" width="445px">
						</div>
						<div class="p-3">
							<button type="button" class="btn btn-outline-primary btn-sm mr-1">Awesome!!</button>
							<button type="button" class="btn btn-light btn-sm mr-1">
								${thread.likeCount}üòç</button>
							<button type="button"
								class="btn btn-outline-secondary btn-sm mr-1">Whats it
								about?</button>
							<button type="button"
								class="btn btn-outline-secondary btn-sm mr-1">Oooo
								Great Wow</button>
						</div>
					</div>
					</c:forEach>
				</main>
				<aside
					class="col col-xl-3 order-xl-1 col-lg-6 order-lg-2 col-md-6 col-sm-6 col-12">
					<div
						class="box mb-3 shadow-sm border rounded bg-white profile-box text-center">
						<div class="py-4 px-3 border-bottom">
							<img src="img/user1.svg" width="130px"
								class="img-fluid mt-2 rounded-circle" alt="Responsive image" />
							<h5 class="font-weight-bold text-dark mb-1 mt-4">${currentUser.profile.firstName} ${currentUser.profile.lastName}<br>${online}</h5>
							<p class="mb-0 text-muted">${currentUser.profile.skill}</p>
						</div>
						<div class="d-flex">
							<div class="col-6 border-end p-3">
								<h6 class="font-weight-bold text-dark mb-1">358</h6>
								<p class="mb-0 text-black-50 small">Connections</p>
							</div>
							<div class="col-6 p-3">
								<h6 class="font-weight-bold text-dark mb-1">85</h6>
								<p class="mb-0 text-black-50 small">Views</p>
							</div>
						</div>
						<div class="overflow-hidden border-top">
							<a class="fw-bold p-3 d-block text-decoration-none"
								href="profile"> View Profile </a>
						</div>
					</div>
					<div
						class="box mb-3 shadow-sm rounded bg-white view-box overflow-hidden">
						<div class="box-title border-bottom p-3">
							<h6 class="m-0">Profile Views</h6>
						</div>
						<div class="d-flex text-center">
							<div class="col-6 border-end py-4 px-2">
								<h5 class="font-weight-bold text-info mb-1">
									08 <i class="feather-bar-chart-2"></i>
								</h5>
								<p class="mb-0 text-black-50 small">last 5 days</p>
							</div>
							<div class="col-6 py-4 px-2">
								<h5 class="font-weight-bold text-success mb-1">
									+ 43% <i class="feather-bar-chart"></i>
								</h5>
								<p class="mb-0 text-black-50 small">Since last week</p>
							</div>
						</div>
			
					</div>
					<div
						class="box shadow-sm mb-3 rounded bg-white ads-box text-center">
						<img src="img/hero.jpg" class="img-fluid" alt="Responsive image" />
						<div class="p-3 border-bottom">
							<h6 class="font-weight-bold text-dark">Osahan Solutions</h6>
							<p class="mb-0 text-muted">Looking for talent?</p>
						</div>
						<div class="p-3">
							<button type="button" class="btn btn-outline-primary pl-4 pr-4">POST
								A JOB</button>
						</div>
					</div>
				</aside>
				<aside
					class="col col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-6 col-12">
					<div class="box shadow-sm border rounded bg-white mb-3">
						<div class="box-title border-bottom p-3">
							<h6 class="m-0">People you might know</h6>
						</div>
						<div class="box-body p-3">

							<c:forEach items="${list}" var="user">
								<div
									class="d-flex justify-content-between osahan-post-header mb-3 people-list">
									<div class="d-flex">
										<img class="rounded-circle" src="img/user1.svg"
											width="48px" alt="" alt="" />
										<div class="status-indicator bg-success"></div>
										<div class="font-weight-bold mr-2">
											<div class="text-truncate">${user.profile.firstName}
												${user.profile.lastName}</div>
											<div class="small text-gray-500">${user.profile.country}|
												${user.profile.skill}</div>
										</div>
									</div>
									<span class="ml-auto"><button type="button"
											class="btn btn-light btn-sm">
											<i class="bi bi-person-plus-fill"></i>
										</button> </span>
								</div>

							</c:forEach>

						</div>
					</div>
					<div class="box shadow-sm border rounded bg-white mb-3">
						<div class="box-title border-bottom p-3">
							<h6 class="m-0">Jobs</h6>
						</div>
						<div class="box-body p-3">
							<a href="job-profile.html">
								<div class="shadow-sm border rounded bg-white job-item mb-3">
									<div class="d-flex align-items-center p-3 job-item-header">
										<div class="overflow-hidden mr-2">
											<h6 class="font-weight-bold text-dark mb-0 text-truncate">Product
												Director</h6>
											<div class="text-truncate text-primary">Spotify Inc.</div>
											<div class="small text-gray-500">
												<i class="feather-map-pin"></i> India, Punjab
											</div>
										</div>
										<img class="img-fluid ml-auto" src="img/l3.png" alt="" />
									</div>
									<div
										class="d-flex align-items-center p-3 border-top border-bottom job-item-body">
										<div class="overlap-rounded-circle">
											<img class="rounded-circle shadow-sm" data-toggle="tooltip"
												data-placement="top" title="" src="img/p9.png" alt=""
												data-original-title="Sophia Lee" /> <img
												class="rounded-circle shadow-sm" data-toggle="tooltip"
												data-placement="top" title="" src="img/p10.png" alt=""
												data-original-title="John Doe" /> <img
												class="rounded-circle shadow-sm" data-toggle="tooltip"
												data-placement="top" title="" src="img/p11.png" alt=""
												data-original-title="Julia Cox" /> <img
												class="rounded-circle shadow-sm" data-toggle="tooltip"
												data-placement="top" title="" src="img/p12.png" alt=""
												data-original-title="Robert Cook" />
										</div>
										<span class="font-weight-bold text-muted">18
											connections</span>
									</div>
									<div class="p-3 job-item-footer">
										<small class="text-gray-500"><i class="feather-clock"></i>
											Posted 3 Days ago</small>
									</div>
								</div>
							</a> <a href="job-profile.html">
								<div class="shadow-sm border rounded bg-white job-item">
									<div class="d-flex align-items-center p-3 job-item-header">
										<div class="overflow-hidden mr-2">
											<h6 class="font-weight-bold text-dark mb-0 text-truncate">.NET
												Developer</h6>
											<div class="text-truncate text-primary">Invision</div>
											<div class="small text-gray-500">
												<i class="feather-map-pin"></i> London, UK
											</div>
										</div>
										<img class="img-fluid ml-auto" src="img/l4.png" alt="" />
									</div>
									<div
										class="d-flex align-items-center p-3 border-top border-bottom job-item-body">
										<div class="overlap-rounded-circle">
											<img class="rounded-circle shadow-sm" data-toggle="tooltip"
												data-placement="top" title="" src="img/p13.png" alt=""
												data-original-title="Sophia Lee" /> <img
												class="rounded-circle shadow-sm" data-toggle="tooltip"
												data-placement="top" title="" src="img/p1.png" alt=""
												data-original-title="John Doe" /> <img
												class="rounded-circle shadow-sm" data-toggle="tooltip"
												data-placement="top" title="" src="img/p3.png" alt=""
												data-original-title="Robert Cook" />
										</div>
										<span class="font-weight-bold text-muted">18
											connections</span>
									</div>
									<div class="p-3 job-item-footer">
										<small class="text-gray-500"><i class="feather-clock"></i>
											Posted 3 Days ago</small>
									</div>
								</div>
							</a>
						</div>
					</div>

				</aside>
			</div>
		</div>
	</div>
</div>
<%@include file="footer.jsp"%>
