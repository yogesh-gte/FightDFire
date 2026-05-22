<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>My Bookings | Marketplace</title>
    
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&family=Montserrat:wght@700;800;900&display=swap" rel="stylesheet">
    
    <!-- CSS -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fightdfire-theme.css">

    <style>
        :root {
            --m-purple: #7C2D5E;
            --m-pink: #DB2777;
            --m-bg: #fffcfd;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: var(--m-bg);
            color: #333;
            min-height: 100vh;
        }

        .header-bg {
            background: linear-gradient(135deg, var(--m-purple) 0%, #4a1e38 100%);
            padding: 50px 0;
            color: white;
            margin-bottom: 40px;
        }

        .booking-card {
            background: white;
            border-radius: 20px;
            padding: 25px;
            box-shadow: 0 10px 30px rgba(124, 45, 94, 0.05);
            border: 1px solid rgba(0,0,0,0.05);
        }

        .table thead th {
            background: #fdf2f8;
            color: var(--m-purple);
            font-weight: 700;
            text-transform: uppercase;
            font-size: 0.75rem;
            border: none;
            padding: 15px;
        }

        .status-pill {
            padding: 5px 15px;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 800;
        }

        .status-PENDING { background: #fff9db; color: #f59f00; }
        .status-CONFIRMED { background: #ebfbee; color: #37b24d; }
        .status-COMPLETED { background: #e7f5ff; color: #228be6; }
        .status-CANCELLED { background: #fff5f5; color: #fa5252; }

        .nav-tabs-custom {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
        }

        .nav-tabs-custom a {
            text-decoration: none;
            color: #888;
            font-weight: 700;
            padding: 10px 20px;
            border-radius: 12px;
            transition: 0.3s;
        }

        .nav-tabs-custom a.active {
            color: var(--m-purple);
            background: #fdf2f8;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header id="header" class="header d-flex align-items-center sticky-top">
      <div class="container-fluid container-xl d-flex align-items-center">
        <a href="${pageContext.request.contextPath}/users/dashboard" class="logo me-auto"><h1>FightDFire</h1></a>
        <nav id="navmenu" class="navmenu">
          <ul>
            <li><a href="${pageContext.request.contextPath}/chat/users">Chat</a></li>
            <li><a href="${pageContext.request.contextPath}/user/bookings">My Bookings</a></li>
            <li><a href="${pageContext.request.contextPath}/users/wallet">Wallet 💰</a></li>
            <li><a href="${pageContext.request.contextPath}/users/dashboard" class="btn-dashboard"><i class="fas fa-th-large"></i> Back to Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/users/profile/${user.id}">${user.fullName}</a></li>
          </ul>
          <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
        <a class="btn-getstarted" href="${pageContext.request.contextPath}/logout">Logout</a>
      </div>
    </header>

    <div class="header-bg">
        <div class="container d-flex justify-content-between align-items-center">
            <div>
                <h1 class="fw-900 m-0">My Marketplace</h1>
                <p class="m-0 opacity-75">Track your personal sessions and class enrollments.</p>
            </div>
        </div>
    </div>

    <div class="container mb-5">
        <div class="nav-tabs-custom">
            <a href="${pageContext.request.contextPath}/marketplace/myBookings" class="active">Personal Sessions</a>
            <a href="${pageContext.request.contextPath}/marketplace/my-classes">Joined Classes</a>
        </div>

        <div class="booking-card">
            <c:if test="${empty bookings}">
                <div class="text-center py-5">
                    <i class="bi bi-calendar-x display-1 text-muted opacity-25"></i>
                    <h4 class="mt-4 text-muted">No personal sessions booked yet.</h4>
                    <p class="text-muted">Browse the marketplace to find experts for one-on-one help.</p>
                    <a href="${pageContext.request.contextPath}/marketplace" class="btn btn-primary mt-3 px-4">Browse Marketplace</a>
                </div>
            </c:if>

            <c:if test="${not empty bookings}">
                <div class="table-responsive">
                    <table class="table align-middle">
                        <thead>
                            <tr>
                                <th>Provider</th>
                                <th>Category</th>
                                <th>Scheduled Time</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="b" items="${bookings}">
                                <tr>
                                    <td>
                                        <div class="fw-800 color-m-purple">${b.provider.fullName}</div>
                                    </td>
                                    <td>
                                        <span class="badge bg-light text-dark">${b.provider.category}</span>
                                    </td>
                                    <td>
                                        <div class="small fw-600">${b.requestedTime}</div>
                                    </td>
                                    <td>
                                        <span class="status-pill status-${b.status}">${b.status}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
