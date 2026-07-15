<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fitness & Wellness Hub</title>
    <!-- Bootstrap & Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #f43f5e;
            --primary-light: #ffe4e6;
            --dark-navy: #1e1b4b;
            --glass-bg: rgba(255, 255, 255, 0.85);
            --gradient: linear-gradient(135deg, #1e1b4b 0%, #312e81 50%, #f43f5e 100%);
            --shadow: 0 10px 30px rgba(244, 63, 94, 0.08);
        }
        body {
            font-family: 'Outfit', sans-serif;
            background-color: #f8fafc;
            color: var(--dark-navy);
        }
        .hero-banner {
            background: linear-gradient(135deg, #1e1b4b 0%, #0f172a 100%);
            color: white;
            padding: 60px 0;
            border-radius: 0 0 40px 40px;
            margin-bottom: 40px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            position: relative;
            overflow: hidden;
        }
        .hero-banner::after {
            content: '';
            position: absolute;
            top: -50%; right: -10%;
            width: 300px; height: 300px;
            background: radial-gradient(circle, rgba(244, 63, 94, 0.3) 0%, transparent 70%);
            pointer-events: none;
        }
        .category-chip {
            background: white;
            color: var(--dark-navy);
            border: 1px solid rgba(0,0,0,0.06);
            border-radius: 30px;
            padding: 10px 22px;
            font-weight: 600;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
            white-space: nowrap;
            box-shadow: 0 4px 10px rgba(0,0,0,0.02);
        }
        .category-chip:hover, .category-chip.active {
            background: var(--gradient);
            color: white;
            border-color: transparent;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(16, 185, 129, 0.2);
        }
        .trainer-card {
            background: var(--glass-bg);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255,255,255,0.4);
            border-radius: 24px;
            padding: 25px;
            box-shadow: var(--shadow);
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        .trainer-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 35px rgba(16, 185, 129, 0.15);
            border-color: var(--primary);
        }
        .avatar-img {
            width: 85px;
            height: 85px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }
        .rating-badge {
            background: #fffbeb;
            color: #d97706;
            border-radius: 8px;
            padding: 4px 10px;
            font-weight: 700;
            font-size: 0.82rem;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        .tag-chip {
            font-size: 0.72rem;
            font-weight: 600;
            background: var(--primary-light);
            color: #065f46;
            padding: 4px 10px;
            border-radius: 12px;
            margin: 2px;
            display: inline-block;
        }
        .fee-tag {
            font-size: 1.25rem;
            font-weight: 800;
            color: var(--primary);
        }
        .btn-book {
            background: var(--gradient);
            color: white;
            font-weight: 600;
            border-radius: 30px;
            border: none;
            padding: 10px 20px;
            transition: all 0.3s;
        }
        .btn-book:hover {
            opacity: 0.9;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(16, 185, 129, 0.2);
            color: white;
        }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/views/fragments/header.jsp" />

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar Navigation Included -->
        <jsp:include page="/WEB-INF/views/fragments/sidebar.jsp" />
        
        <div class="col-md-9 col-lg-10 p-0">
            <!-- Hero banner -->
            <div class="hero-banner px-5">
                <div class="container-fluid text-center text-md-start">
                    <div class="row align-items-center">
                        <div class="col-md-8">
                            <span class="badge bg-success mb-2 px-3 py-2" style="border-radius:20px; font-weight:600;">Empower & Wellness</span>
                            <h1 class="display-5 fw-extrabold text-white">Fitness & Wellness Platform</h1>
                            <p class="lead opacity-90 text-white-50">Book certified personal trainers, zumba guides, yoga mentors, and self-defense coaches instantly.</p>
                        </div>
                        <div class="col-md-4 text-md-end mt-3 mt-md-0">
                            <a href="${pageContext.request.contextPath}/fitness/bookings" class="btn btn-light btn-sm fw-bold px-4 py-2 me-2" style="border-radius:30px;">
                                <i class="bi bi-calendar-check me-1"></i> My Bookings
                            </a>
                            <a href="${pageContext.request.contextPath}/fitness/trainer/register" class="btn btn-outline-light btn-sm fw-bold px-4 py-2" style="border-radius:30px;">
                                Trainer Sign Up
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Page contents -->
            <div class="container-fluid px-5 pb-5">
                <c:if test="${not empty success}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert" style="border-radius: 15px;">
                        <i class="bi bi-check-circle-fill me-2"></i> ${success}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <!-- Search and Filters Form -->
                <form method="GET" action="${pageContext.request.contextPath}/fitness" class="row g-3 mb-5 align-items-end" style="background: white; padding: 25px; border-radius: 24px; box-shadow: var(--shadow);">
                    <div class="col-md-4">
                        <label class="form-label text-xs fw-bold text-muted uppercase">Search Trainer Name</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-0"><i class="bi bi-search"></i></span>
                            <input type="text" name="search" class="form-control bg-light border-0" value="${search}" placeholder="Trainer Name..." style="border-radius: 0 10px 10px 0;">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label text-xs fw-bold text-muted uppercase">Maximum Session Fee</label>
                        <input type="number" name="maxPrice" class="form-control bg-light border-0" value="${maxPrice}" placeholder="e.g. 500 Rs" style="border-radius:10px;">
                    </div>
                    <div class="col-md-3">
                        <label class="form-label text-xs fw-bold text-muted uppercase">Minimum Rating</label>
                        <select name="minRating" class="form-select bg-light border-0" style="border-radius:10px;">
                            <option value="">Any Rating</option>
                            <option value="4.0" ${minRating eq 4.0 ? 'selected' : ''}>4.0+ Stars</option>
                            <option value="4.5" ${minRating eq 4.5 ? 'selected' : ''}>4.5+ Stars</option>
                        </select>
                    </div>
                    <input type="hidden" name="category" value="${selectedCategory}">
                    <div class="col-md-2 d-grid">
                        <button type="submit" class="btn btn-book py-2.5">Apply Filters</button>
                    </div>
                </form>

                <!-- Categories Horizontal Row -->
                <div class="mb-4">
                    <h5 class="fw-bold mb-3"><i class="bi bi-grid-fill text-success me-2"></i> Browse Specializations</h5>
                    <div class="d-flex gap-2 overflow-x-auto pb-3 scrollbar-hide">
                        <a href="${pageContext.request.contextPath}/fitness" class="category-chip ${empty selectedCategory ? 'active' : ''}">All Specializations</a>
                        <c:forEach var="cat" items="${categories}">
                            <a href="${pageContext.request.contextPath}/fitness?category=${cat}" class="category-chip ${selectedCategory eq cat ? 'active' : ''}">
                                ${cat}
                            </a>
                        </c:forEach>
                    </div>
                </div>

                <!-- Trainers Grid -->
                <div>
                    <h5 class="fw-bold mb-4"><i class="bi bi-people-fill text-success me-2"></i> Active Trainers</h5>
                    
                    <c:choose>
                        <c:when test="${empty trainers}">
                            <div class="text-center py-5" style="background:white; border-radius: 20px; box-shadow: var(--shadow);">
                                <i class="bi bi-emoji-smile text-muted" style="font-size: 3rem;"></i>
                                <h5 class="mt-3 text-muted">No trainers found matching your filters.</h5>
                                <p class="text-xs text-muted mb-0">Try clearing searches or picking another specialization.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="row g-4">
                                <c:forEach var="t" items="${trainers}">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="trainer-card">
                                            <div class="d-flex align-items-center gap-3 mb-3">
                                                <img src="${not empty t.profilePhotoPath ? t.profilePhotoPath : 'https://images.unsplash.com/photo-1544005313-94ddf0286df2'}" alt="${t.fullName}" class="avatar-img">
                                                <div>
                                                    <h5 class="fw-bold mb-1">${t.fullName}</h5>
                                                    <span class="rating-badge">
                                                        <i class="bi bi-star-fill"></i> ${t.rating > 0 ? t.rating : 'New'}
                                                    </span>
                                                </div>
                                            </div>

                                            <div class="mb-3">
                                                <span class="text-muted text-xs d-block mb-1">Experience: <strong>${t.experience} Years</strong></span>
                                                <span class="text-muted text-xs d-block">Available Hours: <strong>${t.availableTimings}</strong></span>
                                            </div>

                                            <div class="mb-3 flex-wrap">
                                                <c:forEach var="spec" items="${t.specializations.split(',')}">
                                                    <span class="tag-chip">${spec}</span>
                                                </c:forEach>
                                            </div>

                                            <div class="d-flex align-items-center justify-content-between mt-auto pt-3 border-top">
                                                <div>
                                                    <span class="text-muted text-xs d-block">Session Fee</span>
                                                    <span class="fee-tag">₹${t.sessionFees}<small class="text-muted text-xs">/class</small></span>
                                                </div>
                                                <a href="${pageContext.request.contextPath}/fitness/trainer/${t.id}" class="btn btn-book">View Profile</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div>
        </div>
    </div>
</div>

</body>
</html>
