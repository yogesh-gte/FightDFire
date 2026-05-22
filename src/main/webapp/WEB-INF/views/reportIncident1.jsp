<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    
	<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<title>Report an Incident</title>
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
			<style>
    /* ============================================
       ORIGINAL STYLES (kept exactly as is)
       ============================================ */
    :root {
        --primary-purple: #7C2D5E;
        --primary-purple-light: #a64281;
        --primary-coral: #DB2777;
        --primary-coral-dark: #5E1F47;
        --primary-teal: #20c997;
        --primary-gold: #ffd700;
        --dark-bg: #0f0f1a;
        --light-bg: #fffcfd;
        --gradient-primary: linear-gradient(135deg, #7C2D5E 0%, #a64281 50%, #DB2777 100%);
        --shadow-sm: 0 10px 30px rgba(0, 0, 0, 0.08);
        --shadow-md: 0 20px 40px rgba(0, 0, 0, 0.12);
        --shadow-lg: 0 30px 60px rgba(0, 0, 0, 0.15);
    }

    /* ========== APPLY BRAND COLORS TO EXISTING ELEMENTS ========== */
    
    /* Hero section background overlay (if .hero-wrap has overlay) */
    .hero-wrap {
        position: relative;
    }
    .hero-wrap::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(74, 14, 120, 0.6); /* var(--primary-purple) with opacity */
        z-index: 1;
    }
    .hero-wrap .container {
        position: relative;
        z-index: 2;
    }

    /* Headings and text */
    h1, h2, .hero-wrap h1, .hero-wrap h2 {
        color: #fff !important;
        text-shadow: 0 2px 10px rgba(0,0,0,0.3);
    }
    .ftco-animate h2 {
        color: var(--primary-purple) !important;
    }

    /* Primary buttons (btn-watch-video) */
    .btn-watch-video {
        background: var(--gradient-primary);
        border: none;
        color: white !important;
        border-radius: 40px;
        padding: 10px 28px;
        font-weight: 600;
        transition: all 0.3s ease;
        box-shadow: var(--shadow-sm);
    }
    .btn-watch-video:hover {
        transform: translateY(-3px);
        box-shadow: var(--shadow-md);
        background: linear-gradient(135deg, var(--primary-purple-light), var(--primary-coral-dark));
    }

    /* Outline button */
    .btn-outline-primary {
        border: 2px solid var(--primary-gold) !important;
        color: var(--primary-gold) !important;
        background: transparent;
        border-radius: 40px;
        transition: all 0.3s;
    }
    .btn-outline-primary:hover {
        background: var(--primary-gold) !important;
        color: var(--primary-purple) !important;
        transform: translateY(-3px);
    }

    /* Report container card */
    .report-container {
        background: white;
        border-radius: 28px;
        box-shadow: var(--shadow-md);
        transition: transform 0.2s, box-shadow 0.2s;
    }
    .report-container:hover {
        box-shadow: var(--shadow-lg);
    }

    /* Form labels */
    .form-group label {
        color: var(--primary-purple);
        font-weight: 600;
    }

    /* Form inputs & select */
    .form-control, select.form-control {
        border: 1px solid rgba(123, 44, 191, 0.3);
        border-radius: 12px;
        transition: all 0.2s;
    }
    .form-control:focus, select.form-control:focus {
        border-color: var(--primary-purple-light);
        box-shadow: 0 0 0 3px rgba(123, 44, 191, 0.2);
    }

    /* Map container border */
    #v_incidentMap {
        border: 2px solid var(--primary-purple-light) !important;
    }

    /* Selected location box */
    #v_selectedLocation {
        background: rgba(123, 44, 191, 0.05);
        border-left: 4px solid var(--primary-coral);
        color: var(--dark-bg);
    }

    /* Submit button (already uses btn-watch-video) */
    button[type="submit"] {
        background: var(--gradient-primary);
        border: none;
    }

    /* Back to Home button (btn-add) */
    .btn-add {
        display: inline-block;
        margin-top: 15px;
        background: var(--primary-purple-light);
        color: white;
        padding: 8px 20px;
        border-radius: 40px;
        text-decoration: none;
        transition: all 0.3s;
    }
    .btn-add:hover {
        background: var(--primary-purple);
        transform: translateY(-2px);
        color: white;
    }

    /* Adjust icon colors */
    .text-primary {
        color: var(--primary-purple-light) !important;
    }

    /* Responsive tweaks */
    @media (max-width: 768px) {
        .report-container {
            padding: 20px !important;
        }
        .btn-watch-video, .btn-outline-primary {
            padding: 8px 20px;
            font-size: 0.9rem;
        }
    }

    /* ============================================
       🚀 ADDITIONAL ENHANCEMENTS (no existing rules changed)
       ============================================ */

    /* 1. Smooth fade-in animation for the whole page */
    body {
        animation: fadeInPage 0.5s ease-out forwards;
    }
    @keyframes fadeInPage {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    /* 2. Hero text fade-in with staggered delay */
    .hero-wrap h1 {
        animation: fadeInUp 0.6s ease-out forwards;
    }
    .hero-wrap h2 {
        animation: fadeInUp 0.6s ease-out 0.1s forwards;
        opacity: 0;
        animation-fill-mode: forwards;
    }
    .hero-wrap p {
        animation: fadeInUp 0.6s ease-out 0.2s forwards;
        opacity: 0;
        animation-fill-mode: forwards;
    }
    .hero-wrap .btn-watch-video, .hero-wrap .btn-outline-primary {
        animation: fadeInUp 0.6s ease-out 0.3s forwards;
        opacity: 0;
        animation-fill-mode: forwards;
    }
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* 3. Button ripple effect on click (micro-interaction) */
    .btn-watch-video, .btn-outline-primary, .btn-add, button[type="submit"] {
        position: relative;
        overflow: hidden;
    }
    .btn-watch-video::after, .btn-outline-primary::after, .btn-add::after, button[type="submit"]::after {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 0;
        height: 0;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.4);
        transform: translate(-50%, -50%);
        transition: width 0.4s ease, height 0.4s ease;
        pointer-events: none;
    }
    .btn-watch-video:active::after, .btn-outline-primary:active::after,
    .btn-add:active::after, button[type="submit"]:active::after {
        width: 200px;
        height: 200px;
    }

    /* 4. Focus outlines for accessibility (keyboard navigation) */
    .btn-watch-video:focus-visible, .btn-outline-primary:focus-visible,
    .btn-add:focus-visible, button[type="submit"]:focus-visible,
    .form-control:focus-visible, select.form-control:focus-visible {
        outline: 3px solid var(--primary-gold);
        outline-offset: 2px;
        border-radius: 40px;
    }

    /* 5. Custom scrollbar (matches brand purple) */
    ::-webkit-scrollbar {
        width: 8px;
    }
    ::-webkit-scrollbar-track {
        background: var(--light-bg);
        border-radius: 10px;
    }
    ::-webkit-scrollbar-thumb {
        background: var(--primary-purple-light);
        border-radius: 10px;
    }
    ::-webkit-scrollbar-thumb:hover {
        background: var(--primary-purple);
    }

    /* 6. Form input hover effect – border darkens */
    .form-control:hover, select.form-control:hover {
        border-color: var(--primary-purple-light);
    }

    /* 7. Selected location box hover effect */
    #v_selectedLocation {
        transition: transform 0.2s, background 0.2s;
    }
    #v_selectedLocation:hover {
        transform: translateX(3px);
        background: rgba(123, 44, 191, 0.1);
    }

    /* 8. Report container lift enhancement (preserves original hover shadow) */
    .report-container {
        transition: transform 0.3s cubic-bezier(0.2, 0.9, 0.4, 1.1), box-shadow 0.3s;
    }
    .report-container:hover {
        transform: translateY(-6px);
    }

    /* 9. Label hover effect – subtle color shift */
    .form-group label {
        transition: color 0.2s, transform 0.2s;
        display: inline-block;
    }
    .form-group label:hover {
        color: var(--primary-purple-light);
        transform: translateX(2px);
    }

    /* 10. Responsive improvements for very small screens */
    @media (max-width: 480px) {
        .hero-wrap h1 {
            font-size: 1.8rem;
        }
        .hero-wrap h2 {
            font-size: 1.2rem;
        }
        .report-container {
            padding: 15px !important;
        }
        .btn-watch-video, .btn-outline-primary, .btn-add {
            padding: 6px 16px;
            font-size: 0.8rem;
        }
    }

    /* 11. Loading skeleton ready (optional – does nothing by default) */
    @keyframes shimmer {
        0% { background-position: -200% 0; }
        100% { background-position: 200% 0; }
    }
    .report-container.skeleton {
        background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
        background-size: 200% 100%;
        animation: shimmer 1.5s infinite;
        pointer-events: none;
    }
