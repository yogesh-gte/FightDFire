<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    
	<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<title>Beauty Services</title>
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
				<li class="nav-item"><a href="${pageContext.request.contextPath}/users/dashboard" class="nav-link">Home</a></li>
				           <li class="nav-item"><a href="${pageContext.request.contextPath}/user/salons" class="nav-link">Explore Salons</a></li>
				          <li class="nav-item active"><a href="${pageContext.request.contextPath}/salon/treatments/viewtreatments" class="nav-link">SkinCare Treatments</a></li>
				          <li class="nav-item"><a href="${pageContext.request.contextPath}/user/stylists" class="nav-link">Stylists</a></li>
				          <li class="nav-item"><a href="${pageContext.request.contextPath}/user/bookings" class="nav-link">My Bookings</a></li>
				          <li class="nav-item"><a href="${pageContext.request.contextPath}/index/contact" class="nav-link">Contact</a></li>
		      </ul>
		      <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
		    </nav>
		    <a class="btn-qna" href="${pageContext.request.contextPath}/qna">Q&amp;A</a>
		    <a class="btn-getstarted" href="${pageContext.request.contextPath}/logout">Logout</a>
		  </div>
		</header>
<div id="wrapper">
    <jsp:include page="/WEB-INF/views/fragments/sidebar.jsp" />
    <div id="page-content-wrapper" style="min-height: 100vh; overflow-x: hidden;">

  

   <section class="hero-wrap js-fullheight" 
         style="background-image: linear-gradient(rgba(166, 66, 129, 0.2), rgba(0, 0, 0, 0.6)), url('${pageContext.request.contextPath}/beauty/images/glow.jpg'); background-position: center; background-size: cover; background-attachment: fixed;" 
         data-stellar-background-ratio="0.5">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
      <div class="col-md-10 ftco-animate text-center">
        <div class="icon">
          <span class="flaticon-lotus"></span>
        </div>
        <h1>Discover Beauty</h1>
        <h1>Style & Confidence</h1>
        <div class="row justify-content-center">
          <div class="col-md-9 mb-3">
            <p class="hero-highlight-text">Explore top-rated salons, premium skincare treatments, and expert stylists — all in one place.</p>
          </div>
        </div>
        <p>
          <a href="${pageContext.request.contextPath}/contact" 
             class="btn btn-watch-video">Get in Touch</a> |
             
          <a href="${pageContext.request.contextPath}/about" 
             class="btn btn-watch-video">Contact</a> |

          <!-- 🌟 New Discount Button -->
          <a href="${pageContext.request.contextPath}/salon/offers" 
             class="btn btn-watch-video">
             View Discounts
          </a>
        </p>
      </div>
    </div>
  </div>
