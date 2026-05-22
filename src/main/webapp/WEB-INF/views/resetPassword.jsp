<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <style>
    /* ============================================
       ORIGINAL STYLES (kept exactly as is)
       ============================================ */
    :root {
        --primary-purple: #7C2D5E;
        --primary-purple-light: #a64281;
        --primary-coral: #DB2777;
        --primary-coral-dark: #5E1F47;
        --primary-teal: #20c997;
        --primary-gold: #ffd700;
        --dark-bg: #0f0f1a;
        --light-bg: #fffcfd;
        --gradient-primary: linear-gradient(135deg, #7C2D5E 0%, #a64281 50%, #DB2777 100%);
        --shadow-sm: 0 10px 30px rgba(0, 0, 0, 0.08);
        --shadow-md: 0 20px 40px rgba(0, 0, 0, 0.12);
    }

    /* 🌙 Dark Theme using brand purples */
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, var(--primary-purple), var(--primary-purple-light));
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        color: white;
    }

    .container {
        background: rgba(42, 14, 70, 0.95); /* deep purple fallback */
        background: var(--dark-bg);
        padding: 25px;
        border-radius: 12px;
        box-shadow: var(--shadow-md);
        width: 350px;
        text-align: center;
    }

    h2 {
        color: var(--light-bg);
        font-weight: 600;
    }

    input {
        width: 90%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid var(--primary-purple-light);
        border-radius: 6px;
        outline: none;
        background: rgba(15, 15, 26, 0.8);
        color: white;
        transition: 0.3s;
    }

    input::placeholder {
        color: rgba(255, 255, 255, 0.6);
    }

    input:focus {
        border-color: var(--primary-gold);
        box-shadow: 0px 0px 8px rgba(255, 215, 0, 0.4);
    }

    button {
        background: var(--primary-purple-light);
        color: white;
        border: none;
        padding: 12px;
        width: 100%;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        transition: all 0.3s;
    }

    button:hover {
        background: var(--primary-purple);
        transform: translateY(-2px);
        box-shadow: var(--shadow-sm);
    }

    .message {
        margin-top: 10px;
        color: var(--primary-gold);
        font-weight: bold;
    }

    /* ============================================
       🚀 ADDITIONAL ENHANCEMENTS (no existing rules changed)
       ============================================ */

    /* 1. Smooth fade-in animation for the container */
    .container {
        animation: fadeSlideUp 0.5s cubic-bezier(0.2, 0.9, 0.4, 1.1) forwards;
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

    /* 2. Button ripple effect on click (micro-interaction) */
    button {
        position: relative;
        overflow: hidden;
    }
    button::after {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 0;
        height: 0;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.4);
        transform: translate(-50%, -50%);
        transition: width 0.4s ease, height 0.4s ease;
        pointer-events: none;
    }
    button:active::after {
        width: 200px;
        height: 200px;
    }

    /* 3. Focus outlines for accessibility (keyboard navigation) */
    button:focus-visible,
    input:focus-visible {
        outline: 3px solid var(--primary-gold);
        outline-offset: 2px;
        border-radius: 6px;
    }

    /* 4. Custom scrollbar (matches dark theme) */
    ::-webkit-scrollbar {
        width: 8px;
    }
    ::-webkit-scrollbar-track {
        background: var(--dark-bg);
        border-radius: 10px;
    }
    ::-webkit-scrollbar-thumb {
        background: var(--primary-purple-light);
        border-radius: 10px;
    }
    ::-webkit-scrollbar-thumb:hover {
        background: var(--primary-gold);
    }

    /* 5. Label hover effect (if labels exist; adds polish) */
    label {
        transition: color 0.2s, transform 0.2s;
        display: inline-block;
    }
    label:hover {
        color: var(--primary-gold);
        transform: translateX(2px);
    }

    /* 6. Input placeholder styling enhancement (already there, just add transition) */
    input::placeholder {
        transition: opacity 0.2s;
    }
    input:focus::placeholder {
        opacity: 0.5;
    }

    /* 7. Heading hover effect – subtle text shadow */
    h2 {
        transition: text-shadow 0.2s;
    }
    h2:hover {
        text-shadow: 0 0 6px rgba(255,215,0,0.5);
    }

    /* 8. Responsive improvements for mobile */
    @media (max-width: 480px) {
        .container {
            width: 85%;
            padding: 20px;
            margin: 0 15px;
        }
        button {
            padding: 14px;
            font-size: 1rem;
        }
        input {
            padding: 12px;
            font-size: 16px; /* prevents zoom on iOS */
        }
        h2 {
            font-size: 1.5rem;
        }
    }

    /* 9. Loading skeleton ready (optional – does nothing by default) */
    @keyframes shimmer {
        0% { background-position: -200% 0; }
        100% { background-position: 200% 0; }
    }
    .container.skeleton {
        background: linear-gradient(90deg, #2a2a2a 25%, #3a3a3a 50%, #2a2a2a 75%);
        background-size: 200% 100%;
        animation: shimmer 1.5s infinite;
        pointer-events: none;
    }
</style>
        
</head>
<body>

    <div class="container">
        <h2>Reset Password for <%= request.getParameter("userType") %></h2>
        <form action="${pageContext.request.contextPath}/auth/reset-password" method="POST">
            <input type="hidden" name="token" value="${param.token}">
            <input type="password" name="newPassword" placeholder="Enter new password" required>
            <button type="submit">Update Password</button>
        </form>
        <p class="message">${message}</p>
    </div>

</body>
</html>

