<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    
	<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<title>My Bookings</title>
			<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">

			<link href="https://fonts.googleapis.com/css?family=Prata&display=swap" rel="stylesheet">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/open-iconic-bootstrap.min.css">
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
						<!-- Icons & CSS -->
						<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
						<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
						<link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
						<link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
						<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
			
		
</head>
<body>
	

	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center sticky-top">
	  <div class="container-fluid container-xl d-flex align-items-center">
	    <a href="${pageContext.request.contextPath}/users/dashboard" class="logo me-auto"><h1>FightDFire</h1></a>
	    <nav id="navmenu" class="navmenu">
	      <ul>
	        <li><a href="${pageContext.request.contextPath}/chat/users">Chat</a></li>
	        <li><a href="${pageContext.request.contextPath}/user/bookings">My Bookings</a></li>
	        <li><a href="${pageContext.request.contextPath}/users/wallet">Wallet 💰</a></li>
	        <li><a href="${pageContext.request.contextPath}/users/dashboard" class="btn-dashboard"><i class="fas fa-th-large"></i> Back to Dashboard</a></li>
	        <li><a href="${pageContext.request.contextPath}/users/profile/${user.id}">${user.fullName}</a></li>
	      </ul>
	      <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
	    </nav>
	    <a class="btn-qna" href="${pageContext.request.contextPath}/qna">Q&amp;A</a>
	    <a class="btn-getstarted" href="${pageContext.request.contextPath}/logout">Logout</a>
	  </div>
	</header>
	<!-- END nav -->
				<section class="hero-wrap js-fullheight" style="background-image: linear-gradient(rgba(106, 13, 173, 0.3), rgba(0, 0, 0, 0.8)), url('${pageContext.request.contextPath}/beauty/images/book1.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">
				     <div class="overlay"></div>
				     <div class="container">
				       <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
				         <div class="col-md-10 ftco-animate text-center">
				         	<div class="icon">
				          	<span class="flaticon-lotus"></span>
				         	</div>
				           <h1 class="mb-2" style="font-size: 3.5rem; font-weight: 700;">${user.fullName}</h1>
				           <h2 class="text-white mb-4" style="font-size: 2.2rem; font-weight: 300; letter-spacing: 2px;">MY BOOKINGS</h2>
				           <div class="row justify-content-center">
				            <div class="col-md-7 mb-4">
				            	<p style="font-size: 1.25rem; font-weight: 500; background: rgba(124, 45, 94, 0.7); color: white; padding: 10px 30px; border-radius: 50px; display: inline-block; backdrop-filter: blur(10px); border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 10px 25px rgba(0,0,0,0.3);">Review all your service, treatment, and offer bookings in one place.</p>
				            </div>
				          </div>
				           <div class="d-flex justify-content-center gap-3 mt-4">
                               <a href="${pageContext.request.contextPath}/doctors/myAppointments" class="btn d-flex align-items-center gap-2" style="background: var(--brand-purple) !important; color: white !important; border: 1px solid rgba(255, 255, 255, 0.3); padding: 12px 30px; border-radius: 50px; backdrop-filter: blur(10px); font-weight: 600; text-transform: uppercase; letter-spacing: 1px; box-shadow: 0 10px 30px rgba(0,0,0,0.4); text-decoration: none;">
                                   <i class="fas fa-user-md"></i> VIEW MEDICAL APPOINTMENTS
                               </a>
                           </div>
				         </div>
				       </div>
				     </div>
				   </section>

				   <style>
				   										/* ===============================
				   										   HERO FIX – STABLE & SMALL HEIGHT
				   										   =============================== */

				   										.hero-wrap {
				   										  height: 55vh !important;          /* reduced height */
				   										  min-height: 65vh !important;
				   										  background-size: cover !important;
				   										  background-position: center center !important;
				   										  background-repeat: no-repeat !important;
				   										  background-attachment: fixed;
				   										  position: relative;
				   										  overflow: hidden;
				   										}

				   										/* FORCE disable js-fullheight effect */
				   										.hero-wrap.js-fullheight,
				   										.hero-wrap .js-fullheight {
				   										  height: 80vh !important;
				   										  min-height: 70vh !important;
				   										}

				   										/* Overlay MUST be full height */
				   										.hero-wrap .overlay {
				   										  position: absolute;
				   										  inset: 0;
				   										  width: 100%;
				   										  height: 100%;
				   										}

				   										/* Mobile safety */
				   										@media (max-width: 768px) {
				   										  .hero-wrap {
				   										    height: 55vh !important;
				   										    min-height: 45vh !important;
				   										    background-attachment: scroll;
				   										  }
				   										}

				   									</style>
				   <!-- ✅ My Bookings Section (Full Width) -->
				   <section class="ftco-section bg-light mt-5 pt-5">
				     <div class="container-fluid px-5">

				       <!-- Header -->


				       <!-- No Bookings -->
				       <c:if test="${empty serviceBookings and empty treatmentBookings and empty offerBookings}">
				         <div class="alert alert-info text-center">
				           You have no bookings yet.
				         </div>
				       </c:if>

				       <!-- BOOKINGS TABLE -->
				       <c:if test="${not empty serviceBookings or not empty treatmentBookings or not empty offerBookings}">
				         <div class="table-responsive bg-white shadow-sm rounded p-3 ftco-animate">

				           <table class="table table-bordered table-striped text-center align-middle">
				             <thead style="background: linear-gradient(135deg, var(--brand-purple) 0%, var(--brand-purple-dark) 100%); color:white;">
				               <tr>
				                 <th>Type</th>
				                 <th>Item</th>
				                 <th>Salon / Stylist</th>
				                 <th>Booking Mode</th>
				                 <th>Price</th>
				                 <th>Address / Notes</th>
				                 <th>Contact</th>
				                   <th>Date</th>
				                 <th>Booked On</th>
				                 <th>Status</th>
				               </tr>
				             </thead>

				             <tbody>

				               <!-- SERVICE BOOKINGS -->
				               <c:forEach var="b" items="${serviceBookings}">
				                 <tr>
				                   <td><span class="badge bg-primary">Service</span></td>
				                   <td>${b.service.name}</td>
				                   <td>${b.salon.name}</td>
				                   <td>${b.bookingType}</td>
				                   <td>₹${b.price}</td>
				                   <td>
				                     <c:choose>
				                       <c:when test="${b.bookingType eq 'DOOR'}">${b.address}</c:when>
				                       <c:otherwise>${b.notes != null ? b.notes : '-'}</c:otherwise>
				                     </c:choose>
				                   </td>
				                   <td>${b.emergencyContact}</td>
				                     <td>${b.bookingDate}</td>
				                   <td>${b.preferredTime}</td>
				                   <td>
				                     <c:choose>
				                       <c:when test="${b.status eq 'CONFIRMED'}">
				                         <span class="badge bg-success">Confirmed</span>
				                       </c:when>
				                       <c:when test="${b.status eq 'REJECTED'}">
				                         <span class="badge bg-danger">Rejected</span>
				                       </c:when>
				                       <c:otherwise>
				                         <span class="badge bg-warning text-dark">Pending</span>
				                       </c:otherwise>
				                     </c:choose>
				                   </td>
				                 </tr>
				               </c:forEach>

				               <!-- TREATMENT BOOKINGS -->
				               <c:forEach var="t" items="${treatmentBookings}">
				                 <tr>
				                   <td><span class="badge bg-info text-dark">Treatment</span></td>
				                   <td>${t.treatment.serviceName}</td>
				                   <td>${t.salon.name}</td>
				                   <td>${t.bookingType}</td>
				                   <td>₹${t.price}</td>
				                   <td>
				                     <c:choose>
				                       <c:when test="${t.bookingType eq 'DOOR'}">${t.address}</c:when>
				                       <c:otherwise>${t.notes != null ? t.notes : '-'}</c:otherwise>
				                     </c:choose>
				                   </td>
				                   <td>${t.emergencyContact}</td>
				                    <td>${t.bookingDate}</td>
				                   <td>${t.preferredTime}</td>
				                   <td>
				                     <c:choose>
				                       <c:when test="${t.status eq 'CONFIRMED'}">
				                         <span class="badge bg-success">Confirmed</span>
				                       </c:when>
				                       <c:when test="${t.status eq 'REJECTED'}">
				                         <span class="badge bg-danger">Rejected</span>
				                       </c:when>
				                       <c:otherwise>
				                         <span class="badge bg-warning text-dark">Pending</span>
				                       </c:otherwise>
				                     </c:choose>
				                   </td>
				                 </tr>
				               </c:forEach>

				               <!-- OFFER BOOKINGS -->
				               <c:forEach var="o" items="${offerBookings}">
				                 <tr>
				                   <td><span class="badge bg-danger">Offer</span></td>
				                   <td>${o.offer.title}</td>
				                   <td>${o.salon.name}</td>
				                   <td>Offer</td>
				                   <td>
				                     ₹${o.originalPrice - (o.originalPrice * o.offer.discountPercent / 100)}
				                   </td>
				                   <td>${o.offer.description}</td>
				                   <td>-</td>
				                   <td>${o.bookingDate}</td>
				                   <td>
				                     <span class="badge bg-success">Booked</span>
				                   </td>
				                 </tr>
				               </c:forEach>

				             </tbody>
				           </table>

				         </div>
				       </c:if>

				     </div>
				   </section>

				   

