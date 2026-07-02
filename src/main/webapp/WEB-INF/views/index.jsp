<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Fight D Fear - Empowering Women</title>
  
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <style>
    :root {
      --primary: #f43f5e;
      --primary-hover: #e11d48;
      --navy-dark: #1e1b4b;
      --navy-light: #312e81;
      --bg-light: #f8fafc;
      --text-gray: #64748b;
      --text-dark: #0f172a;
    }
    
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(-45deg, #f8fafc, #ffe4e6, #e0e7ff, #f8fafc);
      background-size: 400% 400%;
      animation: gradientBG 20s ease infinite;
      color: var(--text-dark);
      overflow-x: hidden;
    }
    
    @keyframes gradientBG {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    /* Awareness Section */
    .awareness-section {
      padding: 100px 0;
    }
    .awareness-block {
      margin-bottom: 80px;
    }
    .awareness-block:last-child {
      margin-bottom: 0;
    }
    .awareness-img {
      border-radius: 20px;
      box-shadow: 0 20px 40px rgba(0,0,0,0.1);
      transition: transform 0.4s;
      width: 100%;
      height: 400px;
      object-fit: cover;
    }
    .awareness-img:hover {
      transform: translateY(-10px);
    }
    .awareness-text {
      padding: 30px;
    }
    .awareness-text h3 {
      font-weight: 700;
      color: var(--navy-dark);
      margin-bottom: 20px;
      font-size: 2.2rem;
    }
    .awareness-text p {
      font-size: 1.1rem;
      color: var(--text-gray);
      line-height: 1.8;
      margin-bottom: 20px;
    }

    a { text-decoration: none; }
    
    /* Buttons */
    .btn-primary-custom {
      background-color: var(--primary);
      color: white;
      border: none;
      padding: 10px 24px;
      border-radius: 30px;
      font-weight: 500;
      transition: all 0.3s;
    }
    .btn-primary-custom:hover {
      background-color: var(--primary-hover);
      color: white;
      transform: translateY(-2px);
    }
    .btn-outline-custom {
      background-color: transparent;
      color: var(--primary);
      border: 1px solid var(--primary);
      padding: 10px 24px;
      border-radius: 30px;
      font-weight: 500;
      transition: all 0.3s;
    }
    .btn-outline-custom:hover {
      background-color: rgba(244, 63, 94, 0.1);
      color: var(--primary);
    }
    .btn-sos {
      background-color: var(--primary);
      color: white;
      border: none;
      padding: 10px 24px;
      border-radius: 30px;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      gap: 8px;
    }
    .btn-sos:hover { background-color: var(--primary-hover); color: white; }

    /* Header */
    .header-nav {
      background: white;
      padding: 15px 0;
      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
      position: sticky;
      top: 0;
      z-index: 1000;
    }
    .nav-link {
      color: var(--text-dark);
      font-weight: 500;
      font-size: 15px;
      margin: 0 10px;
      transition: color 0.3s;
    }
    .nav-link:hover, .nav-link.active {
      color: var(--primary);
    }

    /* Logo Interactions */
    .brand-logo {
      transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      cursor: pointer;
      border-radius: 8px;
    }
    .brand-logo:hover {
      transform: scale(1.1) rotate(-3deg);
      box-shadow: 0 10px 25px rgba(244, 63, 94, 0.3);
    }

    /* Hero Section */
    .hero-section {
      padding: 180px 0 150px;
      min-height: 80vh;
      display: flex;
      align-items: center;
      position: relative;
      overflow: hidden;
    }
    .hero-video-bg {
      position: absolute;
      top: 50%;
      left: 50%;
      min-width: 100%;
      min-height: 100%;
      width: auto;
      height: auto;
      z-index: 0;
      transform: translateX(-50%) translateY(-50%);
      object-fit: cover;
    }
    .hero-overlay {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(to right, rgba(30, 27, 75, 0.95) 40%, rgba(30, 27, 75, 0.6));
      z-index: 1;
    }
    .hero-content {
      position: relative;
      z-index: 2;
      color: white;
    }
    .hero-title {
      font-size: 4rem;
      font-weight: 800;
      line-height: 1.2;
      margin-bottom: 20px;
    }
    .text-gradient {
      background: linear-gradient(90deg, #fb7185, #f43f5e);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
    .hero-desc {
      font-size: 1.1rem;
      color: #e2e8f0;
      max-width: 500px;
      margin-bottom: 30px;
      line-height: 1.6;
    }
    
    .sos-circle {
      width: 150px;
      height: 150px;
      background: var(--primary);
      border-radius: 50%;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      color: white;
      font-weight: bold;
      text-align: center;
      box-shadow: 0 0 0 15px rgba(244, 63, 94, 0.3), 0 0 40px rgba(244, 63, 94, 0.6);
      animation: pulse-sos 2s infinite;
      cursor: pointer;
      position: relative;
      z-index: 2;
    }
    .sos-circle h3 { margin: 0; font-size: 28px; font-weight: 800; }
    .sos-circle span { font-size: 12px; font-weight: 500; }
    
    @keyframes pulse-sos {
      0% { box-shadow: 0 0 0 0 rgba(244, 63, 94, 0.7); }
      70% { box-shadow: 0 0 0 25px rgba(244, 63, 94, 0); }
      100% { box-shadow: 0 0 0 0 rgba(244, 63, 94, 0); }
    }

    /* Floating Icons */
    .floating-icons {
      position: absolute;
      right: 30px;
      top: 50%;
      transform: translateY(-50%);
      display: flex;
      flex-direction: column;
      gap: 15px;
      z-index: 2;
    }
    .float-icon {
      width: 40px;
      height: 40px;
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(5px);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      transition: background 0.3s;
    }
    .float-icon:hover { background: var(--primary); }

    /* Section Titles */
    .section-title {
      text-align: center;
      font-weight: 700;
      color: var(--navy-dark);
      margin-bottom: 50px;
      position: relative;
    }
    .section-title::after {
      content: '';
      position: absolute;
      bottom: -15px;
      left: 50%;
      transform: translateX(-50%);
      width: 50px;
      height: 3px;
      background: var(--primary);
    }

    /* Features Grid */
    .features-section { 
      padding: 100px 0; 
      background: linear-gradient(135deg, var(--bg-light) 0%, #ffffff 100%);
      position: relative;
    }
    .features-section::before {
      content: '';
      position: absolute;
      top: -100px; right: -50px;
      width: 400px; height: 400px;
      background: radial-gradient(circle, rgba(244, 63, 94, 0.04) 0%, transparent 70%);
      border-radius: 50%;
      z-index: 0;
      pointer-events: none;
    }
    .features-section .container { position: relative; z-index: 1; }
    .feature-card {
      background: white;
      padding: 40px 30px;
      border-radius: 20px;
      text-align: center;
      box-shadow: 0 10px 40px rgba(0,0,0,0.03);
      border: 1px solid rgba(0,0,0,0.02);
      border-bottom: 4px solid transparent;
      transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
      height: 100%;
    }
    .feature-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 20px 40px rgba(244, 63, 94, 0.12);
      border-bottom: 4px solid var(--primary);
    }
    .feature-icon {
      width: 80px;
      height: 80px;
      background: rgba(244, 63, 94, 0.08);
      border-radius: 50%;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      font-size: 32px;
      color: var(--primary);
      margin-bottom: 25px;
      transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
    }
    .feature-card:hover .feature-icon {
      background: var(--primary);
      color: white;
      transform: scale(1.1) rotate(5deg);
      box-shadow: 0 10px 20px rgba(244, 63, 94, 0.2);
    }
    .feature-card h4 { font-size: 20px; font-weight: 700; color: var(--navy-dark); margin-bottom: 12px; }
    .feature-card p { color: var(--text-gray); font-size: 14.5px; margin: 0; line-height: 1.6; }

    /* How It Works */
    .steps-section { padding: 100px 0; background: linear-gradient(180deg, #ffffff 0%, var(--bg-light) 100%); }
    .step-img-wrapper {
      width: 130px;
      height: 130px;
      background: white;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 25px;
      position: relative;
      box-shadow: 0 15px 35px rgba(0,0,0,0.05);
      transition: all 0.4s ease;
    }
    .step-img-wrapper:hover { transform: translateY(-10px) scale(1.05); box-shadow: 0 20px 40px rgba(244, 63, 94, 0.15); }
    .step-number {
      position: absolute;
      bottom: -5px;
      left: 10px;
      width: 35px;
      height: 35px;
      background: var(--primary);
      color: white;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
      border: 4px solid white;
      box-shadow: 0 5px 15px rgba(244, 63, 94, 0.3);
    }
    .step-title { font-size: 18px; font-weight: 800; color: var(--navy-dark); margin-bottom: 10px; }
    .step-desc { font-size: 14px; color: var(--text-gray); line-height: 1.6; }
    .step-arrow { color: var(--primary); opacity: 0.3; font-size: 32px; display: flex; align-items: center; justify-content: center; height: 100%; animation: bounce-horizontal 2s infinite; }
    @keyframes bounce-horizontal { 0%, 100% { transform: translateX(0); } 50% { transform: translateX(10px); } }

    /* Emergency Services */
    .emergency-section { padding: 100px 0; background: white; }
    .emergency-card {
      background: white;
      border: 1px solid rgba(0, 0, 0, 0.04);
      border-radius: 20px;
      padding: 25px;
      display: flex;
      align-items: center;
      gap: 20px;
      transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
      box-shadow: 0 10px 30px rgba(0,0,0,0.02);
    }
    .emergency-card:hover {
      border-color: var(--primary);
      box-shadow: 0 20px 40px rgba(244, 63, 94, 0.15);
      transform: translateY(-8px);
    }
    .em-icon { width: 65px; height: 65px; background: rgba(244, 63, 94, 0.08); border-radius: 16px; display: flex; align-items: center; justify-content: center; font-size: 28px; color: var(--primary); transition: all 0.4s ease; }
    .emergency-card:hover .em-icon { background: var(--primary); color: white; transform: rotate(10deg); box-shadow: 0 10px 20px rgba(244, 63, 94, 0.3); }
    .em-details h5 { font-size: 14px; color: var(--text-gray); margin: 0; font-weight: 500; }
    .em-details h3 { font-size: 26px; font-weight: 800; color: var(--navy-dark); margin: 5px 0; letter-spacing: -0.5px; }
    .em-btn { background: rgba(244, 63, 94, 0.1); color: var(--primary); border: none; padding: 6px 18px; border-radius: 20px; font-size: 13px; font-weight: 700; transition: all 0.3s; }
    .emergency-card:hover .em-btn { background: var(--primary); color: white; }

    /* Map Section */
    .map-section { padding: 100px 0; background: var(--bg-light); }
    .map-container { border-radius: 24px; overflow: hidden; box-shadow: 0 20px 50px rgba(0,0,0,0.1); border: 4px solid white; }
    .map-tag { padding: 8px 18px; border-radius: 25px; font-size: 13px; font-weight: 600; display: inline-flex; align-items: center; gap: 8px; transition: all 0.3s; cursor: pointer; }
    .map-tag:hover { transform: translateY(-3px); }
    .tag-high { background: rgba(244, 63, 94, 0.1); color: var(--primary); }
    .tag-high:hover { background: var(--primary); color: white; box-shadow: 0 10px 20px rgba(244, 63, 94, 0.3); }
    .tag-med { background: rgba(245, 158, 11, 0.1); color: #f59e0b; }
    .tag-med:hover { background: #f59e0b; color: white; box-shadow: 0 10px 20px rgba(245, 158, 11, 0.3); }
    .tag-safe { background: rgba(16, 185, 129, 0.1); color: #10b981; }
    .tag-safe:hover { background: #10b981; color: white; box-shadow: 0 10px 20px rgba(16, 185, 129, 0.3); }

    /* Stats Banner */
    .stats-banner {
      background: linear-gradient(135deg, var(--navy-dark) 0%, var(--navy-light) 100%);
      padding: 50px 0;
      color: white;
      border-radius: 24px;
      margin: 60px auto;
      box-shadow: 0 30px 60px rgba(30, 27, 75, 0.2);
      position: relative;
      overflow: hidden;
    }
    .stats-banner::after { content: ''; position: absolute; top: -50%; right: -10%; width: 50%; height: 200%; background: radial-gradient(circle, rgba(244, 63, 94, 0.15) 0%, transparent 60%); pointer-events: none; }
    .stat-item { display: flex; align-items: center; justify-content: center; gap: 15px; transition: transform 0.3s; }
    .stat-item:hover { transform: translateY(-5px); }
    .stat-icon { font-size: 36px; color: var(--primary); filter: drop-shadow(0 0 15px rgba(244, 63, 94, 0.4)); }
    .stat-details h3 { font-size: 32px; font-weight: 800; margin: 0; letter-spacing: -1px; }
    .stat-details p { font-size: 13px; font-weight: 500; margin: 0; opacity: 0.8; letter-spacing: 1px; text-transform: uppercase; }

    /* Testimonials */
    .testimonial-card {
      background: white;
      padding: 40px 30px;
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.03);
      border: 1px solid rgba(0,0,0,0.02);
      border-bottom: 4px solid transparent;
      height: 100%;
      transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
    }
    .testimonial-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 20px 40px rgba(244, 63, 94, 0.12);
      border-bottom: 4px solid var(--primary);
    }
    .user-info { display: flex; align-items: center; gap: 15px; margin-bottom: 20px; }
    .user-info img { width: 55px; height: 55px; border-radius: 50%; object-fit: cover; box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
    .stars { color: #f59e0b; font-size: 13px; }

    /* CTA Section */
    .cta-section {
      background: linear-gradient(135deg, rgba(244,63,94,0.08), rgba(49,46,129,0.08));
      border-radius: 30px;
      padding: 80px 50px;
      margin: 100px auto;
      display: flex;
      align-items: center;
      justify-content: space-between;
      border: 1px solid rgba(255,255,255,0.5);
      box-shadow: 0 30px 60px rgba(0,0,0,0.05);
    }
    .cta-section img { transition: transform 0.5s cubic-bezier(0.165, 0.84, 0.44, 1); }
    .cta-section:hover img { transform: translateY(-15px) scale(1.05); }
    .app-btns img { height: 45px; margin-right: 15px; transition: transform 0.3s; }
    .app-btns img:hover { transform: translateY(-5px); }

    /* Footer */
    .footer {
      background: var(--navy-dark);
      color: white;
      padding: 80px 0 30px;
      position: relative;
      overflow: hidden;
    }
    .footer::before { content: ''; position: absolute; top: 0; left: 0; right: 0; height: 3px; background: linear-gradient(90deg, var(--navy-dark), var(--primary), var(--navy-dark)); }
    .footer h5 { font-size: 18px; font-weight: 700; margin-bottom: 25px; color: white; }
    .footer ul { list-style: none; padding: 0; margin: 0; }
    .footer ul li { margin-bottom: 12px; }
    .footer ul li a { color: #94a3b8; font-size: 14.5px; transition: all 0.3s; display: inline-block; }
    .footer ul li a:hover { color: var(--primary); transform: translateX(5px); }
    .footer-logo { display: flex; align-items: center; gap: 10px; font-size: 22px; font-weight: 800; margin-bottom: 20px; }
    .social-links a { color: white; width: 40px; height: 40px; background: rgba(255,255,255,0.05); display: inline-flex; align-items: center; justify-content: center; border-radius: 50%; margin-right: 12px; transition: all 0.3s; }
    .social-links a:hover { background: var(--primary); transform: translateY(-5px) scale(1.1); box-shadow: 0 10px 20px rgba(244, 63, 94, 0.3); }
    .newsletter-input { background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1); color: white; padding: 12px 20px; border-radius: 8px; width: 100%; margin-bottom: 15px; transition: border-color 0.3s; }
    .newsletter-input:focus { outline: none; border-color: var(--primary); background: rgba(255,255,255,0.1); }
    .newsletter-btn { background: var(--primary); color: white; border: none; padding: 12px; width: 100%; border-radius: 8px; font-weight: 700; transition: all 0.3s; }
    .newsletter-btn:hover { background: var(--primary-hover); transform: translateY(-2px); box-shadow: 0 10px 20px rgba(244, 63, 94, 0.2); }
    
    .copyright { text-align: center; border-top: 1px solid rgba(255,255,255,0.05); padding-top: 25px; margin-top: 50px; font-size: 14px; color: #64748b; }
  </style>
</head>
<body>

  <!-- Header -->
  <header class="header-nav">
    <div class="container d-flex align-items-center justify-content-between">
      <div class="d-flex align-items-center gap-2 logo-wrapper">
        <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/assets/img/fightdfear-logo.jpg" alt="Fight D Fear Logo" class="brand-logo" style="height: 85px;"></a>
      </div>
      
      <nav class="d-none d-lg-flex">
        <a href="#hero" class="nav-link active">Home</a>
        <a href="#features" class="nav-link">Features</a>
        <a href="#tips" class="nav-link">Safety Tips</a>
        <a href="#emergency" class="nav-link">Emergency</a>
        <a href="#about" class="nav-link">About Us</a>
        <a href="#contact" class="nav-link">Contact</a>
      </nav>

      <div class="d-flex align-items-center gap-3">
        <!-- Dashboard/Login Logic -->
        <c:choose>
          <c:when test="${not empty user || not empty loggedProvider || not empty loggedCentre || not empty loggedDoctor || not empty loggedSalon || not empty loggedStylist || not empty loggedSeller || not empty admin}">
            <c:set var="dashboardUrl" value="${pageContext.request.contextPath}/users/dashboard" />
            <c:if test="${not empty loggedProvider}"><c:set var="dashboardUrl" value="${pageContext.request.contextPath}/marketplace/provider/dashboard" /></c:if>
            <c:if test="${not empty loggedCentre}"><c:set var="dashboardUrl" value="${pageContext.request.contextPath}/centres/dashboard" /></c:if>
            <c:if test="${not empty loggedDoctor}"><c:set var="dashboardUrl" value="${pageContext.request.contextPath}/doctors/dashboard" /></c:if>
            <c:if test="${not empty admin}"><c:set var="dashboardUrl" value="${pageContext.request.contextPath}/admin/adminDashboard" /></c:if>
            <a href="${dashboardUrl}" class="btn-outline-custom d-none d-md-inline-block">My Dashboard</a>
          </c:when>
          <c:otherwise>
            <div class="dropdown d-none d-md-inline-block">
              <button class="btn btn-outline-custom dropdown-toggle" type="button" id="loginDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                Login
              </button>
              <ul class="dropdown-menu" aria-labelledby="loginDropdown">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/login">User</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/doctors/login">Doctor</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/centres/login">Martial Arts Centre</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/salons/login">Salon</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/stylists/login">Stylist</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/marketplace/provider/login">Marketplace Provider</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/women-products/seller/login">Product Seller</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/loginAdmin">Admin</a></li>
              </ul>
            </div>
            
            <div class="dropdown d-none d-md-inline-block ms-2">
              <button class="btn btn-primary-custom dropdown-toggle" type="button" id="registerDropdown" data-bs-toggle="dropdown" aria-expanded="false" style="color: white; font-weight: 500;">
                Register
              </button>
              <ul class="dropdown-menu" aria-labelledby="registerDropdown">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/users/register">User</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/doctors/register">Doctor</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/centres/registerCentre">Martial Arts Centre</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/salons/register">Salon</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/stylists/register">Stylist</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/marketplace/provider/register">Marketplace Provider</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/women-products/seller/register">Product Seller</a></li>
              </ul>
            </div>
          </c:otherwise>
        </c:choose>
        <a href="${pageContext.request.contextPath}/sos/dashboard" class="btn-sos"><i class="fa-solid fa-phone"></i> SOS</a>
      </div>
    </div>
  </header>

  <!-- Hero Section -->
  <section id="hero" class="hero-section">
    <video class="hero-video-bg" autoplay loop muted playsinline>
      <source src="${pageContext.request.contextPath}/assets/images/MicrosoftTeams-video.mp4" type="video/mp4">
    </video>
    <div class="hero-overlay"></div>
    <div class="floating-icons d-none d-xl-flex">
      <a href="#" class="float-icon"><i class="bi bi-headset"></i></a>
      <a href="#" class="float-icon"><i class="bi bi-geo-alt-fill"></i></a>
      <a href="#" class="float-icon"><i class="bi bi-chat-dots-fill"></i></a>
      <a href="#" class="float-icon"><i class="bi bi-shield-lock-fill"></i></a>
    </div>
    
    <div class="container hero-content">
      <div class="row align-items-center">
        <div class="col-lg-7" data-aos="fade-up">
          <h1 class="hero-title">Your Safety,<br><span class="text-gradient">Our Priority</span></h1>
          <p class="hero-desc">Empowering women with real-time safety solutions, emergency alerts, and support when it matters most.</p>
          <div class="d-flex gap-3">
            <a href="${pageContext.request.contextPath}/sos/dashboard" class="btn-primary-custom" style="padding: 12px 30px;"><i class="fa-solid fa-bell"></i> Activate SOS</a>
            <a href="#features" class="btn-outline-custom" style="padding: 12px 30px; border-color: white; color: white;">Learn More</a>
          </div>
        </div>
        <div class="col-lg-5 d-flex justify-content-center mt-5 mt-lg-0" data-aos="zoom-in" data-aos-delay="200">
          <div class="sos-circle" onclick="window.location.href='${pageContext.request.contextPath}/sos/dashboard'">
            <h3>SOS</h3>
            <span>Need Help?</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Features Section -->
  <section id="features" class="features-section">
    <div class="container">
      <h2 class="section-title" data-aos="fade-up">Our Features</h2>
      <div class="row g-4 mt-4">
        
        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
          <div class="feature-card">
            <i class="fa-solid fa-bell feature-icon"></i>
            <h4>SOS Alert</h4>
            <p>One click SOS alert to family and police instantly.</p>
          </div>
        </div>
        
        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
          <div class="feature-card">
            <i class="fa-solid fa-location-dot feature-icon"></i>
            <h4>Live Tracking</h4>
            <p>Share real-time location with trusted contacts.</p>
          </div>
        </div>

        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
          <div class="feature-card">
            <i class="fa-solid fa-microphone feature-icon"></i>
            <h4>Audio Recording</h4>
            <p>Automatically records audio when SOS is triggered.</p>
          </div>
        </div>

        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="400">
          <div class="feature-card">
            <i class="fa-solid fa-triangle-exclamation feature-icon"></i>
            <h4>Unsafe Area Alert</h4>
            <p>Get alerts for unsafe areas in real-time.</p>
          </div>
        </div>

        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="500">
          <div class="feature-card">
            <i class="fa-solid fa-users feature-icon"></i>
            <h4>Emergency Contacts</h4>
            <p>Quick access to your saved emergency contacts.</p>
          </div>
        </div>

        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="600">
          <div class="feature-card">
            <i class="fa-solid fa-robot feature-icon"></i>
            <h4>AI Safety Assistant</h4>
            <p>Get instant guidance and safety tips from AI assistant.</p>
          </div>
        </div>

      </div>
    </div>
  </section>

  <!-- Awareness Section (Zig-Zag Layout) -->
  <section class="awareness-section" id="awareness">
    <div class="container">
      <div class="text-center mb-5" data-aos="fade-up">
        <h2 class="section-title">Awareness & Solidarity</h2>
        <p class="text-muted">Together, we build a safer world through education and unity.</p>
      </div>

      <!-- Block 1: Image Left, Text Right -->
      <div class="row align-items-center awareness-block">
        <div class="col-lg-6 mb-4 mb-lg-0" data-aos="fade-right">
          <img src="assets/img/awareness_solidarity_1779965397029.png" alt="Women Solidarity" class="awareness-img">
        </div>
        <div class="col-lg-6" data-aos="fade-left">
          <div class="awareness-text">
            <h3>Strength in Sisterhood</h3>
            <p>Empowerment begins when we stand together. Fight D Fear fosters a community where women support each other, share critical information, and ensure no one walks alone.</p>
            <p>Join thousands of women who are actively creating safer neighborhoods by staying connected and vigilant.</p>
            <a href="${pageContext.request.contextPath}/stories" class="btn-primary-custom">Read Community Stories</a>
          </div>
        </div>
      </div>

      <!-- Block 2: Text Left, Image Right -->
      <div class="row align-items-center awareness-block flex-lg-row-reverse">
        <div class="col-lg-6 mb-4 mb-lg-0" data-aos="fade-left">
          <img src="assets/img/awareness_tech_shield_1779965413589.png" alt="Tech Shield" class="awareness-img">
        </div>
        <div class="col-lg-6" data-aos="fade-right">
          <div class="awareness-text">
            <h3>Proactive Digital Protection</h3>
            <p>Safety is no longer just physical—it's digital. With advanced Danger Maps, AI Safety Assistants, and real-time alerts, technology becomes your invisible shield.</p>
            <p>We leverage cutting-edge tools to predict unsafe zones and provide immediate assistance before an emergency escalates.</p>
            <a href="${pageContext.request.contextPath}/index/templates#services" class="btn-outline-custom">Explore Safety Tools</a>
          </div>
        </div>
      </div>

      <!-- Block 3: Image Left, Text Right -->
      <div class="row align-items-center awareness-block">
        <div class="col-lg-6 mb-4 mb-lg-0" data-aos="fade-right">
          <img src="assets/img/awareness_self_defense_1779965432813.png" alt="Self Defense Training" class="awareness-img">
        </div>
        <div class="col-lg-6" data-aos="fade-left">
          <div class="awareness-text">
            <h3>Equipped to Defend</h3>
            <p>Awareness is the first step, but preparation is the ultimate defense. Learning self-defense transforms fear into confidence, giving you the power to protect yourself and others.</p>
            <p>Discover local, verified martial arts centres and start your journey towards physical empowerment today.</p>
            <a href="${pageContext.request.contextPath}/centres/allacceptedcentres" class="btn-primary-custom">Find a Training Centre</a>
          </div>
        </div>
      </div>

    </div>
  </section>

  <!-- How It Works Section -->
  <section class="steps-section">
    <div class="container">
      <h2 class="section-title" data-aos="fade-up">How It Works</h2>
      <div class="row text-center mt-5 align-items-center">
        
        <div class="col-md-3" data-aos="fade-up" data-aos-delay="100">
          <div class="step-img-wrapper">
            <i class="fa-solid fa-user-plus" style="font-size: 40px; color: var(--navy-dark);"></i>
            <div class="step-number">1</div>
          </div>
          <h4 class="step-title">Sign Up & Setup</h4>
          <p class="step-desc">Create your account and setup your profile, permissions and emergency contacts.</p>
        </div>
        
        <div class="col-md-1 d-none d-md-block"><div class="step-arrow"><i class="fa-solid fa-arrow-right"></i></div></div>

        <div class="col-md-3" data-aos="fade-up" data-aos-delay="200">
          <div class="step-img-wrapper">
            <i class="fa-solid fa-address-book" style="font-size: 40px; color: var(--navy-dark);"></i>
            <div class="step-number">2</div>
          </div>
          <h4 class="step-title">Add Contacts</h4>
          <p class="step-desc">Add your trusted contacts who will be notified during emergencies.</p>
        </div>

        <div class="col-md-1 d-none d-md-block"><div class="step-arrow"><i class="fa-solid fa-arrow-right"></i></div></div>

        <div class="col-md-3" data-aos="fade-up" data-aos-delay="300">
          <div class="step-img-wrapper">
            <i class="fa-solid fa-hand-pointer" style="font-size: 40px; color: var(--primary);"></i>
            <div class="step-number">3</div>
          </div>
          <h4 class="step-title">Press SOS</h4>
          <p class="step-desc">In danger? Press the SOS button to send alert with your live location.</p>
        </div>

        <div class="col-md-1 d-none d-md-block"><div class="step-arrow"><i class="fa-solid fa-arrow-right"></i></div></div>

        <div class="col-md-3" data-aos="fade-up" data-aos-delay="400">
          <div class="step-img-wrapper">
            <i class="fa-solid fa-shield-halved" style="font-size: 40px; color: var(--navy-dark);"></i>
            <div class="step-number">4</div>
          </div>
          <h4 class="step-title">Get Help</h4>
          <p class="step-desc">Your contacts and local authorities will receive the alert immediately.</p>
        </div>

      </div>
    </div>
  </section>

  <!-- Emergency Services -->
  <section id="emergency" class="emergency-section">
    <div class="container">
      <h2 class="section-title" data-aos="fade-up">Emergency Services</h2>
      <div class="row g-4 mt-3">
        
        <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="100">
          <div class="emergency-card">
            <div class="em-icon"><i class="fa-solid fa-user-shield"></i></div>
            <div class="em-details">
              <h5>Police</h5>
              <h3>100</h3>
              <a href="tel:100"><button class="em-btn">Call Now</button></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="200">
          <div class="emergency-card">
            <div class="em-icon"><i class="fa-solid fa-truck-medical"></i></div>
            <div class="em-details">
              <h5>Ambulance</h5>
              <h3>108</h3>
              <a href="tel:108"><button class="em-btn">Call Now</button></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="300">
          <div class="emergency-card">
            <div class="em-icon"><i class="fa-solid fa-phone-volume"></i></div>
            <div class="em-details">
              <h5>Women Helpline</h5>
              <h3>1091</h3>
              <a href="tel:1091"><button class="em-btn">Call Now</button></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="400">
          <div class="emergency-card">
            <div class="em-icon"><i class="fa-solid fa-fire-extinguisher"></i></div>
            <div class="em-details">
              <h5>Fire Service</h5>
              <h3>101</h3>
              <a href="tel:101"><button class="em-btn">Call Now</button></a>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>

  <!-- Map Section -->
  <section class="map-section">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 mb-4 mb-lg-0" data-aos="fade-right">
          <div id="danger-map" class="map-container" style="height: 400px; width: 100%; background: #e2e8f0;">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d224346.54005187762!2d77.04360370821017!3d28.527252737667746!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390cfd5b347eb62d%3A0x52c2b7494e204dce!2sNew%20Delhi%2C%20Delhi!5e0!3m2!1sen!2sin!4v1700000000000!5m2!1sen!2sin" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
          </div>
        </div>
        <div class="col-lg-6 px-lg-5" data-aos="fade-left">
          <span style="color: var(--primary); font-weight: 600; font-size: 14px;">Stay Aware</span>
          <h2 class="mb-3" style="color: var(--navy-dark); font-weight: 800;">Unsafe Area Map</h2>
          <p style="color: var(--text-gray); margin-bottom: 30px;">Check unsafe areas in and around your location in real-time. Stay alert, stay safe!</p>
          
          <div class="d-flex gap-3 flex-wrap mb-4">
            <div class="map-tag tag-high"><i class="fa-solid fa-circle"></i> High Risk Area</div>
            <div class="map-tag tag-med"><i class="fa-solid fa-circle"></i> Medium Risk Area</div>
            <div class="map-tag tag-safe"><i class="fa-solid fa-circle"></i> Safe Area</div>
          </div>
          
          <a href="${pageContext.request.contextPath}/map" class="btn-primary-custom d-inline-flex align-items-center gap-2">View Full Map <i class="fa-solid fa-arrow-right"></i></a>
        </div>
      </div>
    </div>
  </section>

  <!-- Stats Banner -->
  <div class="container">
    <div class="stats-banner" data-aos="zoom-in">
      <div class="row text-center">
        <div class="col-md-3 stat-item border-end border-light border-opacity-25">
          <i class="fa-solid fa-users stat-icon"></i>
          <div class="stat-details text-start">
            <h3>10K+</h3>
            <p>Users Protected</p>
          </div>
        </div>
        <div class="col-md-3 stat-item border-end border-light border-opacity-25">
          <i class="fa-solid fa-bell stat-icon"></i>
          <div class="stat-details text-start">
            <h3>5K+</h3>
            <p>SOS Alerts Sent</p>
          </div>
        </div>
        <div class="col-md-3 stat-item border-end border-light border-opacity-25">
          <i class="fa-solid fa-shield-halved stat-icon"></i>
          <div class="stat-details text-start">
            <h3>100+</h3>
            <p>Safe Zones</p>
          </div>
        </div>
        <div class="col-md-3 stat-item">
          <i class="fa-regular fa-clock stat-icon"></i>
          <div class="stat-details text-start">
            <h3>24/7</h3>
            <p>Support Available</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Testimonials -->
  <section class="steps-section" style="background: transparent;">
    <div class="container">
      <h2 class="section-title" data-aos="fade-up">What Users Say</h2>
      <div class="row g-4 mt-4">
        
        <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
          <div class="testimonial-card">
            <div class="user-info">
              <img src="assets/img/chat-user-1.png" onerror="this.src='https://via.placeholder.com/50'" alt="User">
              <div>
                <h6 style="margin:0; font-weight:700; color:var(--navy-dark);">Sneha Patil</h6>
                <div class="stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div>
              </div>
            </div>
            <p style="color:var(--text-gray); font-size:14px; margin:0;">The SOS feature helped me alert my family instantly. I feel so much safer now!</p>
          </div>
        </div>

        <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
          <div class="testimonial-card">
            <div class="user-info">
              <img src="assets/img/chat-user-2.jpg" onerror="this.src='https://via.placeholder.com/50'" alt="User">
              <div>
                <h6 style="margin:0; font-weight:700; color:var(--navy-dark);">Anjali Sharma</h6>
                <div class="stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div>
              </div>
            </div>
            <p style="color:var(--text-gray); font-size:14px; margin:0;">Live tracking and audio recording features are amazing. A must-have app for every woman.</p>
          </div>
        </div>

        <div class="col-lg-4" data-aos="fade-up" data-aos-delay="300">
          <div class="testimonial-card">
            <div class="user-info">
              <img src="assets/img/chat-user-3.jpg" onerror="this.src='https://via.placeholder.com/50'" alt="User">
              <div>
                <h6 style="margin:0; font-weight:700; color:var(--navy-dark);">Riya Singh</h6>
                <div class="stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div>
              </div>
            </div>
            <p style="color:var(--text-gray); font-size:14px; margin:0;">The unsafe area alerts are very helpful. Thank you for creating such a wonderful app!</p>
          </div>
        </div>

      </div>
    </div>
  </section>

  <!-- CTA App Download -->
  <div class="container">
    <div class="cta-section" data-aos="fade-up">
      <div class="row align-items-center w-100">
        <div class="col-lg-4 d-flex justify-content-center mb-4 mb-lg-0">
          <img src="assets/img/about-img.svg" onerror="this.src='https://via.placeholder.com/200'" style="height: 200px;" alt="App Interface">
        </div>
        <div class="col-lg-4 text-center">
          <h3 style="color: var(--navy-dark); font-weight: 800; margin-bottom: 15px;">Download Our App</h3>
          <p style="color: var(--text-gray); margin-bottom: 20px;">Your safety companion, always with you.</p>
          <div class="app-btns d-flex justify-content-center gap-3">
            <a href="#"><img src="https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg" alt="Google Play"></a>
            <a href="#"><img src="https://upload.wikimedia.org/wikipedia/commons/3/3c/Download_on_the_App_Store_Badge.svg" alt="App Store"></a>
          </div>
        </div>
        <div class="col-lg-4 d-flex justify-content-center mt-4 mt-lg-0">
           <img src="assets/img/hero-img.svg" onerror="this.src='https://via.placeholder.com/200'" style="height: 250px;" alt="Phone Mockup">
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer class="footer">
    <div class="container">
      <div class="row g-4">
        
        <div class="col-lg-3 col-md-6">
          <div class="footer-logo">
            <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/assets/img/fightdfear-logo.jpg" alt="Fight D Fear Logo" class="brand-logo" style="height: 85px; background: white; padding: 5px;"></a>
          </div>
          <p style="color: #cbd5e1; font-size: 13px; line-height: 1.6;">Our mission is to empower women with technology and community support for a safer tomorrow.</p>
          <div class="social-links mt-3">
            <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
            <a href="#"><i class="fa-brands fa-twitter"></i></a>
            <a href="#"><i class="fa-brands fa-instagram"></i></a>
            <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
            <a href="#"><i class="fa-brands fa-youtube"></i></a>
          </div>
        </div>

        <div class="col-lg-2 col-md-6">
          <h5>Quick Links</h5>
          <ul>
            <li><a href="#hero">Home</a></li>
            <li><a href="#features">Features</a></li>
            <li><a href="#tips">Safety Tips</a></li>
            <li><a href="#emergency">Emergency</a></li>
            <li><a href="#about">About Us</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div>

        <div class="col-lg-3 col-md-6">
          <h5>Important Links</h5>
          <ul>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Terms & Conditions</a></li>
            <li><a href="#">Refund Policy</a></li>
            <li><a href="#">Disclaimer</a></li>
            <li><a href="#">Help & Support</a></li>
          </ul>
        </div>

        <div class="col-lg-4 col-md-6">
          <h5>Contact Us</h5>
          <ul style="margin-bottom: 20px;">
            <li><i class="fa-solid fa-envelope" style="width:20px; color:var(--primary);"></i> support@womensafety.com</li>
            <li><i class="fa-solid fa-phone" style="width:20px; color:var(--primary);"></i> +91 98765 43210</li>
            <li><i class="fa-solid fa-location-dot" style="width:20px; color:var(--primary);"></i> Mumbai, Maharashtra, India</li>
          </ul>
          
          <h5>Newsletter</h5>
          <p style="color: #cbd5e1; font-size: 13px;">Subscribe to get latest updates and safety tips.</p>
          <form action="#">
            <input type="email" class="newsletter-input" placeholder="Enter your email" required>
            <button type="submit" class="newsletter-btn">Subscribe</button>
          </form>
        </div>

      </div>
      
      <div class="copyright">
        &copy; 2026 Women Safety. All Rights Reserved.
      </div>
    </div>
  </footer>

  <!-- Scripts -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script>
    AOS.init({
      duration: 800,
      easing: 'ease-in-out',
      once: true,
      mirror: false
    });
  </script>
</body>
</html>