</section>
   
		
		<section class="ftco-section ftco-intro" style="background-image: url(${pageContext.request.contextPath}/beauty/images/intro.jpg);">
			<div class="container">
				<div class="row justify-content-end">
					<div class="col-md-6">
						<div class="heading-section ftco-animate">
	            <h2 class="mb-4">Benefits Of Website</h2>
	          </div>
	          <p class="ftco-animate">Because beauty is not just skin deep — it’s confidence, care, and comfort. We bring the city’s best salons and stylists to your fingertips.</p>
	          <ul class="mt-5 do-list">
				             <li class="nav-item"><a href="${pageContext.request.contextPath}/users/dashboard" class="nav-link">Home</a></li>
				           <li class="nav-item"><a href="${pageContext.request.contextPath}/user/salons" class="nav-link">Glow Space</a></li>
				          <li class="nav-item active"><a href="${pageContext.request.contextPath}/salon/treatments/viewtreatments" class="nav-link">SkinCare Treatments</a></li>
				          <li class="nav-item"><a href="${pageContext.request.contextPath}/user/stylists" class="nav-link">Stylists</a></li>
				          <li class="nav-item"><a href="${pageContext.request.contextPath}/user/bookings" class="nav-link">My Bookings</a></li>
				          <li class="nav-item"><a href="${pageContext.request.contextPath}/index/contact" class="nav-link">Contact</a></li>          </ul>
					</div>
				</div>
			</div>
		</section>

		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row no-gutters">
					<div class="col-md-4 d-flex align-items-stretch">
						<div class="offer-deal text-center px-2 px-lg-5">
							<div class="img" style="background-image: url(${pageContext.request.contextPath}/beauty/images/offer-deal-1.jpg);"></div>
							<div class="text mt-4">
								<h3 class="mb-4">Book Your Treatment</h3>
								<p class="mb-5">
								   Premium beauty and skincare treatments, booked instantly.								 
								</p>

								<p><a href="${pageContext.request.contextPath}/salon/treatments/viewtreatments" class="btn btn-watch-video"> Book A Treatment <span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
					<div class="col-md-4 d-flex align-items-stretch">
						<div class="offer-deal active text-center px-2 px-lg-5">
							<div class="img" style="background-image: url(${pageContext.request.contextPath}/beauty/images/salon.jpg);"></div>
							<div class="text mt-4">
								<h3 class="mb-4">Book A Salon</h3>
								<p class="mb-5">  Find top-rated salons near you and book your appointment in minutes.</p>
								<p><a href="${pageContext.request.contextPath}/user/salons" class="btn btn-watch-video"> Book A Salon<span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
					<div class="col-md-4 d-flex align-items-stretch">
						<div class="offer-deal text-center px-2 px-lg-5">
							<div class="img" style="background-image: url(${pageContext.request.contextPath}/beauty/images/stylist.jpg);"></div>
							<div class="text mt-4">
								<h3 class="mb-4">Book A Stylist</h3>
								<p class="mb-5">Find professional stylists and book your perfect look with ease.</p>
								<p><a href="${pageContext.request.contextPath}/user/stylists" class="btn btn-watch-video"> Book A Stylist <span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- Salon Services Section -->
		<section class="ftco-section ftco-section-services bg-light py-5">
		  <div class="container-fluid px-md-5">

		    <!-- Section Heading -->
		    <div class="row justify-content-center mb-5">
		      <div class="col-md-8 heading-section text-center ftco-animate">
		        <h2 class="mb-3">Our Services</h2>
		        <p>
		          Discover our range of beauty and grooming treatments designed
		          to make you look and feel amazing.
		        </p>
		      </div>
		    </div>

		    <!-- Services Grid -->
		    <div class="row justify-content-center text-center">

		      <!-- Service 1 -->
		      <div class="col-md-6 col-lg-4 mb-4">
		        <div class="services p-4 h-100">
		          <div class="icon d-flex justify-content-center align-items-center rounded-circle mx-auto mb-3"
		               style="width:100px;height:100px;background:var(--fdf-plum);">
		            <i class="fa-solid fa-store fa-2x text-white"></i>
		          </div>
		          <h3>Explore Salons</h3>
		          <p>Find and book the best beauty salons near you for every occasion.</p>
		        </div>
		      </div>

		      <!-- Service 2 -->
		      <div class="col-md-6 col-lg-4 mb-4">
		        <div class="services p-4 h-100">
		          <div class="icon d-flex justify-content-center align-items-center rounded-circle mx-auto mb-3"
		               style="width:100px;height:100px;background:var(--fdf-plum);">
		            <i class="fa-solid fa-scissors fa-2x text-white"></i>
		          </div>
		          <h3>Explore Stylists</h3>
		          <p>Connect with verified professional stylists for your next makeover.</p>
		        </div>
		      </div>

		      <!-- Service 3 -->
		      <div class="col-md-6 col-lg-4 mb-4">
		        <div class="services p-4 h-100">
		          <div class="icon d-flex justify-content-center align-items-center rounded-circle mx-auto mb-3"
		               style="width:100px;height:100px;background:var(--fdf-plum);">
		            <i class="fa-solid fa-face-smile-beam fa-2x text-white"></i>
		          </div>
		          <h3>Skincare Treatments</h3>
		          <p>Discover premium skincare, spa, and relaxation treatments.</p>
		        </div>
		      </div>

		      <!-- Service 4 -->
		      <div class="col-md-6 col-lg-4 mb-4">
		        <div class="services p-4 h-100">
		          <div class="icon d-flex justify-content-center align-items-center rounded-circle mx-auto mb-3"
		               style="width:100px;height:100px;background:var(--fdf-plum);">
		            <i class="fa-solid fa-hand-sparkles fa-2x text-white"></i>
		          </div>
		          <h3>Exclusive Offers</h3>
		          <p>Grab limited-time offers and loyalty rewards on top salons and stylists.</p>
		        </div>
		      </div>

		      <!-- Service 5 -->
		      <div class="col-md-6 col-lg-4 mb-4">
		        <div class="services p-4 h-100">
		          <div class="icon d-flex justify-content-center align-items-center rounded-circle mx-auto mb-3"
		               style="width:100px;height:100px;background:var(--fdf-plum);">
		            <i class="fa-solid fa-calendar-check fa-2x text-white"></i>
		          </div>
		          <h3>Online Booking</h3>
		          <p>Choose your favorite service and book instantly at your convenience.</p>
		        </div>
		      </div>

		      <!-- Service 6 -->
		      <div class="col-md-6 col-lg-4 mb-4">
		        <div class="services p-4 h-100">
					<div class="icon d-flex justify-content-center align-items-center rounded-circle mx-auto mb-3"
					     style="width:100px;height:100px;background:var(--fdf-plum);">
					  <i class="fa-solid fa-headset fa-2x text-white"></i>
					</div>

		          <h3>Contact & Support</h3>
		          <p>Get quick help and personalized support for all your beauty needs.</p>
		        </div>
		      </div>

		    </div>
		  </div>
		</section>


		<section class="ftco-section">
		  <div class="container-fluid px-md-5">
		    <div class="row justify-content-center mb-5 pb-3">
		      <div class="col-md-12 heading-section ftco-animate text-center">
		        <h3 class="subheading">Why Choose Us</h3>
		       <h2 class="mb-1">Beauty & Skin Treatments</h2> 
		      </div>
		    </div>

		    <div class="row justify-content-center text-center">
		      <!-- Verified & Trusted -->
		      <div class="col-md-3 col-sm-6 d-flex align-items-stretch mb-4">
		        <div class="treatment w-100 ftco-animate border p-4 py-5 rounded">
					<div class="icon d-flex justify-content-center align-items-center">
															<span class="flaticon-candle"></span>
		          </div>
		          <div class="text mt-3">
		            <h5>Verified & Trusted</h5>
		            <p>We list only approved and trusted salons & stylists.</p>
		          </div>
		        </div>
		      </div>

		      <!-- Easy Booking -->
		      <div class="col-md-3 col-sm-6 d-flex align-items-stretch mb-4">
		        <div class="treatment w-100 ftco-animate border p-4 py-5 rounded">
		     	<div class="icon d-flex justify-content-center align-items-center">
															<span class="flaticon-spa-1"></span>
		          </div>
		          <div class="text mt-3">
		            <h5>Easy Booking</h5>
		            <p>Book your beauty sessions instantly without hassle.</p>
		          </div>
		        </div>
		      </div>

		      <!-- Exclusive Deals -->
		      <div class="col-md-3 col-sm-6 d-flex align-items-stretch mb-4">
		        <div class="treatment w-100 ftco-animate border p-4 py-5 rounded">
					<div class="icon d-flex justify-content-center align-items-center">
															<span class="flaticon-stone"></span>
		          </div>
		          <div class="text mt-3">
		            <h5>Exclusive Deals</h5>
		            <p>Enjoy regular offers and packages on premium services.</p>
		          </div>
		        </div>
		      </div>

		      <!-- Expert Hygiene -->
		      <div class="col-md-3 col-sm-6 d-flex align-items-stretch mb-4">
		        <div class="treatment w-100 ftco-animate border p-4 py-5 rounded">
					<div class="icon d-flex justify-content-center align-items-center">
															<span class="flaticon-lotus"></span>
		          </div>
		          <div class="text mt-3">
		            <h5>Expert Hygiene</h5>
		            <p>Clean, sanitized, and safety-certified beauty partners.</p>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>

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
    .btn-watch-video {
        background: rgba(166, 66, 129, 0.85) !important;
        color: #fff !important;
        border: 1px solid rgba(255,255,255,0.3) !important;
        backdrop-filter: blur(5px);
        padding: 12px 25px !important;
        border-radius: 50px !important;
        transition: 0.3s all ease;
        text-transform: uppercase;
        font-weight: 600;
        letter-spacing: 1px;
    }
    .btn-watch-video:hover {
        background: var(--fdf-mulberry) !important;
        box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        transform: translateY(-2px);
    }

    /* Why Choose Us Icons */
    .treatment .icon {
        width: 90px;
        height: 90px;
        margin: 0 auto;
        border-radius: 50%;
        background: rgba(166, 66, 129, 0.12);
        display: flex;
        align-items: center;
        justify-content: center;
        transition: 0.3s;
    }
    .treatment .icon span {
        color: var(--fdf-plum);
        font-size: 42px;
    }
    .treatment:hover .icon {
        background: linear-gradient(135deg, var(--fdf-plum), var(--fdf-mulberry));
    }
    .treatment:hover .icon span {
        color: #fff;
    }

    /* Services Section Icons */
    .services .icon {
        background: var(--fdf-plum) !important;
        transition: 0.3s;
    }
    .services:hover .icon {
        background: var(--fdf-mulberry) !important;
        transform: scale(1.1);
    }

    /* Pricing & Counts Accents */
    #section-counter .block-18 .text .number,
    .block-7 .price .number,
    .block-7 .price sup,
    .blog-entry .one .day,
    .ftco-intro .do-list li span,
    .subheading {
        color: var(--fdf-plum) !important;
    }

    /* Testimony Quotes */
    .testimony-section .quote {
        background: rgba(166, 66, 129, 0.15) !important;
    }
    .testimony-section .quote i {
        color: var(--fdf-plum) !important;
    }
    .testimony-wrap:hover .quote {
        background: var(--fdf-plum) !important;
    }
    .testimony-wrap:hover .quote i {
        color: #fff !important;
    }

    .hero-highlight-text {
        background: rgba(166, 66, 129, 0.15);
        display: inline-block;
        padding: 12px 30px;
        border-radius: 50px;
        backdrop-filter: blur(8px);
        border: 1px solid rgba(255, 255, 255, 0.25);
        font-weight: 500;
        font-size: 1.2rem;
        color: #fff;
        margin-bottom: 20px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        text-shadow: 0 2px 4px rgba(0,0,0,0.3);
    }

    /* Benefits List */
    .do-list li {
        color: #444;
        font-weight: 500;
    }

    /* 📱 Mobile Responsive Fixes */
    html, body {
        overflow-x: hidden;
        width: 100%;
    }
    @media (max-width: 768px) {
        .hero-wrap h1 {
            font-size: 2.5rem !important;
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

	            <a href="${pageContext.request.contextPath}#" class="btn btn-watch-video">Get Started</a>
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

	            <a href="${pageContext.request.contextPath}#" class="btn btn-watch-video">Get Started</a>
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

	            <a href="${pageContext.request.contextPath}#" class="btn btn-watch-video">Get Started</a>
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
	        <h3 class="subheading">Customer Reviews</h3>
	        <h2 class="mb-1">Successful Stories</h2>
	      </div>
	    </div>
	    <div class="row ftco-animate">
	      <div class="col-md-12">
	        <div class="carousel-testimony owl-carousel">

	          <!-- Story 1 -->
	          <div class="item">
	            <div class="testimony-wrap p-4 pb-5">
	              <div class="text">
	                <div class="line pl-5">
	                  <p class="mb-4 pb-1">“I had a bridal makeup session here and felt like a queen! The makeup lasted all day, and the stylist was super friendly and professional.”</p>
	                  <span class="quote d-flex align-items-center justify-content-center"><i class="icon-quote-left"></i></span>
	                </div>
	                <div class="d-flex align-items-center">
	                  <div class="user-img" style="background-image: url(${pageContext.request.contextPath}/beauty/images/person_1.jpg)"></div>
	                  <div class="ml-4">
	                    <p class="name">Anita Kapoor</p>
	                    <span class="position">Makeup Client</span>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>

	          <!-- Story 2 -->
	          <div class="item">
	            <div class="testimony-wrap p-4 pb-5">
	              <div class="text">
	                <div class="line pl-5">
	                  <p class="mb-4 pb-1">“The spa experience was heavenly! The therapists were skilled, the ambiance relaxing, and I left feeling completely rejuvenated.”</p>
	                  <span class="quote d-flex align-items-center justify-content-center"><i class="icon-quote-left"></i></span>
	                </div>
	                <div class="d-flex align-items-center">
	                  <div class="user-img" style="background-image: url(${pageContext.request.contextPath}/beauty/images/person_2.jpg)"></div>
	                  <div class="ml-4">
	                    <p class="name">Rohit Mehra</p>
	                    <span class="position">Spa Client</span>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>

	          <!-- Story 3 -->
	          <div class="item">
	            <div class="testimony-wrap p-4 pb-5">
	              <div class="text">
	                <div class="line pl-5">
	                  <p class="mb-4 pb-1">“I got a haircut and hair coloring done here, and I absolutely love the result! The staff gave great suggestions and made me feel confident.”</p>
	                  <span class="quote d-flex align-items-center justify-content-center"><i class="icon-quote-left"></i></span>
	                </div>
	                <div class="d-flex align-items-center">
	                  <div class="user-img" style="background-image: url(${pageContext.request.contextPath}/beauty/images/person_3.jpg)"></div>
	                  <div class="ml-4">
	                    <p class="name">Priya Sharma</p>
	                    <span class="position">Hair Client</span>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>

	          <!-- Story 4 -->
	          <div class="item">
	            <div class="testimony-wrap p-4 pb-5">
	              <div class="text">
	                <div class="line pl-5">
	                  <p class="mb-4 pb-1">“Their skincare treatments are amazing! My skin feels smooth, clear, and glowing after just a few sessions.”</p>
	                  <span class="quote d-flex align-items-center justify-content-center"><i class="icon-quote-left"></i></span>
	                </div>
	                <div class="d-flex align-items-center">
	                  <div class="user-img" style="background-image: url(${pageContext.request.contextPath}/beauty/images/person_4.jpg)"></div>
	                  <div class="ml-4">
	                    <p class="name">Simran Kaur</p>
	                    <span class="position">Skincare Client</span>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>

	          <!-- Story 5 -->
	          <div class="item">
	            <div class="testimony-wrap p-4 pb-5">
	              <div class="text">
	                <div class="line pl-5">
	                  <p class="mb-4 pb-1">“I tried their nail art services, and the results were fantastic! The designs are creative, precise, and lasted for weeks.”</p>
	                  <span class="quote d-flex align-items-center justify-content-center"><i class="icon-quote-left"></i></span>
	                </div>
	                <div class="d-flex align-items-center">
	                  <div class="user-img" style="background-image: url(${pageContext.request.contextPath}/beauty/images/person_5.jpg)"></div>
	                  <div class="ml-4">
	                    <p class="name">Ananya Joshi</p>
	                    <span class="position">Nail Client</span>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>

	          <!-- Story 6 -->
	          <div class="item">
	            <div class="testimony-wrap p-4 pb-5">
	              <div class="text">
	                <div class="line pl-5">
	                  <p class="mb-4 pb-1">“I booked a full makeover package and was blown away! The team made me feel special and the results were better than I imagined.”</p>
	                  <span class="quote d-flex align-items-center justify-content-center"><i class="icon-quote-left"></i></span>
	                </div>
	                <div class="d-flex align-items-center">
	                  <div class="user-img" style="background-image: url(${pageContext.request.contextPath}/beauty/images/person_6.jpg)"></div>
	                  <div class="ml-4">
	                    <p class="name">Neha Verma</p>
	                    <span class="position">Makeover Client</span>
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


    <section class="ftco-counter img" id="section-counter" style="background-image: url(${pageContext.request.contextPath}/beauty/images/bg_3.jpg);" data-stellar-background-ratio="0.5">
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


    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <h3 class="subheading">Blog</h3>
            <h2 class="mb-1">Recent Posts</h2>
          </div>
        </div>
        <div class="row d-flex">
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <a href="blog-single.html" class="block-20" style="background-image: url('${pageContext.request.contextPath}/beauty/images/image_1.jpg');">
              </a>
              <div class="text p-4 float-right d-block">
              	<div class="d-flex align-items-center pt-2 mb-4">
              		<div class="one">
              			<span class="day">25</span>
              		</div>
              		<div class="two">
              			<span class="yr">2019</span>
              			<span class="mos">September</span>
              		</div>
              	</div>
                <h3 class="heading mt-2"><a href="${pageContext.request.contextPath}#">Healthy Skin, Natural Glow</a></h3>
				<p>
				 Revitalize your skin with expert facials and treatments designed to nourish, hydrate, and enhance your natural glow.
				</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <a href="blog-single.html" class="block-20" style="background-image: url('${pageContext.request.contextPath}/beauty/images/image_2.jpg');">
              </a>
              <div class="text p-4 float-right d-block">
              	<div class="d-flex align-items-center pt-2 mb-4">
              		<div class="one">
              			<span class="day">25</span>
              		</div>
              		<div class="two">
              			<span class="yr">2019</span>
              			<span class="mos">September</span>
              		</div>
              	</div>
                <h3 class="heading mt-2"><a href="${pageContext.request.contextPath}#">Relax. Refresh. Renew.</a></h3>
				<p>
				 Indulge in soothing beauty treatments that relax your body, refresh your mind, and restore your confidence.
				</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry">
              <a href="blog-single.html" class="block-20" style="background-image: url('${pageContext.request.contextPath}/beauty/images/image_3.jpg');">
              </a>
              <div class="text p-4 float-right d-block">
              	<div class="d-flex align-items-center pt-2 mb-4">
              		<div class="one">
              			<span class="day">25</span>
              		</div>
              		<div class="two">
              			<span class="yr">2019</span>
              			<span class="mos">September</span>
              		</div>
              	</div>
                <h3 class="heading mt-2"><a href="${pageContext.request.contextPath}#">Style That Speaks Elegance</a></h3>
				<p>
				 From everyday styling to special occasions, our professional parlour services bring out your best look effortlessly.
				</p>
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
						<a href="${pageContext.request.contextPath}/beauty/images/gallery-1.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(/beauty/images/gallery-1.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="${pageContext.request.contextPath}/beauty/images/gallery-2.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(/beauty/images/gallery-2.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="${pageContext.request.contextPath}/beauty/images/gallery-3.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(/beauty/images/gallery-3.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="${pageContext.request.contextPath}/beauty/images/gallery-4.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(/beauty/images/gallery-4.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
        </div>
    	</div>
    </section>

	<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
<!--

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
		      <p> © Copyright <strong class="px-1 sitename">FightDFire</strong> All Rights Reserved</p>
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


		    </div>
</div>
</body>
		</html>