<footer id="footer" class="footer position-relative">
    <div class="container footer-top">
      <div class="row gy-4">
        <div class="col-lg-4 col-md-6 footer-about">
          <a href="${pageContext.request.contextPath}/index/templates" class="d-flex align-items-center">
            FightDFire
          </a>
             
  <div class="pt-3">
    <p class="fw-semibold">Our Values</p>
	<p>Empowering women to stay safe, strong, and supported through awareness, self-defense, and action.</p>
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
					  	<!-- Scripts -->
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

						<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
							<script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
							<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

            <script>
              (function () {
                let initialSignature = "";
                try {
                  initialSignature = [
                    <c:forEach var="booking" items="${bookings}">
                      "B:${booking.id}|${booking.status};",
                    </c:forEach>
                    <c:forEach var="b" items="${serviceBookings}">
                      "B1:${b.id}|${b.status};",
                    </c:forEach>
                    <c:forEach var="t" items="${treatmentBookings}">
                      "B1:${t.id}|${t.status};",
                    </c:forEach>
                    <c:forEach var="o" items="${offerBookings}">
                      "O:${o.id}|${o.status};",
                    </c:forEach>
                  ].join("");
                } catch (e) {}

                async function checkForUpdates() {
                  try {
                    const res = await fetch("${pageContext.request.contextPath}/user/bookings.meta", {
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

</body>
</html>
