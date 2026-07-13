<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Financial Literacy Hub</title>
    
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&family=Montserrat:wght@700;800;900&display=swap" rel="stylesheet">
    
    <!-- CSS -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Fight D Fear-theme.css">

    <style>
        :root {
            --fl-purple: #1e1b4b;
            --fl-pink: #f43f5e;
            --fl-gold: #ffd700;
            --fl-bg: #f8fafc;
            --fl-shadow: 0 15px 35px rgba(30, 27, 75, 0.1);
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: var(--fl-bg);
            color: #333;
            min-height: 100vh;
        }

        /* Hero Header */
        .fl-hero {
            background: linear-gradient(135deg, var(--fl-purple) 0%, var(--fl-pink) 100%);
            padding: 80px 0 100px;
            color: white;
            text-align: center;
            border-bottom-left-radius: 50% 20px;
            border-bottom-right-radius: 50% 20px;
            position: relative;
            overflow: hidden;
        }

        .fl-hero::before {
            content: '';
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: url('https://www.transparenttextures.com/patterns/cubes.png');
            opacity: 0.1;
        }

        .fl-hero h1 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 900;
            font-size: 3.5rem;
            margin-bottom: 20px;
            letter-spacing: -1px;
        }

        .fl-hero p {
            font-size: 1.2rem;
            opacity: 0.9;
            max-width: 600px;
            margin: 0 auto;
        }

        /* Section Cards */
        .section-card {
            background: white;
            border-radius: 24px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: var(--fl-shadow);
            border: 1px solid rgba(30, 27, 75, 0.05);
            transition: all 0.3s;
        }

        .section-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 25px 50px rgba(30, 27, 75, 0.15);
        }

        .section-header {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 25px;
        }

        .section-header h2 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 800;
            font-size: 1.8rem;
            color: var(--fl-purple);
            margin: 0;
        }

        .section-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, var(--fl-purple), var(--fl-pink));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.8rem;
        }

        /* Item Card */
        .item-card {
            background: #f8fafc;
            border-radius: 20px;
            padding: 25px;
            margin-bottom: 15px;
            display: flex;
            gap: 20px;
            align-items: flex-start;
            transition: all 0.3s;
            cursor: pointer;
            text-decoration: none !important;
            color: inherit;
        }

        .item-card:hover {
            background: #f1f5f9;
            transform: translateX(5px);
        }

        .item-thumbnail {
            width: 180px;
            height: 120px;
            border-radius: 15px;
            background: linear-gradient(135deg, #e2e8f0, #cbd5e1);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            color: var(--fl-purple);
            flex-shrink: 0;
            overflow: hidden;
        }

        .item-thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .item-content {
            flex: 1;
        }

        .item-title {
            font-family: 'Montserrat', sans-serif;
            font-weight: 700;
            font-size: 1.25rem;
            color: var(--fl-purple);
            margin-bottom: 8px;
        }

        .item-description {
            color: #64748b;
            font-size: 0.95rem;
            margin-bottom: 12px;
        }

        .item-meta {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .meta-tag {
            background: rgba(30, 27, 75, 0.1);
            color: var(--fl-purple);
            padding: 5px 12px;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 600;
        }

        /* Category Pills */
        .category-pills {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-bottom: 25px;
        }

        .category-pill {
            background: white;
            color: var(--fl-purple);
            padding: 8px 18px;
            border-radius: 50px;
            font-weight: 600;
            cursor: pointer;
            border: 2px solid rgba(30, 27, 75, 0.1);
            transition: all 0.3s;
        }

        .category-pill:hover, .category-pill.active {
            background: var(--fl-purple);
            color: white;
            border-color: var(--fl-purple);
        }

        /* Back Button */
        .back-btn {
            position: absolute;
            top: 30px;
            left: 30px;
            color: white;
            text-decoration: none;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            opacity: 0.8;
            transition: 0.3s;
            z-index: 100;
        }

        .back-btn:hover {
            opacity: 1;
            transform: translateX(-5px);
        }

        @media (max-width: 768px) {
            .fl-hero h1 { font-size: 2.2rem; }
            .fl-hero { 
                padding: 60px 15px 80px; 
                border-bottom-left-radius: 0;
                border-bottom-right-radius: 0;
            }
            .item-card {
                flex-direction: column;
            }
            .item-thumbnail {
                width: 100%;
                height: 180px;
            }
        }

        /* 📱 Global Mobile Fixes */
        html, body {
            overflow-x: hidden;
            width: 100%;
            position: relative;
        }
        .container {
            padding-left: 20px !important;
            padding-right: 20px !important;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/header.jsp" />
    <header class="fl-hero">
        <a href="${pageContext.request.contextPath}/users/dashboard" class="back-btn">
            <i class="bi bi-arrow-left"></i> Back to Dashboard
        </a>
        <div class="container">
            <h1>Financial Literacy Hub</h1>
            <p>Learn, grow, and master your finances with our curated content, live sessions, and workshops.</p>
        </div>
    </header>

    <main class="container mt-5 mb-5">
        <c:if test="${param.registrationSuccess}">
            <div class="alert alert-success" role="alert">
                <i class="fas fa-check-circle"></i> Registration submitted successfully! Waiting for admin approval.
            </div>
        </c:if>
        <!-- Recorded Videos Section -->
        <div class="section-card">
            <div class="section-header">
                <div class="section-icon">
                    <i class="fas fa-video"></i>
                </div>
                <h2>Recorded Videos</h2>
            </div>

            <div class="category-pills" id="videoCategories">
                <span class="category-pill active" data-category="all">All</span>
                <span class="category-pill" data-category="saving">Saving</span>
                <span class="category-pill" data-category="investing">Investing</span>
                <span class="category-pill" data-category="loans">Loans</span>
                <span class="category-pill" data-category="banking">Banking</span>
                <span class="category-pill" data-category="insurance">Insurance</span>
                <span class="category-pill" data-category="government">Government Schemes</span>
            </div>

            <div id="videosContainer">
            <c:forEach var="video" items="${videos}">
                <a href="${pageContext.request.contextPath}/financial-literacy/video/${video.id}" class="item-card" data-category="${video.category}">
                    <div class="item-thumbnail">
                        <i class="fas fa-play-circle"></i>
                    </div>
                    <div class="item-content">
                        <h3 class="item-title">${video.title}</h3>
                        <p class="item-description">${video.description}</p>
                        <div class="item-meta">
                            <span class="meta-tag"><i class="fas fa-tag me-1"></i> ${video.category}</span>
                            <span class="meta-tag"><i class="fas fa-clock me-1"></i> ${video.duration}</span>
                            <span class="meta-tag"><i class="fas fa-eye me-1"></i> ${video.level}</span>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
        </div>

        <!-- Live Virtual Sessions Section -->
        <div class="section-card">
            <div class="section-header">
                <div class="section-icon">
                    <i class="fas fa-laptop-code"></i>
                </div>
                <h2>Live Virtual Sessions</h2>
            </div>

            <div id="liveSessionsContainer">
            <c:forEach var="session" items="${liveSessions}">
                <a href="${pageContext.request.contextPath}/financial-literacy/live-session/${session.id}" class="item-card">
                    <div class="item-thumbnail">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <div class="item-content">
                        <h3 class="item-title">${session.title}</h3>
                        <p class="item-description">${session.description}</p>
                        <div class="item-meta">
                            <span class="meta-tag"><i class="fas fa-user me-1"></i> Speaker: ${session.speaker}</span>
                            <span class="meta-tag"><i class="fas fa-calendar me-1"></i> ${session.date}</span>
                            <span class="meta-tag"><i class="fas fa-clock me-1"></i> ${session.time}</span>
                            <span class="meta-tag"><i class="fas fa-users me-1"></i> ${session.seats} Seats</span>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
        </div>

        <!-- Offline Workshops Section -->
        <div class="section-card">
            <div class="section-header">
                <div class="section-icon">
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <h2>Offline Workshops</h2>
            </div>

            <div id="workshopsContainer">
            <c:forEach var="workshop" items="${workshops}">
                <a href="${pageContext.request.contextPath}/financial-literacy/workshop/${workshop.id}" class="item-card">
                    <div class="item-thumbnail">
                        <i class="fas fa-school"></i>
                    </div>
                    <div class="item-content">
                        <h3 class="item-title">${workshop.title}</h3>
                        <p class="item-description">${workshop.description}</p>
                        <div class="item-meta">
                            <span class="meta-tag"><i class="fas fa-map-marker-alt me-1"></i> ${workshop.city}</span>
                            <span class="meta-tag"><i class="fas fa-calendar me-1"></i> ${workshop.date}</span>
                            <span class="meta-tag"><i class="fas fa-clock me-1"></i> ${workshop.time}</span>
                            <span class="meta-tag"><i class="fas fa-users me-1"></i> ${workshop.seats} Seats</span>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
        </div>
    </main>

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Video category filtering
            const categoryPills = document.querySelectorAll('#videoCategories .category-pill');
            const videoCards = document.querySelectorAll('#videosContainer .item-card');

            categoryPills.forEach(pill => {
                pill.addEventListener('click', function() {
                    // Update active pill
                    categoryPills.forEach(p => p.classList.remove('active'));
                    this.classList.add('active');

                    // Filter videos
                    const category = this.getAttribute('data-category');
                    videoCards.forEach(card => {
                        const cardCategory = card.getAttribute('data-category');
                        if (category === 'all' || cardCategory === category) {
                            card.style.display = 'flex';
                        } else {
                            card.style.display = 'none';
                        }
                    });
                });
            });
        });
    </script>
</body>
</html>
