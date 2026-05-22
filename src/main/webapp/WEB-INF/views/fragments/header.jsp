<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    /* ============================================
       UNIVERSAL HEADER CSS
       Guarantees identical appearance across all pages
       ============================================ */
    :root {
        --uh-purple: #7C2D5E;
        --uh-purple-light: #a64281;
        --uh-coral: #DB2777;
        --uh-gradient: linear-gradient(135deg, #7C2D5E 0%, #a64281 50%, #DB2777 100%);
    }

    .header {
        background: rgba(255,255,255,0.97) !important;
        border-bottom: 2px solid rgba(74, 14, 120, 0.08);
        backdrop-filter: blur(8px);
        padding: 15px 0;
        transition: all 0.5s;
        z-index: 997;
    }

    .header .logo h1 {
        font-size: 30px !important;
        margin: 0;
        font-weight: 700;
        letter-spacing: 2px;
        background: var(--uh-gradient) !important;
        -webkit-background-clip: text !important;
        -webkit-text-fill-color: transparent !important;
        background-clip: text !important;
    }

    .header .btn-getstarted {
        background: var(--uh-gradient) !important;
        border: none !important;
        color: #fff !important;
        font-size: 14px !important;
        padding: 8px 25px !important;
        margin: 0 0 0 30px !important;
        border-radius: 50px !important;
        transition: 0.3s;
        text-decoration: none !important;
        font-weight: 600;
    }
    
    .header .btn-getstarted:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.1);
    }

    @media (min-width: 1200px) {
        .navmenu {
            padding: 0;
        }
        .navmenu ul {
            margin: 0;
            padding: 0;
            display: flex;
            list-style: none;
            align-items: center;
        }
        .navmenu li {
            position: relative;
        }
        .navmenu a, .navmenu a:focus {
            color: var(--uh-purple-light) !important;
            font-weight: 600 !important;
            padding: 18px 15px !important;
            font-size: 16px !important;
            font-family: 'Poppins', sans-serif;
            display: flex;
            align-items: center;
            justify-content: space-between;
            white-space: nowrap;
            transition: 0.3s;
            text-decoration: none !important;
            position: relative;
        }
        .navmenu a::after {
            content: '';
            position: absolute;
            bottom: 12px;
            left: 15px;
            width: 0%;
            height: 2px;
            background: var(--uh-gradient);
            transition: width 0.3s ease;
        }
        .navmenu a:hover::after, .navmenu .active::after {
            width: calc(100% - 30px);
        }
        .navmenu a:hover, .navmenu .active {
            color: var(--uh-purple) !important;
            text-shadow: 0 0 4px rgba(74,14,120,0.2);
        }
    }

    .header-profile-img {
        width: 42px;
        height: 42px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid var(--uh-purple-light);
        transition: all 0.4s cubic-bezier(0.34, 1.2, 0.64, 1);
        cursor: pointer;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    }
    .header-profile-img:hover {
        transform: scale(1.15) rotate(5deg);
        border-color: var(--uh-coral);
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.12);
    }

    .mobile-nav-toggle {
        color: var(--uh-purple) !important;
        font-size: 28px;
        cursor: pointer;
        line-height: 0;
        transition: 0.5s;
        margin-left: 10px;
    }
</style>

<!-- ======= Header ======= -->
<header id="header" class="header d-flex align-items-center sticky-top">
  <div class="container-fluid container-xl d-flex align-items-center">
    <a href="${pageContext.request.contextPath}/users/dashboard" class="logo me-auto" style="text-decoration: none;"><h1>FightDFire</h1></a>
    <nav id="navmenu" class="navmenu">
      <ul>
        <li><a href="${pageContext.request.contextPath}/chat/users">Chat</a></li>
        <li><a href="${pageContext.request.contextPath}/user/bookings">My Bookings</a></li>
        <li><a href="${pageContext.request.contextPath}/users/wallet">Wallet 💰</a></li>
        
        <!-- Notification Bell for Broadcasts -->
        <li>
            <a href="#" data-bs-toggle="modal" data-bs-target="#broadcastModal" onclick="markBroadcastsAsRead()" style="display: flex; align-items: center;">
                <div style="position: relative; display: inline-block;">
                    <i class="fas fa-bell fs-5"></i>
                    <c:if test="${unreadBroadcastCount > 0}">
                        <span id="broadcastBadge" class="position-absolute badge rounded-pill bg-danger" 
                              style="font-size: 0.65rem; top: -5px; right: -10px; padding: 3px 6px;">
                            ${unreadBroadcastCount}
                        </span>
                    </c:if>
                </div>
            </a>
        </li>
        
        <li><a href="${pageContext.request.contextPath}/users/profile/${user.id}">${user.fullName}</a></li>
      </ul>
      <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
    </nav>
    <a href="${pageContext.request.contextPath}/users/profile/${user.id}" class="ms-3">
        <c:choose>
            <c:when test="${not empty user.profilePhoto}">
                <img src="${pageContext.request.contextPath}${user.profilePhoto}" alt="Profile" class="header-profile-img">
            </c:when>
            <c:otherwise>
                <img src="${pageContext.request.contextPath}/assets/img/default-profile.png" alt="Profile" class="header-profile-img">
            </c:otherwise>
        </c:choose>
    </a>
    <a class="btn-getstarted" href="${pageContext.request.contextPath}/logout">Logout</a>
  </div>
</header>
