<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<title>FightDFire</title>
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
			
			<!-- 🎨 Custom CSS -->
    <style>
    /* ===============================
       🎨 UNIVERSAL THEME: MULBERRY & ROSE
       =============================== */
    :root {
        --fdf-mulberry: #6a0dad;
        --fdf-plum: #a64281;
        --fdf-rose: #d63384;
    }

    /* Navbar Theme */
    #header {
        background: #7d265a !important;
        box-shadow: 0 2px 15px rgba(0,0,0,0.2);
    }
    #header .logo h1, #header .navmenu a {
        color: #fff !important;
    }
    #header .navmenu a:hover, #header .navmenu .active {
        color: #ffd6ff !important;
    }

    /* Hero Buttons */
    .btn-watch-video, .btn-primary, .btn-outline-primary {
        background: var(--fdf-plum) !important;
        color: #fff !important;
        border: 1px solid rgba(255,255,255,0.2) !important;
        padding: 12px 35px !important;
        border-radius: 50px !important;
        transition: 0.3s all ease;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 1px;
        backdrop-filter: blur(5px);
    }
    .btn-primary:hover, .btn-watch-video:hover, .btn-outline-primary:hover {
        background: var(--fdf-mulberry) !important;
        box-shadow: 0 8px 25px rgba(106, 13, 173, 0.4);
        transform: translateY(-2px);
    }

    /* Salon Cards Theme */
    .salon-card {
        border-radius: 20px !important;
        overflow: hidden;
        transition: 0.4s;
        border: 1px solid rgba(0,0,0,0.05) !important;
        background: #fff !important;
    }
    .salon-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 40px rgba(106, 13, 173, 0.15) !important;
    }
    .salon-name {
        color: var(--fdf-mulberry) !important;
        font-size: 1.4rem !important;
    }
    .salon-bio {
        font-size: 0.95rem;
        line-height: 1.6;
        color: #666;
    }
    
    .hero-highlight-text {
        background: rgba(166, 66, 129, 0.15);
        display: inline-block;
        padding: 12px 30px;
        border-radius: 50px;
        backdrop-filter: blur(8px);
        border: 1px solid rgba(255, 255, 255, 0.25);
        font-weight: 500;
        font-size: 1.15rem;
        color: #fff;
        margin-bottom: 20px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        text-shadow: 0 2px 4px rgba(0,0,0,0.3);
    }

    /* Icons & Accents */
    .bi-geo-alt-fill, .bi-clock-fill {
        color: var(--fdf-plum) !important;
    }
    .subheading {
        color: var(--fdf-plum) !important;
        text-transform: uppercase;
        letter-spacing: 2px;
        font-weight: 700;
    }

    /* 📱 Mobile Responsive Fixes */
    html, body {
        overflow-x: hidden;
        width: 100%;
    }
    @media (max-width: 768px) {
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
      <a class="btn-getstarted" href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
  </header>
    <!-- END nav -->

    <section class="hero-wrap js-fullheight" style="background-image: linear-gradient(rgba(106, 13, 173, 0.2), rgba(0, 0, 0, 0.7)), url('${pageContext.request.contextPath}/beauty/images/salon2.jpg'); background-position: center; background-size: cover; background-attachment: fixed;" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-10 ftco-animate text-center">
          	<div class="icon">
	          	<span class="flaticon-lotus"></span>
          	</div>
			<h1>Discover Trusted Salons</h1>
			<h1>Style, Care & Confidence</h1>
            <div class="row justify-content-center">
	            <div class="col-md-9 mb-3">
	            	  <p class="hero-highlight-text">Explore the best salons in your area for stunning makeovers, trusted stylists, and self-care you deserve — all in one beautiful place.</p>
	            </div>
	          </div>
            <p>
            	<a href="#" class="btn btn-primary px-5 py-3 mr-md-2">Get in Touch</a>
            	<a href="#" class="btn btn-outline-primary px-5 py-3 ml-md-2">Contact</a>
            </p>
          </div>
        </div>
      </div>
    </section>	
	<section class="ftco-section bg-light">
	  <div class="container-fluid px-md-5"> <!-- ⬅️ made container fluid for more width -->
	    <!-- Section Header -->
	    <div class="row justify-content-center mb-5 pb-3">
	      <div class="col-md-8 heading-section ftco-animate text-center"> <!-- ⬅️ widened header area -->
	        <h3 class="subheading">Our Beauty Network</h3>
	        <h3 class="mb-1">Explore Salons</h3>
	      </div>
	    </div>

	    <!-- Salon Listing -->
	    <div class="main-content">
	      <c:if test="${not empty salons}">
	        <div class="row justify-content-center">
	          <c:forEach var="salon" items="${salons}">
	           <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 ftco-animate mb-4">
<!-- ⬅️ wider column -->
	              <div class="card salon-card shadow-sm border-0 text-center mx-auto">

	                <!-- Salon Image -->
	                <c:if test="${not empty salon.profileImageUrl}">
	                  <img src="${pageContext.request.contextPath}${salon.profileImageUrl}" 
     alt="${salon.name}" 
     class="card-img-top salon-img">
   </c:if>

	                <!-- Salon Details -->
	                <div class="card-body">
	                  <h4 class="salon-name fw-bold mb-3"><c:out value="${salon.name}" /></h4>

	                  <p class="salon-address text-muted mb-2">
	                    <i class="bi bi-geo-alt-fill text-primary"></i>
	                    <c:out value="${salon.address}" />, 
	                    <c:out value="${salon.city}" />, 
	                    <c:out value="${salon.state}" /> - 
	                    <c:out value="${salon.pincode}" />
	                  </p>

	                  <p class="salon-hours text-muted mb-2">
	                    <i class="bi bi-clock-fill text-primary"></i>
	                    <c:out value="${salon.availabilityHours}" />
	                  </p>

	                  <c:if test="${not empty salon.bio}">
	                    <p class="salon-bio text-secondary mt-3 mb-4 px-4">
	                      <c:out value="${salon.bio}" />
	                    </p>
	                  </c:if>

	                  <a href="${pageContext.request.contextPath}/user/salon/view?id=${salon.id}" 
	                     class="btn btn-primary w-100 py-3 mt-2" style="border-radius: 12px !important;">Explore More</a>
	                </div>

	              </div>
	            </div>
	          </c:forEach>
	        </div>
	      </c:if>

	      <!-- No salons message -->
	      <c:if test="${empty salons}">
	        <div class="text-center text-muted mt-5">
	          <p>No salons available at the moment.</p>
	        </div>
	      </c:if>
	    </div>
	  </div>
	</section>
	<!--
    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <h3 class="subheading">Pricing Tables</h3>
            <h2 class="mb-1">Pricing Features</h2>
          </div>
        </div>
        <div class="row">
	        <div class="col-md-4 ftco-animate">
	          <div class="block-7">
	            <div class="text-center">
	            <h2 class="heading">Year Card</h2>
	            <span class="price"><sup>$</sup> <span class="number">449</span></span>
	            <span class="excerpt d-block">For 1 Year</span>
	            
	            <h3 class="heading-2 my-4">Enjoy All The Features</h3>
	            
	            <ul class="pricing-text mb-5">
	              <li>Face Treatments</li>
	              <li>Nail Treatments</li>
	              <li>Medical Treatments</li>
	              <li>Hair Removal</li>
	            </ul>

	            <a href="#" class="btn btn-primary d-block px-2 py-4">Get Started</a>
	            </div>
	          </div>
	        </div>
	        <div class="col-md-4 ftco-animate">
	          <div class="block-7">
	            <div class="text-center">
	            <h2 class="heading">Monthly Card</h2>
	            <span class="price"><sup>$</sup> <span class="number">200</span></span>
	            <span class="excerpt d-block">For 1 Month</span>
	            
	            <h3 class="heading-2 my-4">Enjoy All The Features</h3>
	            
	            <ul class="pricing-text mb-5">
	              <li>Face Treatments</li>
	              <li>Nail Treatments</li>
	              <li>Medical Treatments</li>
	              <li>Hair Removal</li>
	            </ul>

	            <a href="#" class="btn btn-primary d-block px-2 py-4">Get Started</a>
	            </div>
	          </div>
	        </div>
	        <div class="col-md-4 ftco-animate">
	          <div class="block-7">
	            <div class="text-center">
	            <h2 class="heading">Weekly Card</h2>
	            <span class="price"><sup>$</sup> <span class="number">85</span></span>
	            <span class="excerpt d-block">For 1 Week</span>
	            
	            <h3 class="heading-2 my-4">Enjoy All The Features</h3>
	            
	            <ul class="pricing-text mb-5">
	              <li>Face Treatments</li>
	              <li>Nail Treatments</li>
	              <li>Medical Treatments</li>
	              <li>Hair Removal</li>
	            </ul>

	            <a href="#" class="btn btn-primary d-block px-2 py-4">Get Started</a>
	            </div>
	          </div>
	        </div>
	      </div>
      </div>
    </section>


    <section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-10 heading-section ftco-animate text-center">
            <h3 class="subheading">Testimony</h3>
            <h2 class="mb-1">Successful Stories</h2>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel">
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                  	<div class="line pl-5">
	                    <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	                    <span class="quote d-flex align-items-center justify-content-center">
	                      <i class="icon-quote-left"></i>
	                    </span>
	                  </div>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(/beauty/images/person_1.jpg)">
		                  </div>
		                  <div class="ml-4">
		                  	<p class="name">Gabby Smith</p>
		                    <span class="position">Customer</span>
		                  </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                    <div class="line pl-5">
	                    <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	                    <span class="quote d-flex align-items-center justify-content-center">
	                      <i class="icon-quote-left"></i>
	                    </span>
	                  </div>

                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(/beauty/images/person_2.jpg)">
		                  </div>
		                  <div class="ml-4">
		                  	<p class="name">Floyd Weather</p>
		                    <span class="position">Customer</span>
		                  </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                    <div class="line pl-5">
	                    <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	                    <span class="quote d-flex align-items-center justify-content-center">
	                      <i class="icon-quote-left"></i>
	                    </span>
	                  </div>

                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(/beauty/images/person_3.jpg)">
		                  </div>
		                  <div class="ml-4">
		                  	<p class="name">James Dee</p>
		                    <span class="position">Customer</span>
		                  </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                    <div class="line pl-5">
	                    <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	                    <span class="quote d-flex align-items-center justify-content-center">
	                      <i class="icon-quote-left"></i>
	                    </span>
	                  </div>

                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(/beauty/images/person_4.jpg)">
		                  </div>
		                  <div class="ml-4">
		                  	<p class="name">Lance Roger</p>
		                    <span class="position">Customer</span>
		                  </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                    <div class="line pl-5">
	                    <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	                    <span class="quote d-flex align-items-center justify-content-center">
	                      <i class="icon-quote-left"></i>
	                    </span>
	                  </div>

                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(/beauty/images/person_2.jpg)">
		                  </div>
		                  <div class="ml-4">
		                  	<p class="name">Kenny Bufer</p>
		                    <span class="position">Customer</span>
		                  </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>-->
<!--
    <section class="ftco-counter img" id="section-counter" style="background-image: url(/beauty/images/bg_3.jpg);" data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center">
        	<div class="col-md-10">
        		<div class="row">
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="2560">0</strong>
		              	<span>Happy Customers</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="60">0</strong>
		              	<span>Treatments</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="50">0</strong>
		              	<span>Years of Experience</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="100">0</strong>
		              	<span>Lesson Conducted</span>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
        </div>
      </div>
    </section>


		<section class="ftco-gallery ftco-section">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <h3 class="subheading">Gallery</h3>
            <h2 class="mb-1">See the latest photos</h2>
          </div>
        </div>
    		<div class="row">
					<div class="col-md-3 ftco-animate">
						<a href="/beauty/images/gallery-1.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(/beauty/images/gallery-1.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="/beauty/images/gallery-2.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(/beauty/images/gallery-2.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="/beauty/images/gallery-3.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(/beauty/images/gallery-3.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="/beauty/images/gallery-4.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(/beauty/images/gallery-4.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
        </div>
    	</div>
    </section>

		
-->
    <!-- 🌸 Footer -->
			  	<footer id="footer" class="footer position-relative">

   

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

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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

					  </body>
					  </html>
