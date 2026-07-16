<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>User Profile</title>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600;700&display=swap"
	rel="stylesheet">

<!-- Icons & CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link
	href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/main.css"
	rel="stylesheet">

<!-- 🎨 Custom CSS -->
<style>
/* 🌟 User Profile Split Section CSS */
.user-split-section {
	background-color: #f8f9fa;
	padding: 0;
	border-radius: 20px;
	overflow: hidden;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
	margin-bottom: 30px;
}

.user-bg-left {
	background: linear-gradient(135deg, rgba(30, 27, 75, 0.05) 0%, rgba(244, 63, 94, 0.05) 100%);
	border-right: 1px solid rgba(0, 0, 0, 0.05);
	min-height: 400px;
}

.user-details-side {
	background-color: #ffffff;
}

.user-details {
	width: 100%;
	max-width: 600px;
	margin: 0 auto;
}

.user-details h2 {
	font-weight: 800;
	color: #1e1b4b;
	letter-spacing: -0.5px;
}

.user-details ul li {
	font-size: 1.1rem;
	color: #4a4a4a;
	padding: 12px 0;
	border-bottom: 1px dashed #e9ecef;
}

.user-details ul li:last-child {
	border-bottom: none;
}

.user-details ul li i {
	width: 25px;
	text-align: center;
	color: #f43f5e;
}

.user-details ul li strong {
	color: #1e1b4b;
	margin-right: 5px;
}

