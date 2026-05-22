<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Exclusive Salon Offers & Discounts</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #fff6fa, #f1f7ff);
            min-height: 100vh;
        }
        .page-header { text-align: center; margin: 60px 0 40px; }
        .page-header h2 { color: #7b1fa2; font-size: 3rem; font-weight: bold; }
        .page-header p { color: #555; font-size: 1.1rem; }

        .offer-card {
            border-radius: 18px;
            background: #fff;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            overflow: hidden;
            transition: transform 0.4s ease, box-shadow 0.4s ease;
        }
        .offer-card:hover { transform: translateY(-10px); box-shadow: 0 15px 30px rgba(123,31,162,0.25); }

        .offer-badge {
            position: absolute; top: 18px; right: 18px;
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            color: #fff; padding: 8px 14px; font-weight: bold;
            border-radius: 30px; font-size: 0.9rem;
        }

        .offer-image { height: 180px; background-size: cover; background-position: center; }

        .offer-body { padding: 25px; text-align: center; }
        .offer-title { color: #6a0572; font-size: 1.4rem; font-weight: 600; margin-bottom: 10px; }
        .offer-description { font-size: 0.95rem; color: #666; min-height: 50px; margin-bottom: 15px; }
        .offer-dates { font-size: 0.85rem; color: #999; margin-bottom: 15px; }

        /* Price styling */
        .price-section {
            margin-bottom: 20px;
            font-size: 1.1rem;
        }
        .real-price {
            text-decoration: line-through;
            color: #999;
            margin-right: 10px;
        }
        .discounted-price {
            color: #4a00e0;
            font-weight: bold;
            font-size: 1.2rem;
        }

        .btn-book {
            background: linear-gradient(90deg, #8e2de2, #4a00e0);
            border: none; color: #fff;
            font-weight: 500; padding: 10px 20px;
            border-radius: 50px;
        }
        .btn-book:hover { background: linear-gradient(90deg, #4a00e0, #8e2de2); }

        .no-offers { text-align: center; font-size: 1.3rem; color: #777; margin-top: 80px; }
    </style>
</head>

<body>
<div class="container">
    <div class="page-header">
        <h2>✨ Exclusive Salon Offers & Discounts ✨</h2>
        <p>Grab the hottest beauty deals and glow with confidence 💅</p>
    </div>

    <div class="row">
        <c:forEach var="offer" items="${offers}">
            <div class="col-md-4 col-sm-6 mb-4">
                <div class="offer-card">
                    <div class="offer-image" style="background-image: url('https://img.freepik.com/free-photo/beautiful-spa-composition_23-2147711025.jpg');"></div>
                    <div class="offer-badge">${offer.discountPercent}% OFF</div>

                    <div class="offer-body">
                        <h5 class="offer-title">${offer.title}</h5>
                        <p class="offer-description">${offer.description}</p>
                        <p class="offer-dates">${offer.startDate} — ${offer.endDate}</p>

                        <!-- Price section -->
                        <div class="price-section">
                            <span class="real-price">₹${offer.originalPrice}</span>
                            <span class="discounted-price">₹${offer.discountedPrice}</span>
                        </div>

                      <a href="${pageContext.request.contextPath}/salon/book?offerId=${offer.id}" class="btn btn-book">
    Book Offer
</a>
                      
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty offers}">
            <div class="col-12 no-offers">
                <i class="fas fa-gift fa-2x mb-3" style="color:#7b1fa2;"></i>
                <p>No offers available right now.<br>Stay tuned for upcoming salon discounts 💖</p>
            </div>
        </c:if>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>

