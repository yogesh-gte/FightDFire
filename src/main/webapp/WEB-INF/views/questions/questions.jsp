<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Q&A Forum</title>
    
        
            
        
<style>
    :root {
        --primary-purple: #1e1b4b;
        --primary-purple-light: #312e81;
        --primary-coral: #f43f5e;
        --primary-gold: #ffd700;
        --dark-bg: #150510;
        --text-primary: #ffffff;
        --text-secondary: rgba(255, 255, 255, 0.7);
        --gradient-primary: linear-gradient(135deg, #1e1b4b 0%, #f43f5e 100%);
    }

    body {
        font-family: 'Inter', -apple-system, sans-serif;
        margin: 0;
        padding: 0;
        background: var(--dark-bg);
        color: var(--text-primary);
        min-height: 100vh;
    }

    .bg-grid {
        position: fixed; inset: 0;
        background-image:
            radial-gradient(circle at 20% 50%, rgba(124, 45, 94, 0.2) 0%, transparent 50%),
            radial-gradient(circle at 80% 20%, rgba(219, 39, 119, 0.15) 0%, transparent 50%);
        z-index: 0;
    }

    /* Header */
    .top-nav {
        position: fixed; top: 0; left: 0; right: 0;
        padding: 16px 24px;
        display: flex; justify-content: space-between; align-items: center;
        background: linear-gradient(to right, var(--primary-purple), #4a0e2a);
        backdrop-filter: blur(20px);
        border-bottom: 2px solid var(--primary-coral);
        z-index: 100;
        box-shadow: 0 4px 15px rgba(0,0,0,0.3);
    }
    .top-nav .brand { font-weight:700; font-size:18px; color: white; text-decoration: none; display:flex; align-items:center; gap:8px; }
    .top-nav .back-btn {
        color: var(--text-secondary); text-decoration:none; font-size:14px;
        display:flex; align-items:center; gap:6px; transition: color 0.2s;
    }
    .top-nav .back-btn:hover { color: var(--text-primary); }

    .container {
        position: relative;
        z-index: 1;
        width: 90%;
        max-width: 900px;
        margin: 0 auto;
        padding: 100px 0 40px;
    }

    h1 {
        font-size: 32px;
        font-weight: 800;
        text-align: center;
        margin-bottom: 30px;
        background: var(--gradient-primary);
        -webkit-background-clip: text;
        background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    h2 {
        font-size: 20px;
        color: var(--primary-coral);
        margin: 40px 0 20px;
        letter-spacing: 1px;
        text-transform: uppercase;
        border-bottom: 1px solid rgba(255,255,255,0.1);
        padding-bottom: 10px;
    }

    .ask-form {
        background: rgba(255, 255, 255, 0.05);
        border: 1px solid rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(15px);
        border-radius: 20px;
        padding: 30px;
        margin-bottom: 40px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.2);
    }

    .ask-form textarea,
    .ask-form input[type="text"] {
        width: 100%;
        padding: 14px;
        background: rgba(255, 255, 255, 0.05);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 12px;
        color: white;
        font-size: 15px;
        margin-bottom: 15px;
        box-sizing: border-box;
        transition: all 0.3s;
    }
    .ask-form textarea:focus,
    .ask-form input[type="text"]:focus {
        border-color: var(--primary-coral);
        background: rgba(255, 255, 255, 0.1);
        outline: none;
        box-shadow: 0 0 15px rgba(219, 39, 119, 0.3);
    }

    .ask-form button {
        width: 100%;
        padding: 14px;
        background: var(--gradient-primary);
        color: #fff;
        border: none;
        border-radius: 12px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 700;
        transition: all 0.3s;
    }

    .ask-form button:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(219, 39, 119, 0.4);
    }

    .question-card {
        background: rgba(255, 255, 255, 0.03);
        border: 1px solid rgba(255, 255, 255, 0.08);
        padding: 24px;
        margin-bottom: 20px;
        border-radius: 16px;
        transition: all 0.3s;
    }

    .question-card:hover {
        background: rgba(255, 255, 255, 0.06);
        border-color: rgba(255, 255, 255, 0.15);
        transform: translateY(-3px);
    }

    .question-card p strong { color: var(--primary-coral); margin-right: 10px; }
    .question-card .meta { font-size: 12px; color: var(--text-secondary); margin-top: 8px; }

    .question-card a {
        display: inline-block;
        margin-top: 15px;
        background: rgba(219, 39, 119, 0.1);
        color: var(--primary-coral);
        padding: 8px 16px;
        border-radius: 20px;
        text-decoration: none;
        font-weight: 600;
        font-size: 13px;
        transition: all 0.3s;
    }

    .question-card a:hover {
        background: var(--primary-coral);
        color: white;
    }

        h1 { font-size: 26px; }
    }

    /* Dashboard Button Styling */
    .dashboard-bar {
        position: relative;
        z-index: 99;
        margin-top: 10px;
        padding-right: 15px;
    }
    .dashboard-btn {
        background: var(--gradient-primary);
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
    <div class="bg-grid"></div>

    <nav class="top-nav">
        <a href="${pageContext.request.contextPath}/users/dashboard" class="brand"><i class="bi bi-chat-dots-fill" style="color: var(--primary-gold);"></i> Q&A Forum</a>
    </nav>
    

    <div class="container">
        <h1>Community Questions</h1>

        <!-- Ask a question form -->
        <div class="ask-form">
            <form action="${pageContext.request.contextPath}/qna/ask" method="post">
                <textarea name="content" placeholder="Type your question here..." required></textarea>
                <input type="text" name="displayName" placeholder="Display name (Anonymous if blank)">
                <button type="submit">Submit Question</button>
            </form>
        </div>

        <h2>Recent Discussions</h2>
        <c:forEach var="q" items="${threads}">
            <div class="question-card">
                <p><strong>Q:</strong> ${q.content}</p>
                <div class="meta">Asked by ${q.displayName != '' ? q.displayName : 'Anonymous'} | <i>${q.postedAt}</i></div>
                <a href="${pageContext.request.contextPath}/qna/thread/${q.id}">View Full Thread &nbsp; <i class="bi bi-chevron-right"></i></a>
            </div>
        </c:forEach>
    </div>
</body>
</html>

