<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<aside class="sidebar">

    <!-- MOBILE HEADER -->
    <div class="d-flex justify-content-between align-items-center mb-3 d-lg-none">

        <div class="brand mb-0">
            Admin Menu
        </div>

        <button type="button"
                class="btn-close"
                id="closeSidebar"
                aria-label="Close">
        </button>

    </div>

    <!-- DESKTOP HEADER -->
    <div class="brand d-none d-lg-block">
        Admin Menu
    </div>

    <!-- DASHBOARD -->
    <div class="sectionTitle">
        Dashboard
    </div>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'adminDashboard') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/adminDashboard">

        <i class="fas fa-home"></i>
        Home

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'heatmap') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/heatmap">

        <i class="fas fa-map-marked-alt"></i>
        Incident Heatmap

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'buddy-management') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/buddy-management">

        <i class="fas fa-user-friends"></i>
        Buddy Oversight

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'safety-points') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/safety-points">

        <i class="fas fa-shield-alt"></i>
        Safety Verification

    </a>

    <!-- COMMUNICATION -->
    <div class="sectionTitle">
        Communication
    </div>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'contact-messages') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/contact-messages">

        <i class="fas fa-envelope"></i>
        Contact Messages

        <c:if test="${side_unreadContactMessages > 0}">
            <span class="badge rounded-pill bg-danger ms-auto">
                ${side_unreadContactMessages}
            </span>
        </c:if>

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'broadcast') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/broadcast">

        <i class="fas fa-bullhorn"></i>
        Broadcast Center

    </a>

    <!-- ANALYTICS -->
    <div class="sectionTitle">
        Analytics
    </div>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'reports') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/reports">

        <i class="fas fa-chart-bar"></i>
        Reports & Exports

    </a>

    <!-- MODERATION -->
    <div class="sectionTitle">
        Moderation
    </div>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'sos') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/sos">

        <i class="fas fa-broadcast-tower" style="color:#ff3b3b;"></i>
        SOS Monitoring

        <span class="badge rounded-pill bg-danger ms-auto"
              id="sosSideBadge"
              style="display:none;">

            LIVE

        </span>

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'incidents') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/incidents/list">

        <i class="fas fa-bell"></i>
        Incidents

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'reported-videos') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/reported-videos">

        <i class="fas fa-flag"></i>
        Reported Videos

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'questions') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/qna/admin/questions">

        <i class="fas fa-question-circle"></i>
        Q&amp;A Panel

    </a>

    <!-- APPROVALS -->
    <div class="sectionTitle">
        Approvals
    </div>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'martialManagement') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/martialManagement">

        <i class="fas fa-dumbbell"></i>
        Martial Arts Centres

        <c:if test="${side_pendingCentres > 0}">
            <span class="badge rounded-pill bg-danger ms-auto">
                ${side_pendingCentres}
            </span>
        </c:if>

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'pending-suggestions') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/pending-suggestions">

        <i class="fas fa-users"></i>
        Volunteer Suggestions

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'users') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/users">

        <i class="fas fa-users-cog"></i>
        User Management

        <c:if test="${side_pendingUsers > 0}">
            <span class="badge rounded-pill bg-danger ms-auto">
                ${side_pendingUsers}
            </span>
        </c:if>

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'salons') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/salons">

        <i class="fas fa-cut"></i>
        Salon Verification

        <c:if test="${side_pendingSalons > 0}">
            <span class="badge rounded-pill bg-danger ms-auto">
                ${side_pendingSalons}
            </span>
        </c:if>

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'stylists') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/stylists">

        <i class="fas fa-user-tie"></i>
        Stylist Verification

        <c:if test="${side_pendingStylists > 0}">
            <span class="badge rounded-pill bg-danger ms-auto">
                ${side_pendingStylists}
            </span>
        </c:if>

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'pending-doctors') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/pending-doctors">

        <i class="fas fa-user-md"></i>
        Doctor Verification

        <c:if test="${side_pendingDoctors > 0}">
            <span class="badge rounded-pill bg-danger ms-auto">
                ${side_pendingDoctors}
            </span>
        </c:if>

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'pending-providers') && param.category == 'WOMEN_LAWYER' ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/pending-providers?category=WOMEN_LAWYER">

        <i class="fas fa-gavel"></i>
        Women Lawyer

        <c:if test="${side_pendingLawyers > 0}">
            <span class="badge rounded-pill bg-danger ms-auto">
                ${side_pendingLawyers}
            </span>
        </c:if>

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'pending-providers') && param.category == 'FITNESS_ZUMBA' ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/pending-providers?category=FITNESS_ZUMBA">

        <i class="fas fa-running"></i>
        Fitness Zumba

        <c:if test="${side_pendingFitness > 0}">
            <span class="badge rounded-pill bg-danger ms-auto">
                ${side_pendingFitness}
            </span>
        </c:if>

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'pending-providers') && empty param.category ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/pending-providers">

        <i class="fas fa-store"></i>
        Marketplace Providers

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'WOMEN_PRODUCTS') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/pending-providers?category=WOMEN_PRODUCTS">

        <i class="fas fa-shopping-bag"></i>
        Women Services

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'pending-sellers') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/pending-sellers">

        <i class="fas fa-shopping-cart"></i>
        Product Sellers

        <c:if test="${side_pendingSellers > 0}">
            <span class="badge rounded-pill bg-danger ms-auto">
                ${side_pendingSellers}
            </span>
        </c:if>

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'women-product-orders') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/women-product-orders">

        <i class="fas fa-box"></i>
        Product Orders

    </a>

    <!-- FINANCIAL LITERACY -->
    <div class="sectionTitle">
        Financial Literacy
    </div>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'financial-literacy/admin') && !fn:contains(pageContext.request.requestURI,'add-') && !fn:contains(pageContext.request.requestURI,'registrations') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/financial-literacy/admin">

        <i class="fas fa-book"></i>
        Home

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'add-video') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/financial-literacy/admin/add-video">

        <i class="fas fa-plus-circle"></i>
        Add Video

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'add-live-session') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/financial-literacy/admin/add-live-session">

        <i class="fas fa-video"></i>
        Add Live Session

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'add-workshop') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/financial-literacy/admin/add-workshop">

        <i class="fas fa-calendar-check"></i>
        Add Workshop

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'registrations') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/financial-literacy/admin/registrations">

        <i class="fas fa-users"></i>
        View Registrations

    </a>

    <!-- CONTENT -->
    <div class="sectionTitle">
        Content
    </div>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'videoManagement') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/video/videoManagement">

        <i class="fas fa-video"></i>
        Video Library

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'videos') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/videos">

        <i class="fas fa-film"></i>
        Reels Rewards

    </a>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'user-reels') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/user-reels">

        <i class="fas fa-mobile-alt"></i>
        User Reels Management

    </a>

    <!-- ACCOUNT -->
    <div class="sectionTitle">
        Account
    </div>

    <a class="navlink ${fn:contains(pageContext.request.requestURI,'profile') ? 'active' : ''}"
       href="${pageContext.request.contextPath}/admin/profile/${admin.id}">

        <i class="fas fa-user"></i>
        Profile

    </a>

    <a class="navlink"
       href="${pageContext.request.contextPath}/admin/logout">

        <i class="fas fa-sign-out-alt"></i>
        Logout

    </a>

</aside>
