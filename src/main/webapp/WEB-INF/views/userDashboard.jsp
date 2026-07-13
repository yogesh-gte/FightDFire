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
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@700;800;900&display=swap" rel="stylesheet">

<!-- Icons & CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/fightdfire-theme.css" rel="stylesheet">
<!-- Leaflet CSS -->
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/>

<style>
    :root {
        --primary-purple: #1e1b4b; 
        --primary-purple-light: #312e81; 
        --primary-coral: #f43f5e; 
        --primary-teal: #20c997;
        --primary-gold: #ffd700;
        --light-bg: #f4f6fa;
        --shadow-sm: 0 4px 15px rgba(0, 0, 0, 0.05);
        --shadow-md: 0 10px 30px rgba(0, 0, 0, 0.08);
        --sidebar-text: rgba(255, 255, 255, 0.7);
    }

    body {
        background: var(--light-bg);
        overflow-x: hidden;
        font-family: 'Poppins', sans-serif;
    }

    /* === Sidebar Layout CSS === */
    #wrapper {
        display: flex;
        width: 100%;
        align-items: stretch;
    }
    
    /* NEW: Curved sidebar */
    #sidebar-wrapper {
        min-width: 260px;
        max-width: 260px;
        background: var(--primary-purple);
        color: white;
        transition: all 0.3s ease-in-out;
        min-height: calc(100vh - 80px); 
        z-index: 1000;
        position: sticky;
        top: 80px; 
        height: calc(100vh - 80px);
        overflow-y: auto;
        border-top-right-radius: 40px;
        padding-top: 20px;
        box-shadow: 10px 0 20px rgba(0,0,0,0.05);
    }
    
    #sidebar-wrapper::-webkit-scrollbar { width: 4px; }
    #sidebar-wrapper::-webkit-scrollbar-thumb { background-color: var(--primary-purple-light); border-radius: 10px; }
    
    .sidebar-heading {
        padding: 10px 25px 25px;
        font-size: 1.1rem;
        font-weight: 700;
        color: white;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    
    .list-group-item {
        background: transparent;
        color: var(--sidebar-text);
        border: none;
        padding: 12px 25px;
        font-size: 14px;
        font-weight: 500;
        transition: all 0.3s;
        display: flex;
        align-items: center;
        gap: 15px;
        position: relative;
        text-decoration: none;
    }
    .list-group-item i { font-size: 1.1rem; width: 20px; text-align: center; }
    .list-group-item:hover, .list-group-item.active {
        color: white;
        background: transparent;
    }
    .list-group-item:hover::before, .list-group-item.active::before {
        content: '';
        position: absolute;
        left: 0;
        top: 50%;
        transform: translateY(-50%);
        height: 70%;
        width: 4px;
        background: var(--primary-coral);
        border-radius: 0 4px 4px 0;
    }

    #page-content-wrapper {
        flex: 1;
        min-width: 0;
        display: flex;
        flex-direction: column;
        padding: 25px 30px;
    }
    
    .dashboard-header-flex {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 25px;
    }
    .dashboard-title {
        font-size: 1.3rem;
        font-weight: 700;
        color: var(--primary-purple);
        margin: 0;
    }
    .header-actions {
        display: flex;
        align-items: center;
        gap: 15px;
    }
    .reload-data {
        color: #64748b;
        font-size: 0.9rem;
        font-weight: 600;
        text-decoration: none;
        display: flex;
        align-items: center;
        gap: 6px;
    }
    
    /* 3-Column Layout structure */
    .dashboard-container {
        display: flex;
        gap: 25px;
        align-items: flex-start;
    }
    .main-col {
        flex: 1;
        min-width: 0;
    }
    .right-col {
        width: 320px;
        flex-shrink: 0;
        display: flex;
        flex-direction: column;
        gap: 25px;
    }
    
    /* 4 Stat Cards */
    .stat-cards-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
        margin-bottom: 25px;
    }
    .stat-card-new {
        background: #fff;
        border-radius: 16px;
        padding: 20px;
        box-shadow: var(--shadow-sm);
        position: relative;
    }
    .stat-icon-box {
        width: 45px;
        height: 45px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 20px;
        margin-bottom: 15px;
    }
    .stat-badge {
        position: absolute;
        top: 20px;
        right: 20px;
        padding: 4px 10px;
        border-radius: 20px;
        font-size: 0.75rem;
        font-weight: 700;
    }
    .stat-value-text {
        font-size: 1.6rem;
        font-weight: 800;
        color: #1e293b;
        line-height: 1.2;
        margin-bottom: 5px;
    }
    .stat-label-text {
        font-size: 0.85rem;
        color: #94a3b8;
        font-weight: 500;
        margin: 0;
    }
    
    /* Icons styling */
    .icon-blue { color: #3b82f6; }
    .icon-orange { color: #f97316; }
    .icon-yellow { color: #eab308; }
    .icon-green { color: #22c55e; }
    
    .badge-green { background: #dcfce7; color: #16a34a; }
    .badge-red { background: #fee2e2; color: #ef4444; }
    
    /* Panels */
    .panel-new {
        background: #fff;
        border-radius: 16px;
        padding: 20px;
        box-shadow: var(--shadow-sm);
        margin-bottom: 25px;
    }
    .panel-header-flex {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }
    .panel-title {
        font-size: 1.1rem;
        font-weight: 700;
        color: var(--primary-purple);
        margin: 0;
    }
    .panel-link {
        font-size: 0.85rem;
        color: #3b82f6;
        text-decoration: none;
        font-weight: 600;
    }
    
    /* Charts grid */
    .charts-grid {
        display: grid;
        grid-template-columns: 2fr 1fr 1fr;
        gap: 20px;
        margin-bottom: 25px;
    }
    .chart-container {
        position: relative;
        height: 250px;
        width: 100%;
    }
    
    /* Bottom grid */
    .bottom-grid {
        display: grid;
        grid-template-columns: 2fr 1fr;
        gap: 20px;
    }
    
    /* Lists */
    .activity-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    .activity-item {
        display: flex;
        align-items: center;
        gap: 15px;
        padding: 12px 0;
        border-bottom: 1px solid #f1f5f9;
    }
    .activity-item:last-child { border-bottom: none; }
    
    .act-avatar {
        width: 40px; height: 40px; border-radius: 50%; object-fit: cover;
    }
    .act-info { flex: 1; min-width: 0; }
    .act-title { font-size: 0.9rem; font-weight: 600; color: #1e293b; margin: 0; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
    .act-desc { font-size: 0.8rem; color: #94a3b8; margin: 0; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
    .act-time { font-size: 0.75rem; color: #94a3b8; font-weight: 500; }
    .act-amount { font-size: 0.9rem; font-weight: 700; }
    .text-green { color: #22c55e; }
    .text-red { color: #ef4444; }
    
    /* Leaflet fix */
    #dangerMap {
        border-radius: 12px;
        z-index: 1;
    }
    
    @media (max-width: 1200px) {
        .dashboard-container { flex-direction: column; }
        .right-col { width: 100%; flex-direction: row; }
        .right-col .panel-new { flex: 1; margin-bottom: 0; }
        .charts-grid { grid-template-columns: 1fr; }
        .bottom-grid { grid-template-columns: 1fr; }
    }
    @media (max-width: 991px) {
        .stat-cards-grid { grid-template-columns: repeat(2, 1fr); }
        .right-col { flex-direction: column; }
    }
    @media (max-width: 576px) {
        .stat-cards-grid { grid-template-columns: 1fr; }
    }
</style>
</head>

<body>

<jsp:include page="/WEB-INF/views/fragments/header.jsp" />

<div id="wrapper">
    <!-- Sidebar -->
    <div id="sidebar-wrapper">
        <div class="sidebar-heading">
            <i class="bi bi-layers-half"></i> Rubick <span style="font-weight: 400; font-size: 0.9rem;">FightDFire</span>
        </div>
        <div class="list-group list-group-flush mt-3">
            <!-- Dashboard (Active) -->
            <a href="${pageContext.request.contextPath}/users/dashboard" class="list-group-item active">
                <i class="bi bi-house-door"></i> Dashboard
            </a>
            
            <c:if test="${isWorker}">
                <a href="${pageContext.request.contextPath}/marketplace/worker-bookings" class="list-group-item">
                    <i class="bi bi-briefcase-fill text-success"></i> Job Bookings
                </a>
            </c:if>
            
            <!-- Restored previous links -->
            <a href="${pageContext.request.contextPath}/sos/dashboard" class="list-group-item">
                <i class="bi bi-exclamation-triangle text-danger"></i> SOS Emergency
            </a>
            <a href="${pageContext.request.contextPath}/users/profile/${user.id}" class="list-group-item">
                <i class="bi bi-person-badge"></i> Your Profile
            </a>
            <a href="${pageContext.request.contextPath}/centres/allacceptedcentres" class="list-group-item">
                <i class="bi bi-shield-check"></i> Martial Arts Centres
            </a>
            <a href="${pageContext.request.contextPath}/video/allVideos" class="list-group-item">
                <i class="bi bi-play-circle"></i> View Videos
            </a>
            <a href="${pageContext.request.contextPath}/incidents/report" class="list-group-item">
                <i class="bi bi-file-earmark-medical"></i> Report Incident
            </a>
            <a href="${pageContext.request.contextPath}/index/templates" class="list-group-item">
                <i class="bi bi-stars"></i> Glow Space
            </a>
            <a href="${pageContext.request.contextPath}/users/search?tab=requests" class="list-group-item">
                <i class="bi bi-people"></i> Let's Connect
                <span id="pendingRequestsBadge" class="badge bg-danger ms-auto" style="display:none;">0</span>
            </a>
            <a href="${pageContext.request.contextPath}/chat/users" class="list-group-item">
                <i class="bi bi-chat-dots"></i> Chat
            </a>
            <a href="${pageContext.request.contextPath}/video/reels" class="list-group-item">
                <i class="bi bi-camera-video"></i> Reels
            </a>
            <a href="${pageContext.request.contextPath}/users/wallet" class="list-group-item">
                <i class="bi bi-wallet2"></i> My Wallet
            </a>
            <a href="${pageContext.request.contextPath}/buddy" class="list-group-item">
                <i class="bi bi-person-walking"></i> Buddy Mode
            </a>
            <a href="${pageContext.request.contextPath}/doctors/list" class="list-group-item">
                <i class="bi bi-heart-pulse"></i> Women Doctors
            </a>
            <a href="${pageContext.request.contextPath}/marketplace" class="list-group-item">
                <i class="bi bi-shop"></i> Women Marketplace
            </a>

            
            
            <!-- Financial Literacy Hub -->
            <a href="${pageContext.request.contextPath}/financial-literacy" class="list-group-item list-group-item-action">
                <i class="bi bi-book"></i>  Financial Literacy Hub
            </a>
            <!-- Women Lawyers -->
            <a href="${pageContext.request.contextPath}/marketplace/list?category=WOMEN_LAWYER" class="list-group-item list-group-item-action">

            <a href="${pageContext.request.contextPath}/marketplace/list?category=WOMEN_LAWYER" class="list-group-item">

                <i class="bi bi-briefcase"></i> Women Lawyers
            </a>
            <a href="${pageContext.request.contextPath}/marketplace/list?category=FITNESS_ZUMBA" class="list-group-item">
                <i class="bi bi-activity"></i> Fitness & Zumba
            </a>
            <a href="${pageContext.request.contextPath}/women-products" class="list-group-item">
                <i class="bi bi-bag-heart"></i> Women Products
            </a>
            <a href="${pageContext.request.contextPath}/journey" class="list-group-item">
                <i class="bi bi-pin-map"></i> Journey Safety Tracker
            </a>
            <a href="${pageContext.request.contextPath}/reminders" class="list-group-item">
                <i class="bi bi-alarm"></i> Routine Reminders
            </a>
        </div>
    </div>
    
    <!-- Page Content -->
    <div id="page-content-wrapper">
        <div class="dashboard-header-flex">
            <h2 class="dashboard-title">
                General Report
                <c:if test="${isWorker}">
                    <span class="badge bg-success ms-2 fs-6 align-middle">
                        <i class="fas fa-user-check me-1"></i> Verified Worker
                    </span>
                </c:if>
            </h2>
            <div class="header-actions">
                <a href="#" class="reload-data" onclick="location.reload()"><i class="bi bi-arrow-clockwise"></i> Reload Data</a>
            </div>
        </div>

        <div class="dashboard-container">
            <!-- MAIN COLUMN -->
            <div class="main-col">
                
                <!-- 4 Stats Cards -->
                <div class="stat-cards-grid">
                    <div class="stat-card-new">
                        <span class="stat-badge badge-green">33% <i class="bi bi-arrow-up-short"></i></span>
                        <div class="stat-icon-box" style="background:#e0f2fe; color:#3b82f6;"><i class="bi bi-file-earmark-medical"></i></div>
                        <div class="stat-value-text">${myIncidents.size()}</div>
                        <p class="stat-label-text">My Incidents</p>
                    </div>
                    
                    <div class="stat-card-new">
                        <span class="stat-badge badge-red">2% <i class="bi bi-arrow-down-short"></i></span>
                        <div class="stat-icon-box" style="background:#ffedd5; color:#f97316;"><i class="bi bi-shield-check"></i></div>
                        <div class="stat-value-text">${approvedCentreCount}</div>
                        <p class="stat-label-text">Martial Arts Centres</p>
                    </div>
                    
                    <div class="stat-card-new">
                        <span class="stat-badge badge-green">12% <i class="bi bi-arrow-up-short"></i></span>
                        <div class="stat-icon-box" style="background:#fef3c7; color:#eab308;"><i class="bi bi-people"></i></div>
                        <div class="stat-value-text" id="statPendingRequests">${requestCount == null ? 0 : requestCount}</div>
                        <p class="stat-label-text">Connect Requests</p>
                    </div>
                    
                    <div class="stat-card-new">
                        <span class="stat-badge badge-green">22% <i class="bi bi-arrow-up-short"></i></span>
                        <div class="stat-icon-box" style="background:#dcfce7; color:#22c55e;"><i class="bi bi-bell"></i></div>
                        <div class="stat-value-text">${unreadBroadcastCount}</div>
                        <p class="stat-label-text">Unread Alerts</p>
                    </div>
                </div>

                <!-- Charts Section -->
                <div class="charts-grid">
                    <!-- Line Chart -->
                    <div class="panel-new">
                        <div class="panel-header-flex mb-1">
                            <h3 class="panel-title">Activity Report</h3>
                            <div class="d-flex align-items-center gap-2 border rounded px-3 py-1" style="font-size:0.8rem;">
                                <i class="bi bi-calendar3 text-muted"></i> 
                                <span>2 May - 2 Jun, 2026</span>
                            </div>
                        </div>
                        <div class="d-flex gap-4 mb-4 mt-3">
                            <div>
                                <div class="fs-4 fw-bold" style="color:var(--primary-purple);">${myIncidents.size() + 15}</div>
                                <div class="small text-muted fw-semibold">This Month</div>
                            </div>
                            <div>
                                <div class="fs-4 fw-bold text-muted">10</div>
                                <div class="small text-muted fw-semibold">Last Month</div>
                            </div>
                        </div>
                        <div class="chart-container">
                            <canvas id="lineChart"></canvas>
                        </div>
                    </div>
                    
                    <!-- Pie Chart -->
                    <div class="panel-new d-flex flex-column">
                        <div class="panel-header-flex">
                            <h3 class="panel-title">User Demographics</h3>
                            <a href="#" class="panel-link">Show More</a>
                        </div>
                        <div class="chart-container flex-grow-1 d-flex align-items-center" style="height: 180px;">
                            <canvas id="pieChart"></canvas>
                        </div>
                        <div class="mt-3 w-100">
                            <div class="d-flex justify-content-between align-items-center small text-muted mb-2">
                                <span><i class="bi bi-circle-fill icon-blue me-2" style="font-size:10px;"></i> 17 - 30 Years old</span>
                                <span class="fw-bold text-dark">62%</span>
                            </div>
                            <div class="d-flex justify-content-between align-items-center small text-muted mb-2">
                                <span><i class="bi bi-circle-fill icon-orange me-2" style="font-size:10px;"></i> 31 - 50 Years old</span>
                                <span class="fw-bold text-dark">33%</span>
                            </div>
                            <div class="d-flex justify-content-between align-items-center small text-muted">
                                <span><i class="bi bi-circle-fill icon-yellow me-2" style="font-size:10px;"></i> >= 50 Years old</span>
                                <span class="fw-bold text-dark">10%</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Donut Chart -->
                    <div class="panel-new d-flex flex-column">
                        <div class="panel-header-flex">
                            <h3 class="panel-title">Safety Score</h3>
                            <a href="#" class="panel-link">Show More</a>
                        </div>
                        <div class="chart-container flex-grow-1 d-flex align-items-center" style="height: 180px;">
                            <canvas id="donutChart"></canvas>
                        </div>
                        <div class="mt-3 w-100">
                             <div class="d-flex justify-content-between align-items-center small text-muted mb-2">
                                <span><i class="bi bi-circle-fill icon-blue me-2" style="font-size:10px;"></i> Secured Area</span>
                                <span class="fw-bold text-dark">85%</span>
                            </div>
                            <div class="d-flex justify-content-between align-items-center small text-muted mb-2">
                                <span><i class="bi bi-circle-fill me-2" style="font-size:10px; color:#e2e8f0;"></i> Risk Area</span>
                                <span class="fw-bold text-dark">15%</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bottom Grid -->
                <div class="bottom-grid">
                    <!-- Map -->
                    <div class="panel-new d-flex flex-column">
                        <div class="panel-header-flex">
                            <h3 class="panel-title">Community Safety Map</h3>
                            <div class="d-flex align-items-center gap-2 border rounded px-3 py-1 bg-light text-muted" style="font-size:0.8rem;">
                                <i class="bi bi-geo-alt"></i> Live Data
                            </div>
                        </div>
                        <div id="dangerMap" style="height:250px; width:100%; background:#eee; flex:1;"></div>
                        <div class="mt-3 text-muted small">
                            <i class="bi bi-info-circle me-1"></i> Showing current safety reports.
                        </div>
                    </div>
                    
                    <!-- Best Sellers (Featured Centres) -->
                    <div class="panel-new overflow-auto" style="max-height: 400px;">
                        <div class="panel-header-flex">
                            <h3 class="panel-title">Top Rated Centres</h3>
                        </div>
                        <c:choose>
                            <c:when test="${not empty approvedCentres}">
                                <ul class="activity-list">
                                    <c:forEach var="centre" items="${approvedCentres}" end="4">
                                        <li class="activity-item">
                                            <div class="act-avatar bg-light d-flex align-items-center justify-content-center text-primary" style="background:#e0e7ff; border-radius:8px;">
                                                <img src="${pageContext.request.contextPath}/assets/img/hero-bg.jpg" alt="img" class="w-100 h-100" style="border-radius:8px; object-fit:cover;">
                                            </div>
                                            <div class="act-info">
                                                <h4 class="act-title">${centre.name}</h4>
                                                <p class="act-desc">${centre.location}</p>
                                            </div>
                                            <span class="badge bg-success rounded-pill" style="font-size:0.7rem;">Active</span>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <p class="text-muted small">No centres available.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div><!-- /main-col -->
            
            <!-- RIGHT COLUMN -->
            <div class="right-col">
                
                <!-- Incoming Job requests moved to a dedicated page -->

                <!-- Transactions (Recent Broadcasts) -->
                <div class="panel-new">
                    <h3 class="panel-title mb-4">Recent Alerts</h3>
                    <c:choose>
                        <c:when test="${not empty recentBroadcasts}">
                            <ul class="activity-list">
                                <c:forEach var="msg" items="${recentBroadcasts}" end="4">
                                    <li class="activity-item">
                                        <div class="act-avatar d-flex align-items-center justify-content-center" style="background: ${msg.type == 'ALERT' ? '#fee2e2' : '#e0f2fe'}; color: ${msg.type == 'ALERT' ? '#ef4444' : '#0ea5e9'}">
                                            <i class="bi ${msg.type == 'ALERT' ? 'bi-exclamation-circle' : 'bi-info-circle'}"></i>
                                        </div>
                                        <div class="act-info">
                                            <h4 class="act-title">${msg.title}</h4>
                                            <p class="act-desc">${msg.sentAt}</p>
                                        </div>
                                        <div class="act-time fw-bold ${msg.type == 'ALERT' ? 'text-danger' : 'text-primary'}">${msg.type}</div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <p class="text-muted small">No recent alerts.</p>
                        </c:otherwise>
                    </c:choose>
                    <div class="mt-4 text-center">
                        <button class="btn border w-100 rounded text-muted fw-bold bg-light">View More</button>
                    </div>
                </div>
                
                <!-- Recent Activities (My Incidents) -->
                <div class="panel-new">
                    <div class="panel-header-flex">
                        <h3 class="panel-title">Recent Activities</h3>
                        <a href="#" class="panel-link">Show More</a>
                    </div>
                    <c:choose>
                        <c:when test="${not empty myIncidents}">
                            <ul class="activity-list border-start border-2 ms-3 border-light position-relative">
                                <c:forEach var="inc" items="${myIncidents}" end="3">
                                    <li class="activity-item align-items-start position-relative border-0 py-3">
                                        <!-- Timeline dot -->
                                        <div class="position-absolute" style="left: -23px; top: 15px; width: 14px; height: 14px; background:#f97316; border: 3px solid #fff; border-radius:50%;"></div>
                                        
                                        <div class="act-avatar d-flex align-items-center justify-content-center mt-0 ms-2" style="background: #ffedd5; color: #f97316;">
                                            <i class="bi bi-shield-exclamation"></i>
                                        </div>
                                        <div class="act-info">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <h4 class="act-title m-0">${inc.type} Incident Reported</h4>
                                                <div class="act-time m-0" style="font-size:0.7rem;">${inc.reportedAt}</div>
                                            </div>
                                            <p class="act-desc text-wrap mt-1 mb-2">${inc.description}</p>
                                            <span class="badge ${inc.status == 'RESOLVED' ? 'bg-success' : 'bg-warning text-dark'}" style="font-size:10px;">${inc.status}</span>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <p class="text-muted small">No recent activities.</p>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div><!-- /right-col -->
        </div><!-- /dashboard-container -->

    </div><!-- /#page-content-wrapper -->
</div><!-- /#wrapper -->

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Line Chart
        var canvas = document.getElementById('lineChart');
        if(canvas) {
            var ctxLine = canvas.getContext('2d');
            var gradient = ctxLine.createLinearGradient(0, 0, 0, 250);
            gradient.addColorStop(0, 'rgba(59, 130, 246, 0.4)');
            gradient.addColorStop(1, 'rgba(59, 130, 246, 0)');
            
            new Chart(ctxLine, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    datasets: [
                        {
                            label: 'Current Month',
                            data: [100, 250, 200, 450, 300, 650, 450, 800, 700, 950, 850, 1100],
                            borderColor: '#3b82f6',
                            backgroundColor: gradient,
                            borderWidth: 3,
                            pointRadius: 0,
                            pointHoverRadius: 6,
                            tension: 0.4,
                            fill: true
                        },
                        {
                            label: 'Last Month',
                            data: [150, 200, 180, 250, 220, 350, 320, 500, 450, 600, 580, 700],
                            borderColor: '#cbd5e1',
                            borderWidth: 2,
                            borderDash: [5, 5],
                            pointRadius: 0,
                            tension: 0.4,
                            fill: false
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { display: false } },
                    scales: {
                        x: { grid: { display: false }, ticks: {color: '#94a3b8'} },
                        y: { 
                            grid: { borderDash: [2, 2], color: '#f1f5f9' },
                            ticks: { color: '#94a3b8', callback: function(value) { return '$' + value; } }
                        }
                    }
                }
            });
        }

        // Pie Chart
        var pieCanvas = document.getElementById('pieChart');
        if (pieCanvas) {
            var ctxPie = pieCanvas.getContext('2d');
            new Chart(ctxPie, {
                type: 'pie',
                data: {
                    labels: ['17-30 Years', '31-50 Years', '>=50 Years'],
                    datasets: [{
                        data: [62, 33, 10],
                        backgroundColor: ['#3b82f6', '#f97316', '#eab308'],
                        borderWidth: 0,
                        hoverOffset: 4
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { display: false } }
                }
            });
        }

        // Donut Chart
        var donutCanvas = document.getElementById('donutChart');
        if (donutCanvas) {
            var ctxDonut = donutCanvas.getContext('2d');
            new Chart(ctxDonut, {
                type: 'doughnut',
                data: {
                    labels: ['Secured Area', 'Risk Area'],
                    datasets: [{
                        data: [85, 15],
                        backgroundColor: ['#3b82f6', '#e2e8f0'],
                        borderWidth: 0,
                        cutout: '75%'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { display: false } }
                }
            });
        }
    });
</script>

<!-- Leaflet JS & Map Init -->
<script>
  window.__APP_CTX__ = "${pageContext.request.contextPath}";
</script>
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        if(document.getElementById('dangerMap')) {
            var map = L.map('dangerMap').setView([20.5937, 78.9629], 5);
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '© OpenStreetMap'
            }).addTo(map);
        }
    });
</script>

<!-- WebSocket Badges -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
  (function () {
    const badge = document.getElementById("pendingRequestsBadge");
    if (!badge) return;
    function applyCount(count) {
      const n = Number(count || 0);
      if (n > 0) { badge.textContent = String(n); badge.style.display = "inline-block"; }
      else { badge.style.display = "none"; }
      const statEl = document.getElementById("statPendingRequests");
      if (statEl) statEl.textContent = String(n);
    }
    applyCount(${requestCount == null ? 0 : requestCount});
  })();
</script>

</body>
</html>
