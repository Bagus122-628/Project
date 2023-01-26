<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@include file="header.jsp"%>
<div>
	<div class="py-4">
		<div class="container">
			<div class="row">

				<main
					class="col col-xl-6 order-xl-2 col-lg-12 order-lg-2 col-md-12 col-sm-12 col-12">
					<div class="box shadow-sm border rounded bg-white mb-3">
						<div class="box-title border-bottom p-3">
							<h6 class="m-0">About You</h6>
						</div>
						<div class="box-body p-3">
							<div class="py-4 px-3 border-bottom">
								<img src="img/${user.profile.photoProfile}" width="48px"
									class="img-fluid mt-2 rounded-circle" alt="Responsive image" />
								<h5 class="font-weight-bold text-dark mb-1 mt-4">${user.profile.firstName}
									${user.profile.lastName}</h5>
								<p class="mb-0 text-muted">${user.profile.skill}</p>
								<h3>Details Submitted!!</h3>

								<table>
									<tr>
										<td>Profile email :</td>
										<td>${user.email}</td>
									</tr>
									<tr>
										<td>first Name:</td>
										<td>${user.profile.firstName}</td>
									</tr>
									<tr>
										<td>last name:</td>
										<td>${user.profile.lastName}</td>
									</tr>
									<tr>
										<td>country:</td>
										<td>${user.profile.country}</td>
									</tr>
								</table>
								<c:if test="${canEdit}">
									<a class="btn btn-warning col-6" href="edituserform/${user.id}">edit</a>
								</c:if>
								<a class="btn btn-primary" href="../addThread">Add thread</a>
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
								<a class="font-weight-bold p-3 d-block" href="logout"> Log
									Out </a>
							</div>
							<p class="mb-0">Find the most qualified people in the most
								unexpected places. Information for applicants to consider when
								applying for local positions. The largest community on the web
								to find and list jobs that aren't restricted by commutes or a
								specific location.</p>
						</div>
					</div>
					

				</main>
				<aside class="col col-xl-3 order-xl-3 col-lg-12 order-lg-3 col-12">
					<div class="box shadow-sm border rounded bg-white mb-3">
						<div class="box-title border-bottom p-3">
							<h6 class="m-0">Who viewed your profile</h6>
						</div>
						<div class="box-body p-3">
							<div
								class="d-flex align-items-center osahan-post-header mb-3 people-list">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle" src="images/p4.png" alt="" />
									<div class="status-indicator bg-success"></div>
								</div>
								<div class="font-weight-bold mr-2">
									<div class="text-truncate">Sophia Lee</div>
									<div class="small text-gray-500">@Harvard</div>
								</div>
								<span class="ml-auto"><button type="button"
										class="btn btn-light btn-sm">Connent</button> </span>
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
										class="btn btn-light btn-sm">Connent</button> </span>
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
										class="btn btn-light btn-sm">Connent</button> </span>
							</div>
							<div
								class="d-flex align-items-center osahan-post-header mb-3 people-list">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle" src="images/p11.png" alt="" />
									<div class="status-indicator bg-success"></div>
								</div>
								<div class="font-weight-bold mr-2">
									<div class="text-truncate">Robert Cook</div>
									<div class="small text-gray-500">@Photography</div>
								</div>
								<span class="ml-auto"><button type="button"
										class="btn btn-light btn-sm">Connent</button> </span>
							</div>
							<div
								class="d-flex align-items-center osahan-post-header people-list">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle" src="images/p12.png" alt="" />
									<div class="status-indicator bg-success"></div>
								</div>
								<div class="font-weight-bold mr-2">
									<div class="text-truncate">Richard Bell</div>
									<div class="small text-gray-500">@Envato</div>
								</div>
								<span class="ml-auto"><button type="button"
										class="btn btn-light btn-sm">Connent</button> </span>
							</div>
						</div>
					</div>
					<div
						class="box shadow-sm mb-3 rounded bg-white ads-box text-center overflow-hidden">
						<img src="images/ads1.png" class="img-fluid"
							alt="Responsive image" />
						<div class="p-3 border-bottom">
							<h6 class="font-weight-bold text-gold">Olink Premium</h6>
							<p class="mb-0 text-muted">Grow &amp; nurture your network</p>
						</div>
						<div class="p-3">
							<button type="button" class="btn btn-outline-gold pl-4 pr-4">ACTIVATE</button>
						</div>
					</div>
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
						<div class="shadow-sm border rounded bg-white job-item mb-3">
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
				</aside>
			</div>
		</div>
	</div>

</div>
<%@include file="footer.jsp"%>