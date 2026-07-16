<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    /* === Sidebar Layout CSS === */
    #wrapper {
        display: flex;
        width: 100%;
        align-items: stretch;
    }
    
    /* Curved sidebar */
    #sidebar-wrapper {
        min-width: 260px;
        max-width: 260px;
        background: #1e1b4b; /* var(--primary-purple) */
        color: white;
        transition: all 0.3s ease-in-out;
        min-height: 100vh; 
        z-index: 1000;
        position: fixed;
        top: 0;
        left: 0;
        height: 100vh;
        overflow-y: auto;
        border-top-right-radius: 0;
        padding-top: 20px;
        box-shadow: 10px 0 20px rgba(0,0,0,0.05);
    }
    
    #sidebar-wrapper::-webkit-scrollbar { width: 4px; }
    #sidebar-wrapper::-webkit-scrollbar-thumb { background-color: #312e81; border-radius: 10px; }
    
    .sidebar-heading {
        padding: 10px 25px 25px;
        font-size: 1.1rem;
        font-weight: 700;
        color: white;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    
    .sidebar-list-group-item {
        background: transparent;
        color: rgba(255, 255, 255, 0.7);
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
    .sidebar-list-group-item i { font-size: 1.1rem; width: 20px; text-align: center; }
    .sidebar-list-group-item:hover, .sidebar-list-group-item.active {
        color: white;
        background: transparent;
    }
    .sidebar-list-group-item:hover::before, .sidebar-list-group-item.active::before {
        content: '';
        position: absolute;
        left: 0;
        top: 50%;
        transform: translateY(-50%);
        height: 70%;
        width: 4px;
        background: #f43f5e;
        border-radius: 0 4px 4px 0;
    }

    #page-content-wrapper {
        flex: 1;
        min-width: 0;
        margin-left: 260px; /* offset for fixed sidebar */
        display: flex;
        flex-direction: column;
        padding: 25px 30px;
        background: #f4f6fa !important;
    }
    
    @media (max-width: 768px) {
        #sidebar-wrapper {
            position: fixed !important;
            top: 70px !important;
            left: -100% !important;
            width: 260px !important;
            height: calc(100vh - 70px) !important;
            z-index: 9999 !important;
            transition: left 0.4s ease !important;
            min-width: 260px !important;
            max-width: 260px !important;
            border-radius: 0 !important;
            padding-top: 20px !important;
        }
        #page-content-wrapper {
            margin-left: 0 !important;
        }
        body.mobile-nav-active #sidebar-wrapper {
            left: 0 !important;
        }
        .list-group {
            flex-direction: column !important;
            margin-top: 0 !important;
        }
        .sidebar-list-group-item {
            display: flex !important;
            background: transparent !important;
        }
    }
</style>

