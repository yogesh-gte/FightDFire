<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Women Marketplace | Services & Training</title>
    
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
            --m-purple: #1e1b4b;
            --m-pink: #f43f5e;
            --m-bg: #fffcfd;
            --m-glass: rgba(255, 255, 255, 0.9);
            --m-shadow: 0 15px 35px rgba(30, 27, 75, 0.1);
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: var(--m-bg);
            color: #333;
            min-height: 100vh;
        }

        /* Hero Header */
        .market-hero {
            background: linear-gradient(135deg, var(--m-purple) 0%, var(--m-pink) 100%);
            padding: 80px 0 120px;
            color: white;
            text-align: center;
            border-bottom-left-radius: 50% 20px;
            border-bottom-right-radius: 50% 20px;
            position: relative;
            overflow: hidden;
        }

        .market-hero::before {
            content: '';
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: url('https://www.transparenttextures.com/patterns/cubes.png');
            opacity: 0.1;
        }

        .market-hero h1 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 900;
            font-size: 3.5rem;
            margin-bottom: 20px;
            letter-spacing: -1px;
        }

        .market-hero p {
            font-size: 1.2rem;
            opacity: 0.9;
            max-width: 600px;
            margin: 0 auto;
        }

        /* Search Box */
        .search-wrapper {
            max-width: 700px;
            margin: -40px auto 60px;
            position: relative;
            z-index: 10;
        }

        .market-search {
            background: white;
            padding: 10px;
            border-radius: 50px;
            display: flex;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }

        .market-search input {
            border: none;
            flex: 1;
            padding: 10px 25px;
            font-size: 1.1rem;
            border-radius: 50px;
            outline: none !important;
        }

        .market-search button {
            background: var(--m-pink);
            border: none;
            color: white;
            padding: 12px 35px;
            border-radius: 50px;
            font-weight: 700;
            transition: 0.3s;
        }

        .market-search button:hover {
            transform: scale(1.05);
            background: var(--m-purple);
        }

        /* Category Grid */
        .category-card {
            background: white;
            border-radius: 24px;
            padding: 40px 30px;
            text-align: center;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            border: 1px solid rgba(124, 45, 94, 0.05);
            box-shadow: var(--m-shadow);
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            overflow: hidden;
            text-decoration: none !important;
        }

        .category-card::after {
            content: '';
            position: absolute;
            top: 0; left: 0; width: 100%; height: 6px;
            background: var(--gradient-primary);
            transform: scaleX(0);
            transition: 0.4s;
            transform-origin: left;
        }

        .category-card:hover {
            transform: translateY(-15px);
            box-shadow: 0 30px 60px rgba(124, 45, 94, 0.2);
            border-color: var(--m-pink);
        }

        .category-card:hover::after {
            transform: scaleX(1);
        }

        .cat-icon {
            font-size: 3.5rem;
            margin-bottom: 25px;
            display: block;
            background: linear-gradient(135deg, var(--m-purple), var(--m-pink));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .category-card h3 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 800;
            font-size: 1.5rem;
            color: var(--m-purple);
            margin-bottom: 15px;
        }

        .category-card p {
            font-size: 0.9rem;
            color: #666;
            line-height: 1.6;
            margin-bottom: 0;
        }

        /* Section Title */
        .section-header {
            text-align: center;
            margin-bottom: 50px;
        }

        .section-header h2 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 900;
            font-size: 2.2rem;
            color: var(--m-purple);
            position: relative;
            display: inline-block;
            padding-bottom: 15px;
        }

        .section-header h2::after {
            content: '';
            position: absolute;
            bottom: 0; left: 25%; width: 50%; height: 4px;
            background: var(--m-pink);
            border-radius: 2px;
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
            color: var(--brand-pink-light);
            transform: translateX(-5px);
        }

        @media (max-width: 768px) {
            .market-hero h1 { font-size: 2.2rem; }
            .market-hero { 
                padding: 60px 15px 100px; 
                border-bottom-left-radius: 0;
                border-bottom-right-radius: 0;
            }
            .market-search {
                flex-direction: column;
                border-radius: 20px;
                padding: 15px;
                gap: 10px;
            }
            .market-search input {
                padding: 12px 15px;
                text-align: center;
            }
            .market-search button {
                width: 100%;
            }
            .search-wrapper {
                margin: -40px 15px 40px;
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
        .row {
            margin-left: 0 !important;
            margin-right: 0 !important;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/header.jsp" />
<div id="wrapper">
    <jsp:include page="/WEB-INF/views/fragments/sidebar.jsp" />
    <div id="page-content-wrapper" style="min-height: 100vh; overflow-x: hidden;">

    <header class="market-hero">
        <a href="${pageContext.request.contextPath}/users/dashboard" class="back-btn">
            <i class="bi bi-arrow-left"></i> Back to Dashboard
        </a>
        <div class="container">
            <h1>Marketplace</h1>
            <p>Empowering women through skill-sharing, entrepreneurship, and community-driven services.</p>
        </div>
    </header>

    <div class="search-wrapper container">
        <div class="market-search">
            <input type="text" placeholder="Search for tutors, bakers, or products...">
            <button>Find Service</button>
        </div>
    </div>

    <main class="container mb-5">
        <div class="section-header">
            <h2>Explore Categories</h2>
        </div>

        <div class="row g-4">
            <c:forEach var="cat" items="${dynamicCategories}">
                <div class="col-md-6 col-lg-3">
                    <a href="${pageContext.request.contextPath}/marketplace/workers?category=${cat}" class="category-card">
                        <i class="cat-icon fas fa-briefcase"></i>
                        <h3>${cat}</h3>
                        <p>Find verified women professionals in ${cat}.</p>
                    </a>
                </div>
            </c:forEach>
            <c:if test="${empty dynamicCategories}">
                <div class="col-12 text-center py-5">
                    <p class="text-muted fs-5">No verified worker categories available yet.</p>
                </div>
            </c:if>
        </div>

        <!-- Call to Action -->
        <div class="mt-5 p-5 rounded-4 text-center" style="background: rgba(124, 45, 94, 0.03); border: 2px dashed var(--m-purple);">
            <h4 style="font-weight: 800; color: var(--m-purple);">Are you a service provider?</h4>
            <p class="text-muted mb-4">Join our growing community of professional women and start offering your services today.</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="${pageContext.request.contextPath}/marketplace/provider/login" class="btn btn-outline-primary px-4 py-2" style="border-radius: 12px; font-weight: 700;">Provider Login</a>
                <a href="${pageContext.request.contextPath}/marketplace/provider/register" class="btn btn-primary px-4 py-2" style="border-radius: 12px; font-weight: 700; background: var(--m-purple); border: none;">Register Now</a>
            </div>
        </div>
    </main>

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.querySelector('.market-search input');
            const searchButton = document.querySelector('.market-search button');
            const categoryCards = document.querySelectorAll('.category-card');

            function performSearch() {
                const query = searchInput.value.trim().toLowerCase();
                
                categoryCards.forEach(card => {
                    const title = card.querySelector('h3').innerText.toLowerCase();
                    const desc = card.querySelector('p').innerText.toLowerCase();
                    const parentCol = card.parentElement;

                    if (title.includes(query) || desc.includes(query)) {
                        parentCol.style.display = 'block';
                    } else {
                        parentCol.style.display = 'none';
                    }
                });
            }

            searchInput.addEventListener('input', performSearch);

            searchButton.addEventListener('click', function() {
                const query = searchInput.value.trim().toLowerCase();
                let matchUrl = null;
                categoryCards.forEach(card => {
                    const title = card.querySelector('h3').innerText.toLowerCase();
                    const desc = card.querySelector('p').innerText.toLowerCase();
                    if (title.includes(query) || desc.includes(query)) {
                        if (!matchUrl) matchUrl = card.getAttribute('href');
                    }
                });
                if (matchUrl) {
                    window.location.href = matchUrl;
                } else {
                    alert('No services matched your query. Try searching for "Tutors", "Bakers", or "Products".');
                    categoryCards.forEach(card => card.parentElement.style.display = 'block');
                }
            });

            searchInput.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    searchButton.click();
                }
            });
        });
    </script>
    </div>
</div>
</body>
</html>
