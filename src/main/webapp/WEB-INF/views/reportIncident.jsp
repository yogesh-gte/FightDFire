<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Report Incident | Fight D Fear</title>
    
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&family=Montserrat:wght@800;900&display=swap" rel="stylesheet">
    
    <!-- CSS -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/Fight D Fear-theme.css" rel="stylesheet">
    
    <!-- Leaflet for Map -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />

    <style>
        :root {
            --r-bg: #fffcfd;
            --r-purple: #7C2D5E;
            --r-pink: #DB2777;
            --r-dark: #2D0B2E;
            --r-glass: rgba(255, 255, 255, 0.9);
            --r-shadow: 0 20px 40px rgba(45, 11, 46, 0.1);
        }

        body {
            font-family: 'Outfit', sans-serif;
            background-color: var(--r-bg);
            color: var(--r-dark);
        }

        .hero-mini {
            background: linear-gradient(135deg, var(--r-dark) 0%, var(--r-purple) 100%);
            padding: 80px 0 120px;
            color: white;
            text-align: center;
        }

        .hero-mini h1 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 900;
            font-size: 4rem;
            margin-bottom: 20px;
            background: linear-gradient(to right, #ffffff, var(--r-pink));
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }

        .form-card {
            background: var(--r-glass);
            backdrop-filter: blur(10px);
            border-radius: 30px;
            padding: 50px;
            margin-top: -80px;
            border: 1px solid rgba(124, 45, 94, 0.1);
            box-shadow: var(--r-shadow);
            z-index: 10;
            position: relative;
        }

        .section-tag {
            color: var(--r-pink);
            text-transform: uppercase;
            font-weight: 800;
            font-size: 0.8rem;
            letter-spacing: 2px;
            margin-bottom: 10px;
            display: block;
        }

        .form-label {
            font-weight: 700;
            color: var(--r-purple);
            margin-bottom: 10px;
            font-size: 0.95rem;
        }

        .fdf-input {
            border: 2px solid rgba(124, 45, 94, 0.1);
            border-radius: 15px;
            padding: 12px 20px;
            transition: 0.3s;
            font-weight: 500;
        }

        .fdf-input:focus {
            border-color: var(--r-pink);
            box-shadow: 0 0 0 4px rgba(219, 39, 119, 0.1);
        }

        #incidentMap {
            border-radius: 20px;
            border: 2px solid rgba(124, 45, 94, 0.1);
            box-shadow: inset 0 2px 10px rgba(0,0,0,0.05);
        }

        .map-search-container {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
        }

        .btn-gps {
            background: var(--r-purple);
            color: white;
            border-radius: 12px;
            width: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: none;
            transition: 0.3s;
        }

        .btn-gps:hover {
            background: var(--r-pink);
            transform: scale(1.05);
        }

        .location-badge {
            background: #fdf2f8;
            border: 1px solid rgba(219, 39, 119, 0.1);
            padding: 12px 20px;
            border-radius: 12px;
            font-size: 0.85rem;
            color: var(--r-pink);
            margin-top: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .btn-submit {
            background: linear-gradient(135deg, var(--r-purple) 0%, var(--r-pink) 100%);
            border: none;
            color: white;
            padding: 15px 40px;
            border-radius: 50px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: 0.3s;
            box-shadow: 0 10px 20px rgba(219, 39, 119, 0.2);
        }

        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(219, 39, 119, 0.3);
            filter: brightness(1.1);
        }

        #searchResults {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            z-index: 100;
            max-height: 200px;
            overflow-y: auto;
            display: none;
            margin-top: 5px;
        }

        .search-item {
            padding: 10px 15px;
            cursor: pointer;
            border-bottom: 1px solid #eee;
            font-size: 0.9rem;
        }

        .search-item:hover {
            background: #f9f9f9;
        }

        /* Header Visibility Fix */
        .header {
            background: rgba(255, 255, 255, 0.95) !important;
            box-shadow: 0 2px 20px rgba(0,0,0,0.1) !important;
        }
        .header .logo h1 {
            color: var(--r-purple) !important;
        }
        .navmenu ul li a {
            color: var(--r-purple) !important;
            font-weight: 600 !important;
        }
        .navmenu ul li a:hover, .navmenu ul li a.active {
            color: var(--r-pink) !important;
        }
        .mobile-nav-toggle {
            color: var(--r-purple) !important;
        }

        @media (max-width: 768px) {
            .form-card { padding: 30px 20px; border-radius: 0; margin-top: 0; }
            .hero-mini h1 { font-size: 2.5rem; }
        }
    </style>
</head>
<body>

    <!-- Header -->
