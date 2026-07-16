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
<link href="${pageContext.request.contextPath}/assets/css/Fight D Fear-theme.css" rel="stylesheet">

<style>
	/* ============================================
	   ROOT VARIABLES (your brand colors)
	   ============================================ */
	:root {
		--primary-purple: #1e1b4b;
		--primary-purple-light: #312e81;
		--primary-coral: #f43f5e;
		--primary-coral-dark: #1e1b4b;
		--primary-teal: #20c997;
		--primary-gold: #ffd700;
		--dark-bg: #0f0f1a;
		--light-bg: #fffcfd;
		--gradient-primary: linear-gradient(135deg, #1e1b4b 0%, #312e81 50%, #f43f5e 100%);
		--gradient-gold: linear-gradient(135deg, #ffd700, #ffb347);
		--shadow-sm: 0 10px 30px rgba(0, 0, 0, 0.08);
		--shadow-md: 0 20px 40px rgba(0, 0, 0, 0.12);
		--shadow-lg: 0 30px 60px rgba(0, 0, 0, 0.15);
		--transition-smooth: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
	}

	html {
		scroll-behavior: smooth;
	}

	/* ============================================
	   HERO SECTION (enhanced)
	   ============================================ */
	.hero-section {
		position: relative;
		overflow: hidden;
	}

	.hero-section::before {
		content: "";
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: linear-gradient(135deg, rgba(123,44,191,0.3), rgba(255,107,107,0.2));
		/* original rgba(180,140,220,0.25) replaced with richer gradient */
		z-index: 1;
		backdrop-filter: blur(2px);
		transition: backdrop-filter 0.5s ease;
	}

	.hero-section:hover::before {
		backdrop-filter: blur(1px);
	}

	/* Floating animated shapes */
	.hero-section::after {
		content: '';
		position: absolute;
		top: 10%;
		right: 5%;
		width: 250px;
		height: 250px;
		background: radial-gradient(circle, rgba(255,215,0,0.15), transparent);
		border-radius: 50%;
		z-index: 0;
		animation: floatShape 12s infinite ease-in-out;
		pointer-events: none;
	}

	@keyframes floatShape {
		0%, 100% { transform: translate(0,0) scale(1); }
		50% { transform: translate(-20px, -30px) scale(1.1); }
	}

	.hero-section .container {
		position: relative;
		z-index: 2;
		padding-top: 100px;
	}

	.hero-section h1 {
		font-size: 2.8rem;
		font-weight: 800;
		margin-bottom: 20px;
		margin-top: 80px;
		font-family: 'Playfair Display', serif;
		color: #fff;
		text-shadow: 0 2px 15px rgba(0,0,0,0.3);
		animation: fadeInUp 0.8s ease-out forwards;
		letter-spacing: -0.01em;
	}

	.hero-section p {
		font-size: 1.2rem;
		color: #f8f9fa;
		margin-bottom: 35px;
		max-width: 650px;
		margin-left: auto;
		margin-right: auto;
		text-shadow: 0 1px 8px rgba(0,0,0,0.2);
		animation: fadeInUp 0.8s ease-out 0.15s forwards;
		opacity: 0;
		animation-fill-mode: forwards;
	}

	/* Gold buttons with shine effect */
	.hero-section a.btn-primary {
		background: linear-gradient(135deg, var(--primary-gold), #ffc107);
		border: none;
		color: var(--primary-purple);
		font-weight: 700;
		transition: var(--transition-smooth);
		box-shadow: var(--shadow-sm);
		border-radius: 50px;
		padding: 12px 30px;
		position: relative;
		overflow: hidden;
		z-index: 1;
	}

	.hero-section a.btn-primary::before {
		content: '';
		position: absolute;
		top: 0;
		left: -100%;
		width: 100%;
		height: 100%;
		background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent);
		transition: left 0.5s ease;
		z-index: -1;
	}

	.hero-section a.btn-primary:hover::before {
		left: 100%;
	}

	.hero-section a.btn-primary:hover {
		transform: translateY(-3px);
		box-shadow: var(--shadow-md);
	}

	.hero-section a.btn-outline-light {
		border-radius: 50px;
		padding: 12px 30px;
		border-width: 2px;
		transition: var(--transition-smooth);
	}

	.hero-section a.btn-outline-light:hover {
		background-color: #fff;
		color: var(--primary-gold) !important;
		transform: translateY(-3px);
		box-shadow: var(--shadow-sm);
	}

	/* ============================================
	   DASHBOARD CARDS (ultra-enhanced)
	   ============================================ */
	.dashboard-card {
		background: #fff;
		padding: 20px;
		border-radius: 16px;
		text-align: center;
		transition: var(--transition-smooth);
		box-shadow: var(--shadow-sm);
		border: 1px solid rgba(123, 44, 191, 0.1);
		position: relative;
		overflow: hidden;
	}

	/* Top gradient bar animation */
	.dashboard-card::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 4px;
		background: var(--gradient-primary);
		transform: scaleX(0);
		transform-origin: left;
		transition: transform 0.4s ease;
	}

	.dashboard-card:hover::before {
		transform: scaleX(1);
	}

	.dashboard-card:hover {
		transform: translateY(-8px);
		box-shadow: var(--shadow-lg);
		border-color: rgba(123, 44, 191, 0.2);
		background: rgba(255,255,255,0.98);
	}

	.dashboard-card img {
		width: 100%;
		height: 200px;
		object-fit: cover;
		border-radius: 12px;
		transition: transform 0.4s var(--transition-smooth);
		box-shadow: 0 4px 12px rgba(0,0,0,0.1);
	}

	.dashboard-card:hover img {
		transform: scale(1.02);
	}

	.dashboard-card h4 {
		font-size: 1.25rem;
		margin: 15px 0;
		color: var(--primary-purple);
		font-weight: 700;
		transition: color 0.3s;
	}

	.dashboard-card:hover h4 {
		color: var(--primary-purple-light);
	}

	.dashboard-card p {
		font-size: 0.95rem;
		color: #555;
		line-height: 1.5;
		transition: color 0.3s;
	}

	.dashboard-card a.btn {
		margin-top: 10px;
		background-color: var(--primary-purple-light);
		border: none;
		border-radius: 40px;
		padding: 8px 20px;
		font-weight: 600;
		transition: var(--transition-smooth);
		display: inline-block;
	}

	.dashboard-card a.btn:hover {
		background-color: var(--primary-purple);
		transform: translateY(-2px);
		box-shadow: var(--shadow-sm);
	}

	/* ============================================
	   ANIMATIONS
	   ============================================ */
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

	/* ============================================
	   RESPONSIVE (kept original + improvements)
	   ============================================ */
	@media (max-width: 768px) {
		.hero-section h1 {
			font-size: 2rem;
			margin-top: 60px;
		}
		.hero-section p {
			font-size: 1rem;
		}
		.dashboard-card img {
			height: 160px;
		}
		.dashboard-card {
			padding: 15px;
		}
		.hero-section a.btn-primary,
		.hero-section a.btn-outline-light {
			padding: 8px 20px;
			font-size: 0.9rem;
		}
	}
	}
	
	/* Dashboard Button Styling */
	.dashboard-bar {
		position: relative;
		z-index: 99;
		margin-top: 10px;
		padding-right: 15px;
	}
	.dashboard-btn {
		background: var(--gradient-primary);
		color: #fff !important;
		padding: 10px 24px;
		border-radius: 50px;
		font-weight: 700;
		text-decoration: none;
		display: inline-flex;
		align-items: center;
		gap: 10px;
		box-shadow: 0 4px 15px rgba(124, 45, 94, 0.3);
		transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
		font-family: 'Raleway', sans-serif;
		font-size: 0.95rem;
		letter-spacing: 0.5px;
	}
	.dashboard-btn:hover {
		transform: translateY(-3px) scale(1.02);
		box-shadow: 0 8px 25px rgba(124, 45, 94, 0.45);
		color: #fff !important;
	}
	.dashboard-btn i {
		font-size: 1.2rem;
		transition: transform 0.3s ease;
	}
	.dashboard-btn:hover i {
		transform: translateX(5px);
	}
