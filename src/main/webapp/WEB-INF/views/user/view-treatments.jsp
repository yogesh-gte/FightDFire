<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Treatments</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Prata&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600;700&display=swap" rel="stylesheet">

<!-- Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/open-iconic-bootstrap.min.css">

<!-- Theme CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/jquery.timepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">

<!-- Custom Styles -->
<style>
#ftco-navbar {
  background-color: #6a0dad !important;
}
#ftco-navbar .navbar-brand,
#ftco-navbar .nav-link {
  color: #ffffff !important;
}
#ftco-navbar .nav-link {
  font-size: 1.1rem;
  padding: 10px 18px;
}
#ftco-navbar .nav-link:hover {
  color: #ffd6ff !important;
}

/* 📱 Mobile Responsive Fixes */
html, body {
    overflow-x: hidden;
    width: 100%;
    position: relative;
}

@media (max-width: 768px) {
    .container, .container-fluid {
        padding-left: 15px !important;
        padding-right: 15px !important;
    }
    .row {
        margin-left: 0 !important;
        margin-right: 0 !important;
    }
    .header .logo h1 {
        font-size: 1.5rem !important;
    }
    .btn-qna, .btn-getstarted {
        padding: 6px 12px !important;
        font-size: 0.8rem !important;
    }
}
</style>
</head>

<body>

<!-- NAVBAR -->
<header id="header" class="header d-flex align-items-center sticky-top">
		  <div class="container-fluid container-xl d-flex align-items-center">
		    <a href="${pageContext.request.contextPath}/users/dashboard" class="logo me-auto"><h1>FightDFire</h1></a>
		    <nav id="navmenu" class="navmenu">
		      <ul>
				<li class="nav-item"><a href="${pageContext.request.contextPath}/users/dashboard" class="nav-link">Home</a></li>
				           <li class="nav-item"><a href="${pageContext.request.contextPath}/user/salons" class="nav-link">Explore Salons</a></li>
				          <li class="nav-item active"><a href="${pageContext.request.contextPath}/salon/treatments/viewtreatments" class="nav-link">SkinCare Treatments</a></li>
				          <li class="nav-item"><a href="${pageContext.request.contextPath}/user/stylists" class="nav-link">Stylists</a></li>
				          <li class="nav-item"><a href="${pageContext.request.contextPath}/user/bookings" class="nav-link">My Bookings</a></li>
				          <li class="nav-item"><a href="${pageContext.request.contextPath}/users/profile/${user.id}" class="nav-link">Profile</a></li>
		      </ul>
		      <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
		    </nav>
		    <a class="btn-qna" href="${pageContext.request.contextPath}/qna">Q&amp;A</a>
		    <a class="btn-getstarted" href="${pageContext.request.contextPath}/logout">Logout</a>
		  </div>
		</header>

<!-- CONTENT -->
<div class="container mt-5">
  <h2 class="text-center mb-4">All Treatments from Salons</h2>

  <c:if test="${empty treatments}">
    <p class="text-center text-muted">No treatments available at the moment.</p>
  </c:if>

  <div class="row">
    <c:forEach var="treatment" items="${treatments}">
      <div class="col-md-4 mb-4">
        <div class="card h-100 shadow-sm">
          <div class="card-body d-flex flex-column">
            <h5 class="card-title">${treatment.serviceName}</h5>
            <p class="card-text">${treatment.description}</p>
            <p><strong>Price:</strong> ₹${treatment.price}</p>

            <c:if test="${treatment.skinType != null}">
              <p><strong>Skin Type:</strong> ${treatment.skinType.displayName}</p>
            </c:if>

            <p><strong>Salon:</strong> ${treatment.salon.name}</p>

            <a href="${pageContext.request.contextPath}/booking/new?treatmentId=${treatment.id}"
               class="btn btn-primary mt-auto">Book Now</a>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>

<!-- FOOTER -->
<footer id="footer" class="footer">

   

    <div class="container footer-top">
      <div class="row gy-4">
        <div class="col-lg-4 col-md-6 footer-about">
          <a href="${pageContext.request.contextPath}/index/templates" class="d-flex align-items-center">
            FightDFire
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
            <li><i class="bi bi-chevron-right"></i> <a href="${pageContext.request.contextPath}/index/templates">Home</a></li>
            <li><i class="bi bi-chevron-right"></i> <a href="${pageContext.request.contextPath}/index/about">About us</a></li>
            <li><i class="bi bi-chevron-right"></i> <a href="${pageContext.request.contextPath}/index/templates#services">Services</a></li>
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
      <p>© Copyright <strong class="px-1 sitename">FightDFire</strong> All Rights Reserved</p>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you've purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
       <!--  Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a> -->
      </div>
    </div>

  </footer>

 


<!-- JS (ORDER MATTERS) -->
<script src="${pageContext.request.contextPath}/beauty/js/jquery.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/jquery-migrate-3.0.1.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/popper.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/bootstrap.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/jquery.easing.1.3.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/jquery.waypoints.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/jquery.stellar.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/owl.carousel.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/jquery.magnific-popup.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/aos.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/jquery.animateNumber.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/bootstrap-datepicker.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/jquery.timepicker.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/scrollax.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/google-map.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/main.js"></script>

</body>
</html>