<jsp:include page="/WEB-INF/views/fragments/header.jsp" />

    <!-- Hero Section -->
    <section class="hero-mini">
        <div class="container" data-aos="fade-down">
            <span class="section-tag" style="color: #ffd700; font-weight: 900; filter: drop-shadow(0 2px 4px rgba(0,0,0,0.3));">Safety First</span>
            <h1>Report an Incident</h1>
            <p class="mx-auto" style="max-width: 600px; font-weight: 600; color: rgba(255,255,255,0.95); text-shadow: 0 2px 10px rgba(0,0,0,0.2);">
                Your report helps us build a safer community. Provide as much detail as possible to assist in quick action.
            </p>
        </div>
    </section>

    <!-- Form Section -->
    <div class="container mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="form-card" data-aos="fade-up">
                    <div class="text-center mb-5">
                        <h2 style="font-weight: 800; color: var(--r-purple);">Official Incident Report</h2>
                        <div style="width: 60px; height: 4px; background: var(--r-pink); margin: 15px auto; border-radius: 2px;"></div>
                    </div>
                    <form action="${pageContext.request.contextPath}/incidents/report" method="post" enctype="multipart/form-data">
                        
                        <div class="row g-4">
                            <!-- Incident Type -->
                            <div class="col-md-6">
                                <label class="form-label"><i class="bi bi-shield-exclamation me-2"></i> What happened?</label>
                                <select name="type" class="form-select fdf-input" required>
                                    <option value="">-- Select Type --</option>
                                    <option value="HARASSMENT">Harassment</option>
                                    <option value="THEFT">Theft</option>
                                    <option value="ASSAULT">Assault</option>
                                    <option value="STALKING">Stalking</option>
                                    <option value="OTHER">Other</option>
                                </select>
                            </div>

                            <!-- Media Upload -->
                            <div class="col-md-6">
                                <label class="form-label"><i class="bi bi-camera me-2"></i> Evidence (Photo/Video)</label>
                                <input type="file" name="file" class="form-control fdf-input">
                            </div>

                            <!-- Location Picker -->
                            <div class="col-12 mt-5">
                                <label class="form-label"><i class="bi bi-geo-alt me-2"></i> Where did it happen?</label>
                                
                                <input type="hidden" name="location" id="locationValue" required>
                                <input type="hidden" name="latitude" id="latitudeValue">
                                <input type="hidden" name="longitude" id="longitudeValue">

                                <div class="map-search-container position-relative">
                                    <input type="text" id="locationSearch" class="form-control fdf-input flex-grow-1" placeholder="Search address or landmark...">
                                    <button type="button" class="btn-gps" onclick="useMyLocation()" title="Use Current GPS">
                                        <i class="bi bi-crosshairs"></i>
                                    </button>
                                    <div id="searchResults"></div>
                                </div>

                                <div id="incidentMap" style="width:100%; height:400px;"></div>

                                <div id="selectedLocation" class="location-badge" style="display: none;">
                                    <i class="bi bi-check-circle-fill"></i>
                                    <span id="selectedLocationText"></span>
                                </div>
                            </div>

                            <!-- Description -->
                            <div class="col-12 mt-5">
                                <label class="form-label"><i class="bi bi-chat-left-text me-2"></i> Additional Details</label>
                                <textarea name="description" rows="5" class="form-control fdf-input" placeholder="Provide details like time, people involved, or any other helpful info..." required></textarea>
                            </div>

                            <!-- Submit -->
                            <div class="col-12 text-center mt-5">
                                <button type="submit" class="btn btn-submit">
                                    Submit Official Report
                                </button>
                                <p class="text-muted small mt-3">
                                    <i class="bi bi-info-circle me-1"></i> For life-threatening emergencies, please call 112 or 100 immediately.
                                </p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Leaflet JS -->
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <script>
        // Map Logic
        (function() {
            var map = L.map('incidentMap').setView([20.5937, 78.9629], 5);
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; OpenStreetMap'
            }).addTo(map);

            var marker = null;
            var searchTimeout = null;

            map.on('click', function(e) {
                placeMarker(e.latlng.lat, e.latlng.lng);
                reverseGeocode(e.latlng.lat, e.latlng.lng);
            });

            function placeMarker(lat, lng) {
                if (marker) map.removeLayer(marker);
                marker = L.marker([lat, lng], { draggable: true }).addTo(map);
                document.getElementById('latitudeValue').value = lat;
                document.getElementById('longitudeValue').value = lng;
                
                marker.on('dragend', function(ev) {
                    var pos = ev.target.getLatLng();
                    document.getElementById('latitudeValue').value = pos.lat;
                    document.getElementById('longitudeValue').value = pos.lng;
                    reverseGeocode(pos.lat, pos.lng);
                });
            }

            function reverseGeocode(lat, lng) {
                fetch('https://nominatim.openstreetmap.org/reverse?format=json&lat='+lat+'&lon='+lng)
                    .then(r => r.json())
                    .then(data => {
                        var addr = data.display_name;
                        updateLocationDisplay(addr);
                    });
            }

            function updateLocationDisplay(address) {
                document.getElementById('locationValue').value = address;
                document.getElementById('locationSearch').value = address;
                document.getElementById('selectedLocationText').textContent = address;
                document.getElementById('selectedLocation').style.display = 'flex';
            }

            window.useMyLocation = function() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(pos => {
                        var lat = pos.coords.latitude;
                        var lng = pos.coords.longitude;
                        map.setView([lat, lng], 16);
                        placeMarker(lat, lng);
                        reverseGeocode(lat, lng);
                    });
                }
            };

            document.getElementById('locationSearch').addEventListener('input', function() {
                var q = this.value;
                clearTimeout(searchTimeout);
                if (q.length < 3) return;
                searchTimeout = setTimeout(() => {
                    fetch('https://nominatim.openstreetmap.org/search?format=json&q=' + encodeURIComponent(q))
                        .then(r => r.json())
                        .then(results => {
                            var box = document.getElementById('searchResults');
                            box.innerHTML = results.slice(0, 5).map(r => 
                                `<div class="search-item" onclick="selectAddr(\${r.lat}, \${r.lon}, '\${r.display_name.replace(/'/g, "\\\\'")}')">\${r.display_name}</div>`
                            ).join('');
                            box.style.display = 'block';
                        });
                }, 400);
            });

            window.selectAddr = function(lat, lng, name) {
                map.setView([lat, lng], 16);
                placeMarker(lat, lng);
                updateLocationDisplay(name);
                document.getElementById('searchResults').style.display = 'none';
            };
        })();
    </script>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />

    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
    <script>AOS.init();</script>
</body>
</html>