</style>
</head>
<body>
	

	<!-- ======= Header ======= -->
<jsp:include page="/WEB-INF/views/fragments/header.jsp" />
	<section class="hero-wrap"
	  style="background-image: url('${pageContext.request.contextPath}/beauty/images/bg_1.jpg'); 
	         min-height:80vh; 
	         padding-top:0;"
	>

	  <div class="container">
	    <div class="row no-gutters slider-text align-items-center justify-content-center">

	      <div class="col-md-10 ftco-animate text-center">

	        <div class="icon">
	          <span class="flaticon-lotus"></span>
	        </div>

	        <h1>Report an Incident</h1>
	        <h2>Your voice ensures a safer community.</h2>

	        <div class="row justify-content-center">
	          <div class="col-md-7 mb-3">
	            <p>
	              Help us maintain safety by reporting any unusual or concerning activity.
	              Your information stays confidential and contributes to a secure environment for everyone.
	            </p>
	          </div>
	        </div>

	        <p>
	          <a href="${pageContext.request.contextPath}/incidents/listForUser"
	             class="btn btn-watch-video btn-lg">
	            View All Reports
	          </a>

	          <a href="${pageContext.request.contextPath}/incidents/report"
	             class="btn btn-outline-primary btn-lg ml-md-2">
	            + Report a New Incident
	          </a>
	        </p>

	      </div>

	    </div>
	  </div>
	</section>

	<!-- 📝 Report an Incident Section (Full Width Form) -->
	<section id="reportFormSection" class="ftco-section bg-light py-5">
	  <div class="container-fluid px-5">

	    <!-- Heading -->
	    <div class="row justify-content-center mb-4">
	      <div class="col-md-10 text-center ftco-animate">
	        <h2>
	          <i class="fas fa-exclamation-triangle"></i> Report an Incident
	        </h2>
	        <p class="text-muted">
	          Please provide accurate details and upload any supporting media to help us take necessary action promptly.
	        </p>
	      </div>
	    </div>

	    <!-- Form -->
	    <div class="row justify-content-center">
	      <div class="col-12 col-lg-10">
	        <div class="report-container bg-white p-5 rounded shadow-sm ftco-animate mx-auto">

	          <form action="${pageContext.request.contextPath}/incidents/report"
	                method="post"
	                enctype="multipart/form-data">

	            <!-- Incident Type -->
	            <div class="form-group mb-4">
	              <label class="fw-semibold">
	                <i class="fas fa-list-alt me-2 text-primary"></i> Incident Type
	              </label>
	              <select name="type" class="form-control" required>
	                <option value="">-- Select Type --</option>
	                <option value="HARASSMENT">Harassment</option>
	                <option value="THEFT">Theft</option>
	                <option value="ASSAULT">Assault</option>
	                <option value="OTHER">Other</option>
	              </select>
	            </div>

	            <!-- Location - Interactive Map Picker -->
	            <div class="form-group mb-4">
	              <label class="fw-semibold">
	                <i class="fas fa-map-marker-alt me-2 text-primary"></i> Location
	              </label>
	              <input type="hidden" name="location" id="v_locationValue" required>
	              <div class="d-flex gap-2 mb-2">
	                <div class="position-relative flex-grow-1">
	                  <input type="text" id="v_locationSearch" class="form-control"
	                         placeholder="Search a place or click on map..." autocomplete="off">
	                  <div id="v_searchResults" style="
	                    position:absolute; top:100%; left:0; right:0; z-index:1000;
	                    background:#fff; border:1px solid #ddd; border-radius:8px;
	                    max-height:200px; overflow-y:auto; display:none;
	                    box-shadow:0 8px 24px rgba(0,0,0,0.12);"></div>
	                </div>
	                <button type="button" class="btn btn-outline-primary" id="v_gpsBtn" onclick="vUseMyLocation()" title="Use my current location">
	                  <i class="fas fa-crosshairs"></i>
	                </button>
	              </div>
	              <div id="v_incidentMap" style="width:100%; height:320px; border-radius:12px; border:2px solid #e0e0e0; overflow:hidden;"></div>
	              <div id="v_selectedLocation" style="
	                margin-top:8px; padding:10px 14px; background:#f0f7ff;
	                border:1px solid #cce0ff; border-radius:8px; font-size:13px;
	                color:#333; display:none;">
	                <i class="fas fa-map-pin text-primary me-2"></i>
	                <span id="v_selectedLocationText"></span>
	              </div>
	            </div>
	            <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
	            <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
	            <script>
	            (function() {
	              var map = L.map('v_incidentMap').setView([20.5937, 78.9629], 5);
	              L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	                attribution: '&copy; OpenStreetMap', maxZoom: 19
	              }).addTo(map);
	              var marker = null, searchTimeout = null;
	              map.on('click', function(e) {
	                placeMarker(e.latlng.lat, e.latlng.lng);
	                reverseGeocode(e.latlng.lat, e.latlng.lng);
	              });
	              function placeMarker(lat, lng) {
	                if (marker) map.removeLayer(marker);
	                marker = L.marker([lat, lng], { draggable: true }).addTo(map);
	                marker.on('dragend', function(ev) { var p=ev.target.getLatLng(); reverseGeocode(p.lat, p.lng); });
	              }
	              function reverseGeocode(lat, lng) {
	                fetch('https://nominatim.openstreetmap.org/reverse?format=json&lat='+lat+'&lon='+lng+'&zoom=18')
	                  .then(function(r){return r.json();})
	                  .then(function(d){ setLoc(d.display_name || (lat.toFixed(6)+', '+lng.toFixed(6))); })
	                  .catch(function(){ setLoc(lat.toFixed(6)+', '+lng.toFixed(6)); });
	              }
	              function setLoc(addr) {
	                document.getElementById('v_locationValue').value = addr;
	                document.getElementById('v_locationSearch').value = addr;
	                document.getElementById('v_selectedLocationText').textContent = addr;
	                document.getElementById('v_selectedLocation').style.display = 'block';
	              }
	              window.vUseMyLocation = function() {
	                if (!navigator.geolocation) { alert('Geolocation not supported.'); return; }
	                var btn = document.getElementById('v_gpsBtn');
	                btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i>'; btn.disabled = true;
	                navigator.geolocation.getCurrentPosition(
	                  function(pos) { map.setView([pos.coords.latitude,pos.coords.longitude],16); placeMarker(pos.coords.latitude,pos.coords.longitude); reverseGeocode(pos.coords.latitude,pos.coords.longitude); btn.innerHTML='<i class="fas fa-crosshairs"></i>'; btn.disabled=false; },
	                  function() { alert('Unable to get location.'); btn.innerHTML='<i class="fas fa-crosshairs"></i>'; btn.disabled=false; },
	                  { enableHighAccuracy:true, timeout:10000 }
	                );
	              };
	              document.getElementById('v_locationSearch').addEventListener('input', function() {
	                var q=this.value.trim(); clearTimeout(searchTimeout);
	                if(q.length<3){document.getElementById('v_searchResults').style.display='none';return;}
	                searchTimeout=setTimeout(function(){
	                  fetch('https://nominatim.openstreetmap.org/search?format=json&q='+encodeURIComponent(q)+'&limit=5&countrycodes=in')
	                    .then(function(r){return r.json();})
	                    .then(function(res){
	                      var box=document.getElementById('v_searchResults');
	                      if(!res.length){box.style.display='none';return;}
	                      box.innerHTML=res.map(function(r){
	                        return '<div style="padding:10px 14px;cursor:pointer;border-bottom:1px solid #eee;font-size:13px;" onmouseover="this.style.background=\'#f5f5f5\'" onmouseout="this.style.background=\'#fff\'" onclick="window._vSelect('+r.lat+','+r.lon+',\''+r.display_name.replace(/'/g,"\\'")+'\')">'+'<i class="fas fa-map-marker-alt text-primary me-2"></i>'+r.display_name+'</div>';
	                      }).join(''); box.style.display='block';
	                    });
	                },400);
	              });
	              window._vSelect=function(lat,lng,name){map.setView([lat,lng],16);placeMarker(lat,lng);setLoc(name);document.getElementById('v_searchResults').style.display='none';};
	              document.addEventListener('click',function(e){if(!e.target.closest('#v_locationSearch')&&!e.target.closest('#v_searchResults'))document.getElementById('v_searchResults').style.display='none';});
	              setTimeout(function(){map.invalidateSize();},500);
	            })();
	            </script>

	            <!-- Description -->
	            <div class="form-group mb-4">
	              <label class="fw-semibold">
	                <i class="fas fa-align-left me-2 text-primary"></i> Description
	              </label>
	              <textarea name="description"
	                        rows="5"
	                        class="form-control"
	                        placeholder="Describe the incident..."
	                        required></textarea>
	            </div>

	            <!-- Media Upload -->
	            <div class="form-group mb-4">
	              <label class="fw-semibold">
	                <i class="fas fa-upload me-2 text-primary"></i> Upload Media Evidence (optional)
	              </label>
	              <input type="file" name="file" class="form-control">
	            </div>

	            <!-- Submit -->
	            <div class="text-center">
	              <button type="submit" class="btn btn-watch-video btn-lg">
	                <i class="fas fa-paper-plane me-2"></i> Submit Report
	              </button>
	            </div>
	            <div class="text-center">
<a href="${pageContext.request.contextPath}/volunteer/dashboard" class="btn-add">
            <i class="fas fa-home"></i> Back to Home
        </a>
        </div>
	          </form>

	        </div>
	      </div>
	    </div>

	  </div>
	</section>


	

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

					  </body>
					  </html>
