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
    --fdf-plum: #312e81;
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
  <div id="wrapper">
    <jsp:include page="/WEB-INF/views/fragments/sidebar.jsp" />
    <div id="page-content-wrapper">
        <jsp:include page="/WEB-INF/views/fragments/header.jsp" />
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
        
        body {
            font-family: 'Poppins', sans-serif;
            background: var(--glow-bg);
            color: var(--fdf-text);
            overflow-x: hidden;
        }

        /* Floating background blobs */
        .glow-bg-layer {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            z-index: -1;
            overflow: hidden;
            pointer-events: none;
        }
        .blob {
            position: absolute;
            width: 500px; height: 500px;
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.12;
            animation: floatBlob 20s infinite alternate;
        }
        .blob-1 { top: -100px; right: -100px; background: var(--brand-purple); }
        .blob-2 { bottom: -150px; left: -150px; background: var(--brand-pink); animation-delay: -5s; }
        
        @keyframes floatBlob {
            0% { transform: translate(0, 0) scale(1); }
            100% { transform: translate(40px, 30px) scale(1.15); }
        }

        /* Clean Minimal Header */
        .glow-header {
            padding: 60px 20px 40px;
            text-align: center;
            background: white;
            border-bottom: 1px solid var(--fdf-border);
            position: relative;
        }
        .glow-header h1 {
            font-family: 'Montserrat', sans-serif;
            font-size: 38px;
            font-weight: 900;
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 10px;
        }
        .glow-header p {
            color: var(--fdf-muted);
            font-size: 15px;
            max-width: 650px;
            margin: 0 auto;
            line-height: 1.6;
        }

        /* Top navigation */
        .top-bar {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            padding: 16px 30px;
            position: absolute;
            top: 0; right: 0;
            width: 100%;
        }
        .top-btn {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 10px 20px;
            border-radius: 999px;
            background: #fff;
            border: 1px solid var(--fdf-border);
            color: var(--brand-purple);
            text-decoration: none;
            font-size: 13px;
            font-weight: 700;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-sm);
        }
        .top-btn:hover {
            background: var(--brand-purple);
            color: #fff;
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        /* Sub Navigation Pills */
        .glow-nav {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-top: 30px;
            flex-wrap: wrap;
        }
        .glow-nav a {
            padding: 10px 24px;
            border-radius: 999px;
            background: #fff;
            border: 1px solid var(--fdf-border);
            color: var(--fdf-muted);
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s;
        }
        .glow-nav a:hover, .glow-nav a.active {
            background: var(--gradient-primary);
            color: #fff;
            border-color: transparent;
            box-shadow: 0 4px 15px rgba(124, 45, 94, 0.2);
        }

        /* Stylists Grid */
        .stylists-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(290px, 1fr));
            gap: 25px;
            padding: 40px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .stylist-card {
            background: var(--card-bg);
            border: 1px solid var(--fdf-border);
            border-radius: 20px;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-sm);
            display: flex;
            flex-direction: column;
            text-align: center;
        }
        .stylist-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow-lg);
            border-color: var(--brand-pink-light);
        }
        .stylist-img-wrapper {
            position: relative;
            overflow: hidden;
            height: 280px;
            background-color: #faf8f9;
        }
        .stylist-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        .stylist-card:hover .stylist-img {
            transform: scale(1.06);
        }
        .stylist-img-placeholder {
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #fdf2f8, #f5f3ff);
            font-size: 48px;
            color: var(--brand-pink-light);
        }
        .stylist-body {
            padding: 24px;
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }
        .stylist-name {
            font-size: 19px;
            font-weight: 800;
            color: var(--brand-purple);
            margin-bottom: 6px;
        }
        .stylist-spec {
            font-size: 13px;
            font-weight: 700;
            color: var(--brand-pink);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 12px;
        }
        .stylist-salon {
            font-size: 13px;
            color: var(--fdf-muted);
            margin-bottom: 20px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
        }
        .stylist-salon i {
            color: var(--brand-purple-dark);
        }
        .btn-stylist-action {
            display: block;
            width: 100%;
            padding: 10px 20px;
            border-radius: 12px;
            font-size: 13px;
            font-weight: 700;
            text-align: center;
            border: none;
            transition: all 0.2s;
            text-decoration: none;
            background: var(--gradient-primary);
            color: #fff;
        }
        .btn-stylist-action:hover {
            filter: brightness(1.1);
            color: #fff;
            transform: scale(1.02);
        }
        
        .empty-stylists {
            text-align: center;
            padding: 80px 20px;
            color: var(--fdf-muted);
        }
        
        @media (max-width: 768px) {
            .glow-header { padding-top: 30px; padding-bottom: 20px; }
            .top-bar {
                position: relative;
                justify-content: center;
                padding: 10px;
                flex-wrap: wrap;
                gap: 8px;
                margin-bottom: 15px;
            }
            .top-btn {
                padding: 8px 14px;
                font-size: 12px;
                margin-right: 0 !important;
            }
            .glow-header h1 { font-size: 28px; }
            .glow-nav { gap: 8px; margin-top: 20px; }
            .glow-nav a { padding: 8px 16px; font-size: 12px; }
            .stylists-grid {
                grid-template-columns: 1fr;
                gap: 20px;
                padding: 20px 15px;
            }
        }
    </style>
