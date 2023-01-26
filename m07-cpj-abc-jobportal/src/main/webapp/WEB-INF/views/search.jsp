<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<div>
	<div class="py-4">
		<div class="container p-4">
			<div class="row px-5 mx-5">
				<main
					class="col col-xl-6 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-12">
					<div
						class="box shadow-sm border rounded bg-white mb-3 osahan-share-post">
						<form class="job-search p-3 border-bottom" action="search">
							<div class="input-group input-group-sm">
								<input class="form-control" placeholder="Search" name="keyword" />
								<div class="input-group-text">
									<button class="btn" type="submit">
										<i class="bi bi-search"></i>
									</button>
								</div>
							</div>
						</form>
						<ul class="nav border-bottom osahan-line-tab" id="myTab"
							role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">Category</a></li>
							<li class="nav-item"><a class="nav-link" id="profile-tab"
								data-toggle="tab" href="#profile" role="tab"
								aria-controls="profile" aria-selected="false">Title</a></li>
							<li class="nav-item"><a class="nav-link" id="contact-tab"
								data-toggle="tab" href="#contact" role="tab"
								aria-controls="contact" aria-selected="false">Location</a></li>
							<li class="nav-item"><a class="nav-link" id="type-tab"
								data-toggle="tab" href="#type" role="tab" aria-controls="type"
								aria-selected="false">Type</a></li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="home" role="tabpanel"
								aria-labelledby="home-tab">
								<div class="p-3 job-tags">
									<button type="button"
										class="btn btn-outline-secondary btn-sm mr-1">All</button>
									<button type="button"
										class="btn btn-outline-secondary btn-sm mr-1">Sales</button>
									<button type="button"
										class="btn btn-outline-primary btn-sm mr-1">Design</button>
									<button type="button"
										class="btn btn-outline-secondary btn-sm mr-1">Products</button>
									<button type="button"
										class="btn btn-outline-secondary btn-sm mr-1">Developer</button>
									<button type="button"
										class="btn btn-outline-secondary btn-sm mr-1">Business
										Analyst</button>
								</div>
								<div class="p-3 border-top">
									<div class="row">
										<c:forEach var="user" items="${userList}">
											<div class="col-md-6">
												<a href="profile/${user.id}">
													<div class="border job-item mb-3">
														<div class="d-flex align-items-center p-3 job-item-header">
															<div class="overflow-hidden mr-2">
																<h6
																	class="font-weight-bold text-dark mb-0 text-truncate">${user.profile.firstName}
																	${user.profile.lastName}</h6>
																<div class="text-truncate text-primary">${user.profile.skill}</div>
																<div class="small text-gray-500">
																	<i class="feather-map-pin"></i>${user.profile.country}</div>
															</div>
															<img class="img-fluid ms-auto" src="img/${user.profile.photoProfile }" width="48px" alt="" />
														</div>
														<div
															class="d-flex align-items-center p-3 border-top border-bottom job-item-body">
															<div class="overlap-rounded-circle">
																<img class="rounded-circle shadow-sm"
																	data-toggle="tooltip" data-placement="top" title=""
																	src="images/p1.png" alt=""
																	data-original-title="Sophia Lee" /> <img
																	class="rounded-circle shadow-sm" data-toggle="tooltip"
																	data-placement="top" title="" src="images/p2.png"
																	alt="" data-original-title="John Doe" /> <img
																	class="rounded-circle shadow-sm" data-toggle="tooltip"
																	data-placement="top" title="" src="images/p3.png"
																	alt="" data-original-title="Julia Cox" /> <img
																	class="rounded-circle shadow-sm" data-toggle="tooltip"
																	data-placement="top" title="" src="images/p4.png"
																	alt="" data-original-title="Robert Cook" /> <img
																	class="rounded-circle shadow-sm" data-toggle="tooltip"
																	data-placement="top" title="" src="images/p5.png"
																	alt="" data-original-title="Sophia Lee" />
															</div>
															<span class="font-weight-bold text-primary">18
																connections</span>
														</div>

													</div>
												</a>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</main>
				<aside
					class="col col-xl-3 order-xl-1 col-lg-6 order-lg-2 col-md-6 col-sm-6 col-12">
					<div
						class="box shadow-sm mb-3 rounded bg-white ads-box text-center overflow-hidden">
						<img src="img/vitamin-a.jpg" class="img-fluid"
							alt="Responsive image" />
						<div class="p-3 border-bottom">
							<h6 class="font-weight-bold text-dark">Osahan Solutions</h6>
							<p class="mb-0 text-muted">Looking for talent?</p>
						</div>
						<div class="p-3">
							<button type="button" class="btn btn-primary pl-4 pr-4">POST
								A JOB</button>
						</div>
					</div>
					<div class="shadow-sm rounded bg-white job-item-2 p-3 mb-3">
						<div class="media">
							<div class="u-avatar mr-3">
								<img class="img-fluid" src="images/l3.png"
									alt="Image Description" />
							</div>
							<div class="media-body">
								<div class="mb-3">
									<h6 class="font-weight-bold mb-0">
										<a class="text-dark" href="job-profile.html">C# Developer</a>
									</h6>
									<a class="d-inline-block small pt-1" href="job-profile.html">
										<span class="text-warning"> <span class="feather-star"></span>
											<span class="feather-star"></span> <span class="feather-star"></span>
											<span class="feather-star text-gray-500"></span> <span
											class="feather-star text-gray-500"></span>
									</span> <span class="text-dark font-weight-bold ml-2">3.74</span> <span
										class="text-muted">(567 reviews)</span>
									</a>
								</div>
								<div class="d-flex align-items-center">
									<div class="border-right pr-3 mr-3">
										<a class="text-secondary small" href="job-profile.html">Salaries</a>
									</div>
									<a class="small" href="job-profile.html">Open jobs</a>
								</div>
							</div>
						</div>
					</div>
					<div class="shadow-sm rounded bg-white job-item-2 p-3 mb-3">
						<div class="media">
							<div class="u-avatar mr-3">
								<img class="img-fluid" src="images/l2.png"
									alt="Image Description" />
							</div>
							<div class="media-body">
								<div class="mb-3">
									<h6 class="font-weight-bold mb-0">
										<a class="text-dark" href="job-profile.html">Junior UX
											Designer</a>
									</h6>
									<a class="d-inline-block small pt-1" href="job-profile.html">
										<span class="text-warning"> <span class="feather-star"></span>
											<span class="feather-star"></span> <span class="feather-star"></span>
											<span class="feather-star"></span> <span class="feather-star"></span>
									</span> <span class="text-dark font-weight-bold ml-2">3.74</span> <span
										class="text-muted">(567 reviews)</span>
									</a>
								</div>
								<div class="d-flex align-items-center">
									<div class="border-right pr-3 mr-3">
										<a class="text-secondary small" href="job-profile.html">Salaries</a>
									</div>
									<a class="small" href="job-profile.html">Open jobs</a>
								</div>
							</div>
						</div>
					</div>
				</aside>
				<aside
					class="col col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-6 col-12">
					<div class="pb-3">
						<h6 class="font-weight-bold text-dark mb-1">Because you
							viewed</h6>
						<p class="mb-0 text-muted">Designer at Google?</p>
					</div>
					<a href="job-profile.html">
						<div class="shadow-sm rounded bg-white job-item mb-3">
							<div class="d-flex align-items-center p-3 job-item-header">
								<div class="overflow-hidden mr-2">
									<h6 class="font-weight-bold text-dark mb-0 text-truncate">Product
										Director</h6>
									<div class="text-truncate text-primary">Spotify Inc.</div>
									<div class="small text-gray-500">
										<i class="feather-map-pin"></i> India, Punjab
									</div>
								</div>
								<img class="img-fluid ml-auto" src="images/l3.png" alt="" />
							</div>
							<div
								class="d-flex align-items-center p-3 border-top border-bottom job-item-body">
								<div class="overlap-rounded-circle">
									<img class="rounded-circle shadow-sm" data-toggle="tooltip"
										data-placement="top" title="" src="images/p9.png" alt=""
										data-original-title="Sophia Lee" /> <img
										class="rounded-circle shadow-sm" data-toggle="tooltip"
										data-placement="top" title="" src="images/p10.png" alt=""
										data-original-title="John Doe" /> <img
										class="rounded-circle shadow-sm" data-toggle="tooltip"
										data-placement="top" title="" src="images/p11.png" alt=""
										data-original-title="Julia Cox" /> <img
										class="rounded-circle shadow-sm" data-toggle="tooltip"
										data-placement="top" title="" src="images/p10.png" alt=""
										data-original-title="John Doe" /> <img
										class="rounded-circle shadow-sm" data-toggle="tooltip"
										data-placement="top" title="" src="images/p11.png" alt=""
										data-original-title="Julia Cox" /> <img
										class="rounded-circle shadow-sm" data-toggle="tooltip"
										data-placement="top" title="" src="images/p12.png" alt=""
										data-original-title="Robert Cook" />
								</div>
								<span class="font-weight-bold text-muted">18 connections</span>
							</div>
							<div class="p-3 job-item-footer">
								<small class="text-gray-500"><i class="feather-clock"></i>
									Posted 3 Days ago</small>
							</div>
						</div>
					</a> <a href="job-profile.html">
						<div class="shadow-sm rounded bg-white job-item mb-3">
							<div class="d-flex align-items-center p-3 job-item-header">
								<div class="overflow-hidden mr-2">
									<h6 class="font-weight-bold text-dark mb-0 text-truncate">.NET
										Developer</h6>
									<div class="text-truncate text-primary">Invision</div>
									<div class="small text-gray-500">
										<i class="feather-map-pin"></i> London, UK
									</div>
								</div>
								<img class="img-fluid ml-auto" src="images/l4.png" alt="" />
							</div>
							<div
								class="d-flex align-items-center p-3 border-top border-bottom job-item-body">
								<div class="overlap-rounded-circle">
									<img class="rounded-circle shadow-sm" data-toggle="tooltip"
										data-placement="top" title="" src="images/p13.png" alt=""
										data-original-title="Sophia Lee" /> <img
										class="rounded-circle shadow-sm" data-toggle="tooltip"
										data-placement="top" title="" src="images/p1.png" alt=""
										data-original-title="John Doe" /> <img
										class="rounded-circle shadow-sm" data-toggle="tooltip"
										data-placement="top" title="" src="images/p2.png" alt=""
										data-original-title="Julia Cox" /> <img
										class="rounded-circle shadow-sm" data-toggle="tooltip"
										data-placement="top" title="" src="images/p3.png" alt=""
										data-original-title="Robert Cook" />
								</div>
								<span class="font-weight-bold text-muted">18 connections</span>
							</div>
							<div class="p-3 job-item-footer">
								<small class="text-gray-500"><i class="feather-clock"></i>
									Posted 3 Days ago</small>
							</div>
						</div>
					</a>
					<div class="box shadow-sm border rounded bg-white mb-3">
						<div class="box-title border-bottom p-3">
							<h6 class="m-0">People you might know</h6>
						</div>
						<div class="box-body p-3">
							<div
								class="d-flex align-items-center osahan-post-header mb-3 people-list">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle" src="images/p8.png" alt="" />
									<div class="status-indicator bg-success"></div>
								</div>
								<div class="font-weight-bold mr-2">
									<div class="text-truncate">Sophia Lee</div>
									<div class="small text-gray-500">Student at Harvard</div>
								</div>
								<span class="ml-auto"><button type="button"
										class="btn btn-outline-primary btn-sm">
										<i class="feather-user-plus"></i>
									</button> </span>
							</div>
							<div
								class="d-flex align-items-center osahan-post-header mb-3 people-list">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle" src="images/p9.png" alt="" />
									<div class="status-indicator bg-success"></div>
								</div>
								<div class="font-weight-bold mr-2">
									<div class="text-truncate">John Doe</div>
									<div class="small text-gray-500">Traveler</div>
								</div>
								<span class="ml-auto"><button type="button"
										class="btn btn-outline-primary btn-sm">
										<i class="feather-user-plus"></i>
									</button> </span>
							</div>
							<div
								class="d-flex align-items-center osahan-post-header mb-3 people-list">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle" src="images/p10.png" alt="" />
									<div class="status-indicator bg-success"></div>
								</div>
								<div class="font-weight-bold mr-2">
									<div class="text-truncate">Julia Cox</div>
									<div class="small text-gray-500">Art Designer</div>
								</div>
								<span class="ml-auto"><button type="button"
										class="btn btn-outline-primary btn-sm">
										<i class="feather-user-plus"></i>
									</button> </span>
							</div>
							<div
								class="d-flex align-items-center osahan-post-header mb-3 people-list">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle" src="images/p11.png" alt="" />
									<div class="status-indicator bg-success"></div>
								</div>
								<div class="font-weight-bold mr-2">
									<div class="text-truncate">Robert Cook</div>
									<div class="small text-gray-500">Photographer at
										Photography</div>
								</div>
								<span class="ml-auto"><button type="button"
										class="btn btn-outline-primary btn-sm">
										<i class="feather-user-plus"></i>
									</button> </span>
							</div>
							<div
								class="d-flex align-items-center osahan-post-header people-list">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle" src="images/p12.png" alt="" />
									<div class="status-indicator bg-success"></div>
								</div>
								<div class="font-weight-bold mr-2">
									<div class="text-truncate">Richard Bell</div>
									<div class="small text-gray-500">Graphic Designer at
										Envato</div>
								</div>
								<span class="ml-auto"><button type="button"
										class="btn btn-outline-primary btn-sm">
										<i class="feather-user-plus"></i>
									</button> </span>
							</div>
						</div>
					</div>
				</aside>
			</div>
		</div>
	</div>
</div>

<%@include file="footer.jsp"%>