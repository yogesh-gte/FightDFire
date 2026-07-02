<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/Fight D Fear-theme.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/doctor-list.css">
</head>
<body class="dl-page">

<jsp:include page="/WEB-INF/views/fragments/header.jsp" />
    <section class="dl-hero">
        <a href="${pageContext.request.contextPath}/users/dashboard" class="dl-back">
            <i class="bi bi-arrow-left"></i>
        </a>
        <h1>Find Your Doctor</h1>
        <p>Connect with trusted, verified female healthcare professionals dedicated to your well-being.</p>
        
        <div class="dl-search-wrap">
            <i class="bi bi-search"></i>
            <input type="text" id="searchInput" placeholder="Search by name, specialization, or city..." oninput="filterDoctors()">
        </div>
    </section>

    <!-- Categories Filters -->
    <div class="dl-categories">
        <div class="dl-cat-scroll">
            <button class="dl-cat-pill active" onclick="filterCategory(this,'all')"><i class="bi bi-grid-fill"></i> All</button>
            <button class="dl-cat-pill" onclick="filterCategory(this,'Gynecologist')"><i class="bi bi-gender-female"></i> Gynecologist</button>
            <button class="dl-cat-pill" onclick="filterCategory(this,'Psychologist')"><i class="bi bi-brain-fill"></i> Psychologist</button>
            <button class="dl-cat-pill" onclick="filterCategory(this,'General Physician')"><i class="bi bi-heart-pulse-fill"></i> General Physician</button>
            <button class="dl-cat-pill" onclick="filterCategory(this,'Dermatologist')"><i class="bi bi-droplet-fill"></i> Dermatologist</button>
            <button class="dl-cat-pill" onclick="filterCategory(this,'Pediatrician')"><i class="bi bi-emoji-smile-fill"></i> Pediatrician</button>
            <button class="dl-cat-pill" onclick="filterCategory(this,'Nutritionist')"><i class="bi bi-cup-straw"></i> Nutritionist</button>
        </div>
    </div>

    <!-- Main Content -->
    <div class="dl-content">
        <c:if test="${not empty message}">
            <div class="alert-success-custom mb-4" style="background: #f0fdf4; color: #16a34a; padding: 15px 25px; border-radius: 16px; border: 1px solid rgba(22, 163, 74, 0.1); font-weight: 600;">
                <i class="bi bi-check-circle-fill me-2"></i> ${message}
            </div>
        </c:if>

        <div class="dl-count">
            <i class="bi bi-info-circle me-1"></i> Showing <span id="visibleCount">${doctors.size()}</span> verified medical experts
        </div>

        <c:if test="${empty doctors}">
            <div class="dl-empty">
                <i class="bi bi-clipboard-x display-1 opacity-25"></i>
                <h3 class="mt-4">No Doctors Found</h3>
                <p>We're currently expanding our network. Please check back soon.</p>
            </div>
        </c:if>

        <div class="dl-grid" id="doctorGrid">
            <c:forEach var="d" items="${doctors}">
                <div class="dl-card" 
                     data-name="${d.fullName}" 
                     data-spec="${d.specialization}" 
                     data-city="${d.city}" 
                     data-loc="${d.locationText}">
                    
                    <div class="dl-card-top">
                        <div class="dl-avatar">
                            <c:choose>
                                <c:when test="${not empty d.profilePhotoPath}">
                                    <img src="${pageContext.request.contextPath}${d.profilePhotoPath}" alt="${d.fullName}">
                                </c:when>
                                <c:otherwise>${d.fullName.charAt(0)}</c:otherwise>
                            </c:choose>
                        </div>
                        <div class="dl-info">
                            <div class="d-flex justify-content-between align-items-start">
                                <span class="spec">${d.specialization}</span>
                                <div class="dl-rating"><i class="bi bi-star-fill"></i> ${d.rating}</div>
                            </div>
                            <h3>${d.fullName}</h3>
                            <div class="loc"><i class="bi bi-geo-alt-fill"></i> ${d.locationText != null ? d.locationText : 'Location not set'}</div>
                        </div>
                    </div>

                    <div class="dl-tags">
                        <c:if test="${d.qualification != null}"><span class="dl-tag"><i class="bi bi-mortarboard me-1"></i> ${d.qualification}</span></c:if>
                        <c:if test="${d.experienceYears != null}"><span class="dl-tag exp"><i class="bi bi-clock-history me-1"></i> ${d.experienceYears} Years</span></c:if>
                        <c:if test="${d.consultationType != null}"><span class="dl-tag online"><i class="bi bi-laptop me-1"></i> ${d.consultationType}</span></c:if>
                        <c:if test="${d.emergencyAvailable != null && d.emergencyAvailable}"><span class="dl-tag emg"><i class="bi bi-lightning-fill me-1"></i> Emergency</span></c:if>
                    </div>

                    <div class="dl-divider"></div>

                    <div class="dl-actions">
                        <a href="${pageContext.request.contextPath}/doctors/chat/${d.id}" class="dl-act-btn chat"><i class="bi bi-chat-dots-fill"></i> Chat</a>
                        <a href="${pageContext.request.contextPath}/doctors/voice-call/${d.id}" target="_blank" class="dl-act-btn call"><i class="bi bi-telephone-fill"></i> Call</a>
                        <a href="${pageContext.request.contextPath}/doctors/video-call/${d.id}" target="_blank" class="dl-act-btn video"><i class="bi bi-camera-video-fill"></i> Video</a>
                        <a href="${pageContext.request.contextPath}/doctors/view/${d.id}" class="dl-act-btn book">View Profile & Book <i class="bi bi-arrow-right-short"></i></a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script>
        let activeCategory = 'all';

        function filterCategory(btn, cat) {
            document.querySelectorAll('.dl-cat-pill').forEach(p => p.classList.remove('active'));
            btn.classList.add('active');
            activeCategory = cat;
            filterDoctors();
        }

        function filterDoctors() {
            const q = document.getElementById('searchInput').value.toLowerCase();
            const cards = document.querySelectorAll('.dl-card');
            let count = 0;
            
            cards.forEach(c => {
                const name = (c.dataset.name || '').toLowerCase();
                const spec = (c.dataset.spec || '').toLowerCase();
                const city = (c.dataset.city || '').toLowerCase();
                const loc = (c.dataset.loc || '').toLowerCase();
                
                const matchSearch = !q || name.includes(q) || spec.includes(q) || city.includes(q) || loc.includes(q);
                const matchCat = activeCategory === 'all' || spec.includes(activeCategory.toLowerCase());
                
                if (matchSearch && matchCat) {
                    c.style.display = 'flex';
                    count++;
                } else {
                    c.style.display = 'none';
                }
            });
            document.getElementById('visibleCount').textContent = count;
        }
    </script>
    <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>

