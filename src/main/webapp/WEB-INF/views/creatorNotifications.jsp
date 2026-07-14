<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creator Notifications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --dark-bg: #09090e;
            --card-bg: rgba(20, 20, 35, 0.6);
            --border-color: rgba(255, 255, 255, 0.08);
            --primary-accent: #f43f5e;
            --secondary-accent: #8b5cf6;
            --text-main: #f3f4f6;
            --text-muted: #9ca3af;
        }

        body {
            background-color: var(--dark-bg);
            background-image: radial-gradient(circle at 10% 20%, rgba(139, 92, 246, 0.07) 0%, transparent 45%),
                              radial-gradient(circle at 90% 80%, rgba(244, 63, 94, 0.07) 0%, transparent 45%);
            color: var(--text-main);
            font-family: 'Outfit', sans-serif;
            margin: 0;
            padding-bottom: 80px;
        }

        .hub-container {
            margin-top: 110px;
        }

        .glass-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 24px;
            padding: 30px;
            backdrop-filter: blur(15px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
            max-width: 700px;
            margin: 0 auto;
        }

        .notif-item {
            background: rgba(255, 255, 255, 0.02);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 15px 20px;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 15px;
            transition: all 0.2s;
        }
        .notif-item:hover {
            background: rgba(255, 255, 255, 0.04);
            border-color: var(--primary-accent);
        }

        .icon-box {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            flex-shrink: 0;
        }
        .icon-like { background: rgba(244, 63, 94, 0.15); color: var(--primary-accent); }
        .icon-comment { background: rgba(56, 189, 248, 0.15); color: #38bdf8; }
        .icon-follow { background: rgba(139, 92, 246, 0.15); color: var(--secondary-accent); }
        .icon-money { background: rgba(251, 191, 36, 0.15); color: #fbbf24; }
        .icon-system { background: rgba(255, 255, 255, 0.1); color: #fff; }
    </style>
</head>
<body>

    <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

    <div class="container hub-container">
        
        <div class="glass-card">
            
            <div class="d-flex align-items-center justify-content-between mb-4">
                <h3 class="text-white m-0"><i class="fa-regular fa-bell text-danger me-2"></i>Notifications</h3>
                <a href="/creator-hub" class="btn btn-outline-light rounded-pill btn-sm px-3 py-1">
                    <i class="fa-solid fa-chevron-left me-1"></i> Back to Hub
                </a>
            </div>

            <c:if test="${empty notifications}">
                <div class="text-center py-5 text-muted">
                    <i class="fa-regular fa-bell-slash mb-3" style="font-size: 40px; opacity: 0.5;"></i>
                    <p>No new notifications at this time.</p>
                </div>
            </c:if>

            <c:forEach var="n" items="${notifications}">
                <div class="notif-item">
                    
                    <c:choose>
                        <c:when test="${n.type eq 'LIKE'}">
                            <div class="icon-box icon-like"><i class="fa-solid fa-heart"></i></div>
                        </c:when>
                        <c:when test="${n.type eq 'COMMENT'}">
                            <div class="icon-box icon-comment"><i class="fa-solid fa-comment"></i></div>
                        </c:when>
                        <c:when test="${n.type eq 'FOLLOW'}">
                            <div class="icon-box icon-follow"><i class="fa-solid fa-user-plus"></i></div>
                        </c:when>
                        <c:when test="${n.type eq 'MONEY_RECEIVED'}">
                            <div class="icon-box icon-money"><i class="fa-solid fa-coins"></i></div>
                        </c:when>
                        <c:otherwise>
                            <div class="icon-box icon-system"><i class="fa-solid fa-circle-info"></i></div>
                        </c:otherwise>
                    </c:choose>

                    <div>
                        <p class="mb-1 text-white opacity-90 text-sm" style="line-height: 1.4;">${n.message}</p>
                        <span class="text-muted text-xs">${n.createdAt}</span>
                    </div>

                </div>
            </c:forEach>

        </div>

    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
