<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>User Dashboard</title>

<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600;700&display=swap" rel="stylesheet">
<!-- Purpose: global typography used by assets/css/main.css -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@700;800;900&display=swap" rel="stylesheet">

<!-- Icons & CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/Fight D Fear-theme.css" rel="stylesheet">
<!-- Leaflet CSS -->
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/>
<style>
    /* ============================================
       ROOT VARIABLES (your brand colors)
       ============================================ */
    :root {
        --primary-purple: #1e1b4b; /* Deep Navy */
        --primary-purple-light: #312e81; /* Light Navy */
        --primary-coral: #f43f5e; /* Rose Pink */
        --primary-coral-dark: #e11d48;
        --primary-teal: #20c997;
        --primary-gold: #ffd700;
        --dark-bg: #0f0f1a;
        --light-bg: #f8fafc;
        --gradient-primary: linear-gradient(135deg, #1e1b4b 0%, #312e81 50%, #f43f5e 100%);
        --gradient-gold: linear-gradient(135deg, #ffd700, #ffb347);
        --shadow-sm: 0 10px 30px rgba(0, 0, 0, 0.08);
        --shadow-md: 0 20px 40px rgba(0, 0, 0, 0.12);
        --shadow-lg: 0 30px 60px rgba(0, 0, 0, 0.15);
        --shadow-xl: 0 40px 80px rgba(0, 0, 0, 0.2);
        --transition-smooth: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
        --transition-bounce: all 0.4s cubic-bezier(0.34, 1.2, 0.64, 1);
    }

    /* Floating Blobs for Premium Feel */
    .hero-section::before,
    .hero-section::after {
        content: "";
        position: absolute;
        width: 300px;
        height: 300px;
        border-radius: 50%;
        filter: blur(60px);
        opacity: 0.2;
        z-index: 0;
        pointer-events: none;
        animation: floatDashboard 12s ease-in-out infinite;
    }
    .hero-section::before {
        top: -100px; left: -100px;
        background: radial-gradient(circle, var(--primary-purple), transparent);
    }
    .hero-section::after {
        bottom: -100px; right: -100px;
        background: radial-gradient(circle, var(--primary-coral), transparent);
        animation-delay: -6s;
    }
    @keyframes floatDashboard {
        0%, 100% { transform: translate(0,0) scale(1); }
        50% { transform: translate(20px, -20px) scale(1.1); }
    }

    .text-gradient {
        background: linear-gradient(135deg, var(--primary-purple) 0%, var(--primary-coral) 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        font-weight: 800;
    }

    /* ============================================
       GLOBAL ANIMATIONS & BACKGROUND
       ============================================ */
    body {
        background: var(--light-bg);
        position: relative;
        overflow-x: hidden;
    }
    /* Subtle moving gradient background */
    body::before {
        content: '';
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: radial-gradient(circle at 20% 40%, rgba(123,44,191,0.03) 0%, transparent 50%),
                    radial-gradient(circle at 80% 70%, rgba(255,107,107,0.02) 0%, transparent 60%);
        pointer-events: none;
        z-index: -1;
        animation: subtleShift 20s ease infinite;
    }
    @keyframes subtleShift {
        0% { transform: scale(1) translate(0,0); }
        50% { transform: scale(1.05) translate(2%, 1%); }
        100% { transform: scale(1) translate(0,0); }
    }

    /* ============================================
       HERO SECTION (enhanced)
       ============================================ */
    .hero-section {
        position: relative;
        overflow: hidden;
    }
    .hero-section::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(123, 44, 191, 0.3);
        z-index: 1;
        backdrop-filter: blur(3px);
        transition: backdrop-filter 0.5s ease;
    }
    .hero-section:hover::before {
        backdrop-filter: blur(2px);
    }
    /* Animated floating shapes behind hero */
    .hero-section::after {
        content: '';
        position: absolute;
        top: 10%;
        right: 5%;
        width: 200px;
        height: 200px;
        background: radial-gradient(circle, rgba(255,215,0,0.15), transparent);
        border-radius: 50%;
        z-index: 0;
        animation: floatShape 12s infinite ease-in-out;
        pointer-events: none;
    }
    @keyframes floatShape {
        0%, 100% { transform: translate(0,0) scale(1); }
        50% { transform: translate(-20px, -30px) scale(1.1); }
    }

    .hero-section .container {
        position: relative;
        z-index: 2;
        padding-top: 100px;
    }

    .hero-section h1 {
        font-size: clamp(2rem, 8vw, 3.5rem);
        font-weight: 800;
        margin-bottom: 20px;
        margin-top: clamp(40px, 10vh, 80px);
        font-family: 'Playfair Display', serif;
        background: linear-gradient(135deg, #fff, var(--primary-gold));
        background-clip: text;
        -webkit-background-clip: text;
        color: transparent;
        text-shadow: none;
        animation: fadeInUp 0.8s ease-out forwards;
        letter-spacing: -0.02em;
    }

    .hero-section p {
        font-size: 1.2rem;
        color: rgba(255,255,255,0.95);
        margin-bottom: 35px;
        max-width: 650px;
        margin-left: auto;
        margin-right: auto;
        text-shadow: 0 2px 12px rgba(0,0,0,0.4);
        animation: fadeInUp 0.8s ease-out 0.15s forwards;
        opacity: 0;
        animation-fill-mode: forwards;
        backdrop-filter: blur(2px);
        padding: 0 10px;
    }

    /* Gold buttons with shine effect */
    .hero-section a.btn-primary {
        background: linear-gradient(135deg, var(--primary-gold), #ffc107);
        border: none;
        color: var(--primary-purple);
        font-weight: 700;
        transition: var(--transition-bounce);
        box-shadow: var(--shadow-sm);
        border-radius: 60px;
        padding: 12px 32px;
        position: relative;
        overflow: hidden;
        z-index: 1;
    }
    .hero-section a.btn-primary::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent);
        transition: left 0.6s ease;
        z-index: -1;
    }
    .hero-section a.btn-primary:hover::before {
        left: 100%;
    }
    .hero-section a.btn-primary:hover {
        transform: translateY(-4px) scale(1.02);
        box-shadow: var(--shadow-md);
        color: var(--primary-purple);
    }

    .hero-section a.btn-outline-light {
        border-radius: 60px;
        padding: 12px 32px;
        border-width: 2px;
        transition: var(--transition-bounce);
    }
    .hero-section a.btn-outline-light:hover {
        background-color: #fff;
        color: var(--primary-gold) !important;
        transform: translateY(-4px) scale(1.02);
        box-shadow: var(--shadow-md);
    }

    /* ============================================
       DASHBOARD CARDS (ultra-enhanced)
       ============================================ */
    .dashboard-card {
        background: #fff;
        padding: 20px;
        border-radius: 24px;
        text-align: center;
        transition: var(--transition-bounce);
        box-shadow: var(--shadow-sm);
        border: 1px solid rgba(123, 44, 191, 0.1);
        position: relative;
        overflow: hidden;
        cursor: pointer;
        backdrop-filter: blur(0px);
    }
    /* Glass morphism on hover */
    .dashboard-card:hover {
        backdrop-filter: blur(8px);
        background: rgba(255,255,255,0.95);
        transform: translateY(2px) scale(1.02);
        box-shadow: var(--shadow-xl);
        border-color: var(--primary-purple-light);
    }
    /* Top gradient bar animation */
    .dashboard-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 5px;
        background: var(--gradient-primary);
        transform: scaleX(0);
        transform-origin: left;
        transition: transform 0.4s ease;
    }
    .dashboard-card:hover::before {
        transform: scaleX(1);
    }
    /* Icon / image zoom */
    .dashboard-card img {
        width: 100%;
        height: 350px;
        object-fit: cover;
        border-radius: 20px;
        transition: transform 0.5s var(--transition-bounce);
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    .dashboard-card:hover img {
        transform: scale(1.05) rotate(1deg);
        box-shadow: 0 12px 28px rgba(0,0,0,0.2);
    }
    /* Title with gradient */
    .dashboard-card h4 {
        font-size: 1.35rem;
        margin: 18px 0 12px;
        background: linear-gradient(135deg, var(--primary-purple), var(--primary-purple-light));
        background-clip: text;
        -webkit-background-clip: text;
        color: transparent;
        font-weight: 800;
        transition: var(--transition-smooth);
    }
    .dashboard-card:hover h4 {
        background: var(--gradient-primary);
        background-clip: text;
        -webkit-background-clip: text;
    }
    .dashboard-card p {
        font-size: 0.95rem;
        color: #555;
        line-height: 1.5;
        transition: color 0.3s;
    }
    .dashboard-card:hover p {
        color: #333;
    }
    /* Button inside card */
    .dashboard-card a.btn {
        margin-top: 15px;
        background: var(--gradient-primary);
        border: none;
        border-radius: 40px;
        padding: 10px 24px;
        font-weight: 700;
        transition: var(--transition-bounce);
        color: white;
        box-shadow: var(--shadow-sm);
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
    }
    .dashboard-card a.btn:hover {
        transform: translateY(-3px) scale(1.05);
        box-shadow: var(--shadow-md);
        filter: brightness(1.05);
    }

    /* ============================================
       NAVBAR MENU (glow effect)
       ============================================ */
    #navmenu ul li a, .navmenu ul li a {
        color: var(--primary-purple-light) !important;
        font-weight: 600;
        transition: var(--transition-smooth);
        position: relative;
    }
    #navmenu ul li a::after, .navmenu ul li a::after {
        content: '';
        position: absolute;
        bottom: 12px;
        left: 15px;
        width: 0%;
        height: 2px;
        background: var(--gradient-primary);
        transition: width 0.3s ease;
    }
    #navmenu ul li a:hover::after, .navmenu ul li a:hover::after,
    #navmenu ul li a.active::after, .navmenu ul li a.active::after {
        width: calc(100% - 30px);
    }
    #navmenu ul li a:hover, .navmenu ul li a:hover {
        color: var(--primary-purple) !important;
        text-shadow: 0 0 4px rgba(74,14,120,0.2);
    }

    /* ============================================
       ANIMATIONS
       ============================================ */
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(40px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* ============================================
       RESPONSIVE & PERFORMANCE
       ============================================ */
    @media (max-width: 768px) {
        .hero-section {
            min-height: 80vh !important;
            height: auto !important;
            padding: 100px 0 60px;
        }
        .hero-section h1 {
            font-size: 1.75rem;
            margin-top: 10px;
            line-height: 1.2;
        }
        .hero-section p {
            font-size: 0.95rem;
            margin-bottom: 25px;
            padding: 0 15px;
        }
        .dashboard-card img {
            height: 220px;
        }
        .dashboard-card {
            padding: 15px;
            margin-bottom: 5px;
        }
        .hero-section a.btn-primary,
        .hero-section a.btn-outline-light {
            padding: 12px 24px;
            font-size: 1rem;
            width: 100%;
            margin-bottom: 15px;
            display: block;
        }
        .dashboard-card h4 {
            font-size: 1.25rem;
        }
        #dangerMap {
            height: 380px !important;
        }
        .hero-section .container {
            padding-top: 40px;
        }
        .section-title h2 {
            font-size: 1.75rem;
        }
    }

    @media (max-width: 576px) {
        .hero-section h1 {
            font-size: 1.5rem;
        }
        .dashboard-card img {
            height: 200px;
        }
        .section-title h2 {
            font-size: 1.5rem;
        }
        .header .logo h1 {
            font-size: 22px;
        }
        .header-profile-img {
            width: 36px;
            height: 36px;
        }
    }

    /* Optional: Smooth scroll behavior */
    html {
        scroll-behavior: smooth;
    }
    /* Header Profile Photo */
    .header-profile-img {
        width: 42px;
        height: 42px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid var(--primary-purple-light);
        transition: var(--transition-bounce);
        cursor: pointer;
        box-shadow: var(--shadow-sm);
    }
    .header-profile-img:hover {
        transform: scale(1.15) rotate(5deg);
    }
    .header-profile-img:hover {
        transform: scale(1.15) rotate(5deg);
        border-color: var(--primary-coral);
        box-shadow: var(--shadow-md);
    }



    /* === Sidebar Layout CSS === */
    #wrapper {
        display: flex;
        width: 100%;
        align-items: stretch;
    }
    #sidebar-wrapper {
        min-width: 280px;
        max-width: 280px;
        background: var(--primary-purple);
        color: white;
        transition: all 0.3s ease-in-out;
        min-height: calc(100vh - 80px); /* Adjust for header */
        z-index: 1000;
        box-shadow: 4px 0 15px rgba(0,0,0,0.1);
        position: sticky;
        top: 80px; /* Adjust based on header height */
        height: calc(100vh - 80px);
        overflow-y: auto;
    }
    #sidebar-wrapper::-webkit-scrollbar {
        width: 6px;
    }
    #sidebar-wrapper::-webkit-scrollbar-thumb {
        background-color: var(--primary-purple-light);
        border-radius: 10px;
    }
    .sidebar-heading {
        padding: 20px;
        font-size: 1.2rem;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1px;
        border-bottom: 1px solid rgba(255,255,255,0.1);
        background: rgba(0,0,0,0.1);
    }
    .list-group-item {
        background: transparent;
        color: rgba(255,255,255,0.8);
        border: none;
        padding: 15px 20px;
        font-size: 15px;
        font-weight: 500;
        transition: all 0.3s;
        display: flex;
        align-items: center;
        gap: 12px;
        border-left: 4px solid transparent;
        text-decoration: none;
    }
    .list-group-item i {
        font-size: 1.2rem;
        width: 24px;
        text-align: center;
        transition: all 0.3s;
    }
    .list-group-item:hover, .list-group-item.active {
        background: rgba(244, 63, 94, 0.1);
        color: white;
        border-left-color: var(--primary-coral);
    }
    .list-group-item:hover i {
        color: var(--primary-coral);
        transform: scale(1.1);
    }
    .list-group-item.sos-link {
        background: rgba(244, 63, 94, 0.15);
        color: var(--primary-coral);
        font-weight: 700;
        border-left-color: var(--primary-coral);
    }
    .list-group-item.sos-link:hover {
        background: var(--primary-coral);
        color: white;
    }
    .list-group-item.sos-link:hover i {
        color: white;
    }
    
    #page-content-wrapper {
        flex: 1;
        min-width: 0;
        display: flex;
        flex-direction: column;
    }

    /* Animated Hero Updates */
    .hero-section {
        position: relative;
        overflow: hidden;
        min-height: 400px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: linear-gradient(-45deg, #1e1b4b, #312e81, #7c2d5e, #f43f5e);
        background-size: 400% 400%;
        animation: gradientBG 15s ease infinite;
    }
    @keyframes gradientBG {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }
    .hero-overlay {
        position: absolute;
        top: 0; left: 0; right: 0; bottom: 0;
        background: radial-gradient(circle at center, transparent 0%, rgba(30, 27, 75, 0.6) 100%);
        z-index: 1;
    }
    .hero-content {
        position: relative;
        z-index: 2;
        padding: 40px 20px;
        text-align: center;
    }
</style>
</head>

<body>

<jsp:include page="/WEB-INF/views/fragments/header.jsp" />

<div id="wrapper">
    <!-- Sidebar -->
    <div id="sidebar-wrapper">
        <div class="sidebar-heading">
            <i class="bi bi-grid-1x2-fill me-2"></i> Menu
        </div>
        <div class="list-group list-group-flush">
            <!-- 🚨 SOS Emergency -->
            <a href="${pageContext.request.contextPath}/sos/dashboard" class="list-group-item list-group-item-action sos-link">
                <i class="fas fa-exclamation-triangle"></i> SOS Emergency
            </a>
            <!-- Profile -->
            <a href="${pageContext.request.contextPath}/users/profile/${user.id}" class="list-group-item list-group-item-action">
                <i class="bi bi-person-badge"></i> Your Profile
            </a>
            <!-- Martial Arts Centres -->
            <a href="${pageContext.request.contextPath}/centres/allacceptedcentres" class="list-group-item list-group-item-action">
                <i class="bi bi-shield-check"></i> Martial Arts Centres
            </a>
            <!-- View Videos -->
            <a href="${pageContext.request.contextPath}/video/allVideos" class="list-group-item list-group-item-action">
                <i class="bi bi-play-circle"></i> View Videos
            </a>
            <!-- Report Incident -->
            <a href="${pageContext.request.contextPath}/incidents/report" class="list-group-item list-group-item-action">
                <i class="bi bi-file-earmark-medical"></i> Report Incident
            </a>
            <!-- Glow Space -->
            <a href="${pageContext.request.contextPath}/index/templates" class="list-group-item list-group-item-action">
                <i class="bi bi-stars"></i> Glow Space
            </a>
            <!-- Let's Connect -->
            <a href="${pageContext.request.contextPath}/users/search?tab=requests" class="list-group-item list-group-item-action">
                <i class="bi bi-people"></i> Let's Connect
                <span id="pendingRequestsBadge" class="badge bg-danger ms-auto" style="display:none;">0</span>
            </a>
            <!-- Chat -->
            <a href="${pageContext.request.contextPath}/chat/users" class="list-group-item list-group-item-action">
                <i class="bi bi-chat-dots"></i> Chat
            </a>
            <!-- Reels -->
            <a href="${pageContext.request.contextPath}/video/reels" class="list-group-item list-group-item-action">
                <i class="bi bi-camera-video"></i> Reels
            </a>
            <!-- My Wallet -->
            <a href="${pageContext.request.contextPath}/users/wallet" class="list-group-item list-group-item-action">
                <i class="bi bi-wallet2"></i> My Wallet
            </a>
            <!-- Buddy Mode -->
            <a href="${pageContext.request.contextPath}/buddy" class="list-group-item list-group-item-action">
                <i class="bi bi-person-walking"></i> Buddy Mode
            </a>
            <!-- Women Doctors -->
            <a href="${pageContext.request.contextPath}/doctors/list" class="list-group-item list-group-item-action">
                <i class="bi bi-heart-pulse"></i> Women Doctors
            </a>
            <!-- Women Marketplace -->
            <a href="${pageContext.request.contextPath}/marketplace" class="list-group-item list-group-item-action">
                <i class="bi bi-shop"></i> Women Marketplace
            </a>
            <!-- Women Lawyers -->
            <a href="${pageContext.request.contextPath}/marketplace/list?category=WOMEN_LAWYER" class="list-group-item list-group-item-action">
                <i class="bi bi-briefcase"></i> Women Lawyers
            </a>
            <!-- Fitness & Zumba -->
            <a href="${pageContext.request.contextPath}/marketplace/list?category=FITNESS_ZUMBA" class="list-group-item list-group-item-action">
                <i class="bi bi-activity"></i> Fitness & Zumba
            </a>
            <!-- Women Products -->
            <a href="${pageContext.request.contextPath}/women-products" class="list-group-item list-group-item-action">
                <i class="bi bi-bag-heart"></i> Women Products
            </a>
            <!-- Journey Safety Tracker -->
            <a href="${pageContext.request.contextPath}/journey" class="list-group-item list-group-item-action">
                <i class="bi bi-pin-map"></i> Journey Safety Tracker
            </a>
            <!-- Routine Reminders -->
            <a href="${pageContext.request.contextPath}/reminders" class="list-group-item list-group-item-action">
                <i class="bi bi-alarm"></i> Routine Reminders
            </a>
        </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        
        <!-- Animated Hero Section -->
        <section class="hero-section">
            <div class="hero-overlay"></div>
            
            <div class="container hero-content text-center text-white">
                <div class="icon mb-3">
                    <span class="flaticon-lotus" style="font-size: 3rem; color: #fff;"></span>
                </div>
                <h1 class="display-4 fw-bold mb-3" style="font-family: 'Playfair Display', serif;">
                    Welcome, <span style="color: var(--primary-coral);">${user.fullName}</span>!
                </h1>
                <h2 class="h3 mb-3">Empowering Women's Safety Through Technology</h2>
                <p class="lead">Your safety is our mission. Discover features that protect, inform, and connect you in times of need.</p>
            </div>
        </section>

        <!-- Main Dashboard Content Area -->
        <div class="container-fluid py-4 px-4" style="background: var(--light-bg); min-height: 50vh;">

    <!-- My Incident Reports Section -->
    <div class="row mt-5">
      <div class="col-12">
        <div class="p-4 rounded-4 bg-white shadow-sm border">
          <div class="d-flex justify-content-between align-items-center mb-4">
            <h4 class="fw-800 m-0"><i class="fas fa-file-shield text-danger me-2"></i>My Reported Incidents</h4>
            <span class="badge bg-soft-pink text-pink rounded-pill px-3">${myIncidents.size()} Reports</span>
          </div>
          
          <c:choose>
            <c:when test="${not empty myIncidents}">
              <div class="table-responsive">
                <table class="table table-hover align-middle">
                  <thead class="table-light">
                    <tr>
                      <th>Date</th>
                      <th>Type</th>
                      <th>Location</th>
                      <th>Description</th>
                      <th>Evidence</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="inc" items="${myIncidents}">
                      <tr>
                        <td class="small fw-600">${inc.reportedAt}</td>
                        <td><span class="badge bg-light text-dark border">${inc.type}</span></td>
                        <td class="small">${inc.location}</td>
                        <td class="small text-muted">${inc.description}</td>
                        <td>
                          <c:choose>
                            <c:when test="${not empty inc.mediaPath}">
                              <a href="${pageContext.request.contextPath}${inc.mediaPath}" target="_blank">
                                <img src="${pageContext.request.contextPath}${inc.mediaPath}" class="rounded shadow-sm" style="width: 50px; height: 50px; object-fit: cover;" onerror="this.src='${pageContext.request.contextPath}/assets/img/no-image.png'">
                              </a>
                            </c:when>
                            <c:otherwise><span class="text-muted smaller italic">No media</span></c:otherwise>
                          </c:choose>
                        </td>
                        <td>
                          <span class="badge ${inc.status == 'RESOLVED' ? 'bg-success' : (inc.status == 'PENDING' ? 'bg-warning' : 'bg-info')}">
                            ${inc.status}
                          </span>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </c:when>
            <c:otherwise>
              <div class="text-center py-5">
                <i class="fas fa-clipboard-check text-muted display-4 mb-3"></i>
                <p class="text-muted">You haven't reported any incidents yet.</p>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>

  </div>
</section>

<!-- Community Safety Map (Heatmap + Safest Route) -->
<section class="section py-5" style="background:#fff6f8;">
  <div class="container">
    <div class="text-center mb-4">
      <h2>Community Safety Map</h2>
      <p class="mb-0">Mark danger locations and find a safer route.</p>
    </div>

    <div class="row g-4">
      <div class="col-lg-4">
        <div class="p-4 rounded bg-white shadow-sm">
          <h5 class="mb-3">Mark a danger location</h5>
          <p class="small text-muted mb-3">Click on the map to pick a location, then submit details.</p>

          <div class="mb-3">
            <label class="form-label">Severity</label>
            <select id="dpSeverity" class="form-select">
              <option value="1">1 (Low)</option>
              <option value="2">2</option>
              <option value="3" selected>3 (Medium)</option>
              <option value="4">4</option>
              <option value="5">5 (High)</option>
            </select>
          </div>

          <div class="mb-3">
            <label class="form-label">Category</label>
            <select id="dpCategory" class="form-select">
              <option value="general" selected>General</option>
              <option value="harassment">Harassment</option>
              <option value="theft">Theft</option>
              <option value="poorLighting">Poor lighting</option>
              <option value="stalking">Stalking</option>
              <option value="unsafeTransport">Unsafe transport</option>
            </select>
          </div>

          <div class="mb-3">
            <label class="form-label">Note (optional)</label>
            <input id="dpNote" type="text" class="form-control" maxlength="200" placeholder="Short note (avoid personal info)">
          </div>

          <div class="mb-3">
            <label class="form-label">Attach Photo (optional)</label>
            <input id="dpImage" type="file" class="form-control" accept="image/*">
            <div class="small text-muted mt-1">Upload a photo for evidence.</div>
          </div>

          <!-- Purpose: enabled only after user clicks on map and selects a point. -->
          <button id="dpSubmit" class="btn btn-danger w-100" type="button" disabled>
            Submit selected point
          </button>
          <div id="dpStatus" class="small mt-3 text-muted"></div>

          <hr class="my-4">

          <h5 class="mb-3">Find a safer route</h5>
          <div class="mb-3">
            <label class="form-label">From</label>
            <input id="routeFrom" type="text" class="form-control" placeholder="Start location">
          </div>
          <div class="mb-3">
            <label class="form-label">To</label>
            <input id="routeTo" type="text" class="form-control" placeholder="Destination">
          </div>
          <div class="mb-3">
            <label class="form-label">Travel mode</label>
            <!-- Purpose: allow safer route selection for walking vs driving. -->
            <select id="routeMode" class="form-select">
              <option value="DRIVING" selected>Driving</option>
              <option value="WALKING">Walking</option>
              <option value="TRANSIT">Transit</option>
            </select>
          </div>
          <button id="routeGo" class="btn btn-primary w-100" type="button">Find safest route</button>
          <div class="d-flex gap-2 mt-3">
            <button id="toggleHeatmap" class="btn btn-outline-secondary btn-sm" type="button">Toggle heatmap</button>
            <button id="clearRoute" class="btn btn-outline-secondary btn-sm" type="button">Clear route</button>
          </div>
          <div id="routeStatus" class="small mt-3 text-muted"></div>
        </div>
      </div>

      <div class="col-lg-8">
        <!-- Purpose: map container; JS initializes Google Map + heatmap layer. -->
        <div id="dangerMap" class="rounded shadow-sm" style="height:520px; width:100%; background:#eee;"></div>
        
        <!-- Map Legend -->
        <div class="mt-3 p-3 bg-white rounded shadow-sm" style="font-size: 0.85rem;">
          <h6 class="mb-2"><i class="fas fa-info-circle me-2"></i>Map Legend</h6>
          <div class="d-flex flex-wrap gap-3">
            <div class="d-flex align-items-center"><span style="width:12px; height:12px; border-radius:50%; background:#e63946; display:inline-block; margin-right:6px;"></span> User Danger Point</div>
            <div class="d-flex align-items-center"><span style="width:12px; height:12px; border-radius:50%; background:#ef4444; display:inline-block; margin-right:6px;"></span> Harassment</div>
            <div class="d-flex align-items-center"><span style="width:12px; height:12px; border-radius:50%; background:#f97316; display:inline-block; margin-right:6px;"></span> Assault</div>
            <div class="d-flex align-items-center"><span style="width:12px; height:12px; border-radius:50%; background:#3b82f6; display:inline-block; margin-right:6px;"></span> Theft</div>
            <div class="d-flex align-items-center"><span style="width:12px; height:12px; border-radius:50%; background:#6b7280; display:inline-block; margin-right:6px;"></span> Other Incidents</div>
            <div class="ms-auto text-muted"><i class="fas fa-fire me-1" style="color:#ef4444;"></i> Heatmap: Red = High Risk Area</div>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>
</div>

  <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />

<script>
window.onload = function () {
  const params = new URLSearchParams(window.location.search);
  const tab = params.get("tab");
  if (tab) {
    switchTab(tab);
  }
};
</script>

<!-- Routine reminder popup (web-only) -->
<script>
  // Purpose: provide contextPath to reminder script.
  window.__APP_CTX__ = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/assets/js/reminder-popup.js"></script>

<script>
  (function () {
    const badge = document.getElementById("pendingRequestsBadge");
    if (!badge) return;

    function applyCount(count) {
      const n = Number(count || 0);
      if (n > 0) {
        badge.textContent = String(n);
        badge.style.display = "inline-block";
      } else {
        badge.textContent = "0";
        badge.style.display = "none";
      }
    }

    // initial render from server (if available)
    applyCount(${requestCount == null ? 0 : requestCount});

    async function refresh() {
      try {
        const res = await fetch("${pageContext.request.contextPath}/users/pendingRequestCount", {
          headers: { "Accept": "application/json" }
        });
        if (!res.ok) return;
        const data = await res.json();
        applyCount(data && data.count);
      } catch (e) {
        // ignore transient errors
      }
    }

    // poll every 5s for near real-time badge updates
    setInterval(refresh, 5000);
  })();
</script>

<!-- 🔴 Real-time friend-request badge (WebSocket) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
  (function () {
    const badge = document.getElementById("pendingRequestsBadge");
    if (!badge) return;

    const userId = ${sessionScope.user.id};
    const socket = new SockJS('${pageContext.request.contextPath}/ws-chat');
    const client = Stomp.over(socket);
    client.debug = null;

    function applyCount(count) {
      const n = Number(count || 0);
      if (n > 0) {
        badge.textContent = String(n);
        badge.style.display = "inline-block";
      } else {
        badge.textContent = "0";
        badge.style.display = "none";
      }
    }

    client.connect({}, function () {
      client.subscribe("/topic/follow/" + userId, function (frame) {
        try {
          const evt = JSON.parse(frame.body || "{}");
          if (evt && evt.type === "FOLLOW_STATE_CHANGED") {
            applyCount(evt.pendingRequestCount);
          }
        } catch (e) {}
      });
    });
  })();
</script>

<!-- Broadcast Messages Modal -->
<div class="modal fade" id="broadcastModal" tabindex="-1" aria-labelledby="broadcastModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content" style="border-radius: 16px; border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.2);">
      <div class="modal-header" style="background: var(--gradient-primary); color: white; border-top-left-radius: 16px; border-top-right-radius: 16px;">
        <h5 class="modal-title fw-bold" id="broadcastModalLabel"><i class="fas fa-bullhorn me-2"></i> System Announcements</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body p-0" style="background: #f8f9fa;">
        <c:choose>
            <c:when test="${not empty recentBroadcasts}">
                <div class="list-group list-group-flush">
                    <c:forEach var="msg" items="${recentBroadcasts}">
                        <div class="list-group-item p-3" style="border-left: 4px solid ${msg.type == 'ALERT' ? '#dc3545' : (msg.type == 'WARNING' ? '#ffc107' : '#0dcaf0')}; margin-bottom: 1px;">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="badge ${msg.type == 'ALERT' ? 'bg-danger' : (msg.type == 'WARNING' ? 'bg-warning text-dark' : 'bg-info text-dark')}" style="font-size: 0.75rem;">${msg.type}</span>
                                <small class="text-muted"><i class="fas fa-clock me-1"></i> ${msg.sentAt}</small>
                            </div>
                            <h6 class="mb-1 fw-bold" style="color: var(--primary-purple-dark);">${msg.title}</h6>
                            <p class="mb-0 text-muted" style="font-size: 0.9rem;">${msg.message}</p>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="text-center p-5">
                    <i class="fas fa-check-circle text-success mb-3" style="font-size: 3rem; opacity: 0.5;"></i>
                    <h6 class="text-muted">You're all caught up!</h6>
                    <p class="text-muted small mb-0">No new announcements from the admin.</p>
                </div>
            </c:otherwise>
        </c:choose>
      </div>
      <div class="modal-footer justify-content-center border-0 bg-light rounded-bottom">
        <button type="button" class="btn btn-secondary rounded-pill px-4" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script>
function markBroadcastsAsRead() {
    var badge = document.getElementById('broadcastBadge');
    if (badge) {
        badge.style.display = 'none';
        fetch('${pageContext.request.contextPath}/users/broadcast/read', {
            method: 'POST'
        }).then(response => {
            console.log('Broadcasts marked as read');
        }).catch(err => console.error(err));
    }
}
</script>

<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

<!-- Leaflet JS & Heatmap plugin -->
<script>
  // Purpose: expose contextPath to the map script.
  window.__APP_CTX__ = "${pageContext.request.contextPath}";
</script>
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
<script src="https://unpkg.com/leaflet.heat/dist/leaflet-heat.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/danger-map.js"></script>

</body>
</html>


