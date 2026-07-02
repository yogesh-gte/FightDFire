<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
   <meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<title>Fight D Fear</title>
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

			<!-- 🎨 Custom CSS -->
			<style>
			/* Purple navbar */
#ftco-navbar, #header {
  background-color: #7d265a !important; /* wine/deep plum */
}

/* --- THEME STYLES --- */
:root {
    --fdf-mulberry: #6a0dad;
    --fdf-plum: #a64281;
    --fdf-rose: #d63384;
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

.subheading {
    color: var(--fdf-plum) !important;
    text-transform: uppercase;
    letter-spacing: 2px;
    font-weight: 700;
}

.btn-primary, .btn-outline-primary {
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
.btn-primary:hover, .btn-outline-primary:hover {
    background: var(--fdf-mulberry) !important;
    box-shadow: 0 8px 25px rgba(106, 13, 173, 0.4);
    transform: translateY(-2px);
}

			
			.hero-section::before {
			    content: "";
			    position: absolute;
			    top: 0; left: 0;
			    width: 100%;
			    height: 100%;
			    background: rgba(255, 215, 0, 0.35); /* 💛 Light golden transparent overlay */
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
			    background-color: #e6b800;  /* ✨ Soft gold */
			    border-color: #e6b800;
			    transition: 0.3s;
			}

			.hero-section a.btn-primary:hover {
			    background-color: #f1c232;  /* Slightly brighter on hover */
			    border-color: #f1c232;
			}

			.hero-section a.btn-outline-light:hover {
			    background-color: #fff;
			    color: #e6b800 !important;
			}
			/* ✨ Increase only nav item font size */
			#ftco-navbar .nav-link {
			  font-size: 1.2rem !important;  /* Slightly larger font */
			  font-weight: 300;              /* Make text a bit bolder */
			  letter-spacing: 0.5px;         /* Add spacing for cleaner look */
			  padding: 10px 18px !important; /* Slightly larger clickable area */
			  transition: all 0.3s ease;
			}

		/* --- Layout --- */
		.salon-header-section {
		    width: 100%;
		    background: #fff;
		    margin-bottom: 40px;
			margin-top: 80px; 
		}

		.salon-header {
		    border-radius: 12px;
		    overflow: hidden;
		    box-shadow: 0 4px 25px rgba(0,0,0,0.1);
		}

		/* --- Left Image Side --- */
		.salon-image-side {
		    padding: 0;
		}

		.salon-img {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		    min-height: 500px;
		}

		/* --- Right Details Side --- */
		.salon-details-side {
		    background-color: #fafafa;
		    display: flex;
		    align-items: center;
		}

		.salon-details {
		    width: 100%;
		}

		.salon-name {
		    font-size: 2rem;
		    font-weight: 700;
		    color: #2c2c2c;
		}

		.salon-details p {
		    font-size: 1.05rem;
		    color: #555;
		    margin-bottom: 10px;
		    line-height: 1.7;
		}

		.salon-details a {
		    color: #007bff;
		    text-decoration: none;
		    font-weight: 500;
		}

		.salon-details a:hover {
		    text-decoration: underline;
		}

		/* --- Responsive --- */
		@media (max-width: 768px) {
		    .salon-img {
		        min-height: 300px;
		    }

		    .salon-details-side {
		        padding: 25px;
		    }

		    .salon-name {
		        font-size: 1.6rem;
		    }
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
  <header id="header" class="header d-flex align-items-center sticky-top">
    <div class="container-fluid container-xl d-flex align-items-center">
      <a href="${pageContext.request.contextPath}/users/dashboard" class="logo me-auto"><h1>Fight D Fear</h1></a>
      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="${pageContext.request.contextPath}/chat/users">Chat</a></li>
          <li><a href="${pageContext.request.contextPath}/user/bookings">My Bookings</a></li>
          <li><a href="${pageContext.request.contextPath}/users/wallet">Wallet 💰</a></li>
          <li><a href="${pageContext.request.contextPath}/users/dashboard" class="btn-dashboard"><i class="fas fa-th-large"></i> Back to Dashboard</a></li>
          <li class="nav-profile">
              <a href="${pageContext.request.contextPath}/users/profile/${user.id}" class="d-flex align-items-center">
                  <img src="${pageContext.request.contextPath}${not empty user.profilePhoto ? user.profilePhoto : '/images/default-profile.png'}" 
                       alt="Profile" class="rounded-circle" style="width: 35px; height: 35px; object-fit: cover; border: 2px solid var(--brand-pink);">
                  <span class="ms-2 d-none d-lg-inline text-white">${user.fullName}</span>
              </a>
          </li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>
      <a class="btn-getstarted" href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
  </header>
    <!-- END nav -->

    <section class="hero-wrap js-fullheight" style="background-image: linear-gradient(rgba(106, 13, 173, 0.2), rgba(0, 0, 0, 0.7)), url('${pageContext.request.contextPath}/beauty/images/style1.jpg'); background-position: center; background-size: cover; background-attachment: fixed;" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-10 ftco-animate text-center">
          	<div class="icon">
	          	<span class="flaticon-lotus"></span>
          	</div>
			<h1>Explore Stylists</h1>
			<h1>Meet Your Perfect Match</h1>
            <div class="row justify-content-center">
	            <div class="col-md-9 mb-3">
	            	<p class="hero-highlight-text">Find skilled stylists specializing in hair, makeup, and beauty care — ready to bring out your best look.</p>
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
		    <div class="container">
		      <div class="row justify-content-center mb-5 pb-3">
		        <div class="col-md-7 heading-section ftco-animate text-center">
		          <h3 class="subheading">Explore Stylists</h3>
		          <h3 >Meet Professional Experts</h3>
		        </div>
		      </div>
	
		    <div class="row">
		        <c:forEach var="stylist" items="${stylists}">
		            <div class="col-md-4 mb-4">
		                <div class="card shadow-sm border-0 h-100 text-center" style="border-radius:12px; overflow:hidden;">
		                    
		                    <!-- Profile Image -->
		                    <img src="${pageContext.request.contextPath}${stylist.profileImage != null ? stylist.profileImage : 'images/default-stylist.jpg'}"
		                         alt="${stylist.firstName}"
		                         class="card-img-top"
		                         style="width:100%; height:300px; object-fit:cover;">

		                    <!-- Card Body -->
		                    <div class="card-body">
		                        <h5 class="card-title mb-1">
		                            ${stylist.firstName} ${stylist.lastName}
		                        </h5>
		                        <p class="text-muted mb-2">${stylist.specialization}</p>

		                        <p class="salon-name mb-3">
		                            <i class="fas fa-store text-primary"></i>
		                            <c:choose>
		                                <c:when test="${stylist.salon != null}">
		                                    ${stylist.salon.name}
		                                </c:when>
		                                <c:otherwise>
		                                    Independent Stylist
		                                </c:otherwise>
		                            </c:choose>
		                        </p>

		                        <a href="${pageContext.request.contextPath}/user/stylist/view?id=${stylist.id}" 
		                           class="btn btn-primary px-4 py-2">
		                            View Details
		                        </a>
		                    </div>
		                </div>
		            </div>
		        </c:forEach>
		    </div>
		</div>

	</section>



<!--
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
    </section>

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
      <p>© Copyright <strong class="px-1 sitename">Fight D Fear</strong> All Rights Reserved</p>
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


