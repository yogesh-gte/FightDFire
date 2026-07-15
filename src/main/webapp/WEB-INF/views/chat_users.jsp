<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chat Users</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/Fight D Fear-theme.css" rel="stylesheet">
</head>
<body>

<jsp:include page="/WEB-INF/views/fragments/header.jsp" />
<div id="wrapper">
    <jsp:include page="/WEB-INF/views/fragments/sidebar.jsp" />
    <div id="page-content-wrapper" style="min-height: 100vh; overflow-x: hidden;">


<style>
  .collage-hero {
    display: flex;
    width: 100%;
    height: 500px;
    overflow: hidden;
    margin-bottom: 50px;
    background: #1a1a1a;
    position: relative;
    border-radius: 15px;
  }
  .collage-panel {
    flex: 1;
    height: 100%;
    border-right: 4px solid #fff;
    position: relative;
    overflow: hidden;
    transition: flex 0.7s cubic-bezier(0.25, 1, 0.5, 1);
    cursor: pointer;
    background: #333;
  }
  .collage-panel:last-child {
    border-right: none;
  }
  .collage-panel img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    filter: brightness(0.65);
    transition: transform 0.8s ease, filter 0.6s ease;
  }
  .collage-panel:hover {
    flex: 2;
  }
  .collage-panel:hover img {
    filter: brightness(1);
    transform: scale(1.1);
  }
  .collage-content {
    position: absolute;
    bottom: 50px;
    left: 25px;
    right: 25px;
    color: #fff;
    pointer-events: none;
    z-index: 5;
    opacity: 0;
    transition: opacity 0.5s ease;
  }
  .collage-panel:hover .collage-content {
    opacity: 1;
  }
  .collage-content h3 {
    font-size: 1.8rem;
    font-weight: 800;
    text-shadow: 0 4px 15px rgba(0,0,0,1);
    margin: 0;
  }
  .hero-overlay-text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    color: #fff;
    z-index: 10;
    pointer-events: none;
    width: 100%;
  }
    .hero-overlay-text h1 {
    font-size: 4.5rem;
    font-weight: 900;
    text-shadow: 0 5px 25px rgba(0,0,0,1);
    margin: 0;
  }
  
  /* Dashboard Button Styling */
  .dashboard-bar {
    position: relative;
    z-index: 99;
    margin-top: 10px;
    padding: 0 15px;
  }
  .dashboard-btn {
    background: linear-gradient(135deg, #1e1b4b 0%, #312e81 50%, #f43f5e 100%);
    color: #fff !important;
    padding: 10px 24px;
    border-radius: 50px;
    font-weight: 700;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 10px;
    box-shadow: 0 4px 15px rgba(124, 45, 94, 0.3);
    transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    font-family: 'Raleway', sans-serif;
    font-size: 0.95rem;
    letter-spacing: 0.5px;
  }
  .dashboard-btn:hover {
    transform: translateY(-3px) scale(1.02);
    box-shadow: 0 8px 25px rgba(124, 45, 94, 0.45);
    color: #fff !important;
  }
  .dashboard-btn i {
    font-size: 1.2rem;
    transition: transform 0.3s ease;
  }
  .dashboard-btn:hover i {
    transform: translateX(5px);
  }

  @media (max-width: 991px) {
    .collage-hero {
      height: 350px !important;
      margin-bottom: 30px;
    }
    .hero-overlay-text h1 {
      font-size: 2.2rem !important;
      padding: 0 15px;
    }
    .dashboard-bar {
      justify-content: center !important;
      margin-top: 15px;
      margin-bottom: 15px;
    }
    .dashboard-btn {
      width: 100%;
      justify-content: center;
      padding: 12px 20px;
    }
    .collage-panel {
        border-right: 2px solid #fff;
    }
    .collage-content h3 {
        font-size: 1.2rem;
    }
  }
</style>

<div class="collage-hero">
  <div class="collage-panel">
    <img src="${pageContext.request.contextPath}/assets/img/chat-slide-1.png" alt="Chat 1">
    <div class="collage-content">
      <h3>Stay Connected</h3>
    </div>
  </div>
  <div class="collage-panel">
    <img src="${pageContext.request.contextPath}/assets/img/chat-slide-2.png" alt="Chat 2">
    <div class="collage-content">
      <h3>Secure Circles</h3>
    </div>
  </div>
  <div class="collage-panel">
    <img src="${pageContext.request.contextPath}/assets/img/chat-slide-3.png" alt="Chat 3">
    <div class="collage-content">
      <h3>Safe Sharing</h3>
    </div>
  </div>
  <div class="hero-overlay-text">
    <h1><i class="bi bi-chat-heart-fill me-3"></i>Chat With Friends</h1>
  </div>
</div>

<section class="services section light-background py-5">
  <div class="container">
    <div class="row g-4">
      <c:forEach var="chatUser" items="${users}">
        <div class="col-md-4 col-sm-6">
          <a href="${pageContext.request.contextPath}/chat/window/${chatUser.id}" class="text-decoration-none">
            <div class="dashboard-card h-100 d-flex flex-column align-items-center p-4">
              <img src="${pageContext.request.contextPath}${chatUser.profilePhoto}"
                   onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/default-profile.png';"
                   alt="${chatUser.fullName}"
                   style="width:80px; height:80px; border-radius:50%; object-fit:cover; border:3px solid var(--primary-purple-light);">
              <h4 class="mt-3 mb-1">${not empty chatUser.fullName ? chatUser.fullName : chatUser.email}</h4>
              <span class="btn btn-watch-video btn-sm mt-2">
                <i class="bi bi-chat-fill me-1"></i> Open Chat
              </span>
            </div>
          </a>
        </div>
      </c:forEach>
    </div>
  </div>
</section>

<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

    </div>
</div>
</body>
</html>


