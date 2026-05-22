<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>🎞 My Uploaded Videos</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fightdfire-theme.css">
    <style>
    /* ============================================
       ORIGINAL STYLES (kept exactly as is)
       ============================================ */
    :root {
        --primary-purple: #7C2D5E;
        --primary-purple-light: #a64281;
        --primary-coral: #DB2777;
        --primary-coral-dark: #5E1F47;
        --primary-teal: #20c997;
        --primary-gold: #ffd700;
        --dark-bg: #0f0f1a;
        --light-bg: #fffcfd;
        --gradient-primary: linear-gradient(135deg, #7C2D5E 0%, #a64281 50%, #DB2777 100%);
        --shadow-sm: 0 10px 30px rgba(0, 0, 0, 0.08);
        --shadow-md: 0 20px 40px rgba(0, 0, 0, 0.12);
    }

    body { 
        background: var(--light-bg); 
        margin: 0;
        font-family: 'Segoe UI', system-ui, sans-serif;
    }

    .pageShell { 
        max-width: 1100px; 
        margin: 0 auto; 
        padding: 32px 16px 40px; 
    }

    .videoCard { 
        border-radius: 16px; 
        overflow: hidden; 
        border: 1px solid var(--primary-purple-light); 
        box-shadow: var(--shadow-sm);
        transition: transform 0.2s, box-shadow 0.2s;
        background: white;
    }
    .videoCard:hover {
        transform: translateY(-4px);
        box-shadow: var(--shadow-md);
    }
    .videoCard video { 
        border-radius: 0; 
        width: 100%;
        display: block;
    }

    /* ============================================
       🚀 ADDITIONAL ENHANCEMENTS (no existing rules changed)
       ============================================ */

    /* 1. Smooth fade-in animation for the page shell */
    .pageShell {
        animation: fadeSlideUp 0.5s cubic-bezier(0.2, 0.9, 0.4, 1.1) forwards;
    }
    @keyframes fadeSlideUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* 2. Staggered animation for video cards (optional – adds polish) */
    .videoCard {
        opacity: 0;
        animation: cardFadeIn 0.4s forwards;
    }
    @keyframes cardFadeIn {
        from {
            opacity: 0;
            transform: translateY(15px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    .videoCard:nth-child(1) { animation-delay: 0.05s; }
    .videoCard:nth-child(2) { animation-delay: 0.1s; }
    .videoCard:nth-child(3) { animation-delay: 0.15s; }
    .videoCard:nth-child(4) { animation-delay: 0.2s; }
    .videoCard:nth-child(5) { animation-delay: 0.25s; }
    .videoCard:nth-child(6) { animation-delay: 0.3s; }

    /* 3. Video thumbnail hover effect – subtle scale and glow */
    .videoCard video {
        transition: transform 0.3s ease, box-shadow 0.3s;
    }
    .videoCard:hover video {
        transform: scale(1.02);
        box-shadow: inset 0 0 0 2px var(--primary-gold);
    }

    /* 4. Overlay play icon simulation (optional – purely visual) */
    .videoCard {
        position: relative;
    }
    .videoCard::after {
        content: '▶';
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%) scale(0.8);
        font-size: 48px;
        color: white;
        background: rgba(0,0,0,0.6);
        width: 70px;
        height: 70px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        opacity: 0;
        transition: opacity 0.2s, transform 0.2s;
        pointer-events: none;
        z-index: 2;
        font-family: Arial;
        backdrop-filter: blur(4px);
    }
    .videoCard:hover::after {
        opacity: 0.8;
        transform: translate(-50%, -50%) scale(1);
    }

    /* 5. Focus outline for accessibility (keyboard navigation) */
    .videoCard:focus-visible {
        outline: 3px solid var(--primary-gold);
        outline-offset: 3px;
        border-radius: 16px;
    }

    /* 6. Custom scrollbar (matches brand purple) */
    ::-webkit-scrollbar {
        width: 8px;
    }
    ::-webkit-scrollbar-track {
        background: var(--light-bg);
        border-radius: 10px;
    }
    ::-webkit-scrollbar-thumb {
        background: var(--primary-purple-light);
        border-radius: 10px;
    }
    ::-webkit-scrollbar-thumb:hover {
        background: var(--primary-purple);
    }

    /* 7. Responsive improvements for mobile */
    @media (max-width: 768px) {
        .pageShell {
            padding: 20px 12px 30px;
        }
        .videoCard::after {
            width: 50px;
            height: 50px;
            font-size: 32px;
        }
    }

    /* 8. Loading skeleton ready (optional – does nothing by default) */
    @keyframes shimmer {
        0% { background-position: -200% 0; }
        100% { background-position: 200% 0; }
    }
    .videoCard.skeleton {
        background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
        background-size: 200% 100%;
        animation: shimmer 1.5s infinite;
        pointer-events: none;
    }
</style>
</head>
<body class="fdf-page">
<div class="pageShell">
<h2 class="mb-3">All Uploaded Videos</h2>
 
<a href="${pageContext.request.contextPath}/video/upload?isReel=false" class="btn btn-fdf mb-3">Upload New Video</a>
 
<div class="row">
    <c:forEach var="video" items="${videos}">
        <div class="col-md-4 mb-3">
            <div class="card videoCard">
                <c:choose>
                    <c:when test="${not empty video.thumbnailPath}">
                        <div class="position-relative">
                            <img src="${pageContext.request.contextPath}${video.thumbnailPath}" class="w-100" style="aspect-ratio: 16/9; object-fit: cover;">
                            <div class="position-absolute top-0 end-0 p-2">
                                <c:if test="${video.isPrivate()}">
                                    <span class="badge bg-dark opacity-75"><i class="bi bi-lock-fill"></i> Private</span>
                                </c:if>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <video controls width="100%" poster="${pageContext.request.contextPath}${video.thumbnailPath}">
                            <source src="${pageContext.request.contextPath}${video.videoPath}" type="video/mp4">
                        </video>
                    </c:otherwise>
                </c:choose>
                <div class="card-body text-center">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <span class="badge bg-secondary">${video.category}</span>
                        <c:if test="${not video.isPrivate()}">
                            <span class="badge bg-success">Public</span>
                        </c:if>
                        <c:choose>
                            <c:when test="${video.isReel()}">
                                <span class="badge bg-primary">🎬 Reel</span>
                            </c:when>
                            <c:otherwise>
                                <c:if test="${not video.isPrivate()}">
                                    <span class="badge bg-success">Public</span>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <h5>${video.title}</h5>
                    <p class="text-truncate">${video.description}</p>
                    <small class="text-muted">Uploaded on: ${video.uploadTime}</small><br>
                    ❤️ <span id="like-${video.id}">${video.likeCount}</span> &nbsp;&nbsp; 
                    👁️ <span id="view-${video.id}">${video.viewCount}</span> views <br><br><a href="${pageContext.request.contextPath}/video/comments/${video.id}">
    💬 Comments (${video.comments.size()})
</a>
                    👁️ <span id="view-${video.id}">${video.viewCount}</span> views <br><br>
                    
                    <div class="d-flex justify-content-center gap-2">
                        <a href="${pageContext.request.contextPath}/video/comments/${video.id}" class="btn btn-outline-primary btn-sm">
                            💬 Comments (${video.comments.size()})
                        </a>
                        <c:if test="${video.user.id == sessionScope.user.id}">
                            <form action="${pageContext.request.contextPath}/video/deleteUpload" method="post" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this video? This action cannot be undone.');">
                                <input type="hidden" name="videoId" value="${video.id}">
                                <button type="submit" class="btn btn-outline-danger btn-sm">
                                    🗑️ Delete
                                </button>
                            </form>
                        </c:if>
                    </div>
 
                  
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<!-- 🔴 Real-time myVideos updates (likes/views/comments) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
  (function () {
    const userId = ${sessionScope.user.id};
    const socket = new SockJS('${pageContext.request.contextPath}/ws-chat');
    const client = Stomp.over(socket);
    client.debug = null;

    client.connect({}, function () {
      client.subscribe("/topic/userVideos/" + userId, function (frame) {
        try {
          const evt = JSON.parse(frame.body || "{}");
          if (!evt || !evt.type || !evt.videoId) return;

          if (evt.type === "LIKE_UPDATED") {
            const el = document.getElementById("like-" + evt.videoId);
            if (el) el.textContent = String(evt.likeCount);
          }
          if (evt.type === "VIEW_UPDATED") {
            const el = document.getElementById("view-" + evt.videoId);
            if (el) el.textContent = String(evt.viewCount);
          }
          // For new uploads by same user, simplest is reload
          if (evt.type === "NEW_UPLOAD") {
            window.location.reload();
          }
        } catch (e) {}
      });
    });
  })();
</script>
</div>
</body>
</html>