</style>
</head>

<body>

<!-- ======= Header ======= -->
<div id="wrapper">
    <jsp:include page="/WEB-INF/views/fragments/sidebar.jsp" />
    <div id="page-content-wrapper">
        <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

<!-- ======= Hero Section for Incident & Safety Updates ======= -->
<section class="hero-wrap" 
         style="background: linear-gradient(rgba(124, 45, 94, 0.4), rgba(15, 15, 26, 0.8)), url('${pageContext.request.contextPath}/assets/img/safety1.jpg'); height: 75vh; position:relative; background-size: cover; background-position: center; display: flex; align-items: center;" 
         data-stellar-background-ratio="0.5">
 

  <div class="container">
    <div class="row no-gutters align-items-center justify-content-center text-center">
      <div class="col-md-10 text-white">

        <!-- Icon -->
        <div class="icon mb-4" data-aos="zoom-in">
          <i class="fas fa-shield-alt" style="font-size:4rem; color: #f43f5e; filter: drop-shadow(0 0 15px rgba(219, 39, 119, 0.5));"></i>
        </div>

        <!-- Headings -->
        <h1 class="mb-2" style="font-family: 'Playfair Display', serif; font-weight: 900; font-size: 3.5rem; text-transform: uppercase; letter-spacing: 2px;">
            Community <span style="color: #f43f5e;">Safety</span> Updates
        </h1>
        <h2 class="mb-4" style="font-weight: 300; opacity: 0.9; letter-spacing: 1px;">Stay Informed. Stay Secure.</h2>

        <!-- Description -->
        <div class="row justify-content-center mb-4">
          <div class="col-md-8">
            <p style="font-size: 1.1rem; line-height: 1.8; color: rgba(255,255,255,0.9);">Track, review, and respond to real-time incident reports across our community. Your awareness contributes to a safer environment for everyone.</p>
          </div>
        </div>

        <!-- Buttons -->
        <div class="d-flex justify-content-center gap-3 flex-wrap">
          <a href="#reports-section" 
             class="btn btn-watch-video btn-lg d-flex justify-content-center align-items-center gap-2 mt-auto">View All Reports</a>
          <a href="${pageContext.request.contextPath}/incidents/report" 
             class="btn btn-watch-video btn-lg d-flex justify-content-center align-items-center gap-2 mt-auto">+ Report a New Incident</a>
        </div>

      </div>
    </div>
  </div>
