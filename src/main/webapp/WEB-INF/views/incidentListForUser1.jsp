<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Incident Reports</title>

<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600;700&display=swap" rel="stylesheet">

<!-- Icons & CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">

<style>
	/* ============================================
	   ORIGINAL STYLES (kept exactly as is)
	   ============================================ */
	.hero-section::before {
	    content: "";
	    position: absolute;
	    top: 0; left: 0;
	    width: 100%;
	    height: 100%;
		background: rgba(180, 140, 220, 0.25);
	    z-index: 1;
	}

	.hero-section .container {
	    position: relative;
	    z-index: 2;
	    padding-top: 100px;
	}

	.hero-section h1 {
	    font-size: 2.8rem;
	    font-weight: 700;
	    margin-bottom: 20px;
	     margin-top: 80px; 
	    font-family: 'Playfair Display', serif;
	    color: #fff;
	}

	.hero-section p {
	    font-size: 1.2rem;
	    color: #f8f9fa;
	    margin-bottom: 35px;
	    max-width: 650px;
	    margin-left: auto;
	    margin-right: auto;
	}

	.hero-section a.btn-primary {
	    background-color: #e6b800;
	    border-color: #e6b800;
	    transition: 0.3s;
	}

	.hero-section a.btn-primary:hover {
	    background-color: #f1c232;
	    border-color: #f1c232;
	}

	.hero-section a.btn-outline-light:hover {
	    background-color: #fff;
	    color: #e6b800 !important;
	}

	/* 🟣 Services-style dashboard cards */
	.dashboard-card img {
	  width: 100%;
	  height: 200px;
	  object-fit: cover;
	  border-radius: 8px;
	}

	.dashboard-card {
	  background: #fff;
	  padding: 20px;
	  border-radius: 12px;
	  text-align: center;
	  transition: 0.3s;
	  box-shadow: 0 8px 20px rgba(0,0,0,0.08);
	}

	.dashboard-card:hover {
	  transform: translateY(-5px);
	  box-shadow: 0 12px 25px rgba(0,0,0,0.12);
	}

	.dashboard-card h4 { font-size: 1.25rem; margin: 15px 0; }
	.dashboard-card p { font-size: 0.95rem; color: #555; }
	.dashboard-card a.btn { margin-top: 10px; }

	/* ============================================
	   🚀 ADDITIONAL ENHANCEMENTS (no existing rules changed)
	   ============================================ */

	/* 1. Smooth fade-in animation for hero content */
	.hero-section h1 {
		animation: fadeInUp 0.8s ease-out forwards;
	}
	.hero-section p {
		animation: fadeInUp 0.8s ease-out 0.15s forwards;
		opacity: 0;
		animation-fill-mode: forwards;
	}
	.hero-section .btn-primary,
	.hero-section .btn-outline-light {
		animation: fadeInUp 0.8s ease-out 0.3s forwards;
		opacity: 0;
		animation-fill-mode: forwards;
	}
	@keyframes fadeInUp {
		from {
			opacity: 0;
			transform: translateY(30px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}

	/* 2. Button hover lift + enhanced shadow (preserves original background change) */
	.hero-section a.btn-primary,
	.hero-section a.btn-outline-light {
		transition: transform 0.3s ease, box-shadow 0.3s ease;
		display: inline-block;
	}
	.hero-section a.btn-primary:hover,
	.hero-section a.btn-outline-light:hover {
		transform: translateY(-3px);
		box-shadow: 0 8px 20px rgba(0,0,0,0.2);
	}

	/* 3. Dashboard card image zoom on hover (adds to existing card lift) */
	.dashboard-card img {
		transition: transform 0.4s ease;
	}
	.dashboard-card:hover img {
		transform: scale(1.03);
	}

	/* 4. Card inner content hover effect – subtle color shift */
	.dashboard-card h4 {
		transition: color 0.2s;
	}
	.dashboard-card:hover h4 {
		color: #6a0dad;
	}

	/* 5. Focus outlines for accessibility (keyboard navigation) */
	.hero-section a:focus-visible,
	.dashboard-card a.btn:focus-visible {
		outline: 3px solid #ffd700;
		outline-offset: 3px;
		border-radius: 6px;
	}

	/* 6. Custom scrollbar (golden/purple theme) */
	::-webkit-scrollbar {
		width: 8px;
	}
	::-webkit-scrollbar-track {
		background: #f0f0f0;
		border-radius: 10px;
	}
	::-webkit-scrollbar-thumb {
		background: #6a0dad;
		border-radius: 10px;
	}
	::-webkit-scrollbar-thumb:hover {
		background: #e6b800;
	}

	/* 7. Responsive refinements (preserves original breakpoints) */
	@media (max-width: 768px) {
		.hero-section h1 {
			font-size: 2rem;
			margin-top: 60px;
		}
		.hero-section p {
			font-size: 1rem;
			padding: 0 15px;
		}
		.dashboard-card img {
			height: 160px;
		}
		.dashboard-card {
			padding: 15px;
		}
	}

	/* 8. Loading skeleton ready (optional – does nothing by default) */
	@keyframes shimmer {
		0% { background-position: -200% 0; }
		100% { background-position: 200% 0; }
	}
	.dashboard-card.skeleton {
		background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
		background-size: 200% 100%;
		animation: shimmer 1.5s infinite;
		pointer-events: none;
	}
</style>
</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="header d-flex align-items-center sticky-top">
  <div class="container-fluid container-xl d-flex align-items-center">
    <a href="${pageContext.request.contextPath}/users/dashboard" class="logo me-auto"><h1>FightDFire</h1></a>
    </div>
</header>
<!-- ======= Hero Section for Incident & Safety Updates ======= -->
<section class="hero-wrap" 
         style="background-image: url('${pageContext.request.contextPath}/beauty/images/bg_1.jpg'); height: 60vh; position:relative; background-size: cover; background-position: center;" 
         data-stellar-background-ratio="0.5">
 

  <div class="container h-100">
    <div class="row h-100 no-gutters align-items-center justify-content-center text-center">
      <div class="col-md-10 text-white">

        <!-- Icon -->
        <div class="icon mb-3">
          <span class="flaticon-lotus" style="font-size:3rem; color:#fff;"></span>
        </div>

        <!-- Headings -->
        <h1 class="mb-2">Incident &amp; Safety Updates</h1>
        <h2 class="mb-3">Stay Informed. Stay Secure.</h2>

        <!-- Description -->
        <div class="row justify-content-center mb-3">
          <div class="col-md-8">
            <p>Track, review, and respond to real-time incident reports across all centers to ensure transparency, safety, and accountability.</p>
          </div>
        </div>

        <!-- Buttons -->
        <div class="d-flex justify-content-center gap-3 flex-wrap">
          <a href="${pageContext.request.contextPath}/incidents/listForUser" 
             class="btn btn-watch-video btn-lg d-flex justify-content-center align-items-center gap-2 mt-auto">View All Reports</a>
          <a href="${pageContext.request.contextPath}/incidents/report" 
             class="btn btn-watch-video btn-lg d-flex justify-content-center align-items-center gap-2 mt-auto">+ Report a New Incident</a>
        </div>

      </div>
    </div>
  </div>
</section>


			  <!-- ======= Reported Incidents Section (Dashboard Style) ======= -->
			  <section class="services section light-background py-5">
			    <div class="container">
			      <div class="text-center mb-5">
			        <h2>Community Reports</h2>
			        <p>Reported Incidents in your area</p>
			      </div>
			      <div class="row g-4">
			        <c:forEach var="incident" items="${incidents}">
			          <div class="col-md-4">
			            <div class="dashboard-card h-100 d-flex flex-column">
			              
			              <!-- Media -->
			              <c:choose>
			                <c:when test='${fn:endsWith(incident.mediaPath, ".jpg") 
			                               or fn:endsWith(incident.mediaPath, ".jpeg") 
			                               or fn:endsWith(incident.mediaPath, ".png")}'>
			                  <img src="${pageContext.request.contextPath}${incident.mediaPath}" 
			                       alt="Incident Image" class="img-fluid">
			                </c:when>
			                <c:when test='${fn:endsWith(incident.mediaPath, ".mp4") 
			                               or fn:endsWith(incident.mediaPath, ".mov")}'>
			                  <video controls class="w-100" style="max-height:220px; object-fit:cover;">
			                    <source src="${pageContext.request.contextPath}${incident.mediaPath}" type="video/mp4">
			                    Your browser does not support the video tag.
			                  </video>
			                </c:when>
			                <c:otherwise>
			                  <img src="${pageContext.request.contextPath}/beauty/images/default.jpg" 
			                       alt="Default Incident" class="img-fluid">
			                </c:otherwise>
			              </c:choose>

			              <!-- Incident Info -->
			              <h4 class="mt-3">Type: ${incident.type}</h4>
			              <p class="mb-1"><strong>Location:</strong> ${incident.location}</p>
			              <p class="mb-1">
			                <strong>Status:</strong> 
			                <span class="badge
			                  <c:choose>
			                    <c:when test='${incident.status eq "PENDING"}'>bg-warning text-dark</c:when>
			                    <c:when test='${incident.status eq "REVIEWED"}'>bg-info text-white</c:when>
			                    <c:when test='${incident.status eq "ACTION_TAKEN"}'>bg-success text-white</c:when>
			                    <c:otherwise>bg-secondary text-white</c:otherwise>
			                  </c:choose>
			                ">
			                  ${incident.status}
			                </span>
			              </p>
			              <p class="text-secondary mb-3" style="min-height:70px;">
			                <strong>Description:</strong> ${incident.description}
			              </p>

			              <!-- View Details Button -->
			              <a href="${pageContext.request.contextPath}${incident.mediaPath}" 
			                 class="btn btn-watch-video btn-lg d-flex justify-content-center align-items-center gap-2 mt-auto">
			                View Details
			              </a>

			            </div>
			          </div>
			        </c:forEach>
			      </div>
			    </div>
			  </section>


	 

	<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	</body>
	</html>