@media ( max-width : 767.98px) {
	.user-bg-left {
		min-height: 250px;
		border-right: none;
		border-bottom: 1px solid rgba(0, 0, 0, 0.05);
	}
	.user-details {
		padding: 2rem !important;
	}
}
</style>
</head>
<body>
    <div id="wrapper">
        <jsp:include page="/WEB-INF/views/fragments/sidebar.jsp" />
        <div id="page-content-wrapper">
            <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

            <div class="container-fluid p-4">
                <div class="d-flex justify-content-end mb-4">
                    <a href="${pageContext.request.contextPath}/marketplace/provider/register" class="btn btn-success fw-bold px-4 py-2" style="border-radius: 50px; box-shadow: 0 4px 15px rgba(32, 201, 151, 0.3);">
                        <i class="bi bi-briefcase-fill me-2"></i> Want to earn? Register to work
                    </a>
                </div>

	<!-- 🌟 User Profile Split Section -->
	<section class="ftco-section user-split-section">
		<div class="container-fluid">
			<div class="row no-gutters align-items-center">
				<div
					class="col-md-6 user-bg-left d-flex justify-content-center align-items-center p-4">
					<img src="${pageContext.request.contextPath}${user.profilePhoto}"
						onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/default-profile.png';"
						alt="User Profile Picture"
						style="width: 120px; height: 120px; border-radius: 50%; object-fit: cover; border: 3px solid #f43f5e; box-shadow: 0 4px 14px rgba(219, 39, 119, 0.35);">
				</div>

				<!-- 📋 Right Side: User Details -->
				<div class="col-md-6 user-details-side d-flex align-items-center">
					<div class="user-details p-5">

						<!-- Header -->
						<div class="heading-section ftcao-animate mb-4">
							<h2 class="mb-2">Hello, ${user.fullName} 👋</h2>

							<!-- 📊 Instagram-style Stats -->
							<div class="d-flex gap-4 my-3 py-2 border-top border-bottom">
								<div class="text-center">
									<h5 class="mb-0 fw-bold">${postsCount != null ? postsCount : 0}</h5>
									<small class="text-muted">Posts</small>
								</div>
								<div class="text-center">
									<h5 class="mb-0 fw-bold">${followersCount != null ? followersCount : 0}</h5>
									<small class="text-muted">Followers</small>
								</div>
								<div class="text-center">
									<h5 class="mb-0 fw-bold">${followingCount != null ? followingCount : 0}</h5>
									<small class="text-muted">Following</small>
								</div>
								<div class="text-center">
									<h5 class="mb-0 fw-bold">${friendsCount != null ? friendsCount : 0}</h5>
									<small class="text-muted">Friends</small>
								</div>
							</div>

							<p class="text-muted">Here’s complete profile overview</p>
							<c:if
								test="${not empty currentUser and currentUser.id ne user.id}">
								<div id="follow-container"
									class="d-flex gap-2 align-items-center">
									<c:choose>
										<c:when test="${isFollowing}">
											<button type="button" class="btn btn-success mt-3 px-4"
												disabled>
												<i class="fas fa-check me-2"></i> Following
											</button>
											<c:if test="${isFriend}">
												<a
													href="${pageContext.request.contextPath}/chat/window/${user.id}"
													class="btn btn-outline-primary mt-3 px-4"> <i
													class="bi bi-chat-dots-fill me-2"></i> Chat
												</a>
											</c:if>
										</c:when>
										<c:when test="${isPending}">
											<button type="button" class="btn btn-warning mt-3 px-4"
												disabled>
												<i class="fas fa-clock me-2"></i> Request Sent
											</button>
										</c:when>
										<c:when test="${hasIncomingRequest}">
											<form
												action="${pageContext.request.contextPath}/users/acceptRequest/${user.id}"
												method="post" style="display: inline;">
												<button type="submit" class="btn btn-success mt-3 px-4">
													<i class="fas fa-check me-2"></i> Accept Request
												</button>
											</form>
											<form
												action="${pageContext.request.contextPath}/users/declineRequest/${user.id}"
												method="post" style="display: inline;">
												<button type="submit"
													class="btn btn-outline-danger mt-3 px-4">
													<i class="fas fa-times me-2"></i> Decline
												</button>
											</form>
										</c:when>
										<c:otherwise>
											<button type="button" id="follow-btn"
												class="btn btn-primary mt-3 px-4"
												onclick="sendFollowRequest(${user.id})">
												<i class="fas fa-user-plus me-2"></i> Follow
											</button>
										</c:otherwise>
									</c:choose>
								</div>
							</c:if>
						</div>

						<!-- Details List -->
						<ul class="list-unstyled ftco-animate">
							<li class="mb-3"><i
								class="fas fa-envelope text-primary me-2"></i> <strong>Email:</strong>
								${user.email}</li>
							<li class="mb-3"><i class="fas fa-phone text-primary me-2"></i>
								<strong>Phone:</strong> ${user.phoneNumber}</li>
							<li class="mb-3"><i class="fas fa-home text-primary me-2"></i>
								<strong>Address:</strong> ${user.homeAddress}</li>
							<li class="mb-3"><i
								class="fas fa-id-badge text-primary me-2"></i> <strong>User
									ID:</strong> ${user.id}</li>
							<li class="mb-3"><i
								class="fas fa-calendar-alt text-primary me-2"></i> <strong>Age:</strong>
								${user.age}</li>
							<li class="mb-3"><i
								class="fas fa-venus-mars text-primary me-2"></i> <strong>Gender:</strong>
								${user.gender}</li>
							<li class="mb-3"><i class="fas fa-file text-primary me-2"></i>
								<strong>ID Document:</strong> <a
								href="${pageContext.request.contextPath}${user.identityDocument}"
								target="_blank" class="text-decoration-none">View</a></li>
						</ul>


					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- 🎥 Profile User Uploaded Videos -->
	<section class="ftco-section">
		<div class="container">

			<div class="row mb-4">
				<div class="col text-center">
					<h3 class="mb-3">Uploaded Videos</h3>
					<p class="text-muted">${user.fullName}'svideos</p>
				</div>
			</div>

			<c:if test="${empty videos}">
				<p class="text-center text-muted">No videos uploaded yet.</p>
			</c:if>

			<div class="row">
				<c:forEach var="video" items="${videos}">
					<div class="col-md-4 col-6 p-1">
						<div class="ratio ratio-1x1 bg-dark"
							style="border-radius: 4px; overflow: hidden; cursor: pointer;">
							<video class="w-100 h-100 object-fit-cover"
								onclick="this.paused ? this.play() : this.pause()">
								<source
									src="${pageContext.request.contextPath}${video.videoPath}"
									type="video/mp4">
							</video>
							<div class="position-absolute top-0 end-0 p-2">
								<c:if
									test="${not empty currentUser and currentUser.id == user.id}">
									<form method="post"
										action="${pageContext.request.contextPath}/video/deleteUpload"
										onsubmit="return confirm('Delete this video?');"
										style="display: inline;">
										<input type="hidden" name="videoId" value="${video.id}">
										<button type="submit"
											class="btn btn-sm btn-danger p-1 opacity-75">
											<i class="bi bi-trash-fill"></i>
										</button>
									</form>
								</c:if>
							</div>
							<div
								class="position-absolute bottom-0 start-0 w-100 p-2 text-white bg-gradient-dark"
								style="background: linear-gradient(transparent, rgba(0, 0, 0, 0.7));">
								<small><i class="bi bi-heart-fill"></i>
									${video.likeCount} • <i class="bi bi-eye-fill"></i>
									${video.viewCount}</small>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
	</section>

            </div> <!-- End container-fluid -->
        </div> <!-- End page-content-wrapper -->
    </div> <!-- End wrapper -->

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/beauty/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/beauty/js/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/beauty/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/beauty/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/beauty/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath}/beauty/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/beauty/js/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/beauty/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/beauty/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/beauty/js/aos.js"></script>
	<script
		src="${pageContext.request.contextPath}/beauty/js/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/beauty/js/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/beauty/js/jquery.timepicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/beauty/js/scrollax.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/beauty/js/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/beauty/js/main.js"></script>

	<script>
					  	function sendFollowRequest(userId) {
					  	    const btn = document.getElementById('follow-btn');
					  	    if (btn) {
					  	        btn.disabled = true;
					  	        btn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i> Sending...';
					  	    }
					  	    fetch('${pageContext.request.contextPath}/users/followAjax/' + userId, {
					  	        method: 'POST',
					  	        headers: {
					  	            'Content-Type': 'application/json'
					  	        }
					  	    })
					  	    .then(response => response.json())
					  	    .then(data => {
					  	        const container = document.getElementById('follow-container');
					  	        if (data.status === 'FOLLOWING') {
					  	            let html = '<button type="button" class="btn btn-success mt-3 px-4" disabled><i class="fas fa-check me-2"></i> Following</button>';
					  	            if (data.isFriend) {
					  	                html += '<a href="${pageContext.request.contextPath}/chat/window/' + userId + '" class="btn btn-outline-primary mt-3 px-4 ms-2"><i class="bi bi-chat-dots-fill me-2"></i> Chat</a>';
					  	            }
					  	            container.innerHTML = html;
					  	        } else if (data.status === 'REQUESTED') {
					  	            container.innerHTML = '<button type="button" class="btn btn-warning mt-3 px-4" disabled><i class="fas fa-clock me-2"></i> Request Sent</button>';
					  	        } else if (data.error === 'LOGIN_REQUIRED') {
					  	            alert('Please login to follow users.');
					  	            window.location.href = '${pageContext.request.contextPath}/login';
					  	        } else {
					  	            alert('Failed to send follow request.');
					  	            if (btn) {
					  	                btn.disabled = false;
					  	                btn.innerHTML = '<i class="fas fa-user-plus me-2"></i> Follow';
					  	            }
					  	        }
					  	    })
					  	    .catch(error => {
					  	        console.error('Error:', error);
					  	        alert('An error occurred. Please try again.');
					  	        if (btn) {
					  	            btn.disabled = false;
					  	            btn.innerHTML = '<i class="fas fa-user-plus me-2"></i> Follow';
					  	        }
					  	    });
					  	}
					  	</script>

</body>
</html>

