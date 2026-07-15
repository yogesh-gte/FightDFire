<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Women Events — Discover Empowering Events</title>
    <meta name="description" content="Discover women's events near you — health, fitness, entrepreneurship, education, and community events for women across India."/>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css"/>
    <style>
        *, *::before, *::after { box-sizing: border-box; }
        body { font-family: 'Outfit', sans-serif; background: #faf7fb; color: #1a1a2e; margin: 0; }

        /* Hero */
        .hero {
            background: linear-gradient(135deg, #1e1b4b 0%, #312e81 50%, #f43f5e 100%);
            padding: 70px 20px 80px;
            position: relative;
            overflow: hidden;
            color: white;
        }
        .hero::before {
            content: '';
            position: absolute; inset: 0;
            background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.05'%3E%3Ccircle cx='30' cy='30' r='4'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
        }
        .hero-content { position: relative; z-index: 1; max-width: 800px; margin: 0 auto; text-align: center; }
        .hero h1 { font-size: clamp(2rem, 5vw, 3.5rem); font-weight: 800; margin-bottom: 16px; letter-spacing: -0.5px; }
        .hero p { font-size: 1.15rem; opacity: 0.9; margin-bottom: 32px; }

        /* Search bar */
        .search-bar { background: white; border-radius: 50px; padding: 8px 8px 8px 24px;
            display: flex; align-items: center; gap: 8px; max-width: 620px; margin: 0 auto;
            box-shadow: 0 20px 60px rgba(0,0,0,0.2); }
        .search-bar input { border: none; outline: none; flex: 1; font-size: 1rem; color: #1a1a2e; font-family: 'Outfit', sans-serif; }
        .search-bar button { background: linear-gradient(135deg, #1e1b4b, #a855f7);
            border: none; color: white; border-radius: 40px; padding: 10px 24px;
            font-weight: 600; cursor: pointer; font-family: 'Outfit', sans-serif; white-space: nowrap; }

        /* Stats strip */
        .stats-strip { background: white; padding: 20px 0; border-bottom: 1px solid #f0e8f5; }
        .stat-item { text-align: center; }
        .stat-num { font-size: 1.8rem; font-weight: 800; color: #1e1b4b; }
        .stat-label { font-size: 0.8rem; color: #888; font-weight: 500; text-transform: uppercase; letter-spacing: 0.5px; }

        /* Category pills */
        .category-strip { padding: 24px 0; display: flex; gap: 12px; overflow-x: auto; scrollbar-width: none; padding-left: 15px; }
        .category-strip::-webkit-scrollbar { display: none; }
        .cat-pill { border-radius: 30px; padding: 9px 20px; font-size: 0.85rem; font-weight: 600;
            cursor: pointer; white-space: nowrap; border: 2px solid transparent; transition: all 0.2s;
            text-decoration: none; display: inline-flex; align-items: center; gap: 6px; }
        .cat-pill:hover, .cat-pill.active { color: white !important; border-color: transparent; }
        .cat-pill.c1 { background: #fff0f6; color: #be185d; } .cat-pill.c1:hover, .cat-pill.c1.active { background: #be185d; }
        .cat-pill.c2 { background: #f0fdf4; color: #15803d; } .cat-pill.c2:hover, .cat-pill.c2.active { background: #15803d; }
        .cat-pill.c3 { background: #fff7ed; color: #c2410c; } .cat-pill.c3:hover, .cat-pill.c3.active { background: #c2410c; }
        .cat-pill.c4 { background: #eff6ff; color: #1d4ed8; } .cat-pill.c4:hover, .cat-pill.c4.active { background: #1d4ed8; }
        .cat-pill.c5 { background: #faf5ff; color: #7e22ce; } .cat-pill.c5:hover, .cat-pill.c5.active { background: #7e22ce; }
        .cat-pill.c6 { background: #fff1f2; color: #be123c; } .cat-pill.c6:hover, .cat-pill.c6.active { background: #be123c; }

        /* Layout */
        .main-grid { display: grid; grid-template-columns: 260px 1fr; gap: 28px; max-width: 1280px;
            margin: 0 auto; padding: 30px 20px 60px; }
        @media (max-width: 900px) { .main-grid { grid-template-columns: 1fr; } .filter-panel { order: -1; } }

        /* Filter panel */
        .filter-panel { background: white; border-radius: 20px; padding: 24px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05); height: fit-content; position: sticky; top: 24px; }
        .filter-title { font-weight: 700; font-size: 1rem; color: #1e1b4b; margin-bottom: 16px;
            display: flex; align-items: center; gap: 8px; }
        .filter-label { font-size: 0.8rem; font-weight: 600; color: #555; text-transform: uppercase;
            letter-spacing: 0.5px; margin-bottom: 8px; margin-top: 16px; }
        .filter-input { width: 100%; border: 1.5px solid #e5e7eb; border-radius: 10px; padding: 10px 14px;
            font-family: 'Outfit', sans-serif; font-size: 0.9rem; outline: none; transition: border-color 0.2s; }
        .filter-input:focus { border-color: #1e1b4b; }
        .filter-btn { width: 100%; background: linear-gradient(135deg, #1e1b4b, #a855f7);
            color: white; border: none; border-radius: 10px; padding: 12px; font-family: 'Outfit', sans-serif;
            font-weight: 600; cursor: pointer; margin-top: 18px; font-size: 0.95rem; }
        .filter-clear { display: block; text-align: center; margin-top: 8px; color: #1e1b4b;
            font-size: 0.85rem; text-decoration: none; font-weight: 500; }

        /* Event cards */
        .events-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 22px; }
        .event-card { background: white; border-radius: 20px; overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06); transition: all 0.3s; cursor: pointer; }
        .event-card:hover { transform: translateY(-6px); box-shadow: 0 20px 50px rgba(124,45,94,0.15); }
        .event-card a { text-decoration: none; color: inherit; }
        .card-banner { width: 100%; height: 180px; object-fit: cover; background: linear-gradient(135deg, #1e1b4b, #a855f7); }
        .card-banner-placeholder { width: 100%; height: 180px; background: linear-gradient(135deg, #1e1b4b22, #a855f722);
            display: flex; align-items: center; justify-content: center; font-size: 3rem; }
        .card-body { padding: 18px; }
        .card-cat { font-size: 0.72rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.8px;
            color: #1e1b4b; margin-bottom: 6px; }
        .card-title { font-size: 1.05rem; font-weight: 700; margin-bottom: 8px; line-height: 1.3;
            display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }
        .card-meta { display: flex; flex-direction: column; gap: 4px; margin-bottom: 12px; }
        .card-meta span { font-size: 0.82rem; color: #666; display: flex; align-items: center; gap: 5px; }
        .card-footer-row { display: flex; align-items: center; justify-content: space-between; }
        .fee-badge { background: #f0fdf4; color: #15803d; border-radius: 20px; padding: 4px 12px;
            font-size: 0.8rem; font-weight: 700; }
        .fee-badge.paid { background: #fff7ed; color: #c2410c; }
        .featured-badge { position: absolute; top: 12px; left: 12px; background: linear-gradient(135deg,#f59e0b,#ef4444);
            color: white; font-size: 0.72rem; font-weight: 700; padding: 4px 10px; border-radius: 20px; }
        .card-img-wrap { position: relative; }
        .register-btn { font-size: 0.82rem; font-weight: 600; color: #1e1b4b; text-decoration: none;
            border: 1.5px solid #1e1b4b; border-radius: 20px; padding: 5px 14px;
            transition: all 0.2s; display: inline-block; }
        .register-btn:hover { background: #1e1b4b; color: white; }

        /* Featured strip */
        .featured-section { background: linear-gradient(135deg, #1e1b4b11, #a855f711); padding: 30px 0; margin-bottom: 0; }
        .section-title { font-size: 1.4rem; font-weight: 800; color: #1e1b4b; margin-bottom: 20px;
            display: flex; align-items: center; gap: 10px; }
        .featured-scroll { display: flex; gap: 20px; overflow-x: auto; scrollbar-width: none; padding-bottom: 10px; }
        .featured-scroll::-webkit-scrollbar { display: none; }
        .featured-card { min-width: 300px; max-width: 300px; background: white; border-radius: 18px;
            overflow: hidden; box-shadow: 0 8px 30px rgba(124,45,94,0.1); flex-shrink: 0;
            transition: all 0.3s; }
        .featured-card:hover { transform: translateY(-4px); }

        /* No events */
        .no-events { text-align: center; padding: 60px 20px; color: #888; }
        .no-events .icon { font-size: 4rem; margin-bottom: 16px; display: block; }

        /* Organizer CTA */
        .organizer-cta { background: linear-gradient(135deg, #1a1a2e, #1e1b4b);
            color: white; border-radius: 24px; padding: 40px; text-align: center; margin: 40px auto;
            max-width: 800px; }
        .organizer-cta h3 { font-size: 1.8rem; font-weight: 800; margin-bottom: 10px; }
        .organizer-cta p { opacity: 0.85; margin-bottom: 24px; }
        .cta-btn { background: white; color: #1e1b4b; border: none; border-radius: 30px;
            padding: 14px 36px; font-weight: 700; font-family: 'Outfit', sans-serif; cursor: pointer;
            font-size: 1rem; text-decoration: none; display: inline-block; transition: all 0.2s; }
        .cta-btn:hover { background: #f9f0ff; transform: scale(1.03); color: #1e1b4b; }

        /* Alert */
        .flash-alert { position: fixed; top: 20px; right: 20px; z-index: 9999; max-width: 380px; border-radius: 14px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.15); animation: slideIn 0.4s ease; }
        @keyframes slideIn { from { transform: translateX(120%); opacity: 0; } to { transform: translateX(0); opacity: 1; } }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>

<div id="wrapper">
    <jsp:include page="/WEB-INF/views/fragments/sidebar.jsp" />
    <div id="page-content-wrapper" style="min-height: 100vh; overflow-x: clip; background: #faf7fb;">

<c:if test="${not empty success}">
    <div class="flash-alert alert alert-success alert-dismissible fade show" role="alert">
        <i class="bi bi-check-circle-fill me-2"></i>${success}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
</c:if>
<c:if test="${not empty error}">
    <div class="flash-alert alert alert-danger alert-dismissible fade show" role="alert">
        <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
</c:if>

<!-- Hero -->
<div class="hero">
    <div class="hero-content">
        <h1>Women's Events Platform 🌸</h1>
        <p>Discover, participate, and thrive — health, fitness, entrepreneurship, education & more events designed for women.</p>
        <form method="get" action="${pageContext.request.contextPath}/women-events" class="search-bar">
            <i class="bi bi-search" style="color:#1e1b4b; font-size:1.1rem;"></i>
            <input type="text" name="query" placeholder="Search events by name..." value="${query}"/>
            <button type="submit"><i class="bi bi-search me-1"></i>Search</button>
        </form>
    </div>
</div>

<!-- Stats Strip -->
<div class="stats-strip">
    <div class="container">
        <div class="row justify-content-center g-3">
            <div class="col-auto stat-item">
                <div class="stat-num">${events.size()}</div>
                <div class="stat-label">Events Near You</div>
            </div>
            <div class="col-auto stat-item">
                <div class="stat-num">6</div>
                <div class="stat-label">Categories</div>
            </div>
            <div class="col-auto stat-item">
                <div class="stat-num">${cities.size()}</div>
                <div class="stat-label">Cities</div>
            </div>
            <div class="col-auto stat-item">
                <div class="stat-num">9+</div>
                <div class="stat-label">Organizer Types</div>
            </div>
        </div>
    </div>
</div>

<!-- Category Pills -->
<div class="container">
    <div class="category-strip">
        <a href="${pageContext.request.contextPath}/women-events" class="cat-pill c1 ${empty selectedCategory ? 'active' : ''}">
            <i class="bi bi-grid-fill"></i>All Events
        </a>
        <a href="?category=HEALTH_WELLNESS" class="cat-pill c1 ${'HEALTH_WELLNESS' == selectedCategory ? 'active' : ''}">
            <i class="bi bi-heart-pulse-fill"></i>Health & Wellness
        </a>
        <a href="?category=ENTREPRENEURSHIP_CAREER" class="cat-pill c2 ${'ENTREPRENEURSHIP_CAREER' == selectedCategory ? 'active' : ''}">
            <i class="bi bi-briefcase-fill"></i>Entrepreneurship
        </a>
        <a href="?category=FITNESS_SPORTS" class="cat-pill c3 ${'FITNESS_SPORTS' == selectedCategory ? 'active' : ''}">
            <i class="bi bi-trophy-fill"></i>Fitness & Sports
        </a>
        <a href="?category=EDUCATION_SKILLS" class="cat-pill c4 ${'EDUCATION_SKILLS' == selectedCategory ? 'active' : ''}">
            <i class="bi bi-book-fill"></i>Education & Skills
        </a>
        <a href="?category=SOCIAL_COMMUNITY" class="cat-pill c5 ${'SOCIAL_COMMUNITY' == selectedCategory ? 'active' : ''}">
            <i class="bi bi-people-fill"></i>Social & Community
        </a>
        <a href="?category=SAFETY_AWARENESS" class="cat-pill c6 ${'SAFETY_AWARENESS' == selectedCategory ? 'active' : ''}">
            <i class="bi bi-shield-fill-check"></i>Safety & Awareness
        </a>
    </div>
</div>

<!-- Featured Events (if any) -->
<c:if test="${not empty featuredEvents && empty selectedCategory && empty query}">
    <div class="featured-section">
        <div class="container">
            <div class="section-title"><i class="bi bi-star-fill text-warning"></i>Featured Events</div>
            <div class="featured-scroll">
                <c:forEach var="ev" items="${featuredEvents}">
                    <a href="${pageContext.request.contextPath}/women-events/${ev.id}" class="featured-card" style="text-decoration:none; color:inherit;">
                        <div class="card-img-wrap">
                            <c:choose>
                                <c:when test="${not empty ev.bannerImage}">
                                    <img src="${pageContext.request.contextPath}/uploads/${ev.bannerImage}" class="card-banner" alt="${ev.name}"/>
                                </c:when>
                                <c:otherwise>
                                    <div class="card-banner-placeholder">🌸</div>
                                </c:otherwise>
                            </c:choose>
                            <span class="featured-badge"><i class="bi bi-star-fill"></i> Featured</span>
                        </div>
                        <div class="card-body">
                            <div class="card-cat">${ev.category.displayName}</div>
                            <div class="card-title">${ev.name}</div>
                            <div class="card-meta">
                                <span><i class="bi bi-calendar3"></i>${ev.eventDate}</span>
                                <span><i class="bi bi-geo-alt-fill"></i>${ev.city}</span>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
    </div>
</c:if>

<!-- Recommended Events (if any) -->
<c:if test="${not empty recommendations && empty selectedCategory && empty query}">
    <div class="featured-section" style="background: linear-gradient(135deg, #10b9810b, #3b82f60b); padding-top: 10px; padding-bottom: 20px;">
        <div class="container">
            <div class="section-title" style="color:#10b981;"><i class="bi bi-compass-fill text-success"></i>Recommended for You</div>
            <div class="featured-scroll">
                <c:forEach var="ev" items="${recommendations}">
                    <a href="${pageContext.request.contextPath}/women-events/${ev.id}" class="featured-card" style="text-decoration:none; color:inherit;">
                        <div class="card-img-wrap">
                            <c:choose>
                                <c:when test="${not empty ev.bannerImage}">
                                    <img src="${pageContext.request.contextPath}/uploads/${ev.bannerImage}" class="card-banner" alt="${ev.name}"/>
                                </c:when>
                                <c:otherwise>
                                    <div class="card-banner-placeholder">🌸</div>
                                </c:otherwise>
                            </c:choose>
                            <span class="featured-badge" style="background:linear-gradient(135deg,#10b981,#3b82f6);"><i class="bi bi-stars"></i> Recommended</span>
                        </div>
                        <div class="card-body">
                            <div class="card-cat" style="color:#10b981;">${ev.category.displayName}</div>
                            <div class="card-title">${ev.name}</div>
                            <div class="card-meta">
                                <span><i class="bi bi-calendar3"></i>${ev.eventDate}</span>
                                <span><i class="bi bi-geo-alt-fill"></i>${ev.city}</span>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
    </div>
</c:if>

<!-- Main Grid -->
<div class="main-grid">

    <!-- Filter Panel -->
    <aside class="filter-panel">
        <div class="filter-title"><i class="bi bi-funnel-fill"></i>Filter Events</div>
        <form method="get" action="${pageContext.request.contextPath}/women-events">
            <div class="filter-label">City</div>
            <select name="city" class="filter-input">
                <option value="">All Cities</option>
                <c:forEach var="c" items="${cities}">
                    <option value="${c}" ${c == selectedCity ? 'selected' : ''}>${c}</option>
                </c:forEach>
            </select>

            <div class="filter-label">Category</div>
            <select name="category" class="filter-input">
                <option value="">All Categories</option>
                <option value="HEALTH_WELLNESS" ${'HEALTH_WELLNESS' == selectedCategory ? 'selected' : ''}>Health & Wellness</option>
                <option value="ENTREPRENEURSHIP_CAREER" ${'ENTREPRENEURSHIP_CAREER' == selectedCategory ? 'selected' : ''}>Entrepreneurship & Career</option>
                <option value="FITNESS_SPORTS" ${'FITNESS_SPORTS' == selectedCategory ? 'selected' : ''}>Fitness & Sports</option>
                <option value="EDUCATION_SKILLS" ${'EDUCATION_SKILLS' == selectedCategory ? 'selected' : ''}>Education & Skills</option>
                <option value="SOCIAL_COMMUNITY" ${'SOCIAL_COMMUNITY' == selectedCategory ? 'selected' : ''}>Social & Community</option>
                <option value="SAFETY_AWARENESS" ${'SAFETY_AWARENESS' == selectedCategory ? 'selected' : ''}>Safety & Awareness</option>
            </select>

            <button type="submit" class="filter-btn"><i class="bi bi-search me-2"></i>Apply Filters</button>
            <a href="${pageContext.request.contextPath}/women-events" class="filter-clear">Clear Filters</a>
        </form>

        <hr style="margin: 24px 0; border-color: #f0e8f5;"/>

        <c:if test="${not empty loggedUser}">
            <a href="${pageContext.request.contextPath}/women-events/my-registrations"
               style="display:block; background:#f9f0ff; color:#1e1b4b; border-radius:12px; padding:12px; text-align:center; text-decoration:none; font-weight:600; margin-bottom:10px;">
                <i class="bi bi-ticket-perforated-fill"></i> My Tickets
            </a>
        </c:if>

        <c:choose>
            <c:when test="${not empty loggedHost}">
                <a href="${pageContext.request.contextPath}/women-events/organizer/dashboard"
                   style="display:block; background:#f0fdf4; color:#15803d; border-radius:12px; padding:12px; text-align:center; text-decoration:none; font-weight:600; margin-bottom:10px;">
                    <i class="bi bi-calendar-plus-fill"></i> Organizer Dashboard
                </a>
                <a href="${pageContext.request.contextPath}/women-events/host/logout"
                   style="display:block; background:#fee2e2; color:#ef4444; border-radius:12px; padding:12px; text-align:center; text-decoration:none; font-weight:600; margin-bottom:10px;">
                    <i class="bi bi-box-arrow-right"></i> Host Logout
                </a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/women-events/host/register"
                   style="display:block; background:#fef3c7; color:#d97706; border-radius:12px; padding:12px; text-align:center; text-decoration:none; font-weight:600; margin-bottom:10px;">
                    <i class="bi bi-person-badge-fill"></i> Register as Host
                </a>
                <a href="${pageContext.request.contextPath}/women-events/host/login"
                   style="display:block; background:#f0fdf4; color:#16a34a; border-radius:12px; padding:12px; text-align:center; text-decoration:none; font-weight:600; margin-bottom:10px;">
                    <i class="bi bi-box-arrow-in-right"></i> Host Login
                </a>
            </c:otherwise>
        </c:choose>

        <c:if test="${empty loggedUser && empty loggedHost}">
            <a href="${pageContext.request.contextPath}/login"
               style="display:block; background: linear-gradient(135deg, #1e1b4b, #a855f7); color:white; border-radius:12px; padding:12px; text-align:center; text-decoration:none; font-weight:600;">
                <i class="bi bi-person-circle me-1"></i> Login to Register
            </a>
        </c:if>
    </aside>

    <!-- Events Grid -->
    <div>
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:20px; flex-wrap:wrap; gap:10px;">
            <div style="font-size:0.95rem; color:#555; font-weight:500;">
                Showing <strong>${events.size()}</strong> event${events.size() != 1 ? 's' : ''}
                <c:if test="${not empty selectedCategory}"> in <strong>${selectedCategory}</strong></c:if>
                <c:if test="${not empty selectedCity}"> in <strong>${selectedCity}</strong></c:if>
            </div>
        </div>

        <c:choose>
            <c:when test="${not empty events}">
                <div class="events-grid">
                    <c:forEach var="ev" items="${events}">
                        <div class="event-card">
                            <a href="${pageContext.request.contextPath}/women-events/${ev.id}">
                                <div class="card-img-wrap">
                                    <c:choose>
                                        <c:when test="${not empty ev.bannerImage}">
                                            <img src="${pageContext.request.contextPath}/uploads/${ev.bannerImage}" class="card-banner" alt="${ev.name}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="card-banner-placeholder">
                                                <c:choose>
                                                    <c:when test="${ev.category == 'HEALTH_WELLNESS'}">💊</c:when>
                                                    <c:when test="${ev.category == 'ENTREPRENEURSHIP_CAREER'}">💼</c:when>
                                                    <c:when test="${ev.category == 'FITNESS_SPORTS'}">🏃‍♀️</c:when>
                                                    <c:when test="${ev.category == 'EDUCATION_SKILLS'}">📚</c:when>
                                                    <c:when test="${ev.category == 'SOCIAL_COMMUNITY'}">🤝</c:when>
                                                    <c:otherwise>🛡️</c:otherwise>
                                                </c:choose>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:if test="${ev.featured}">
                                        <span class="featured-badge"><i class="bi bi-star-fill"></i> Featured</span>
                                    </c:if>
                                </div>
                                <div class="card-body">
                                    <div class="card-cat">${ev.category.displayName}</div>
                                    <div class="card-title">${ev.name}</div>
                                    <div class="card-meta">
                                        <span><i class="bi bi-calendar3" style="color:#1e1b4b;"></i>
                                            <fmt:formatDate value="${ev.eventDate}" pattern="dd MMM yyyy" type="date"/>
                                            ${ev.eventDate}
                                        </span>
                                        <span><i class="bi bi-geo-alt-fill" style="color:#ec4899;"></i>${ev.venue}, ${ev.city}</span>
                                        <span><i class="bi bi-person-fill" style="color:#a855f7;"></i>${ev.organizerName} <small style="color:#aaa;">(${ev.organizerType})</small></span>
                                    </div>
                                    <div class="card-footer-row">
                                        <span class="fee-badge ${ev.free ? '' : 'paid'}">
                                            <c:choose>
                                                <c:when test="${ev.free}">🆓 Free</c:when>
                                                <c:otherwise>₹${ev.entryFee}</c:otherwise>
                                            </c:choose>
                                        </span>
                                        <span class="register-btn">View Details →</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="no-events">
                    <span class="icon">🔍</span>
                    <h4 style="color:#555; font-weight:700;">No events found</h4>
                    <p>Try adjusting your filters or <a href="${pageContext.request.contextPath}/women-events" style="color:#1e1b4b; font-weight:600;">browse all events</a>.</p>
                </div>
            </c:otherwise>
        </c:choose>

        <!-- Organizer CTA -->
        <div class="organizer-cta mt-5">
            <h3>🌺 Host Your Own Event</h3>
            <p>Are you an NGO, college, company, gym, or women entrepreneur? List your event on our platform and reach thousands of women.</p>
            <c:choose>
                <c:when test="${not empty loggedHost}">
                    <a href="${pageContext.request.contextPath}/women-events/organizer/dashboard" class="cta-btn">Organizer Dashboard</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/women-events/host/login" class="cta-btn me-2" style="background:rgba(255,255,255,0.15); border:1px solid rgba(255,255,255,0.3); text-decoration:none;">Host Login</a>
                    <a href="${pageContext.request.contextPath}/women-events/host/register" class="cta-btn" style="text-decoration:none;">Register to Host</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

    </div>
</div>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
    // Auto-dismiss flash alerts
    setTimeout(() => {
        document.querySelectorAll('.flash-alert').forEach(el => {
            el.style.transition = 'opacity 0.5s'; el.style.opacity = '0';
            setTimeout(() => el.remove(), 500);
        });
    }, 4000);
</script>
</body>
</html>
