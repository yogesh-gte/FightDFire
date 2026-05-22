<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Provider Dashboard | FightDFire</title>
    
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&family=Montserrat:wght@800;900&display=swap" rel="stylesheet">
    
    <!-- CSS -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --p-purple-dark: #2D0B2E;
            --p-purple-mid: #4A1E38;
            --p-crimson: #DB2777;
            --p-crimson-light: #F472B6;
            --p-glass: rgba(255, 255, 255, 0.03);
            --p-glass-border: rgba(255, 255, 255, 0.1);
            --p-text-main: #FFFFFF;
            --p-text-muted: #A1A1AA;
            --transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        body {
            font-family: 'Outfit', sans-serif;
            background-color: var(--p-purple-dark);
            background-image: 
                radial-gradient(circle at 10% 20%, rgba(219, 39, 119, 0.1) 0%, transparent 40%),
                radial-gradient(circle at 90% 80%, rgba(124, 45, 94, 0.1) 0%, transparent 40%);
            color: var(--p-text-main);
            min-height: 100vh;
            overflow-x: hidden;
            scroll-behavior: smooth;
        }

        /* Sidebar */
        .sidebar {
            width: 280px;
            height: 100vh;
            position: fixed;
            background: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(20px);
            border-right: 1px solid var(--p-glass-border);
            padding: 40px 20px;
            z-index: 1000;
        }

        .brand-box {
            margin-bottom: 50px;
            padding: 0 15px;
        }

        .brand-box h2 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 900;
            font-size: 1.5rem;
            background: linear-gradient(135deg, #FFF, var(--p-crimson-light));
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .provider-profile {
            text-align: center;
            margin-bottom: 40px;
            padding: 20px;
            background: var(--p-glass);
            border-radius: 24px;
            border: 1px solid var(--p-glass-border);
        }

        .avatar-circle {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, var(--p-crimson), var(--p-purple-mid));
            border-radius: 24px;
            margin: 0 auto 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            font-weight: 800;
            box-shadow: 0 10px 20px rgba(219, 39, 119, 0.2);
        }

        .sidebar-nav {
            list-style: none;
            padding: 0;
        }

        .sidebar-nav li {
            margin-bottom: 10px;
        }

        .sidebar-nav a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 14px 18px;
            color: var(--p-text-muted);
            text-decoration: none;
            border-radius: 16px;
            transition: var(--transition);
            font-weight: 500;
        }

        .sidebar-nav a:hover, .sidebar-nav a.active {
            background: rgba(219, 39, 119, 0.1);
            color: var(--p-crimson-light);
            transform: translateX(5px);
        }

        /* Main Content */
        .main-wrapper {
            margin-left: 280px;
            padding: 40px;
        }

        .top-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
        }

        .greeting h2 {
            font-weight: 800;
            margin-bottom: 5px;
        }

        .glass-card {
            background: var(--p-glass);
            backdrop-filter: blur(12px);
            border: 1px solid var(--p-glass-border);
            border-radius: 28px;
            padding: 30px;
            height: 100%;
            transition: var(--transition);
            margin-bottom: 30px;
        }

        .glass-card:hover {
            border-color: rgba(219, 39, 119, 0.3);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        .card-header-custom {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .card-header-custom h4 {
            font-weight: 700;
            margin: 0;
            font-size: 1.25rem;
        }

        /* Forms */
        .fdf-input {
            background: rgba(255, 255, 255, 0.05) !important;
            border: 1px solid var(--p-glass-border) !important;
            border-radius: 14px !important;
            color: white !important;
            padding: 12px 18px !important;
            font-size: 0.9rem !important;
        }

        .fdf-input:focus {
            background: rgba(255, 255, 255, 0.08) !important;
            border-color: var(--p-crimson) !important;
            box-shadow: 0 0 0 4px rgba(219, 39, 119, 0.1) !important;
        }

        .btn-premium {
            background: linear-gradient(135deg, var(--p-crimson), #A855F7);
            border: none;
            color: white;
            padding: 14px 28px;
            border-radius: 16px;
            font-weight: 700;
            transition: var(--transition);
            box-shadow: 0 10px 20px rgba(219, 39, 119, 0.2);
        }

        .btn-premium:hover {
            transform: scale(1.03) translateY(-2px);
            filter: brightness(1.1);
            color: white;
        }

        /* Tables */
        .premium-table {
            color: var(--p-text-main);
        }

        .premium-table thead th {
            border: none;
            background: rgba(255, 255, 255, 0.05);
            padding: 15px;
            font-weight: 600;
            color: var(--p-text-muted);
            font-size: 0.85rem;
            text-transform: uppercase;
        }

        .premium-table tbody td {
            border-bottom: 1px solid var(--p-glass-border);
            padding: 18px 15px;
            font-size: 0.95rem;
        }

        /* Class Items */
        .class-item {
            padding: 20px;
            background: rgba(255, 255, 255, 0.02);
            border: 1px solid var(--p-glass-border);
            border-radius: 20px;
            margin-bottom: 15px;
            transition: var(--transition);
        }

        .class-item:hover {
            background: rgba(255, 255, 255, 0.04);
            border-color: var(--p-crimson-light);
        }

        .badge-live {
            background: rgba(239, 68, 68, 0.1);
            color: #EF4444;
            border: 1px solid rgba(239, 68, 68, 0.2);
            padding: 5px 12px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 0.7rem;
        }

        .badge-rec {
            background: rgba(59, 130, 246, 0.1);
            color: #3B82F6;
            border: 1px solid rgba(59, 130, 246, 0.2);
            padding: 5px 12px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 0.7rem;
        }

        .status-pill {
            padding: 4px 12px;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 700;
        }

        .status-PENDING { background: rgba(245, 158, 11, 0.1); color: #F59E0B; }
        .status-CONFIRMED, .status-PAID { background: rgba(16, 185, 129, 0.1); color: #10B981; }
        .status-COMPLETED { background: rgba(59, 130, 246, 0.1); color: #3B82F6; }
        .status-CANCELLED { background: rgba(239, 68, 68, 0.1); color: #EF4444; }

        /* Stats Bar */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        .stat-card {
            background: var(--p-glass);
            border: 1px solid var(--p-glass-border);
            padding: 25px;
            border-radius: 24px;
            text-align: center;
        }

        .stat-value {
            font-size: 1.8rem;
            font-weight: 800;
            color: var(--p-crimson-light);
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 0.8rem;
            color: var(--p-text-muted);
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        @media (max-width: 1000px) {
            .sidebar { transform: translateX(-100%); }
            .main-wrapper { margin-left: 0; padding: 20px; }
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="brand-box">
            <h2>FightDFire</h2>
        </div>

        <div class="provider-profile">
            <div class="avatar-circle">${provider.fullName.charAt(0)}</div>
            <h5 class="m-0 fw-700">${provider.fullName}</h5>
            <div class="small text-muted mt-1">${provider.category}</div>
            <div class="mt-2"><i class="fas fa-star text-warning"></i> <b>${provider.rating}</b></div>
        </div>

        <ul class="sidebar-nav">
            <li><a href="#overview" class="active"><i class="bi bi-grid-fill"></i> Overview</a></li>
            <li><a href="#schedule"><i class="bi bi-calendar-event"></i> Schedule</a></li>
            <li><a href="#clients"><i class="bi bi-people"></i> My Clients</a></li>
            <li><a href="#earnings"><i class="bi bi-wallet2"></i> Earnings</a></li>
            <li class="mt-5"><a href="${pageContext.request.contextPath}/logout" style="color: #EF4444;"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
        </ul>
    </aside>

    <!-- Main Content -->
    <main class="main-wrapper">
        <div class="top-nav" id="overview">
            <div class="greeting">
                <h2>Dashboard Overview</h2>
                <p class="text-muted m-0">Welcome back! Here's what's happening today.</p>
            </div>
            <div class="d-flex gap-3">
                <button class="btn btn-outline-light border-0" style="background: var(--p-glass); border-radius: 12px; padding: 10px 15px;">
                    <i class="bi bi-bell"></i>
                </button>
            </div>
        </div>

        <!-- Stats Bar -->
        <div class="stats-grid" id="earnings">
            <div class="stat-card">
                <div class="stat-value">₹${totalEarnings}</div>
                <div class="stat-label">Total Revenue</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">${enrollments.size()}</div>
                <div class="stat-label">Total Students</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">${classes.size()}</div>
                <div class="stat-label">Active Classes</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">${provider.rating}</div>
                <div class="stat-label">Average Rating</div>
            </div>
        </div>

        <c:if test="${not empty message}">
            <div class="alert alert-dismissible fade show rounded-4 mb-4" style="background: rgba(16, 185, 129, 0.1); color: #10B981; border: 1px solid rgba(16, 185, 129, 0.2);">
                <i class="bi bi-check-circle-fill me-2"></i> ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <div class="row g-4">
            <!-- Left Panel: Bookings & Enrollments -->
            <div class="col-lg-7" id="clients">
                <div class="glass-card">
                    <!-- Section 1: One-on-One Bookings -->
                    <div class="card-header-custom">
                        <h4>One-on-One Sessions</h4>
                        <span class="badge bg-purple-mid" style="background: var(--p-purple-mid);">${bookings.size()} Requests</span>
                    </div>
                    
                    <c:if test="${empty bookings}">
                        <div class="text-center py-4 mb-4" style="border-bottom: 1px solid var(--p-glass-border);">
                            <p class="text-muted small m-0">No private booking requests.</p>
                        </div>
                    </c:if>
                    
                    <c:if test="${not empty bookings}">
                        <div class="table-responsive mb-5 pb-3" style="border-bottom: 1px solid var(--p-glass-border);">
                            <table class="table premium-table align-middle">
                                <thead>
                                    <tr>
                                        <th>Client</th>
                                        <th>Schedule</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="b" items="${bookings}">
                                    <tr>
                                        <td>
                                            <div class="fw-600">${b.user.fullName}</div>
                                            <div class="small text-muted">#USR-${b.user.id}</div>
                                        </td>
                                        <td>
                                            <div class="small fw-500">${b.requestedTime}</div>
                                        </td>
                                        <td>
                                            <span class="status-pill status-${b.status}">${b.status}</span>
                                        </td>
                                        <td>
                                            <form action="${pageContext.request.contextPath}/marketplace/provider/bookings/${b.id}/status" method="post" class="d-flex gap-2">
                                                <select class="form-select form-select-sm fdf-input" name="status" style="width: 110px;">
                                                    <option value="PENDING" ${b.status == 'PENDING' ? 'selected' : ''}>PENDING</option>
                                                    <option value="CONFIRMED" ${b.status == 'CONFIRMED' ? 'selected' : ''}>CONFIRM</option>
                                                    <option value="COMPLETED" ${b.status == 'COMPLETED' ? 'selected' : ''}>COMPLETE</option>
                                                    <option value="CANCELLED" ${b.status == 'CANCELLED' ? 'selected' : ''}>CANCEL</option>
                                                </select>
                                                <button class="btn btn-sm" type="submit" style="background: var(--p-purple-mid); border: 1px solid var(--p-glass-border); color: white;"><i class="bi bi-check"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>

                    <!-- Section 2: Class Enrollments (Students) -->
                    <div class="card-header-custom mt-4">
                        <h4>Student Enrollments</h4>
                        <span class="badge bg-success" style="background: rgba(16, 185, 129, 0.1); color: #10B981; border: 1px solid rgba(16,185,129,0.2);">${enrollments.size()} Total</span>
                    </div>

                    <c:if test="${empty enrollments}">
                        <div class="text-center py-5">
                            <i class="bi bi-person-plus text-muted display-4 opacity-25"></i>
                            <p class="mt-3 text-muted">No students enrolled in your classes yet.</p>
                        </div>
                    </c:if>

                    <c:if test="${not empty enrollments}">
                        <div class="table-responsive">
                            <table class="table premium-table align-middle">
                                <thead>
                                    <tr>
                                        <th>Student</th>
                                        <th>Enrolled Class</th>
                                        <th>Enrollment Date</th>
                                        <th>Payment</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="e" items="${enrollments}">
                                    <tr>
                                        <td>
                                            <div class="fw-600">${e.user.fullName}</div>
                                            <div class="small text-muted">${e.user.email}</div>
                                        </td>
                                        <td>
                                            <div class="fw-500 text-crimson-light">${e.providerClass.className}</div>
                                        </td>
                                        <td>
                                            <div class="small">${e.enrollmentTime}</div>
                                        </td>
                                        <td>
                                            <span class="status-pill status-${e.paymentStatus}">${e.paymentStatus}</span>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </div>
            </div>

            <!-- Right Panel: Management -->
            <div class="col-lg-5" id="schedule">
                <!-- Add Class Form -->
                <div class="glass-card mb-4" style="background: linear-gradient(135deg, rgba(219, 39, 119, 0.05) 0%, rgba(0, 0, 0, 0) 100%);">
                    <h4 class="fw-700 mb-4"><i class="bi bi-plus-circle me-2 text-crimson"></i> Create New Class</h4>
                    <form action="${pageContext.request.contextPath}/marketplace/provider/classes/add" method="post">
                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label small text-muted text-uppercase fw-700">Class Information</label>
                                <input type="text" name="className" class="form-control fdf-input" placeholder="e.g. Advanced Yoga for Beginners" required>
                            </div>
                            <div class="col-6">
                                <input type="text" name="duration" class="form-control fdf-input" placeholder="Duration (e.g. 1.5h)" required>
                            </div>
                            <div class="col-6">
                                <select name="mode" class="form-select fdf-input" required>
                                    <option value="Live">Live Session</option>
                                    <option value="Recorded">Recorded</option>
                                </select>
                            </div>
                            <div class="col-12">
                                <textarea name="description" class="form-control fdf-input" placeholder="Briefly describe what you'll teach..." rows="3" required></textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label small text-muted text-uppercase fw-700">Schedule & Link</label>
                                <input type="datetime-local" name="dateTime" class="form-control fdf-input" required>
                            </div>
                            <div class="col-12">
                                <input type="url" name="meetingLink" class="form-control fdf-input" placeholder="Zoom/Meet Link" required>
                            </div>
                            <div class="col-6">
                                <label class="form-label small text-muted text-uppercase fw-700">Price (₹)</label>
                                <input type="number" name="price" class="form-control fdf-input" placeholder="₹ 499.00" step="0.01" required>
                            </div>
                            <div class="col-6">
                                <label class="form-label small text-muted text-uppercase fw-700">Capacity</label>
                                <input type="number" name="seats" class="form-control fdf-input" placeholder="25 Seats" required>
                            </div>
                            <div class="col-12 mt-4">
                                <button type="submit" class="btn btn-premium w-100">Launch Class Now</button>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- My Classes List -->
                <div class="glass-card">
                    <div class="card-header-custom">
                        <h4>Active Classes</h4>
                        <span class="badge bg-purple-mid" style="background: var(--p-purple-mid); padding: 5px 12px; border-radius: 8px; font-size: 0.75rem;">${classes.size()} Total</span>
                    </div>
                    
                    <c:forEach var="c" items="${classes}">
                        <div class="class-item">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <div>
                                    <h6 class="m-0 fw-700">${c.className}</h6>
                                    <small class="text-muted">${c.dateTime}</small>
                                </div>
                                <span class="badge-${c.mode == 'Live' ? 'live' : 'rec'}">${c.mode}</span>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="small fw-500 text-crimson-light">₹${c.price}</div>
                                <div class="small text-muted"><i class="bi bi-people-fill me-1"></i> ${c.availableSeats} left</div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty classes}">
                        <div class="text-center py-4">
                            <p class="text-muted small m-0">No active classes yet.</p>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </main>

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
        // Sidebar active state toggle
        document.querySelectorAll('.sidebar-nav a').forEach(link => {
            link.addEventListener('click', function() {
                document.querySelectorAll('.sidebar-nav a').forEach(l => l.classList.remove('active'));
                this.classList.add('active');
            });
        });
    </script>
</body>
</html>
