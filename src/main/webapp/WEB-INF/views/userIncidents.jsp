<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Reported Incidents</title>
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/Fight D Fear-theme.css" rel="stylesheet">

    <style>
    /* ============================================
       ROOT VARIABLES (your brand colors)
       ============================================ */
    :root {
        --primary-purple: #1e1b4b;
        --primary-purple-light: #312e81;
        --primary-coral: #f43f5e;
        --primary-coral-dark: #1e1b4b;
        --primary-teal: #20c997;
        --primary-gold: #ffd700;
        --dark-bg: #0f0f1a;
        --light-bg: #fffcfd;
        --gradient-primary: linear-gradient(135deg, #1e1b4b 0%, #312e81 50%, #f43f5e 100%);
        --shadow-sm: 0 10px 30px rgba(0, 0, 0, 0.08);
        --shadow-md: 0 20px 40px rgba(0, 0, 0, 0.12);
        --shadow-lg: 0 30px 60px rgba(0, 0, 0, 0.15);
    }

    /* General Styling */
    body {
        background-color: var(--light-bg);
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
    }

    /* Header */
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 5%;
        background-color: var(--primary-purple-light);
        color: white;
        border-bottom: 4px solid var(--primary-purple);
        box-shadow: var(--shadow-sm);
    }

    .header h2 {
        margin: 0;
        font-size: 24px;
        font-weight: 700;
    }

    /* Right-Aligned Button */
    .report-btn {
        text-decoration: none;
        background-color: var(--primary-gold);
        color: var(--primary-purple);
        padding: 10px 15px;
        border-radius: 5px;
        font-weight: bold;
        transition: all 0.3s ease;
        display: inline-block;
    }

    .report-btn:hover {
        background-color: #e6c200;
        transform: translateY(-2px);
        box-shadow: var(--shadow-sm);
    }

    /* Table Styling */
    .table-container {
        width: 90%;
        margin: 20px auto;
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: var(--shadow-sm);
        transition: box-shadow 0.3s;
    }
    .table-container:hover {
        box-shadow: var(--shadow-md);
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: white;
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid rgba(123, 44, 191, 0.15);
    }

    th {
        background-color: var(--primary-purple-light);
        color: white;
        font-weight: 600;
    }

    tr:hover {
        background-color: rgba(123, 44, 191, 0.05);
        transition: background 0.2s;
    }

    /* Action Buttons */
    .action-btn {
        text-decoration: none;
        padding: 6px 12px;
        border-radius: 5px;
        font-weight: bold;
        transition: all 0.2s ease;
        display: inline-block;
    }

    .update-btn {
        background-color: var(--primary-gold);
        color: var(--primary-purple);
    }

    .delete-btn {
        background-color: var(--primary-coral-dark);
        color: white;
    }

    .update-btn:hover {
        background-color: #e6c200;
        transform: translateY(-2px);
        box-shadow: var(--shadow-sm);
    }

    .delete-btn:hover {
        background-color: var(--primary-coral);
        transform: translateY(-2px);
        box-shadow: var(--shadow-sm);
    }

    /* Message for No Incidents */
    .no-incident-msg {
        text-align: center;
        font-size: 18px;
        color: var(--primary-purple);
        font-weight: bold;
        margin-top: 20px;
    }

    /* ========== ADDITIONAL ENHANCEMENTS ========== */
    /* Smooth fade-in for the table container */
    .table-container {
        animation: fadeSlideUp 0.5s ease-out;
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

    /* Button ripple effect on click */
    .report-btn, .action-btn {
        position: relative;
        overflow: hidden;
    }
    .report-btn::after, .action-btn::after {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 0;
        height: 0;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.4);
        transform: translate(-50%, -50%);
        transition: width 0.4s, height 0.4s;
        pointer-events: none;
    }
    .report-btn:active::after, .action-btn:active::after {
        width: 200px;
        height: 200px;
    }

    /* Focus outlines for accessibility */
    .report-btn:focus-visible, .action-btn:focus-visible {
        outline: 3px solid var(--primary-gold);
        outline-offset: 2px;
        border-radius: 5px;
    }

    /* Custom scrollbar */
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

    /* Responsive improvements */
    @media (max-width: 768px) {
        .header {
            flex-direction: column;
            gap: 10px;
            text-align: center;
        }
        .table-container {
            width: 95%;
            padding: 15px;
            overflow-x: auto;
        }
        th, td {
            padding: 8px;
            font-size: 0.85rem;
        }
        .action-btn {
            padding: 4px 8px;
            font-size: 0.8rem;
        }
    }
</style>
</head>
<body>

    <!-- Header -->
<jsp:include page="/WEB-INF/views/fragments/header.jsp" />
<div id="wrapper">
    <jsp:include page="/WEB-INF/views/fragments/sidebar.jsp" />
    <div id="page-content-wrapper" style="min-height: 100vh; overflow-x: hidden;">

    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold text-purple">Your Reported Incidents</h2>
            <a href="${pageContext.request.contextPath}/incidents/report" class="report-btn">+ Report a New Incident</a>
        </div>
    </div>

    <!-- Check if there are any incidents -->
    <c:if test="${not empty incidents}">
        <div class="table-container">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Incident Type</th>
                            <th>Location</th>
                            <th>Description</th>
                            <th>Status</th>
                            <th>Media</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Loop through incidents -->
                        <c:forEach var="incident" items="${incidents}">
                            <tr>
                                <td>${incident.type}</td>
                                <td>${incident.location}</td>
                                <td>${incident.description}</td>
                                <td>${incident.status}</td>
                                <td>
                                    <c:if test="${not empty incident.mediaPath}">
                                        <a href="${pageContext.request.contextPath}${incident.mediaPath}" target="_blank">View Media</a>
                                    </c:if>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/incidents/incidentUpdate/${incident.id}" class="action-btn update-btn"> Update</a>
                                    |
                                    <a href="${pageContext.request.contextPath}/incidents/delete/${incident.id}" class="action-btn delete-btn" 
                                       onclick="return confirm('Are you sure you want to delete this incident?')"> Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>

    <!-- Message if there are no incidents -->
    <c:if test="${empty incidents}">
        <p class="no-incident-msg">You have not reported any incidents yet.</p>
    </c:if>
    </div>
</div>
</body>
</html>


