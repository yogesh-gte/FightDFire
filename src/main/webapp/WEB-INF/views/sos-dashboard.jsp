<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SOS Emergency Alert | Women Safety</title>
    <meta name="description" content="Emergency SOS alert system - One tap to alert contacts, volunteers, and emergency services">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- SockJS + STOMP for WebSocket -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

    <style>
    /* ============================================
       ORIGINAL STYLES (kept exactly as is)
       ============================================ */
    :root {
        --pp: #7C2D5E;
        --pp-light: #a64281;
        --coral: #DB2777;
        --gold: #ffd700;
        --bg-primary: #150510;
        --bg-secondary: #210a1b;
        --bg-card: rgba(255, 255, 255, 0.05);
        --bg-glass: rgba(124, 45, 94, 0.12);
        --text-primary: #ffffff;
        --text-secondary: rgba(255, 255, 255, 0.7);
        --accent-red: #DB2777;
        --accent-red-glow: rgba(219, 39, 119, 0.4);
        --accent-green: #30d158;
        --accent-orange: #f1c232;
        --accent-blue: #00bcd4;
        --accent-purple: #7C2D5E;
        --border-subtle: rgba(255, 255, 255, 0.15);
        --shadow-heavy: 0 25px 50px rgba(0, 0, 0, 0.4);
    }

    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
        font-family: 'Inter', -apple-system, sans-serif;
        background: var(--bg-primary);
        color: var(--text-primary);
        min-height: 100vh;
        overflow-x: hidden;
    }

    /* === Animated Background === */
    .bg-grid {
        position: fixed; top: 0; left: 0; right: 0; bottom: 0;
        background-image:
            radial-gradient(circle at 20% 50%, rgba(124, 45, 94, 0.25) 0%, transparent 50%),
            radial-gradient(circle at 80% 20%, rgba(219, 39, 119, 0.15) 0%, transparent 50%),
            radial-gradient(circle at 50% 80%, rgba(124, 45, 94, 0.1) 0%, transparent 50%);
        background-size: cover;
        z-index: 0;
    }

    .bg-grid.sos-active {
        animation: emergencyPulse 1.5s ease-in-out infinite;
    }

    @keyframes emergencyPulse {
        0%, 100% { background-image:
            radial-gradient(circle at 20% 50%, rgba(219, 39, 119, 0.15) 0%, transparent 50%),
            radial-gradient(circle at 80% 20%, rgba(219, 39, 119, 0.1) 0%, transparent 50%),
            radial-gradient(circle at 50% 80%, rgba(219, 39, 119, 0.08) 0%, transparent 50%); }
        50% { background-image:
            radial-gradient(circle at 20% 50%, rgba(219, 39, 119, 0.35) 0%, transparent 50%),
            radial-gradient(circle at 80% 20%, rgba(219, 39, 119, 0.25) 0%, transparent 50%),
            radial-gradient(circle at 50% 80%, rgba(219, 39, 119, 0.2) 0%, transparent 50%); }
    }

    /* === Top Navigation === */
    .top-nav {
        position: fixed; top: 0; left: 0; right: 0;
        padding: 16px 24px;
        display: flex; justify-content: space-between; align-items: center;
        background: linear-gradient(to right, var(--pp), #4a0e2a);
        backdrop-filter: blur(20px);
        border-bottom: 2px solid var(--coral);
        z-index: 100;
        box-shadow: 0 4px 15px rgba(0,0,0,0.3);
    }

    .top-nav .brand {
        font-weight: 700; font-size: 18px;
        display: flex; align-items: center; gap: 8px;
    }

    .top-nav .brand i { color: var(--accent-red); }
    .top-nav .back-btn {
        color: var(--text-secondary);
        text-decoration: none; font-size: 14px;
        display: flex; align-items: center; gap: 6px;
        transition: color 0.2s;
    }
    .top-nav .back-btn:hover { color: var(--text-primary); }

    /* === Main Container === */
    .sos-container {
        position: relative; z-index: 1;
        max-width: 480px; margin: 0 auto;
        padding: 80px 20px 40px;
        min-height: 100vh;
        display: flex; flex-direction: column; align-items: center;
    }

    /* === Status Bar === */
    .status-bar {
        width: 100%; padding: 12px 16px;
        background: var(--bg-glass);
        border: 1px solid var(--border-subtle);
        border-radius: 12px;
        display: flex; align-items: center; gap: 10px;
        margin-bottom: 30px;
        font-size: 13px; color: var(--text-secondary);
    }
    .status-bar .dot {
        width: 8px; height: 8px; border-radius: 50%;
        background: var(--accent-green);
        animation: blink 2s infinite;
    }
    .status-bar.danger .dot { background: var(--accent-red); }
    @keyframes blink { 0%, 100% { opacity: 1; } 50% { opacity: 0.3; } }

    /* Premium Box for SOS */
    .sos-outer-box {
        background: rgba(124, 45, 94, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(15px);
        border-radius: 30px;
        padding: 50px 40px;
        margin: 20px 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        box-shadow: 0 20px 40px rgba(0,0,0,0.3);
    }

    .sos-btn-wrapper {
        position: relative;
        width: 220px; height: 220px;
        background: rgba(219, 39, 119, 0.05);
        border: 2px solid rgba(219, 39, 119, 0.2);
        padding: 10px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .sos-btn-ring {
        position: absolute; inset: -10px;
        border-radius: 50%;
        border: 2px solid rgba(219, 39, 119, 0.3);
        animation: ringPulse 2s ease-in-out infinite;
    }

    @keyframes ringPulse {
        0%, 100% { transform: scale(1); opacity: 0.8; }
        50% { transform: scale(1.1); opacity: 0.2; }
    }

    .sos-btn {
        width: 180px; height: 180px;
        border-radius: 50%;
        border: 6px solid rgba(255, 255, 255, 0.2);
        background: linear-gradient(135deg, var(--coral), #9b1b54);
        color: white;
        font-family: 'Inter', sans-serif;
        font-size: 48px;
        font-weight: 900;
        letter-spacing: 2px;
        cursor: pointer;
        box-shadow:
            0 0 30px var(--accent-red-glow),
            inset 0 4px 10px rgba(255,255,255,0.3),
            inset 0 -4px 10px rgba(0,0,0,0.3);
        transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .sos-btn:hover {
        transform: scale(1.08);
        background: linear-gradient(135deg, #ff4c8a, var(--coral));
        box-shadow: 0 0 50px var(--accent-red-glow);
    }

    .sos-btn-label {
        text-align: center;
        font-size: 14px;
        font-weight: 500;
        color: var(--text-secondary);
        margin-top: 25px;
        letter-spacing: 1px;
        text-transform: uppercase;
    }

    /* === Countdown Overlay === */
    .countdown-overlay {
        display: none;
        position: fixed; inset: 0;
        background: rgba(10, 10, 15, 0.95);
        backdrop-filter: blur(30px);
        z-index: 200;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .countdown-overlay.active { display: flex; }

    .countdown-number {
        font-size: 120px;
        font-weight: 900;
        color: var(--accent-red);
        text-shadow: 0 0 60px var(--accent-red-glow);
        line-height: 1;
        animation: countdownPop 1s ease-in-out infinite;
    }

    @keyframes countdownPop {
        0%, 100% { transform: scale(1); }
        50% { transform: scale(1.08); }
    }

    .countdown-text {
        font-size: 16px;
        color: var(--text-secondary);
        margin-top: 20px;
        text-align: center;
        max-width: 300px;
    }

    .countdown-cancel-btn {
        margin-top: 40px;
        padding: 14px 40px;
        border-radius: 50px;
        border: 2px solid rgba(255, 255, 255, 0.2);
        background: transparent;
        color: white;
        font-family: 'Inter', sans-serif;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s;
    }

    .countdown-cancel-btn:hover {
        background: rgba(255, 255, 255, 0.1);
        border-color: rgba(255, 255, 255, 0.4);
    }

    /* === Alert Progress === */
    .alert-progress {
        width: 100%;
        display: none;
    }

    .alert-progress.active { display: block; }

    .progress-step {
        display: flex; align-items: center; gap: 14px;
        padding: 14px 16px;
        background: var(--bg-glass);
        border: 1px solid var(--border-subtle);
        border-radius: 12px;
        margin-bottom: 10px;
        font-size: 14px;
        transition: all 0.4s ease;
    }

    .progress-step.active {
        border-color: rgba(255, 45, 85, 0.3);
        background: rgba(255, 45, 85, 0.08);
    }

    .progress-step.done {
        border-color: rgba(48, 209, 88, 0.3);
        background: rgba(48, 209, 88, 0.08);
    }

    .progress-step .step-icon {
        width: 32px; height: 32px;
        border-radius: 50%;
        display: flex; justify-content: center; align-items: center;
        font-size: 14px;
        flex-shrink: 0;
    }

    .progress-step .step-icon.pending { background: var(--bg-card); color: var(--text-secondary); }
    .progress-step.active .step-icon { background: rgba(255, 45, 85, 0.2); color: var(--accent-red); }
    .progress-step.done .step-icon { background: rgba(48, 209, 88, 0.2); color: var(--accent-green); }

    .progress-step .step-info { flex: 1; }
    .progress-step .step-title { font-weight: 600; font-size: 13px; }
    .progress-step .step-desc { font-size: 11px; color: var(--text-secondary); margin-top: 2px; }

    .spinner {
        width: 16px; height: 16px;
        border: 2px solid transparent;
        border-top-color: var(--accent-red);
        border-radius: 50%;
        animation: spin 0.8s linear infinite;
    }
    @keyframes spin { to { transform: rotate(360deg); } }

    /* === Quick Actions === */
    .quick-actions {
        width: 100%;
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 10px;
        margin-top: 20px;
    }

    .quick-action-btn {
        padding: 18px 14px;
        border-radius: 16px;
        border: 1px solid rgba(255, 255, 255, 0.1);
        background: rgba(124, 45, 94, 0.2);
        backdrop-filter: blur(5px);
        color: var(--text-primary);
        font-family: 'Inter', sans-serif;
        font-size: 13px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 6px;
        text-decoration: none;
    }

    .quick-action-btn:hover {
        background: rgba(255, 255, 255, 0.1);
        border-color: rgba(255, 255, 255, 0.15);
        transform: translateY(-2px);
        color: var(--text-primary);
    }

    .quick-action-btn i {
        font-size: 20px;
    }

    .quick-action-btn.police i { color: var(--accent-blue); }
    .quick-action-btn.ambulance i { color: var(--accent-green); }
    .quick-action-btn.contacts i { color: var(--accent-purple); }
    .quick-action-btn.location i { color: var(--accent-orange); }

    /* === Info Section === */
    .info-card {
        width: 100%;
        padding: 16px;
        background: var(--bg-glass);
        border: 1px solid var(--border-subtle);
        border-radius: 12px;
        margin-top: 20px;
    }

    .info-card h4 {
        font-size: 13px;
        font-weight: 600;
        margin-bottom: 8px;
        display: flex; align-items: center; gap: 8px;
    }

    .info-card p {
        font-size: 12px;
        color: var(--text-secondary);
        line-height: 1.6;
    }

    /* === Responded Banner === */
    .responded-banner {
        display: none;
        width: 100%;
        padding: 16px;
        background: rgba(48, 209, 88, 0.1);
        border: 1px solid rgba(48, 209, 88, 0.3);
        border-radius: 12px;
        margin-top: 16px;
        text-align: center;
    }

    .responded-banner.active { display: block; }
    .responded-banner.h4 { color: var(--accent-green); font-size: 15px; margin-bottom: 4px; }
    .responded-banner p { font-size: 12px; color: var(--text-secondary); }

    /* === Toast Notification === */
    .toast-notification {
        position: fixed;
        top: 80px; left: 50%; transform: translateX(-50%);
        padding: 12px 24px;
        background: rgba(48, 209, 88, 0.15);
        border: 1px solid rgba(48, 209, 88, 0.3);
        border-radius: 12px;
        color: var(--accent-green);
        font-size: 13px; font-weight: 500;
        z-index: 300;
        display: none;
        backdrop-filter: blur(20px);
    }

    .toast-notification.error {
        background: rgba(255, 45, 85, 0.15);
        border-color: rgba(255, 45, 85, 0.3);
        color: var(--accent-red);
    }

    .toast-notification.show {
        display: block;
        animation: slideDown 0.3s ease, fadeOut 0.3s ease 2.5s forwards;
    }

    @keyframes slideDown { from { opacity: 0; transform: translateX(-50%) translateY(-20px); } to { opacity: 1; transform: translateX(-50%) translateY(0); } }
    @keyframes fadeOut { to { opacity: 0; } }

    /* === Contact Response Panel === */
    .contact-response-panel {
        background: var(--bg-card);
        border: 1px solid var(--border-subtle);
        border-radius: 16px;
        padding: 20px;
        margin-top: 20px;
        backdrop-filter: blur(20px);
    }

    .response-summary {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 10px;
        margin-bottom: 20px;
    }

    .summary-card {
        padding: 15px;
        border-radius: 12px;
        text-align: center;
        border: 1px solid var(--border-subtle);
    }

    .summary-card.accepted {
        background: rgba(48, 209, 88, 0.1);
        border-color: rgba(48, 209, 88, 0.3);
    }

    .summary-card.pending {
        background: rgba(255, 159, 10, 0.1);
        border-color: rgba(255, 159, 10, 0.3);
    }

    .summary-card.rejected {
        background: rgba(255, 45, 85, 0.1);
        border-color: rgba(255, 45, 85, 0.3);
    }

    .summary-number {
        font-size: 32px;
        font-weight: 700;
        margin-bottom: 5px;
    }

    .summary-card.accepted .summary-number { color: var(--accent-green); }
    .summary-card.pending .summary-number { color: var(--accent-orange); }
    .summary-card.rejected .summary-number { color: var(--accent-red); }

    .summary-label {
        font-size: 12px;
        color: var(--text-secondary);
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 4px;
    }

    .contact-list {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .contact-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 12px;
        background: var(--bg-glass);
        border-radius: 10px;
        border: 1px solid var(--border-subtle);
        transition: all 0.3s ease;
    }

    .contact-item.accepted {
        background: rgba(48, 209, 88, 0.08);
        border-color: rgba(48, 209, 88, 0.2);
    }

    .contact-item.rejected {
        background: rgba(255, 45, 85, 0.08);
        border-color: rgba(255, 45, 85, 0.2);
    }

    .contact-info {
        display: flex;
        align-items: center;
        gap: 12px;
        flex: 1;
    }

    .contact-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: linear-gradient(135deg, var(--accent-blue), var(--accent-purple));
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 600;
        font-size: 16px;
    }

    .contact-details h5 {
        font-size: 14px;
        font-weight: 600;
        margin-bottom: 2px;
    }

    .contact-details p {
        font-size: 11px;
        color: var(--text-secondary);
    }

    .contact-status {
        display: flex;
        align-items: center;
        gap: 6px;
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 11px;
        font-weight: 600;
    }

    .contact-status.accepted {
        background: rgba(48, 209, 88, 0.15);
        color: var(--accent-green);
    }

    .contact-status.rejected {
        background: rgba(255, 45, 85, 0.15);
        color: var(--accent-red);
    }

    .contact-status.pending {
        background: rgba(255, 159, 10, 0.15);
        color: var(--accent-orange);
    }

    /* === Responsive === */
    @media (max-width: 480px) {
        .sos-container { padding: 70px 16px 30px; }
        .sos-btn { width: 180px; height: 180px; font-size: 36px; }
        .sos-btn-wrapper { width: 180px; height: 180px; }
        .countdown-number { font-size: 90px; }
    }

    /* ============================================
       🚀 ADDITIONAL ENHANCEMENTS (no existing rules changed)
       ============================================ */

    /* 1. Smooth page fade-in */
    body {
        animation: fadeInPage 0.6s ease-out forwards;
    }
    @keyframes fadeInPage {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    /* 2. Custom scrollbar (dark themed) */
    ::-webkit-scrollbar {
        width: 6px;
        height: 6px;
    }
    ::-webkit-scrollbar-track {
        background: var(--bg-secondary);
        border-radius: 10px;
    }
    ::-webkit-scrollbar-thumb {
        background: var(--accent-purple);
        border-radius: 10px;
    }
    ::-webkit-scrollbar-thumb:hover {
        background: var(--accent-red);
    }

    /* 3. Focus outlines for accessibility (keyboard navigation) */
    .sos-btn:focus-visible,
    .quick-action-btn:focus-visible,
    .countdown-cancel-btn:focus-visible,
    .back-btn:focus-visible {
        outline: 3px solid var(--accent-orange);
        outline-offset: 3px;
        border-radius: 50%;
    }

    /* 4. Button ripple effect on click (micro-interaction) */
    .sos-btn, .quick-action-btn, .countdown-cancel-btn {
        position: relative;
        overflow: hidden;
    }
    .sos-btn::after, .quick-action-btn::after, .countdown-cancel-btn::after {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 0;
        height: 0;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.3);
        transform: translate(-50%, -50%);
        transition: width 0.5s ease, height 0.5s ease;
        pointer-events: none;
    }
    .sos-btn:active::after, .quick-action-btn:active::after, .countdown-cancel-btn:active::after {
        width: 200px;
        height: 200px;
    }

    /* 5. Glass morphism hover enhancement for cards */
    .contact-item, .summary-card, .info-card, .progress-step {
        transition: transform 0.2s ease, border-color 0.2s, background 0.2s;
    }
    .contact-item:hover, .summary-card:hover, .info-card:hover, .progress-step:hover {
        transform: translateY(-2px);
        border-color: rgba(255, 255, 255, 0.2);
        background: rgba(255, 255, 255, 0.08);
    }

    /* 6. Countdown overlay cancel button pulse on hover */
    .countdown-cancel-btn:hover {
        animation: cancelGlow 0.6s ease;
    }
    @keyframes cancelGlow {
        0% { box-shadow: 0 0 0 0 rgba(255, 255, 255, 0.2); }
        100% { box-shadow: 0 0 0 10px rgba(255, 255, 255, 0); }
    }

    /* 7. Status bar dot glow enhancement */
    .status-bar .dot {
        box-shadow: 0 0 4px currentColor;
    }

    /* 8. Quick action icons subtle scale on hover */
    .quick-action-btn i {
        transition: transform 0.2s;
    }
    .quick-action-btn:hover i {
        transform: scale(1.1);
    }

    /* 9. Loading spinner for progress steps (already has one, but add smooth rotation) */
    .spinner {
        animation: spin 0.8s linear infinite;
        will-change: transform;
    }

    /* 10. Additional responsive polish for very small devices */
    @media (max-width: 380px) {
        .response-summary {
            grid-template-columns: 1fr;
            gap: 8px;
        }
        .quick-actions {
            grid-template-columns: 1fr;
        }
        .sos-btn-wrapper {
            transform: scale(0.9);
        }
    }

    /* 11. Smooth loading skeleton ready (optional) */
    @keyframes shimmer {
        0% { background-position: -200% 0; }
        100% { background-position: 200% 0; }
    }
    .skeleton {
        background: linear-gradient(90deg, var(--bg-card) 25%, var(--bg-glass) 50%, var(--bg-card) 75%);
        background-size: 200% 100%;
        animation: shimmer 1.5s infinite;
        pointer-events: none;
    }
    /* Dashboard Button Styling */
    .dashboard-bar {
        position: relative;
        z-index: 99;
        margin-top: 10px;
        padding-right: 15px;
    }
    .dashboard-btn {
        background: linear-gradient(135deg, #7C2D5E 0%, #a64281 50%, #DB2777 100%);
        color: #fff !important;
        padding: 10px 24px;
        border-radius: 50px;
        font-weight: 700;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 10px;
        box-shadow: 0 4px 15px rgba(124, 45, 94, 0.3);
        transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        font-family: 'Inter', sans-serif;
        font-size: 0.95rem;
        letter-spacing: 0.5px;
    }
    .dashboard-btn:hover {
        transform: translateY(-3px) scale(1.02);
        box-shadow: 0 8px 25px rgba(124, 45, 94, 0.45);
        color: #fff !important;
    }
    .dashboard-btn i {
        font-size: 1.2rem;
        transition: transform 0.3s ease;
    }
    .dashboard-btn:hover i {
        transform: translateX(5px);
    }
</style>
</head>
<body>

    <div class="bg-grid" id="bgGrid"></div>

    <!-- Top Nav -->
    <nav class="top-nav">
        <div class="brand"><i class="bi bi-shield-exclamation"></i> SOS Emergency</div>
    </nav>
    <div class="dashboard-bar container-fluid container-xl d-flex justify-content-end">
        <a href="${pageContext.request.contextPath}/users/dashboard" class="dashboard-btn">
            Dashboard <i class="bi bi-arrow-right"></i>
        </a>
    </div>

    <!-- Toast -->
    <div class="toast-notification" id="toast"></div>

    <!-- Main SOS Container -->
    <div class="sos-container">

        <!-- Status -->
        <div class="status-bar" id="statusBar">
            <div class="dot"></div>
            <span id="statusText">System ready &mdash; Location tracking active</span>
        </div>

        <!-- SOS Button Card -->
        <div class="sos-outer-box">
            <div class="sos-btn-wrapper">
                <div class="sos-btn-ring"></div>
                <button class="sos-btn" id="sosBtn" onclick="initiateSOS()">SOS</button>
            </div>
            <div class="sos-btn-label">Tap to send emergency alert</div>
        </div>

        <!-- Alert Progress (hidden until triggered) -->
        <div class="alert-progress" id="alertProgress">
            <div class="progress-step" id="step1">
                <div class="step-icon pending"><i class="bi bi-geo-alt"></i></div>
                <div class="step-info">
                    <div class="step-title">Getting Location</div>
                    <div class="step-desc">Acquiring GPS coordinates...</div>
                </div>
            </div>
            <div class="progress-step" id="step2">
                <div class="step-icon pending"><i class="bi bi-envelope-exclamation"></i></div>
                <div class="step-info">
                    <div class="step-title">Alerting Emergency Contacts</div>
                    <div class="step-desc">Sending email with your location...</div>
                </div>
            </div>
            <div class="progress-step" id="step3">
                <div class="step-icon pending"><i class="bi bi-people"></i></div>
                <div class="step-info">
                    <div class="step-title">Notifying Nearby Volunteers</div>
                    <div class="step-desc">Searching within 20km radius...</div>
                </div>
            </div>
            <div class="progress-step" id="step4">
                <div class="step-icon pending"><i class="bi bi-telephone"></i></div>
                <div class="step-info">
                    <div class="step-title">Auto-Call</div>
                    <div class="step-desc">Dialing emergency contact...</div>
                </div>
            </div>
        </div>

        <!-- Real-Time Contact Response Panel -->
        <div class="contact-response-panel" id="contactResponsePanel" style="display: none;">
            <h4 style="margin-bottom: 15px; display: flex; align-items: center; gap: 8px;">
                <i class="bi bi-people-fill" style="color: var(--accent-blue);"></i>
                Contact Response Status
            </h4>
            
            <!-- Summary Cards -->
            <div class="response-summary" style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px; margin-bottom: 20px;">
                <div class="summary-card accepted">
                    <div class="summary-number" id="acceptedCount">0</div>
                    <div class="summary-label"><i class="bi bi-check-circle"></i> Accepted</div>
                </div>
                <div class="summary-card pending">
                    <div class="summary-number" id="pendingCount">0</div>
                    <div class="summary-label"><i class="bi bi-hourglass-split"></i> Pending</div>
                </div>
                <div class="summary-card rejected">
                    <div class="summary-number" id="rejectedCount">0</div>
                    <div class="summary-label"><i class="bi bi-x-circle"></i> Declined</div>
                </div>
            </div>

            <!-- Contact List -->
            <div class="contact-list" id="contactList">
                <!-- Contacts will be dynamically added here -->
            </div>
        </div>

        <!-- Volunteer Responded Banner -->
        <div class="responded-banner" id="respondedBanner">
            <h4><i class="bi bi-check-circle"></i> Volunteer Responding!</h4>
            <p id="respondedText">A verified volunteer is on their way to help you.</p>
        </div>

        <!-- Quick Actions -->
        <div class="quick-actions">
            <a href="tel:100" class="quick-action-btn police">
                <i class="bi bi-shield-fill"></i>
                Call Police (100)
            </a>
            <a href="tel:108" class="quick-action-btn ambulance">
                <i class="bi bi-heart-pulse"></i>
                Ambulance (108)
            </a>
            <a href="${pageContext.request.contextPath}/users/${userId}/emergency-contacts" class="quick-action-btn contacts">
                <i class="bi bi-person-lines-fill"></i>
                My Contacts
            </a>
            <button class="quick-action-btn location" onclick="shareLocation()">
                <i class="bi bi-pin-map-fill"></i>
                Share Location
            </button>
        </div>

        <!-- How it works -->
        <div class="info-card">
            <h4><i class="bi bi-info-circle"></i> How SOS Works</h4>
            <p>
                1. Tap the SOS button to start a <strong>15-second countdown</strong><br>
                2. You can <strong>cancel</strong> during the countdown if pressed accidentally<br>
                3. After countdown: your <strong>location is sent</strong> to emergency contacts via email<br>
                4. <strong>Nearby verified volunteers</strong> receive real-time alerts<br>
                5. <strong>Auto-call</strong> dials your first emergency contact automatically
            </p>
        </div>
    </div>

    <!-- Countdown Overlay -->
    <div class="countdown-overlay" id="countdownOverlay">
        <div class="countdown-number" id="countdownNumber">15</div>
        <div class="countdown-text">
            Sending SOS alert when countdown reaches zero.<br>
            <strong>Tap below to cancel if pressed accidentally.</strong>
        </div>
        <button class="countdown-cancel-btn" onclick="cancelCountdown()">
            <i class="bi bi-x-circle"></i> &nbsp; Cancel SOS
        </button>
    </div>

    <!-- Alarm Sound -->
    <audio id="alarmSound" loop>
        <source src="${pageContext.request.contextPath}/resources/sounds/alarm.mp3" type="audio/mpeg">
    </audio>

    <script>
        const contextPath = '${pageContext.request.contextPath}';
        let countdownTimer = null;
        let countdownValue = 15;
        let currentSosId = null;
        let userLatitude = null;
        let userLongitude = null;
        let autoCallPhone = null;
        let stompClient = null;

        // === Initialize: Get location on page load ===
        window.addEventListener('load', () => {
            initLocation();
            connectWebSocket();
        });

        function initLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.watchPosition(
                    (pos) => {
                        userLatitude = pos.coords.latitude;
                        userLongitude = pos.coords.longitude;
                        document.getElementById('statusText').textContent =
                            'System ready — Location: ' + userLatitude.toFixed(4) + ', ' + userLongitude.toFixed(4);
                    },
                    (err) => {
                        document.getElementById('statusText').textContent =
                            'Location unavailable — Enable GPS for best results';
                        document.getElementById('statusBar').classList.add('danger');
                    },
                    { enableHighAccuracy: true, timeout: 10000, maximumAge: 5000 }
                );
            } else {
                document.getElementById('statusText').textContent = 'Geolocation not supported by browser';
                document.getElementById('statusBar').classList.add('danger');
            }
        }

        // === WebSocket Connection ===
        function connectWebSocket() {
            try {
                const socket = new SockJS(contextPath + '/ws-sos');
                stompClient = Stomp.over(socket);
                stompClient.debug = null; // Suppress debug logs

                stompClient.connect({}, (frame) => {
                    console.log('WebSocket connected for SOS');

                    stompClient.subscribe('/topic/sos-alerts', (message) => {
                        const data = JSON.parse(message.body);
                        handleWebSocketMessage(data);
                    });
                });
            } catch (e) {
                console.log('WebSocket connection failed, will use polling');
            }
        }

        function handleWebSocketMessage(data) {
            if (data.type === 'SOS_RESPONDED' && data.sosId === currentSosId) {
                const banner = document.getElementById('respondedBanner');
                document.getElementById('respondedText').textContent =
                    (data.volunteerName || 'A volunteer') + ' is on their way to help you!';
                banner.classList.add('active');
                showToast('A volunteer is responding to your SOS!');
            }
            if (data.type === 'SOS_CANCELLED' && data.sosId === currentSosId) {
                showToast('SOS has been cancelled');
            }
        }

        // === SOS Flow ===
        function initiateSOS() {
            // Start countdown
            document.getElementById('countdownOverlay').classList.add('active');
            document.getElementById('sosBtn').classList.add('pressed');
            document.getElementById('bgGrid').classList.add('sos-active');
            countdownValue = 15;
            document.getElementById('countdownNumber').textContent = countdownValue;

            countdownTimer = setInterval(() => {
                countdownValue--;
                document.getElementById('countdownNumber').textContent = countdownValue;

                if (countdownValue <= 0) {
                    clearInterval(countdownTimer);
                    countdownTimer = null;
                    document.getElementById('countdownOverlay').classList.remove('active');
                    executeSOS();
                }
            }, 1000);
        }

        function cancelCountdown() {
            if (countdownTimer) {
                clearInterval(countdownTimer);
                countdownTimer = null;
            }
            document.getElementById('countdownOverlay').classList.remove('active');
            document.getElementById('sosBtn').classList.remove('pressed');
            document.getElementById('bgGrid').classList.remove('sos-active');

            // If SOS was already triggered, cancel it on server
            if (currentSosId) {
                fetch(contextPath + '/sos/cancel/' + currentSosId, { method: 'POST' })
                    .then(r => r.json())
                    .then(data => {
                        showToast(data.message || 'SOS cancelled');
                        currentSosId = null;
                    });
            } else {
                showToast('SOS cancelled — false alarm');
            }
        }

        function executeSOS() {
            const progress = document.getElementById('alertProgress');
            progress.classList.add('active');

            // Step 1: Get Location
            setStepActive('step1');

            if (!userLatitude || !userLongitude) {
                // Try one more time
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(
                        (pos) => {
                            userLatitude = pos.coords.latitude;
                            userLongitude = pos.coords.longitude;
                            proceedWithSOS();
                        },
                        (err) => {
                            // Use default/fallback
                            userLatitude = 0;
                            userLongitude = 0;
                            showToast('Could not get location — sending alert anyway', true);
                            proceedWithSOS();
                        },
                        { enableHighAccuracy: true, timeout: 5000 }
                    );
                } else {
                    userLatitude = 0;
                    userLongitude = 0;
                    proceedWithSOS();
                }
            } else {
                proceedWithSOS();
            }
        }

        function proceedWithSOS() {
            setStepDone('step1');

            // Step 2 & 3: Send to server
            setStepActive('step2');
            updateStatusBar('Sending emergency alerts...', true);

            const formData = new URLSearchParams();
            formData.append('latitude', userLatitude);
            formData.append('longitude', userLongitude);

            fetch(contextPath + '/sos/trigger', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: formData.toString()
            })
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    showToast(data.error, true);
                    return;
                }

                currentSosId = data.sosId;
                autoCallPhone = data.autoCallPhone;

                // Step 2: Done - contacts notified
                const contactCount = data.contactsNotified || 0;
                document.querySelector('#step2 .step-desc').textContent =
                    contactCount + ' contact(s) notified via email';
                setStepDone('step2');

                // Step 3: Done - volunteers alerted
                setTimeout(() => {
                    const volCount = data.volunteersAlerted || 0;
                    document.querySelector('#step3 .step-desc').textContent =
                        volCount + ' volunteer(s) alerted nearby';
                    setStepDone('step3');

                    // Step 4: Auto-call
                    setTimeout(() => {
                        setStepActive('step4');
                        triggerAutoCall();
                    }, 1000);
                }, 800);

                updateStatusBar('🚨 SOS Active — Help is on the way', true);

                // Start polling for contact responses
                startContactResponsePolling();
            })
            .catch(err => {
                console.error('SOS trigger failed:', err);
                showToast('Failed to send SOS. Trying auto-call directly...', true);
                // Fallback: try auto-call even if server fails
                autoCallPhone = '100';
                setTimeout(triggerAutoCall, 1000);
            });
        }

        function triggerAutoCall() {
            const phone = autoCallPhone || '100';
            document.querySelector('#step4 .step-desc').textContent =
                'Dialing ' + phone + '...';

            // Mark auto-call on server
            if (currentSosId) {
                fetch(contextPath + '/sos/auto-call/' + currentSosId, { method: 'POST' }).catch(() => {});
            }

            setTimeout(() => {
                setStepDone('step4');
                // Open phone dialer
                window.location.href = 'tel:' + phone;
            }, 1500);
        }

        // === UI Helpers ===
        function setStepActive(stepId) {
            const step = document.getElementById(stepId);
            step.classList.remove('done');
            step.classList.add('active');
            step.querySelector('.step-icon').classList.remove('pending');
            step.querySelector('.step-icon').innerHTML = '<div class="spinner"></div>';
        }

        function setStepDone(stepId) {
            const step = document.getElementById(stepId);
            step.classList.remove('active');
            step.classList.add('done');
            step.querySelector('.step-icon').innerHTML = '<i class="bi bi-check-lg"></i>';
        }

        function updateStatusBar(text, isDanger) {
            const bar = document.getElementById('statusBar');
            document.getElementById('statusText').textContent = text;
            if (isDanger) bar.classList.add('danger');
            else bar.classList.remove('danger');
        }

        function showToast(message, isError) {
            const toast = document.getElementById('toast');
            toast.textContent = message;
            toast.className = 'toast-notification show' + (isError ? ' error' : '');
            setTimeout(() => { toast.classList.remove('show'); }, 3000);
        }

        function shareLocation() {
            if (userLatitude && userLongitude) {
                const url = 'https://www.google.com/maps?q=' + userLatitude + ',' + userLongitude;
                if (navigator.share) {
                    navigator.share({ title: 'My Location - Emergency', url: url });
                } else {
                    navigator.clipboard.writeText(url).then(() => {
                        showToast('Location link copied to clipboard!');
                    });
                }
            } else {
                showToast('Location not available yet', true);
            }
        }

        // === Real-Time Contact Response Tracking ===
        let responsePollingInterval = null;

        function startContactResponsePolling() {
            // Show the contact response panel
            document.getElementById('contactResponsePanel').style.display = 'block';
            
            // Initial fetch
            fetchContactResponses();
            
            // Poll every 3 seconds for updates
            responsePollingInterval = setInterval(fetchContactResponses, 3000);
        }

        function stopContactResponsePolling() {
            if (responsePollingInterval) {
                clearInterval(responsePollingInterval);
                responsePollingInterval = null;
            }
        }

        function fetchContactResponses() {
            if (!currentSosId) return;

            fetch(contextPath + '/sos/status/' + currentSosId)
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        updateContactResponseUI(data);
                    }
                })
                .catch(err => console.error('Failed to fetch contact responses:', err));
        }

        function updateContactResponseUI(data) {
            // Update summary counts
            document.getElementById('acceptedCount').textContent = data.contactsAccepted || 0;
            document.getElementById('pendingCount').textContent = data.contactsPending || 0;
            document.getElementById('rejectedCount').textContent = data.contactsRejected || 0;

            // Update contact list
            const contactList = document.getElementById('contactList');
            contactList.innerHTML = ''; // Clear existing

            if (data.contactResponses && data.contactResponses.length > 0) {
                data.contactResponses.forEach(contact => {
                    const contactItem = createContactItem(contact);
                    contactList.appendChild(contactItem);
                });
            } else {
                contactList.innerHTML = '<p style="text-align: center; color: var(--text-secondary); padding: 20px;">No contacts added yet</p>';
            }
        }

        function createContactItem(contact) {
            const div = document.createElement('div');
            div.className = 'contact-item ' + (contact.responseStatus || 'pending').toLowerCase();

            const statusIcon = getStatusIcon(contact.responseStatus);
            const statusText = getStatusText(contact.responseStatus);
            const initials = getInitials(contact.contactName);
            const respondedTime = contact.respondedAt ? formatTime(contact.respondedAt) : '';

            var html = '<div class="contact-info">';
            html += '<div class="contact-avatar">' + initials + '</div>';
            html += '<div class="contact-details">';
            html += '<h5>' + (contact.contactName || 'Unknown') + '</h5>';
            html += '<p>' + (contact.relation || 'Contact') + ' • ' + (contact.contactPhone || 'No phone') + '</p>';
            html += '</div></div>';
            html += '<div class="contact-status ' + (contact.responseStatus || 'pending').toLowerCase() + '">';
            html += statusIcon + ' ' + statusText;
            if (respondedTime) {
                html += '<span style="margin-left: 4px; opacity: 0.7;">' + respondedTime + '</span>';
            }
            html += '</div>';

            div.innerHTML = html;

            return div;
        }

        function getStatusIcon(status) {
            switch(status) {
                case 'ACCEPTED': return '<i class="bi bi-check-circle-fill"></i>';
                case 'REJECTED': return '<i class="bi bi-x-circle-fill"></i>';
                case 'ON_THE_WAY': return '<i class="bi bi-car-front-fill"></i>';
                default: return '<i class="bi bi-hourglass-split"></i>';
            }
        }

        function getStatusText(status) {
            switch(status) {
                case 'ACCEPTED': return 'Accepted';
                case 'REJECTED': return 'Declined';
                case 'ON_THE_WAY': return 'On the way';
                case 'NO_RESPONSE': return 'No response';
                default: return 'Pending';
            }
        }

        function getInitials(name) {
            if (!name) return '?';
            return name.split(' ').map(n => n[0]).join('').toUpperCase().substring(0, 2);
        }

        function formatTime(dateTimeStr) {
            if (!dateTimeStr) return '';
            const date = new Date(dateTimeStr);
            const now = new Date();
            const diffMs = now - date;
            const diffSec = Math.floor(diffMs / 1000);
            
            if (diffSec < 60) return 'Just now';
            if (diffSec < 3600) return Math.floor(diffSec / 60) + 'm ago';
            return date.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        }

        // Cleanup polling when page unloads
        window.addEventListener('beforeunload', () => {
            stopContactResponsePolling();
        });
    </script>
</body>
</html>

