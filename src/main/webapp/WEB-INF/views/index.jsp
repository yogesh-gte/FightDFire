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
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
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

    /* ===== PREMIUM NAVBAR ===== */
    .header-nav {
      background: rgba(255, 255, 255, 0.85);
      backdrop-filter: blur(20px);
      -webkit-backdrop-filter: blur(20px);
      padding: 8px 0;
      box-shadow: 0 4px 30px rgba(0, 0, 0, 0.06);
      border-bottom: 1px solid rgba(255, 255, 255, 0.3);
      position: sticky;
      top: 0;
      z-index: 1000;
      transition: all 0.3s ease;
    }
    .header-nav .container {
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    .brand-logo {
      height: 70px;
      transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      border-radius: 12px;
      cursor: pointer;
    }
    .brand-logo:hover {
      transform: scale(1.08) rotate(-2deg);
      box-shadow: 0 12px 30px rgba(244, 63, 94, 0.2);
    }
    .nav-link {
      color: var(--text-dark);
      font-weight: 600;
      font-size: 0.95rem;
      margin: 0 8px;
      padding: 8px 16px;
      border-radius: 30px;
      transition: all 0.3s ease;
      position: relative;
    }
    .nav-link:hover, .nav-link.active {
      color: var(--primary);
      background: rgba(244, 63, 94, 0.08);
    }
    .nav-link::after {
      content: '';
      position: absolute;
      bottom: 2px;
      left: 50%;
      width: 0;
      height: 2px;
      background: var(--primary);
      transition: all 0.3s ease;
      transform: translateX(-50%);
    }
    .nav-link:hover::after, .nav-link.active::after {
      width: 60%;
    }
    .btn-outline-custom {
      border: 2px solid var(--primary);
      background: transparent;
      padding: 8px 24px;
      border-radius: 40px;
      font-weight: 600;
      font-size: 0.9rem;
      color: var(--primary);
      transition: all 0.3s ease;
    }
    .btn-outline-custom:hover {
      background: var(--primary);
      color: #fff;
      transform: translateY(-2px);
      box-shadow: 0 10px 25px rgba(244, 63, 94, 0.25);
    }
    .btn-primary-custom {
      background: var(--primary);
      color: #fff;
      padding: 8px 24px;
      border-radius: 40px;
      font-weight: 600;
      font-size: 0.9rem;
      border: none;
      transition: all 0.3s ease;
    }
    .btn-primary-custom:hover {
      background: var(--primary-hover);
      transform: translateY(-2px);
      box-shadow: 0 10px 25px rgba(244, 63, 94, 0.3);
    }
    .btn-sos {
      background: var(--primary);
      color: #fff;
      border: none;
      padding: 8px 22px;
      border-radius: 40px;
      font-weight: 700;
      font-size: 0.85rem;
      display: inline-flex;
      align-items: center;
      gap: 8px;
      transition: all 0.3s ease;
      box-shadow: 0 8px 25px rgba(244, 63, 94, 0.3);
      animation: pulseSOS 2s infinite;
    }
    .btn-sos:hover {
      background: var(--primary-hover);
      transform: translateY(-2px) scale(1.05);
      color: #fff;
    }
    @keyframes pulseSOS {
      0%, 100% { box-shadow: 0 8px 25px rgba(244, 63, 94, 0.3); }
      50% { box-shadow: 0 8px 40px rgba(244, 63, 94, 0.5); }
    }

    /* ===== HERO CAROUSEL ===== */
    .hero-carousel-section {
      min-height: 90vh;
      display: flex;
      align-items: center;
      position: relative;
      overflow: hidden;
      background: var(--navy-dark);
    }
    .hero-carousel-section .carousel {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
    }
    .hero-carousel-section .carousel-item {
      height: 90vh;
      background-size: cover;
      background-position: center;
      position: relative;
      transition: transform 0.8s ease-in-out, opacity 0.8s ease-in-out;
    }
    .hero-carousel-section .carousel-item::before {
    content: "";
    position: absolute;
    inset: 0;
    background: transparent;
    z-index: 1;
}
    .hero-carousel-section .carousel-item .container {
      position: relative;
      z-index: 2;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
    }
    .hero-carousel-section .carousel-item .hero-content {
      color: white;
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
    }
    .hero-carousel-section .carousel-item .hero-title {
      font-size: 4.2rem;
      font-weight: 900;
      line-height: 1.1;
      margin-bottom: 20px;
      text-shadow: 0 4px 30px rgba(0,0,0,0.3);
    }
    .hero-carousel-section .carousel-item .text-gradient {
      background: linear-gradient(135deg, #fb7185, #f43f5e, #e11d48);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }
    .hero-carousel-section .carousel-item .hero-desc {
      font-size: 1.15rem;
      color: rgba(255,255,255,0.9);
      margin-bottom: 30px;
      line-height: 1.8;
      text-shadow: 0 2px 15px rgba(0,0,0,0.2);
    }
    .hero-carousel-section .carousel-item .hero-badge {
      display: inline-block;
      background: rgba(244, 63, 94, 0.2);
      backdrop-filter: blur(10px);
      padding: 8px 28px;
      border-radius: 50px;
      font-size: 0.85rem;
      color: #fb7185;
      font-weight: 600;
      margin-bottom: 20px;
      border: 1px solid rgba(244, 63, 94, 0.2);
      letter-spacing: 1px;
    }
    .hero-carousel-section .carousel-control-prev,
    .hero-carousel-section .carousel-control-next {
      width: 55px;
      height: 55px;
      background: rgba(255,255,255,0.1);
      border-radius: 50%;
      top: 50%;
      transform: translateY(-50%);
      opacity: 0.7;
      transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
      backdrop-filter: blur(10px);
      border: 1px solid rgba(255,255,255,0.15);
    }
    .hero-carousel-section .carousel-control-prev:hover,
    .hero-carousel-section .carousel-control-next:hover {
      background: var(--primary);
      opacity: 1;
      transform: translateY(-50%) scale(1.1);
      box-shadow: 0 10px 30px rgba(244, 63, 94, 0.3);
    }
    .hero-carousel-section .carousel-indicators {
      bottom: 40px;
    }
    .hero-carousel-section .carousel-indicators button {
      width: 14px;
      height: 14px;
      border-radius: 50%;
      border: 2px solid rgba(255,255,255,0.5);
      background: transparent;
      margin: 0 10px;
      transition: all 0.3s ease;
    }
    .hero-carousel-section .carousel-indicators button.active {
      background: var(--primary);
      border-color: var(--primary);
      transform: scale(1.3);
      box-shadow: 0 0 25px rgba(244, 63, 94, 0.4);
    }

    .sos-circle-center {
      width: 140px;
      height: 140px;
      background: linear-gradient(145deg, var(--primary), var(--primary-hover));
      border-radius: 50%;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      color: white;
      font-weight: bold;
      text-align: center;
      box-shadow: 0 0 0 15px rgba(244, 63, 94, 0.25), 0 0 60px rgba(244, 63, 94, 0.4);
      animation: pulseSOSGlobe 2.5s infinite;
      cursor: pointer;
      transition: all 0.3s ease;
      margin: 20px auto 0;
    }
    .sos-circle-center:hover {
      transform: scale(1.08);
      box-shadow: 0 0 0 20px rgba(244, 63, 94, 0.3), 0 0 80px rgba(244, 63, 94, 0.5);
    }
    .sos-circle-center h3 { margin: 0; font-size: 30px; font-weight: 900; letter-spacing: 2px; }
    .sos-circle-center span { font-size: 12px; font-weight: 500; opacity: 0.9; text-transform: uppercase; letter-spacing: 1px; }
    
    @keyframes pulseSOSGlobe {
      0% { box-shadow: 0 0 0 0 rgba(244, 63, 94, 0.5), 0 0 60px rgba(244, 63, 94, 0.3); }
      70% { box-shadow: 0 0 0 25px rgba(244, 63, 94, 0), 0 0 80px rgba(244, 63, 94, 0.1); }
      100% { box-shadow: 0 0 0 0 rgba(244, 63, 94, 0), 0 0 60px rgba(244, 63, 94, 0.3); }
    }

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

    /* ===== AWARENESS SECTION ===== */
    .awareness-section {
      padding: 100px 0;
      background: var(--bg-light);
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

    /* ===== FEATURES SECTION - 9 MODULES ===== */
    .features-section {
      padding: 100px 0;
      background: linear-gradient(180deg, #ffffff 0%, var(--bg-light) 100%);
      position: relative;
    }
    .features-section::before {
      content: '';
      position: absolute;
      top: -100px;
      right: -50px;
      width: 400px;
      height: 400px;
      background: radial-gradient(circle, rgba(244, 63, 94, 0.04) 0%, transparent 70%);
      border-radius: 50%;
      z-index: 0;
      pointer-events: none;
    }
    .features-section .container {
      position: relative;
      z-index: 1;
    }
    
    .feature-module-card {
      background: white;
      padding: 35px 25px;
      border-radius: 24px;
      text-align: center;
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.03);
      border: 1px solid rgba(0, 0, 0, 0.02);
      transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
      height: 100%;
      position: relative;
      overflow: hidden;
    }
    .feature-module-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      background: linear-gradient(90deg, var(--primary), #fb7185);
      transform: scaleX(0);
      transform-origin: left;
      transition: transform 0.5s ease;
    }
    .feature-module-card:hover::before {
      transform: scaleX(1);
    }
    .feature-module-card:hover {
      transform: translateY(-12px);
      box-shadow: 0 30px 60px rgba(244, 63, 94, 0.08);
      border-color: rgba(244, 63, 94, 0.1);
    }
    
    .feature-module-icon {
      width: 75px;
      height: 75px;
      background: rgba(244, 63, 94, 0.08);
      border-radius: 20px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      font-size: 30px;
      color: var(--primary);
      margin-bottom: 18px;
      transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
    }
    .feature-module-card:hover .feature-module-icon {
      background: var(--primary);
      color: white;
      transform: scale(1.1) rotate(-4deg);
      box-shadow: 0 15px 30px rgba(244, 63, 94, 0.2);
    }
    
    .feature-module-card .module-number {
      display: inline-block;
      background: rgba(244, 63, 94, 0.06);
      color: var(--primary);
      font-size: 0.65rem;
      font-weight: 700;
      padding: 2px 12px;
      border-radius: 20px;
      letter-spacing: 0.5px;
      margin-bottom: 8px;
    }
    
    .feature-module-card h4 {
      font-size: 1.15rem;
      font-weight: 700;
      color: var(--navy-dark);
      margin-bottom: 8px;
    }
    .feature-module-card p {
      color: var(--text-gray);
      font-size: 0.85rem;
      line-height: 1.6;
      margin: 0;
    }
    
    .feature-tags {
      display: flex;
      flex-wrap: wrap;
      gap: 5px;
      justify-content: center;
      margin-top: 12px;
    }
    .feature-tags span {
      background: rgba(244, 63, 94, 0.06);
      color: var(--text-gray);
      font-size: 0.6rem;
      padding: 3px 10px;
      border-radius: 12px;
      font-weight: 500;
    }
    .feature-tags span:hover {
      background: var(--primary);
      color: white;
      cursor: default;
    }

    /* ===== HOW IT WORKS ===== */
    .how-it-works-section {
      padding: 100px 0;
      background: linear-gradient(180deg, #ffffff 0%, var(--bg-light) 100%);
      overflow: hidden;
    }
    .how-it-works-section .section-badge {
      display: inline-block;
      background: rgba(244, 63, 94, 0.08);
      color: var(--primary);
      font-weight: 600;
      font-size: 0.75rem;
      padding: 6px 20px;
      border-radius: 50px;
      text-transform: uppercase;
      letter-spacing: 1.5px;
      margin-bottom: 10px;
    }
    .how-it-works-section .section-title-custom {
      font-weight: 800;
      font-size: 2.8rem;
      color: var(--navy-dark);
      margin-bottom: 10px;
      letter-spacing: -0.02em;
    }
    .how-it-works-section .section-sub {
      color: var(--text-gray);
      font-size: 1.1rem;
      margin-bottom: 40px;
    }

    .step-wrapper {
      position: relative;
      padding-left: 70px;
      margin-bottom: 35px;
      transition: all 0.4s ease;
      border-left: 3px solid transparent;
      padding-bottom: 5px;
    }
    .step-wrapper:last-child {
      margin-bottom: 0;
    }
    .step-wrapper:hover {
      transform: translateX(8px);
      border-left-color: var(--primary);
    }
    .step-icon-circle {
      position: absolute;
      left: 0;
      top: 0;
      width: 50px;
      height: 50px;
      background: rgba(244, 63, 94, 0.08);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.3rem;
      color: var(--primary);
      transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
      border: 2px solid rgba(244, 63, 94, 0.1);
    }
    .step-wrapper:hover .step-icon-circle {
      background: var(--primary);
      color: white;
      transform: scale(1.1) rotate(10deg);
      box-shadow: 0 10px 30px rgba(244, 63, 94, 0.2);
      border-color: var(--primary);
    }
    .step-wrapper .step-icon {
      font-size: 1.3rem;
    }
    .step-wrapper h4 {
      font-weight: 700;
      font-size: 1.3rem;
      color: var(--navy-dark);
      margin-bottom: 6px;
    }
    .step-wrapper p {
      color: var(--text-gray);
      font-size: 0.95rem;
      line-height: 1.7;
      max-width: 500px;
      margin-bottom: 0;
    }

    .how-it-works-image {
      position: relative;
      border-radius: 24px;
      overflow: hidden;
      box-shadow: 0 30px 60px rgba(0, 0, 0, 0.1);
      transition: all 0.6s cubic-bezier(0.165, 0.84, 0.44, 1);
    }
    .how-it-works-image:hover {
      transform: scale(1.02) translateY(-10px);
      box-shadow: 0 40px 80px rgba(244, 63, 94, 0.15);
    }
    .how-it-works-image img {
      width: 100%;
      height: 600px;
      object-fit: cover;
      transition: all 0.6s ease;
    }
    .how-it-works-image:hover img {
      transform: scale(1.05);
    }
    .how-it-works-image .image-overlay {
      position: absolute;
      bottom: 0;
      left: 0;
      right: 0;
      padding: 40px;
      background: linear-gradient(transparent, rgba(30, 27, 75, 0.8));
      color: white;
    }
    .how-it-works-image .image-overlay h3 {
      font-weight: 700;
      font-size: 1.5rem;
      margin-bottom: 5px;
    }
    .how-it-works-image .image-overlay p {
      opacity: 0.9;
      font-size: 0.95rem;
    }

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

    /* Responsive */
    @media (max-width: 768px) {
      .hero-carousel-section .carousel-item .hero-title { font-size: 2.4rem; }
      .hero-carousel-section .carousel-item { height: 80vh; }
      .sos-circle-center { width: 120px; height: 120px; }
      .sos-circle-center h3 { font-size: 22px; }
      .brand-logo { height: 55px; }
      .nav-link { font-size: 0.85rem; padding: 6px 12px; }
      .btn-sos { padding: 6px 16px; font-size: 0.75rem; }
      .how-it-works-image img { height: 350px; }
      .step-wrapper { padding-left: 60px; }
      .step-icon-circle { width: 42px; height: 42px; font-size: 1rem; }
      .how-it-works-section .section-title-custom { font-size: 2rem; }
      .awareness-img { height: 250px; }
      .awareness-text { padding: 15px; }
      .awareness-text h3 { font-size: 1.6rem; }
      .feature-module-card { padding: 25px 20px; }
    }
    @media (max-width: 992px) {
      .how-it-works-image { margin-top: 40px; }
      .awareness-block { margin-bottom: 50px; }
    }
  </style>
</head>
<body>

  <!-- ===== HEADER ===== -->
  <header class="header-nav">
    <div class="container">
      <div class="d-flex align-items-center gap-2">
        <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/assets/img/fightdfear-logo.jpg" alt="Fight D Fear" class="brand-logo"></a>
      </div>
      
      <nav class="d-none d-lg-flex align-items-center">
        <a href="#hero" class="nav-link active">Home</a>
        <a href="${pageContext.request.contextPath}/features.jsp" class="nav-link">Features</a>
        <a href="${pageContext.request.contextPath}/women-events" class="nav-link">Events 🌸</a>
        <a href="#tips" class="nav-link">Safety Tips</a>
        <a href="#awareness" class="nav-link">Awareness</a>
        <a href="#emergency" class="nav-link">Emergency</a>
        <a href="#howitworks" class="nav-link">How It Works</a>
        <a href="#contact" class="nav-link">Contact</a>
      </nav>

      <div class="d-flex align-items-center gap-2">
        <c:choose>
          <c:when test="${not empty user || not empty loggedProvider || not empty loggedCentre || not empty loggedDoctor || not empty loggedSalon || not empty loggedStylist || not empty loggedSeller || not empty loggedEntrepreneur || not empty loggedInvestor || not empty admin}">
            <c:set var="dashboardUrl" value="${pageContext.request.contextPath}/users/dashboard" />
            <c:if test="${not empty loggedProvider}"><c:set var="dashboardUrl" value="${pageContext.request.contextPath}/marketplace/provider/dashboard" /></c:if>
            <c:if test="${not empty loggedCentre}"><c:set var="dashboardUrl" value="${pageContext.request.contextPath}/centres/dashboard" /></c:if>
            <c:if test="${not empty loggedDoctor}"><c:set var="dashboardUrl" value="${pageContext.request.contextPath}/doctors/dashboard" /></c:if>
            <c:if test="${not empty loggedEntrepreneur}"><c:set var="dashboardUrl" value="${pageContext.request.contextPath}/entrepreneur/dashboard" /></c:if>
            <c:if test="${not empty loggedInvestor}"><c:set var="dashboardUrl" value="${pageContext.request.contextPath}/investor/dashboard" /></c:if>
            <c:if test="${not empty admin}"><c:set var="dashboardUrl" value="${pageContext.request.contextPath}/admin/adminDashboard" /></c:if>
            <a href="${dashboardUrl}" class="btn-outline-custom d-none d-md-inline-block"><i class="fa-solid fa-gauge-high me-1"></i> Dashboard</a>
          </c:when>
          <c:otherwise>
            <div class="dropdown d-none d-md-inline-block">
              <button class="btn-outline-custom dropdown-toggle" type="button" data-bs-toggle="dropdown"><i class="fa-solid fa-right-to-bracket me-1"></i> Login</button>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/login">User</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/doctors/login">Doctor</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/centres/login">Martial Arts</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/salons/login">Salon</a></li>

                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/stylists/login">Stylist</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/marketplace/provider/login">Marketplace Provider</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/women-products/seller/login">Product Seller</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/entrepreneur/login">Entrepreneur</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/investor/login">Investor</a></li>

                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/loginAdmin">Admin</a></li>
              </ul>
            </div>
            <div class="dropdown d-none d-md-inline-block">
              <button class="btn-primary-custom dropdown-toggle" type="button" data-bs-toggle="dropdown"><i class="fa-solid fa-user-plus me-1"></i> Register</button>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/users/register">User</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/doctors/register">Doctor</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/centres/registerCentre">Martial Arts</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/salons/register">Salon</a></li>

                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/stylists/register">Stylist</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/marketplace/provider/register">Marketplace Provider</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/women-products/seller/register">Product Seller</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/entrepreneur/register">Entrepreneur</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/investor/register">Investor</a></li>

              </ul>
            </div>
          </c:otherwise>
        </c:choose>
        <a href="${pageContext.request.contextPath}/sos/dashboard" class="btn-sos"><i class="fa-solid fa-phone"></i> SOS</a>
      </div>
    </div>
  </header>

  <!-- ===== HERO CAROUSEL ===== -->
  <section id="hero" class="hero-carousel-section">
    <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="3"></button>
      </div>
      
      <div class="carousel-inner">
        <div class="carousel-item active" style="background-image: url('${pageContext.request.contextPath}/assets/images/img6.jpg');">
          <div class="container">
            <div class="hero-content" data-aos="fade-up">
              <span class="hero-badge"><i class="fa-solid fa-shield-halved me-2"></i> WOMEN'S SAFETY</span>
              <h1 class="hero-title">Your Safety is <span class="text-gradient">Our Priority</span></h1>
              <p class="hero-desc">Empowering women with instant emergency response systems. One tap SOS alert with live location sharing to police and your trusted contacts.</p>
              <div class="d-flex gap-3 flex-wrap justify-content-center">
                <a href="${pageContext.request.contextPath}/sos/dashboard" class="btn-primary-custom" style="padding: 12px 32px;"><i class="fa-solid fa-bell"></i> Activate SOS</a>
                
              </div>
              <div class="sos-circle-center" onclick="window.location.href='${pageContext.request.contextPath}/sos/dashboard'">
                <h3>SOS</h3>
                <span>Need Help?</span>
              </div>
            </div>
          </div>
        </div>
        
        <div class="carousel-item" style="background-image: url('${pageContext.request.contextPath}/assets/images/img7.jpg');">
          <div class="container">
            <div class="hero-content" data-aos="fade-up">
              <span class="hero-badge"><i class="fa-solid fa-fist-raised me-2"></i> SELF DEFENSE</span>
              <h1 class="hero-title">Empower Through <span class="text-gradient">Self-Defense</span></h1>
              <p class="hero-desc">Every women deserves to feel strong and capable. Learn practical self-defense techniques from verified martial arts centres.</p>
              <div class="d-flex gap-3 flex-wrap justify-content-center">
                <a href="${pageContext.request.contextPath}/centres/allacceptedcentres" class="btn-primary-custom" style="padding: 12px 32px;"><i class="fa-solid fa-shield"></i> Find Training</a>
                
              </div>
            </div>
          </div>
        </div>
        
        <div class="carousel-item" style="background-image: url('${pageContext.request.contextPath}/assets/images/img3.jpg');">
          <div class="container">
            <div class="hero-content" data-aos="fade-up">
              <span class="hero-badge"><i class="fa-solid fa-users me-2"></i> COMMUNITY</span>
              <h1 class="hero-title">Stronger <span class="text-gradient">Together</span></h1>
              <p class="hero-desc">Join a powerful community of women supporting women. Share stories, safety tips, and resources.</p>
              <div class="d-flex gap-3 flex-wrap justify-content-center">
                <a href="${pageContext.request.contextPath}/stories" class="btn-primary-custom" style="padding: 12px 32px;"><i class="fa-solid fa-users"></i> Join Community</a>
                
              </div>
            </div>
          </div>
        </div>
        
         <div class="carousel-item" style="background-image: url('${pageContext.request.contextPath}/assets/images/img8.jpg');">
          <div class="container">
            <div class="hero-content" data-aos="fade-up">
              <span class="hero-badge"><i class="fa-solid fa-robot me-2"></i> DIGITAL SAFETY</span>
              <h1 class="hero-title">AI-Powered <span class="text-gradient">Safety Shield</span></h1>
              <p class="hero-desc">Real-time unsafe area alerts, AI safety assistant, and smart tracking to keep you protected wherever you go.</p>
              <div class="d-flex gap-3 flex-wrap justify-content-center">
                <a href="${pageContext.request.contextPath}/map" class="btn-primary-custom" style="padding: 12px 32px;"><i class="fa-solid fa-map"></i> View Safety Map</a>
                
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </section>

  <!-- ===== FEATURES SECTION - 9 MODULES ===== -->
  <section id="features" class="features-section">
    <div class="container">
      <div class="text-center mb-5" data-aos="fade-up">
        <span class="section-badge" style="display:inline-block; background:rgba(244,63,94,0.08); color:var(--primary); font-weight:600; font-size:0.75rem; padding:6px 20px; border-radius:50px; text-transform:uppercase; letter-spacing:1.5px; margin-bottom:10px;">
          <i class="fa-regular fa-star me-2"></i> All-in-One Platform
        </span>
        <h2 class="section-title" style="margin-top:15px;">Everything You Need for <span style="color:var(--primary);">Women's Safety</span></h2>
        <p class="text-muted" style="max-width:600px; margin:0 auto;">9 powerful modules designed to protect, empower, and connect women</p>
      </div>
      
      <div class="row g-4">
        <!-- 1. Core Safety Features -->
        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
          <div class="feature-module-card">
            <span class="module-number">01</span>
            <div class="feature-module-icon"><i class="fa-solid fa-shield-halved"></i></div>
            <h4>Core Safety Features</h4>
            <p>SOS Panic Button, Audio Recording, Emergency Contacts, Live Location Sharing, Journey Tracking & more.</p>
            <div class="feature-tags">
              <span>SOS Alert</span>
              <span>Live Tracking</span>
              <span>Safe Route</span>
            </div>
          </div>
        </div>
        
        <!-- 2. Community Features -->
        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="150">
          <div class="feature-module-card">
            <span class="module-number">02</span>
            <div class="feature-module-icon"><i class="fa-solid fa-users"></i></div>
            <h4>Community Features</h4>
            <p>Community posts, Q&A, Chat, Video Calling, Safety Stories, Volunteer Network & Buddy System.</p>
            <div class="feature-tags">
              <span>Chat</span>
              <span>Video Call</span>
              <span>Volunteer</span>
            </div>
          </div>
        </div>
        
        <!-- 3. Location Intelligence -->
        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
          <div class="feature-module-card">
            <span class="module-number">03</span>
            <div class="feature-module-icon"><i class="fa-solid fa-location-dot"></i></div>
            <h4>Location Intelligence</h4>
            <p>Live GPS tracking, Safe Route navigation, Danger Points mapping & Journey Monitoring.</p>
            <div class="feature-tags">
              <span>Live GPS</span>
              <span>Safe Route</span>
              <span>Danger Points</span>
            </div>
          </div>
        </div>
        
        <!-- 4. Women's Skill Development -->
        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="250">
          <div class="feature-module-card">
            <span class="module-number">04</span>
            <div class="feature-module-icon"><i class="fa-solid fa-graduation-cap"></i></div>
            <h4>Skill Development</h4>
            <p>Online classes, Training programs, Progress tracking, Course enrollment & Schedule management.</p>
            <div class="feature-tags">
              <span>Online Classes</span>
              <span>Training</span>
              <span>Certificates</span>
            </div>
          </div>
        </div>
        
        <!-- 5. Marketplace -->
        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
          <div class="feature-module-card">
            <span class="module-number">05</span>
            <div class="feature-module-icon"><i class="fa-solid fa-store"></i></div>
            <h4>Marketplace</h4>
            <p>Women products marketplace, Secure payments, Digital wallet, Exclusive offers & Seller communication.</p>
            <div class="feature-tags">
              <span>Wallet</span>
              <span>Payments</span>
              <span>Offers</span>
            </div>
          </div>
        </div>
        
        <!-- 6. Beauty & Salon Services -->
        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="350">
          <div class="feature-module-card">
            <span class="module-number">06</span>
            <div class="feature-module-icon"><i class="fa-solid fa-spa"></i></div>
            <h4>Beauty & Salon</h4>
            <p>Salon booking, Beauty services, Professional stylists, Stylist reviews & Treatment packages.</p>
            <div class="feature-tags">
              <span>Salon</span>
              <span>Stylists</span>
              <span>Treatments</span>
            </div>
          </div>
        </div>
        
        <!-- 7. Professional Consultation -->
        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="400">
          <div class="feature-module-card">
            <span class="module-number">07</span>
            <div class="feature-module-icon"><i class="fa-solid fa-stethoscope"></i></div>
            <h4>Professional Consultation</h4>
            <p>Doctor consultation, Video appointments, Booking system & Future: Lawyers, Therapists, Career Mentors.</p>
            <div class="feature-tags">
              <span>Doctors</span>
              <span>Video Consult</span>
              <span>Booking</span>
            </div>
          </div>
        </div>
        
        <!-- 8. Communication -->
        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="450">
          <div class="feature-module-card">
            <span class="module-number">08</span>
            <div class="feature-module-icon"><i class="fa-solid fa-comments"></i></div>
            <h4>Communication</h4>
            <p>Real-time chat, Video calls, Contact messaging, Notifications & Instant alerts for emergencies.</p>
            <div class="feature-tags">
              <span>Chat</span>
              <span>Video Calls</span>
              <span>Alerts</span>
            </div>
          </div>
        </div>
        
        <!-- 9. Content Platform -->
        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="500">
          <div class="feature-module-card">
            <span class="module-number">09</span>
            <div class="feature-module-icon"><i class="fa-solid fa-video"></i></div>
            <h4>Content Platform</h4>
            <p>Upload videos, Watch content, Share media, Safety stories & Creator-style engagement.</p>
            <div class="feature-tags">
              <span>Videos</span>
              <span>Stories</span>
              <span>Media</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ===== AWARENESS & SOLIDARITY SECTION ===== -->
  <section class="awareness-section" id="awareness">
    <div class="container">
      <div class="text-center mb-5" data-aos="fade-up">
        <h2 class="section-title">Awareness & Solidarity</h2>
        <p class="text-muted">Together, we build a safer world through education and unity.</p>
      </div>

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

  <!-- ===== HOW IT WORKS ===== -->
  <section class="how-it-works-section" id="howitworks">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6" data-aos="fade-right">
          <span class="section-badge"><i class="fa-regular fa-circle-check me-2"></i> How It Works</span>
          <h2 class="section-title-custom">Your Safety Journey in 4 Steps</h2>
          <p class="section-sub">Simple, fast, and secure — get protected in minutes</p>
          
          <div class="step-wrapper" data-aos="fade-up" data-aos-delay="100">
            <div class="step-icon-circle"><i class="fa-solid fa-user-plus step-icon"></i></div>
            <h4>Sign Up & Setup</h4>
            <p>Create your free account in under 2 minutes. Set up your profile, customize your safety preferences, and add emergency contacts who will be notified during critical situations.</p>
          </div>
          
          <div class="step-wrapper" data-aos="fade-up" data-aos-delay="200">
            <div class="step-icon-circle"><i class="fa-solid fa-address-book step-icon"></i></div>
            <h4>Add Trusted Contacts</h4>
            <p>Add your family members, friends, or colleagues who will receive your SOS alerts. You can manage multiple contacts and choose who gets notified during different types of emergencies.</p>
          </div>
          
          <div class="step-wrapper" data-aos="fade-up" data-aos-delay="300">
            <div class="step-icon-circle"><i class="fa-solid fa-hand-pointer step-icon"></i></div>
            <h4>Press SOS in Danger</h4>
            <p>In an emergency, tap the SOS button. Your live location, audio recording, and alert will be instantly sent to your trusted contacts and local authorities. Every second counts.</p>
          </div>
          
          <div class="step-wrapper" data-aos="fade-up" data-aos-delay="400">
            <div class="step-icon-circle"><i class="fa-solid fa-shield-halved step-icon"></i></div>
            <h4>Get Immediate Help</h4>
            <p>Your contacts receive your exact location and can track you in real-time. They can also listen to ambient audio and coordinate with emergency services to reach you quickly.</p>
          </div>
        </div>
        
        <div class="col-lg-6" data-aos="fade-left" data-aos-delay="200">
          <div class="how-it-works-image">
            <img src="https://images.unsplash.com/photo-1518611012118-696072aa579a?auto=format&fit=crop&w=800&q=90" alt="Empowered Women Safety">
            <div class="image-overlay">
              <h3>Empowered Women, Safe Women</h3>
              <p>Join thousands of women who have taken control of their safety</p>
            </div>
          </div>
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
          <div class="emergency-card"><div class="em-icon"><i class="fa-solid fa-user-shield"></i></div><div class="em-details"><h5>Police</h5><h3>100</h3><a href="tel:100"><button class="em-btn">Call Now</button></a></div></div>
        </div>
        <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="200">
          <div class="emergency-card"><div class="em-icon"><i class="fa-solid fa-truck-medical"></i></div><div class="em-details"><h5>Ambulance</h5><h3>108</h3><a href="tel:108"><button class="em-btn">Call Now</button></a></div></div>
        </div>
        <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="300">
          <div class="emergency-card"><div class="em-icon"><i class="fa-solid fa-phone-volume"></i></div><div class="em-details"><h5>Women Helpline</h5><h3>1091</h3><a href="tel:1091"><button class="em-btn">Call Now</button></a></div></div>
        </div>
        <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="400">
          <div class="emergency-card"><div class="em-icon"><i class="fa-solid fa-fire-extinguisher"></i></div><div class="em-details"><h5>Fire Service</h5><h3>101</h3><a href="tel:101"><button class="em-btn">Call Now</button></a></div></div>
        </div>
      </div>
    </div>
  </section>

  <!-- Map Section -->
  <section class="map-section">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 mb-4 mb-lg-0" data-aos="fade-right">
          <div class="map-container" style="height: 400px; width: 100%; background: #e2e8f0;">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d224346.54005187762!2d77.04360370821017!3d28.527252737667746!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390cfd5b347eb62d%3A0x52c2b7494e204dce!2sNew%20Delhi%2C%20Delhi!5e0!3m2!1sen!2sin!4v1700000000000" width="100%" height="100%" style="border:0;" allowfullscreen></iframe>
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
          <i class="fa-solid fa-users stat-icon"></i><div class="stat-details text-start"><h3>10K+</h3><p>Users Protected</p></div>
        </div>
        <div class="col-md-3 stat-item border-end border-light border-opacity-25">
          <i class="fa-solid fa-bell stat-icon"></i><div class="stat-details text-start"><h3>5K+</h3><p>SOS Alerts Sent</p></div>
        </div>
        <div class="col-md-3 stat-item border-end border-light border-opacity-25">
          <i class="fa-solid fa-shield-halved stat-icon"></i><div class="stat-details text-start"><h3>100+</h3><p>Safe Zones</p></div>
        </div>
        <div class="col-md-3 stat-item">
          <i class="fa-regular fa-clock stat-icon"></i><div class="stat-details text-start"><h3>24/7</h3><p>Support Available</p></div>
        </div>
      </div>
    </div>
  </div>

  <!-- Testimonials -->
  <section class="steps-section" style="background: transparent; padding: 100px 0;">
    <div class="container">
      <h2 class="section-title" data-aos="fade-up">What Users Say</h2>
      <div class="row g-4 mt-4">
        <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
          <div class="testimonial-card"><div class="user-info"><img src="assets/img/chat-user-1.png" onerror="this.src='https://via.placeholder.com/50'" alt="User"><div><h6 style="margin:0; font-weight:700; color:var(--navy-dark);">Sneha Patil</h6><div class="stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div></div></div><p style="color:var(--text-gray); font-size:14px; margin:0;">The SOS feature helped me alert my family instantly. I feel so much safer now!</p></div>
        </div>
        <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
          <div class="testimonial-card"><div class="user-info"><img src="assets/img/chat-user-2.jpg" onerror="this.src='https://via.placeholder.com/50'" alt="User"><div><h6 style="margin:0; font-weight:700; color:var(--navy-dark);">Anjali Sharma</h6><div class="stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div></div></div><p style="color:var(--text-gray); font-size:14px; margin:0;">Live tracking and audio recording features are amazing. A must-have app for every woman.</p></div>
        </div>
        <div class="col-lg-4" data-aos="fade-up" data-aos-delay="300">
          <div class="testimonial-card"><div class="user-info"><img src="assets/img/chat-user-3.jpg" onerror="this.src='https://via.placeholder.com/50'" alt="User"><div><h6 style="margin:0; font-weight:700; color:var(--navy-dark);">Riya Singh</h6><div class="stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div></div></div><p style="color:var(--text-gray); font-size:14px; margin:0;">The unsafe area alerts are very helpful. Thank you for creating such a wonderful app!</p></div>
        </div>
      </div>
    </div>
  </section>

  <!-- CTA -->
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
          <div class="footer-logo"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/assets/img/fightdfear-logo.jpg" alt="Fight D Fear Logo" class="brand-logo" style="height: 85px; background: white; padding: 5px;"></a></div>
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
          <ul><li><a href="#hero">Home</a></li><li><a href="${pageContext.request.contextPath}/features.jsp">Features</a></li><li><a href="#awareness">Awareness</a></li><li><a href="#emergency">Emergency</a></li><li><a href="#howitworks">How It Works</a></li><li><a href="#contact">Contact</a></li></ul>
        </div>
        <div class="col-lg-3 col-md-6">
          <h5>Important Links</h5>
          <ul><li><a href="#">Privacy Policy</a></li><li><a href="#">Terms & Conditions</a></li><li><a href="#">Refund Policy</a></li><li><a href="#">Disclaimer</a></li><li><a href="#">Help & Support</a></li></ul>
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
          <form action="#"><input type="email" class="newsletter-input" placeholder="Enter your email" required><button type="submit" class="newsletter-btn">Subscribe</button></form>
        </div>
      </div>
      <div class="copyright">&copy; 2026 Women Safety. All Rights Reserved.</div>
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

    document.addEventListener('DOMContentLoaded', function() {
      var carouselElement = document.getElementById('heroCarousel');
      if (carouselElement) {
        var carousel = new bootstrap.Carousel(carouselElement, {
          interval: 5000,
          ride: 'carousel',
          pause: false,
          wrap: true
        });
        carousel.cycle();
      }
    });
  </script>
</body>
</html>