</head>
<body>

<!-- Header -->
<jsp:include page="/WEB-INF/views/fragments/header.jsp" />

<div id="wrapper">
    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/fragments/sidebar.jsp" />
    
    <!-- Content wrapper -->
    <div id="page-content-wrapper" style="min-height: 100vh; overflow-x: hidden;">
        
        <!-- Blobs overlay -->
        <div class="glow-bg-layer">
            <div class="blob blob-1"></div>
            <div class="blob blob-2"></div>
        </div>

        <!-- Dashboard Header -->
        <div class="glow-header">
            <div class="top-bar">
                <a href="${pageContext.request.contextPath}/users/dashboard" class="top-btn" style="margin-right: auto;">
                    <i class="bi bi-house-door"></i> Home
                </a>
                <a href="${pageContext.request.contextPath}/user/bookings" class="top-btn">
                    <i class="bi bi-calendar-event"></i> My Bookings
                </a>
            </div>
            
            <h1>Verified Stylists</h1>
            <p>Connect with top styling and makeover experts. View portfolios, specialization areas, and book personalized styling sessions.</p>
            
            <!-- Category Navigation Tab Pills -->
            <div class="glow-nav">
                <a href="${pageContext.request.contextPath}/index/templates">Overview</a>
                <a href="${pageContext.request.contextPath}/user/salons">Explore Salons</a>
                <a href="${pageContext.request.contextPath}/salon/treatments/viewtreatments">SkinCare Treatments</a>
                <a href="${pageContext.request.contextPath}/user/stylists" class="active">Stylists</a>
                <a href="${pageContext.request.contextPath}/salon/offers">Discounts &amp; Offers</a>
            </div>
        </div>

        <!-- Stylists Grid -->
        <div class="stylists-grid">
            <c:forEach var="stylist" items="${stylists}">
                <div class="stylist-card" data-aos="fade-up">
                    <div class="stylist-img-wrapper">
                        <c:choose>
                            <c:when test="${not empty stylist.profileImage}">
                                <img src="${pageContext.request.contextPath}${stylist.profileImage}" class="stylist-img" alt="${stylist.firstName}">
                            </c:when>
                            <c:otherwise>
                                <div class="stylist-img-placeholder">
                                    <i class="bi bi-person-fill"></i>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="stylist-body">
                        <h3 class="stylist-name">${stylist.firstName} ${stylist.lastName}</h3>
                        
                        <div class="stylist-spec">${stylist.specialization}</div>
                        
                        <div class="stylist-salon">
                            <i class="bi bi-shop"></i>
                            <c:choose>
                                <c:when test="${stylist.salon != null}">
                                    <span>${stylist.salon.name}</span>
                                </c:when>
                                <c:otherwise>
                                    <span>Independent Specialist</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        
                        <a href="${pageContext.request.contextPath}/user/stylist/view?id=${stylist.id}" class="btn-stylist-action">
                            View Details
                        </a>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty stylists}">
                <div class="empty-stylists col-12">
                    <i class="bi bi-people-fill display-1 mb-3 text-muted"></i>
                    <h3>No stylists listed</h3>
                    <p>Stylists have not updated their listings yet. Please check back later!</p>
                </div>
            </c:if>
        </div>

        <!-- Footer -->
        <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />

    </div><!-- /#page-content-wrapper -->
</div><!-- /#wrapper -->

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


     </div>
</div>

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

<script>
    AOS.init({
        duration: 800,
        easing: 'ease-in-out',
        once: true
    });
</script>

</body>
</html>