<!-- Sidebar -->
<div id="sidebar-wrapper">
    <div class="sidebar-heading">
        <i class="bi bi-layers-half"></i> <span style="font-weight: 700; font-size: 1.1rem;">FightDFire</span>
    </div>

    <!-- User Profile Section -->
    <c:if test="${not empty user}">
        <div class="d-flex align-items-center p-3" style="border-bottom: 1px solid rgba(255,255,255,0.05); background: rgba(0,0,0,0.1);">
            <a href="${pageContext.request.contextPath}/users/profile/${user.id}">
                <c:choose>
                    <c:when test="${not empty user.profilePhoto}">
                        <img src="${pageContext.request.contextPath}${user.profilePhoto}" alt="Profile" style="width: 45px; height: 45px; border-radius: 50%; object-fit: cover; border: 2px solid #f43f5e; box-shadow: 0 2px 8px rgba(244,63,94,0.3);">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/assets/img/default-profile.png" alt="Profile" style="width: 45px; height: 45px; border-radius: 50%; object-fit: cover; border: 2px solid #f43f5e; box-shadow: 0 2px 8px rgba(244,63,94,0.3);">
                    </c:otherwise>
                </c:choose>
            </a>
            <div class="ms-3 overflow-hidden">
                <div class="fw-bold text-white text-truncate" style="font-size: 0.95rem;">${user.fullName}</div>
                <div class="text-success d-flex align-items-center" style="font-size: 0.75rem;">
                    <span style="display:inline-block; width: 6px; height: 6px; background-color: #28a745; border-radius: 50%; margin-right: 5px;"></span> Online
                </div>
            </div>
        </div>
    </c:if>

    <div class="list-group list-group-flush mt-2">
        <a href="${pageContext.request.contextPath}/users/dashboard" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/users/dashboard') ? 'active' : ''}">
            <i class="bi bi-speedometer2"></i> Dashboard
        </a>
        <a href="${pageContext.request.contextPath}/" class="sidebar-list-group-item">
            <i class="bi bi-house-door"></i> Back to Home
        </a>
        <a href="${pageContext.request.contextPath}/creator-hub" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/creator-hub') ? 'active' : ''}">
            <i class="bi bi-camera-reels"></i> Creator Hub
        </a>
        <c:if test="${isWorker}">
            <a href="${pageContext.request.contextPath}/marketplace/worker-bookings" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/marketplace/worker-bookings') ? 'active' : ''}">
                <i class="bi bi-briefcase-fill text-success"></i> Job Bookings
            </a>
        </c:if>
        <a href="${pageContext.request.contextPath}/sos/dashboard" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/sos') ? 'active' : ''}">
            <i class="bi bi-exclamation-triangle"></i> SOS Emergency
        </a>
        <a href="${pageContext.request.contextPath}/users/profile/${user.id}" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/users/profile') ? 'active' : ''}">
            <i class="bi bi-person-badge"></i> Your Profile
        </a>
        <a href="#" data-bs-toggle="modal" data-bs-target="#broadcastModal" onclick="markBroadcastsAsRead()" class="sidebar-list-group-item">
            <i class="bi bi-bell"></i> Notifications
            <c:if test="${unreadBroadcastCount > 0}">
                <span id="sidebarBroadcastBadge" class="badge rounded-pill bg-danger ms-auto">${unreadBroadcastCount}</span>
            </c:if>
        </a>
        <a href="${pageContext.request.contextPath}/centres/allacceptedcentres" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/centres') ? 'active' : ''}">
            <i class="bi bi-shield-check"></i> Martial Arts Centres
        </a>
        <a href="${pageContext.request.contextPath}/video/allVideos" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/video/allVideos') ? 'active' : ''}">
            <i class="bi bi-play-circle"></i> View Videos
        </a>
        <a href="${pageContext.request.contextPath}/financial-literacy" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/financial-literacy') ? 'active' : ''}">
            <i class="bi bi-book"></i> Financial Literacy Hub
        </a>
        <a href="${pageContext.request.contextPath}/incidents/report" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/incidents') ? 'active' : ''}">
            <i class="bi bi-file-earmark-medical"></i> Report Incident
        </a>
        <a href="${pageContext.request.contextPath}/index/templates" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/templates') ? 'active' : ''}">
            <i class="bi bi-stars"></i> Glow Space
        </a>
        <a href="${pageContext.request.contextPath}/users/search?tab=requests" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/users/search') ? 'active' : ''}">
            <i class="bi bi-people"></i> Let's Connect
            <span id="pendingRequestsBadge" class="badge bg-danger ms-auto" style="display:none;">0</span>
        </a>
        <a href="${pageContext.request.contextPath}/chat/users" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/chat') ? 'active' : ''}">
            <i class="bi bi-chat-dots"></i> Chat
        </a>
        <a href="${pageContext.request.contextPath}/video/reels" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/reels') ? 'active' : ''}">
            <i class="bi bi-camera-video"></i> Reels
        </a>
        <a href="${pageContext.request.contextPath}/users/wallet" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/wallet') ? 'active' : ''}">
            <i class="bi bi-wallet2"></i> My Wallet
        </a>
        <a href="${pageContext.request.contextPath}/user/bookings" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/user/bookings') ? 'active' : ''}">
            <i class="bi bi-journal-bookmark"></i> My Bookings
        </a>
        <a href="${pageContext.request.contextPath}/marketplace/earn" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/marketplace/earn') ? 'active' : ''}">
            <i class="bi bi-briefcase-fill"></i> Want to Earn
        </a>
        <a href="${pageContext.request.contextPath}/qna" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/qna') ? 'active' : ''}">
            <i class="bi bi-question-circle"></i> Q&A
        </a>
        <a href="${pageContext.request.contextPath}/buddy" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/buddy') ? 'active' : ''}">
            <i class="bi bi-person-walking"></i> Buddy Mode
        </a>
        <a href="${pageContext.request.contextPath}/doctors/list" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/doctors') ? 'active' : ''}">
            <i class="bi bi-heart-pulse"></i> Women Doctors
        </a>
        <a href="${pageContext.request.contextPath}/marketplace" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/marketplace') && !requestScope['javax.servlet.forward.query_string'].contains('category=') ? 'active' : ''}">
            <i class="bi bi-shop"></i> Women Marketplace
        </a>
        <c:if test="${not empty loggedEntrepreneur}">
            <a href="${pageContext.request.contextPath}/entrepreneur/dashboard" class="sidebar-list-group-item fw-bold">
                <i class="bi bi-briefcase"></i> Entrepreneur Portal
            </a>
        </c:if>
        <c:if test="${not empty loggedInvestor}">
            <a href="${pageContext.request.contextPath}/investor/dashboard" class="sidebar-list-group-item fw-bold">
                <i class="bi bi-wallet2"></i> Investor Portal
            </a>
        </c:if>
        <a href="${pageContext.request.contextPath}/marketplace/list?category=WOMEN_LAWYER" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.query_string'].contains('WOMEN_LAWYER') ? 'active' : ''}">
            <i class="bi bi-briefcase"></i> Women Lawyers
        </a>
        <a href="${pageContext.request.contextPath}/fitness" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/fitness') ? 'active' : ''}">
            <i class="bi bi-activity"></i> Fitness & Wellness
        </a>
        <a href="${pageContext.request.contextPath}/women-events" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/women-events') ? 'active' : ''}">
            <i class="bi bi-calendar-event"></i> Women Events
        </a>
        <a href="${pageContext.request.contextPath}/women-products" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/women-products') ? 'active' : ''}">
            <i class="bi bi-bag-heart"></i> Women Products
        </a>
        <a href="${pageContext.request.contextPath}/journey" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/journey') ? 'active' : ''}">
            <i class="bi bi-pin-map"></i> Journey Safety Tracker
        </a>
        <a href="${pageContext.request.contextPath}/reminders" class="sidebar-list-group-item ${requestScope['javax.servlet.forward.request_uri'].contains('/reminders') ? 'active' : ''}">
            <i class="bi bi-alarm"></i> Routine Reminders
        </a>
        <a href="${pageContext.request.contextPath}/logout" class="sidebar-list-group-item" style="color: #f43f5e; margin-top: 15px; border-top: 1px solid rgba(255,255,255,0.1);">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </div>
</div>