</section>


			  <!-- ======= Reported Incidents Section (Dashboard Style) ======= -->
			  <section id="reports-section" class="services section light-background py-5">
			    <div class="container">
			      <div class="text-center mb-5">
			        <h2>Community Reports</h2>
			        <p>Reported Incidents in your area</p>
			      </div>
			      <div class="row g-4" id="incidentCards">
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
			                View 
			              </a>

			            </div>
			          </div>
			        </c:forEach>
			      </div>
			    </div>
			  </section>


	  <footer id="footer" class="footer position-relative">

	   

	    <div class="container footer-top">
	      <div class="row gy-4">
	        <div class="col-lg-4 col-md-6 footer-about">
	          <a href="index.html" class="d-flex align-items-center">
	           Fight D Fear
	          </a>
	             
	  <div class="pt-3">
	    <p class="fw-semibold">Our Values</p>
	    <p>Awareness • Safety • Equality • Empowerment</p>
	    <p class="mt-2">Building a safer tomorrow, together.</p>
	  </div>
	</div>
	        <div class="col-lg-2 col-md-3 footer-links">
	          <h4>Useful Links</h4>
	          <ul>
	            <li><i class="bi bi-chevron-right"></i> <a href="index.html#hero">Home</a></li>
	            <li><i class="bi bi-chevron-right"></i> <a href="index.html#about">About us</a></li>
	            <li><i class="bi bi-chevron-right"></i> <a href="index.html#services">Services</a></li>
	             <li><i class="bi bi-chevron-right"></i> <a href="${pageContext.request.contextPath}/terms">Terms</a></li>
	              </ul>
	        
	</a>
	        </div>

	      <div class="col-lg-2 col-md-3 footer-links">
	  <h4>Our Services</h4>
	  <ul>
	    <li><i class="bi bi-chevron-right"></i> <a href="#">Emergency Assistance</a></li>
	    <li><i class="bi bi-chevron-right"></i> <a href="#">Safety Education</a></li>
	    <li><i class="bi bi-chevron-right"></i> <a href="#">Self-defense Training</a></li>
	    <li><i class="bi bi-chevron-right"></i> <a href="#">Community Support</a></li>
	  </ul>
	</div>

	<div class="col-lg-4 col-md-12">
	  <h4>Follow Us</h4>
	  <p>Stay connected with us for safety updates, resources, and tips. Empower yourself and others!</p>
	  <div class="social-links d-flex">
	    <a href=""><i class="bi bi-twitter"></i></a>
	    <a href=""><i class="bi bi-facebook"></i></a>
	    <a href=""><i class="bi bi-instagram"></i></a>
	    <a href=""><i class="bi bi-linkedin"></i></a>
	  </div>
	</div>


	      </div>
	    </div>

	    <div class="container copyright text-center mt-4">
	      <p>© Copyright<strong class="px-1 sitename">Fight D Fear</strong> All Rights Reserved</p>
	      <div class="credits">
	        <!-- All the links in the footer should remain intact. -->
	        <!-- You can delete the links only if you've purchased the pro version. -->
	        <!-- Licensing information: https://bootstrapmade.com/license/ -->
	        <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
	       <!--  Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a> -->
	      </div>
	    </div>

	  </footer>


	<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

  <script>
    (function () {
      let initialSignature = "";
      try {
        initialSignature = [
          <c:forEach var="incident" items="${incidents}">
            "${incident.id}|${incident.status};",
          </c:forEach>
        ].join("");
      } catch (e) {}

      async function checkForUpdates() {
        try {
          const res = await fetch("${pageContext.request.contextPath}/incidents/listForUser.meta", {
            headers: { "Accept": "application/json" }
          });
          if (!res.ok) return;
          const data = await res.json();
          if (data && data.signature && data.signature !== initialSignature) {
            window.location.reload();
          }
        } catch (e) {
          // ignore
        }
      }

      setInterval(checkForUpdates, 8000);
    })();
  </script>

	    </div>
</div>
</body>
	</html>

