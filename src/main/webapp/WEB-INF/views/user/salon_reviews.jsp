<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${salon.name} - Reviews</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: #f7f7fa;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            max-width: 850px;
            margin: 40px auto;
            background: #fff;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .review {
            border-bottom: 1px solid #e0e0e0;
            padding: 15px 0;
        }
        .review:last-child {
            border-bottom: none;
        }
        .stars i {
            color: gold;
        }
        textarea, input, select {
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 10px;
            margin-top: 10px;
        }
        .btn {
            background: #9c27b0;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        .btn:hover {
            background: #6a0572;
        }
        .no-reviews {
            text-align: center;
            color: #888;
            margin-top: 20px;
        }
        h2, h3 {
            color: #6a0572;
        }
    </style>
</head>
<body>
 
<div class="container">
    <h2>Reviews for ${salon.name}</h2>
    <hr>
 
    <!-- Existing Reviews -->
    <c:choose>
        <c:when test="${not empty reviews}">
            <c:forEach var="review" items="${reviews}">
                <div class="review">
                    <div class="stars">
                        <c:forEach begin="1" end="${review.rating}">
                            <i class="fas fa-star"></i>
                        </c:forEach>
                        <c:forEach begin="${review.rating+1}" end="5">
                            <i class="far fa-star"></i>
                        </c:forEach>
                    </div>
                    <p>${review.comment}</p>
                    <small><strong>${review.userName}</strong> - ${review.createdAt}</small>
                    <!-- ✅ Show salon reply if available -->
                    <c:if test="${not empty review.reply}">
                        <div class="reply-box">
                            <strong>Salon Reply:</strong> ${review.reply} <br>
                            <small><i class="far fa-clock"></i> ${review.repliedAt}</small>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p class="no-reviews">No reviews yet. Be the first to review this salon!</p>
        </c:otherwise>
    </c:choose>
 
    <hr id="addReview">
 
    <!-- Add New Review -->
    <h3>Write Your Review</h3>
    <form action="${pageContext.request.contextPath}/salon/reviews/save" method="post">
        <input type="hidden" name="salonId" value="${salon.id}">
 
        <label for="userName">Your Name:</label>
        <input type="text" name="userName" id="userName" placeholder="Enter your name" required>
 
        <label for="rating">Rating:</label>
        <select name="rating" id="rating" required>
            <option value="">Select Rating</option>
            <option value="5">5 - Excellent</option>
            <option value="4">4 - Very Good</option>
            <option value="3">3 - Good</option>
            <option value="2">2 - Fair</option>
            <option value="1">1 - Poor</option>
        </select>
 
        <label for="comment">Comment:</label>
        <textarea name="comment" id="comment" rows="4" placeholder="Write your feedback..." required></textarea>
 
        <button type="submit" class="btn mt-3">Submit Review</button>
    </form>
</div>
 
</body>
</html>
 

